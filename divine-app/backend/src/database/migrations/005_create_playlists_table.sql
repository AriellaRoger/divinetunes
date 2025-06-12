-- 005_create_playlists_table.sql

CREATE TABLE IF NOT EXISTS Playlists (
    playlist_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL, -- Owner of the playlist
    name VARCHAR(255) NOT NULL,
    description TEXT,
    artwork_url VARCHAR(255),
    is_public BOOLEAN DEFAULT TRUE,
    is_collaborative BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT fk_user
        FOREIGN KEY(user_id)
        REFERENCES Users(user_id)
        ON DELETE CASCADE -- If a user is deleted, their playlists are also deleted.
);

CREATE INDEX IF NOT EXISTS idx_playlists_name ON Playlists(name);
CREATE INDEX IF NOT EXISTS idx_playlists_user_id ON Playlists(user_id);

-- Trigger for updated_at
CREATE TRIGGER trigger_playlists_updated_at
BEFORE UPDATE ON Playlists
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();
