USE OlympicDB
GO

ALTER TABLE dbo.participants_events_relation ADD
CONSTRAINT P_ID FOREIGN KEY (Participant_id) REFERENCES dbo.participants (Participant_id),
CONSTRAINT E_ID FOREIGN KEY (Event_id) REFERENCES dbo.events (Event_id)
GO

ALTER TABLE dbo.event_game_relation ADD
CONSTRAINT P_ID FOREIGN KEY (Game_id) REFERENCES dbo.games (Game_id),
CONSTRAINT E_ID FOREIGN KEY (Event_id) REFERENCES dbo.events (Event_id)
GO

ALTER TABLE dbo.participant_game_relation ADD
CONSTRAINT P_ID FOREIGN KEY (Participant_id) REFERENCES dbo.participants (Participant_id),
CONSTRAINT E_ID FOREIGN KEY (Game_id) REFERENCES dbo.games (Event_id)
GO