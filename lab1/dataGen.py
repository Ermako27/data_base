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
    # PARTICIPANTS DATAFRAME PREPARE
    raw_participants = df.loc[:, 'Name':'Team'] # взять часть столбцов из таблицы (срез по столбцам)
    participants = raw_participants.drop_duplicates(subset='Name', keep='last') # удалить строчки с одинаковыми именами

    # GAMES DATAFRAME PREPARE
    raw_games = df.loc[:, 'Year':'City']
    games = raw_games.drop_duplicates()

    # EVENTS DATAFRAME PREPARE
    events = df.loc[:, 'Sport':'Event']
    events = events.drop_duplicates(subset='Event', keep='last')

    list_of_events = events['Event'].values
    count_of_participants_in_event = [df[df['Event'] == event]['Name'].count() for event in list_of_events]
    events.insert(loc=len(events.columns), column='PCount', value=count_of_participants_in_event)

    return participants, games, events


def generate():
    participants, games, events = create_data_frames()

    participants_count = participants['Name'].count()
    games_count = games['Year'].count()
    events_count = events['Event'].count()

    # participants table

    p = open('participans.csv', 'w')
    p.write("Name,Sex,Age,Height,Weight,Team\n")
    for i in range(participants_count):
        string = "{0},{1},{2},{3},{4},{5}\n".format(isNaN_or_string(participants.iloc[i]['Name']),
                                                    isNaN_or_string(participants.iloc[i]['Sex']),
                                                    isNaN_or_int(participants.iloc[i]['Age']),
                                                    isNaN_or_int(participants.iloc[i]['Height']),
                                                    isNaN_or_int(participants.iloc[i]['Weight']),
                                                    isNaN_or_string(participants.iloc[i]['Team'])
                                                )
        p.write(string)
    
    g = open('games.csv', 'w')
    g.write('Year,Season,City\n')
    for i in range(games_count):
        string = "{0},{1},{2}\n".format(isNaN_or_int(games.iloc[i]['Year']),
                                        isNaN_or_string(games.iloc[i]['Season']),
                                        isNaN_or_string(games.iloc[i]['City'])
                                        )
        g.write(string)
    
    e = open('events.csv', 'w')
    e.write('Sport,Event,PCount\n')
    for i in range(events_count):
        string = "{0},{1},{2}\n".format(isNaN_or_string(events.iloc[i]['Sport']),
                                        isNaN_or_string(events.iloc[i]['Event']),
                                        isNaN_or_int(events.iloc[i]['PCount'])
                                        )
        e.write(string)

    p.close()
    g.close()
    e.close()

if __name__ == "__main__":
    generate()
