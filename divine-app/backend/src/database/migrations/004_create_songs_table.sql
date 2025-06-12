-- 004_create_songs_table.sql

CREATE TABLE IF NOT EXISTS Songs (
    song_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    album_id UUID, -- Can be null if it's a single track not part of an album
    artist_id UUID NOT NULL, -- Denormalized for easier access
    title VARCHAR(255) NOT NULL,
    duration_seconds INTEGER,
    file_url VARCHAR(255) NOT NULL, -- URL to S3 or other storage
    genre VARCHAR(100),
    lyrics TEXT,
    track_number INTEGER,
    plays BIGINT DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT fk_album
        FOREIGN KEY(album_id)
        REFERENCES Albums(album_id)
        ON DELETE SET NULL, -- If an album is deleted, song remains but album_id is set to NULL
    CONSTRAINT fk_artist
        FOREIGN KEY(artist_id)
        REFERENCES Artists(artist_id)
        ON DELETE CASCADE -- If an artist is deleted, their songs are also deleted.
);

CREATE INDEX IF NOT EXISTS idx_songs_title ON Songs(title);
CREATE INDEX IF NOT EXISTS idx_songs_album_id ON Songs(album_id);
CREATE INDEX IF NOT EXISTS idx_songs_artist_id ON Songs(artist_id);
CREATE INDEX IF NOT EXISTS idx_songs_genre ON Songs(genre); -- Added index for genre

-- Trigger for updated_at
CREATE TRIGGER trigger_songs_updated_at
BEFORE UPDATE ON Songs
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();
