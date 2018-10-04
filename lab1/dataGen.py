import pandas as pd

def isNaN_or_int(item):
    if pd.isna(item):
        return 'Null'
    return int(item)

def isNaN_or_string(item):
    if pd.isna(item):
        return 'Null'
    if "'" in item:
        b = []
        for let in item:
            if let == "'":
                b.append("'")
            b.append(let)
        b = ''.join(b)
        return b
    return item

# CREATING MAIN DATAFRAME
df = pd.read_csv('data/athlete_events.csv', sep=',')
df = df.dropna(subset=['Medal'])
df = df.dropna(subset=['Height'])
df = df.dropna(subset=['Weight'])
df = df.query("Team != 'China'")

copy = pd.read_csv('data/athlete_events.csv', sep=',')
copy = copy.dropna(subset=['Medal'])
copy = copy.dropna(subset=['Height'])
copy = copy.dropna(subset=['Weight'])
copy = copy.query("Team != 'China'")

copy['Year'] = copy['Year'].apply(lambda x : x+1000)
df = df.append(copy,ignore_index=True)


# CREATING DATAFRAMES FOR TABLES IN DATABASE
def create_data_frames():

    # PARTICIPANTS DATAFRAME PREPARE
    raw_participants = df.loc[:, 'Name':'Team'] # взять часть столбцов из таблицы (срез по столбцам)
    participants = raw_participants.drop_duplicates(subset='Name', keep='last') # удалить строчки с одинаковыми именами
    participants = participants.reset_index(drop=True) # переиндексируем

    # GAMES DATAFRAME PREPARE
    raw_games = df.loc[:, 'Year':'City']
    games = raw_games.drop_duplicates()
    games = games.reset_index(drop=True)

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
    for man in list_of_participants:
        list_of_events_of_participant = list(pe[pe['Name'] == man]['Event'].values)
        for ev in list_of_events_of_participant:
            print(man, ev,'\n')
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
    eg_city = df['City']

    eg = pd.DataFrame({
        'Event': eg_events,
        'Game': eg_game,
        'City': eg_city
    })
    eg = eg.drop_duplicates()
    eg = eg.sort_values(by=['Game'])
    eg = eg.reset_index(drop=True)
    
    list_of_games_ids = []
    list_of_events_ids = []
    list_of_games = list(games['Year'].values)
    list_of_cities = list(games['City'].values)
    eg_count = games['Year'].count()

    for i in range(eg_count):
        list_of_events_in_game = list(eg[(eg['Game'] == list_of_games[i]) & (eg['City'] == list_of_cities[i])]['Event'].values)
        for ev in list_of_events_in_game:
            print(i,ev)
            list_of_games_ids.append(games[(games['Year'] == list_of_games[i]) & (games['City'] == list_of_cities[i])].index[0]+1) # TO DO добавить выборку по городу
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
    gp_city = df['City']

    gp = pd.DataFrame({
        'Game': gp_game,
        'Name': gp_name,
        'City': gp_city
    })
    gp = gp.drop_duplicates()

    list_of_participants_ids = []
    list_of_games_ids = []
    list_of_participants = list(participants['Name'].values)

    for man in list_of_participants:
        list_of_games_of_participant = list(gp[gp['Name'] == man]['Game'].values)
        list_of_cities_of_participant = list(gp[gp['Name'] == man]['City'].values)
        games_count = len(list_of_games_of_participant)

        for i in range(games_count):
            print(man,i)
            list_of_participants_ids.append(participants[participants['Name'] == man].index[0]+1)
            list_of_games_ids.append(games[(games['Year'] == list_of_games_of_participant[i]) & (games['City'] == list_of_cities_of_participant[i])].index[0]+1)


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
    p = open('participants.csv', 'w')
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


if __name__ == '__main__':
    generate()
    # create_data_frames()
