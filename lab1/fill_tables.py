import pymssql

hostName = 'localhost'
userName = 'SA'
passw = 'ptvvrdbe16U'
DBase = 'OlympicDB'

conn = pymssql.connect(server=hostName, user=userName, password=passw, database=DBase)
cursor = conn.cursor()



p = open('participants.csv','r')
head = p.readline()
s1 = p.readline()
while s1:
    Id,Name,Sex,Age,Height,Weight,Team = s1.split('|')
    insert_string = "INSERT dbo.participants (Participant_id,PersonName,Sex,Age,HeightP,WeightP,Team) VALUES ({0},'{1}','{2}',{3},{4},{5},'{6}')".format(
                                                                                          Id,Name,Sex,Age,Height,Weight,Team
                                                                                          )
    print(insert_string)
    cursor.execute(insert_string)
    # row = cursor.fetchone()
    s1 = p.readline()

g = open('games.csv','r')
head = g.readline()
s2 = g.readline()
while s2:
    Id, year, season, city = s2.split('|')
    insert_string = "INSERT dbo.games (Game_id,YearG,Season,City) VALUES ({0},{1},'{2}','{3}')".format(
                                                                                          Id, year, season, city      
    )
    print(insert_string)
    cursor.execute(insert_string)
    # row = cursor.fetchone()
    s2 = g.readline()

e = open('events.csv','r')
head = e.readline()
s3 = e.readline()
while s3:
    Id,Sport,Event,PCount = s3.split('|')
    insert_string = "INSERT dbo.events (Event_id,Sport,EventName,PCount) VALUES ({0},'{1}','{2}',{3})".format(
                                                                                          Id,Sport,Event,PCount      
    )
    print(insert_string)
    cursor.execute(insert_string)
    # row = cursor.fetchone()
    s3 = e.readline()


pe = open('participants_events.csv','r')
head = pe.readline()
s4 = pe.readline()
while s4:
    Id,participant_id,event_id = s4.split('|')
    insert_string = "INSERT dbo.participants_events_relation (id,Participant_id,Event_id) VALUES ({0},{1},{2})".format(
                                                                                          Id,participant_id,event_id      
    )
    cursor.execute(insert_string)
    # row = cursor.fetchone()
    s4 = pe.readline()

eg = open('events_games.csv','r')
head = eg.readline()
s5 = eg.readline()
while s5:
    Id,game_id,event_id = s5.split('|')
    insert_string = "INSERT dbo.event_game_relation (id,Game_id,Event_id) VALUES ({0},{1},{2})".format(
                                                                                          Id,game_id,event_id     
    )
    cursor.execute(insert_string)
    # row = cursor.fetchone()
    s5 = eg.readline()


gp = open('games_participants.csv','r')
head = gp.readline()
s6 = gp.readline()
while s6:
    Id,participant_id,game_id = s6.split('|')
    insert_string = "INSERT dbo.participant_game_relation (id,Participant_id,Game_id) VALUES ({0},{1},{2})".format(
                                                                                          Id,participant_id,game_id    
    )
    cursor.execute(insert_string)
    # row = cursor.fetchone()
    s6 = gp.readline()


p.close()
g.close()
e.close()
pe.close()
eg.close()
gp.close()

conn.commit()
conn.close()

