-- 012_create_user_activity_table.sql

CREATE TABLE IF NOT EXISTS UserActivity (
    activity_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    activity_type VARCHAR(100) NOT NULL, -- e.g., 'played_song', 'liked_album', 'followed_artist', 'posted_testimony'
    target_id UUID, -- e.g., song_id, album_id, artist_id, testimony_id. Using UUID for consistency.
    target_type VARCHAR(100), -- e.g., 'Song', 'Album', 'Artist', 'Testimony'
    activity_timestamp TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    details JSONB, -- For storing additional context-specific data
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(), -- Redundant with activity_timestamp but kept for pattern consistency
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(), -- Likely won't be updated, but kept for pattern consistency

    CONSTRAINT fk_user
        FOREIGN KEY(user_id)
        REFERENCES Users(user_id)
        ON DELETE CASCADE -- If a user is deleted, their activity log is also deleted.
);

CREATE INDEX IF NOT EXISTS idx_user_activity_user_id ON UserActivity(user_id);
CREATE INDEX IF NOT EXISTS idx_user_activity_activity_type ON UserActivity(activity_type);
CREATE INDEX IF NOT EXISTS idx_user_activity_target_id ON UserActivity(target_id);
CREATE INDEX IF NOT EXISTS idx_user_activity_target_type ON UserActivity(target_type);
CREATE INDEX IF NOT EXISTS idx_user_activity_timestamp ON UserActivity(activity_timestamp);

-- Trigger for updated_at (less likely to be used for this table)
CREATE TRIGGER trigger_user_activity_updated_at
BEFORE UPDATE ON UserActivity
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();
