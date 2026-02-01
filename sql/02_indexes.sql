-- Indexes to optimize analytical queries on large datasets

CREATE INDEX idx_events_time ON events(event_time);
CREATE INDEX idx_events_user ON events(user_id);
CREATE INDEX idx_events_session ON events(user_session);
CREATE INDEX idx_events_type ON events(event_type);
