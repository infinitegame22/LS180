ALTER TABLE planets ALTER column mass TYPE numeric,
                    ALTER COLUMN mass SET NOT NULL,
                    ADD CHECK (mass >= 0);

ALTER TABLE planets ALTER COLUMN designation NOT NULL;

ALTER TABLE planets
    ALTER COLUMN mass TYPE numeric,
    ALTER COLUMN mass SET NOT NULL,
    ADD CHECK (mass > 0.0),
    ALTER COLUMN designation SET NOT NULL;