import pandas as pd

df = pd.read_csv('data/athlete_events.csv', sep=',')

def isNaN_or_int(item):
    if pd.isna(item):
        return 'Null'
    return int(item)

def isNaN_or_string(item):
    if pd.isna(item):
        return 'Null'
    return item


def create_data_frames():
    df = pd.read_csv('data/athlete_events.csv', sep=',')
    copy = pd.read_csv('data/athlete_events.csv', sep=',')   

    copy['Year'] = copy['Year'].apply(lambda x : x+1000)
    df = df.append(copy,ignore_index=True)

    # PARTICIPANTS DATAFRAME PREPARE
    raw_participants = df.loc[:, 'Name':'Team'] # взять часть столбцов из таблицы (срез по столбцам)
    participants = raw_participants.drop_duplicates(subset='Name', keep='last') # удалить строчки с одинаковыми именами
    participants = participants.reset_index(drop=True) # переиндексируем

    # GAMES DATAFRAME PREPARE
    raw_games = df.loc[:, 'Year':'City']
    games = raw_games.drop_duplicates()
    games = games.reset_index(drop=True)
    
    # рандомим дополнительные олимпийские игры 
   # games_count = games['Year'].count()
   # fake_cities_of_games = list(games['City'])
   # fake_years_of_games = [str(2018 + 2*i) for i in range(games_count)]
   # seasons = ['Winter','Summer']

   # val = pd.DataFrame([ [fake_years_of_games[i], seasons[i%2], fake_cities_of_games[i]] for i in range(games_count)],
   #                                                                                     columns=['Year', 'Season', 'City'])

   # games = games.append(val, ignore_index=True) # Без присвоения append не сработает

    # EVENTS DATAFRAME PREPARE
    events = df.loc[:, 'Sport':'Event']
    events = events.drop_duplicates(subset='Event', keep='last')
    events = events.reset_index(drop=True)

    list_of_events = events['Event'].values
    count_of_participants_in_event = [df[df['Event'] == event]['Name'].count() for event in list_of_events]
    events.insert(loc=len(events.columns), column='PCount', value=count_of_participants_in_event)
    events = events.reset_index(drop=True)
    events

    # PREPARE PARTICIPANT-EVENT RELATION
    pe_name = df['Name']
    pe_events = df['Event']
    pe = pd.DataFrame({
        'Event': df['Event'],
        'Name': df['Name']
    })
    pe = pe.drop_duplicates()
    pe = pe.reset_index(drop=True)

    list_of_participants_ids = []
    list_of_events_ids = []
    list_of_participants = list(participants['Name'].values)
    print(len(list_of_participants))

    for man in list_of_participants:
        list_of_events_of_participant = list(pe[pe['Name'] == man]['Event'].values)
        for ev in list_of_events_of_participant:
            list_of_participants_ids.append(participants[participants['Name'] == man].index[0]+1)
            list_of_events_ids.append(events[events['Event'] == ev].index[0]+1)


    participant_event_relation_table = pd.DataFrame({
        'ParticipantID': list_of_participants_ids,
        'EventID': list_of_events_ids
    })

    participant_event_relation_table = participant_event_relation_table.sort_values(by='ParticipantID')
    participant_event_relation_table = participant_event_relation_table.drop_duplicates()
    participant_event_relation_table 

    # PREPARE EVENT-GAME RELATION
    eg_events = df['Event']
    eg_game = df['Year']

    eg = pd.DataFrame({
        'Event': eg_events,
        'Game': eg_game
    })
    eg = eg.drop_duplicates()
    eg = eg.sort_values(by=['Game'])
    eg = eg.reset_index(drop=True)
    
    list_of_games_ids = []
    list_of_events_ids = []
    list_of_games = list(games['Year'].values)

    print(len(list_of_games))

    for game in list_of_games:
        list_of_events_in_game = list(eg[eg['Game'] == game]['Event'].values)
        for ev in list_of_events_in_game:
            list_of_games_ids.append(games[games['Year'] == game].index[0]+1)
            list_of_events_ids.append(events[events['Event'] == ev].index[0]+1)

    event_game_relation_table = pd.DataFrame({
        'GameID': list_of_games_ids,
        'EventID': list_of_events_ids
    })

    event_game_relation_table = event_game_relation_table.sort_values(by='GameID')
    event_game_relation_table = event_game_relation_table.drop_duplicates()
    event_game_relation_table

    # PREPARE GAME-PARICIPANT RELATION
    gp_game = df['Year']
    gp_name = df['Name']

    gp = pd.DataFrame({
        'Game': gp_game,
        'Name': gp_name
    })
    gp = gp.drop_duplicates()

    list_of_participants_ids = []
    list_of_games_ids = []
    list_of_participants = list(participants['Name'].values)
    print(len(list_of_participants))

    for man in list_of_participants:
        list_of_games_of_participant = list(gp[gp['Name'] == man]['Game'].values)
        for game in list_of_games_of_participant:
            list_of_participants_ids.append(participants[participants['Name'] == man].index[0]+1)
            list_of_games_ids.append(games[games['Year'] == game].index[0]+1)


    game_participant_relation_table = pd.DataFrame({
        'ParticipantID': list_of_participants_ids,
        'GameID': list_of_games_ids
    })
    game_participant_relation_table = game_participant_relation_table.sort_values(by='GameID')
    game_participant_relation_table = game_participant_relation_table.drop_duplicates()
    game_participant_relation_table  

    return participants, games, events, participant_event_relation_table, event_game_relation_table, game_participant_relation_table




def generate():

    participants, games, events, participant_event_relation_table, event_game_relation_table, game_participant_relation_table  = create_data_frames()

    participants_count = participants['Name'].count()
    games_count = games['Year'].count()
    events_count = events['Event'].count()

    # participants table
    p = open('participans.csv', 'w')
    p.write("id,Name,Sex,Age,Height,Weight,Team\n")
    for i in range(participants_count):
        string = "{0}|{1}|{2}|{3}|{4}|{5}|{6}\n".format(i+1,
                                                    isNaN_or_string(participants.iloc[i]['Name']),
                                                    isNaN_or_string(participants.iloc[i]['Sex']),
                                                    isNaN_or_int(participants.iloc[i]['Age']),
                                                    isNaN_or_int(participants.iloc[i]['Height']),
                                                    isNaN_or_int(participants.iloc[i]['Weight']),
                                                    isNaN_or_string(participants.iloc[i]['Team'])
                                                )
        p.write(string)

    # games table
    g = open('games.csv', 'w')
    g.write('id|Year|Season|City\n')
    for i in range(games_count):
        string = "{0}|{1}|{2}|{3}\n".format(i+1,
                                        isNaN_or_int(games.iloc[i]['Year']),
                                        isNaN_or_string(games.iloc[i]['Season']),
                                        isNaN_or_string(games.iloc[i]['City'])
                                        )
        g.write(string)
    
    # events table
    e = open('events.csv', 'w')
    e.write('id,Sport,Event,PCount\n')
    for i in range(events_count):
        string = "{0}|{1}|{2}|{3}\n".format(i+1,
                                        isNaN_or_string(events.iloc[i]['Sport']),
                                        isNaN_or_string(events.iloc[i]['Event']),
                                        isNaN_or_int(events.iloc[i]['PCount'])
                                        )
        e.write(string)

    # participants-events relation table

    pe_count = participant_event_relation_table['ParticipantID'].count()
    pe = open('participants_events.csv', 'w')
    pe.write('id,participant_id,event_id\n')   
    for i in range(pe_count):
        string = "{0}|{1}|{2}\n".format(i+1,
                            participant_event_relation_table.iloc[i]['ParticipantID'],
                            participant_event_relation_table.iloc[i]['EventID']
                            )

        pe.write(string)
    
    # events-games relation table

    eg_count = event_game_relation_table['GameID'].count()
    eg = open('events_games.csv', 'w')
    eg.write('id,game_id,event_id\n')   
    for i in range(eg_count):
        string = "{0}|{1}|{2}\n".format(i+1,
                            event_game_relation_table.iloc[i]['GameID'],
                            event_game_relation_table.iloc[i]['EventID']
                            )

        eg.write(string)
    
    # games-participants relation table 
    pg_count = game_participant_relation_table['GameID'].count()
    pg = open('games_participants.csv', 'w')
    pg.write('id,participant_id,game_id\n')   
    for i in range(pg_count):
        string = "{0}|{1}|{2}\n".format(i+1,
                            game_participant_relation_table.iloc[i]['ParticipantID'],
                            game_participant_relation_table.iloc[i]['GameID']
                            )

        pg.write(string)


    pg.close()
    eg.close()
    pe.close()
    p.close()
    g.close()
    e.close()

if __name__ == "__main__":
    generate()
