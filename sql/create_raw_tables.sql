
CREATE TABLE IF NOT EXISTS raw.member_file_records (

    raw_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    batch_id UUID NOT NULL,

    source_file VARCHAR(255) NOT NULL,

    record_number BIGINT NOT NULL,

    raw_record TEXT NOT NULL,

    ingested_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT uq_member_batch_record
        UNIQUE (batch_id, record_number)

);

-- Index for retrieving records belonging to a batch
CREATE INDEX IF NOT EXISTS idx_member_raw_batch
ON raw.member_file_records(batch_id);

-- Index for file-level auditing
CREATE INDEX IF NOT EXISTS idx_member_raw_source_file
ON raw.member_file_records(source_file);
