-- 010_create_live_streams_table.sql

CREATE TABLE IF NOT EXISTS LiveStreams (
    live_stream_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    artist_id UUID NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    start_time TIMESTAMP WITH TIME ZONE NOT NULL,
    end_time TIMESTAMP WITH TIME ZONE,
    stream_url VARCHAR(255), -- This might be the MUX stream key or similar
    playback_url VARCHAR(255), -- URL for users to watch
    status VARCHAR(50) DEFAULT 'upcoming' CHECK (status IN ('upcoming', 'live', 'ended', 'cancelled')),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT fk_artist
        FOREIGN KEY(artist_id)
        REFERENCES Artists(artist_id)
        ON DELETE CASCADE -- If an artist is deleted, their live streams are also deleted.
);

CREATE INDEX IF NOT EXISTS idx_live_streams_artist_id ON LiveStreams(artist_id);
CREATE INDEX IF NOT EXISTS idx_live_streams_status ON LiveStreams(status);
CREATE INDEX IF NOT EXISTS idx_live_streams_start_time ON LiveStreams(start_time);

-- Trigger for updated_at
CREATE TRIGGER trigger_live_streams_updated_at
BEFORE UPDATE ON LiveStreams
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();
