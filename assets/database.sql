CREATE TABLE IF NOT EXISTS choices(
    choice_id INTEGER PRIMARY KEY,
    window_name TEXT,
    window_id INTEGER,
    canteen_name TEXT,
    canteen_id INTEGER,
    FOREIGN KEY(canteen_id) REFERENCES canteen(id)
);

INSERT INTO
    choices(
        choice_id,
        window_name,
        window_id,
        canteen_name,
        canteen_id
    )
VALUES
    (3, '台湾卤肉饭', 3, 'south', 3);

INSERT INTO
    choices(
        choice_id,
        window_name,
        window_id,
        canteen_name,
        canteen_id
    )
VALUES
    (1, '黄焖鸡米饭饭', 12, 'south', 3);

INSERT INTO
    choices(
        choice_id,
        window_name,
        window_id,
        canteen_name,
        canteen_id
    )
VALUES
    (2, '山西刀削面', 3, 'north', 2);

-- Path: assets\database.sql
-- above are EXAMPLES, you can delete them if you want
-- csv files are in assets\data.csv
.mode csv -- add your own csv files here
.import data.csv choices
ALTER TABLE
    choices
ADD
    COLUMN id INTEGER;

UPDATE
    choices
SET
    id = ROWID;