-- 006_create_playlist_songs_table.sql

CREATE TABLE IF NOT EXISTS PlaylistSongs (
    playlist_song_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    playlist_id UUID NOT NULL,
    song_id UUID NOT NULL,
    added_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    sequence_number INTEGER, -- To maintain order in playlist
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(), -- Keep created_at for consistency, though added_at is similar
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(), -- Might be useful if we allow modifying sequence_number or other attributes later

    CONSTRAINT fk_playlist
        FOREIGN KEY(playlist_id)
        REFERENCES Playlists(playlist_id)
        ON DELETE CASCADE, -- If a playlist is deleted, its song entries are also deleted.
    CONSTRAINT fk_song
        FOREIGN KEY(song_id)
        REFERENCES Songs(song_id)
        ON DELETE CASCADE, -- If a song is deleted, its entries in playlists are also deleted.
    UNIQUE (playlist_id, song_id) -- Prevent duplicate songs in the same playlist
);

CREATE INDEX IF NOT EXISTS idx_playlist_songs_playlist_id ON PlaylistSongs(playlist_id);
CREATE INDEX IF NOT EXISTS idx_playlist_songs_song_id ON PlaylistSongs(song_id);

-- Trigger for updated_at (optional for join tables, but included for consistency)
CREATE TRIGGER trigger_playlist_songs_updated_at
BEFORE UPDATE ON PlaylistSongs
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();
