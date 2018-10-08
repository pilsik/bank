BEGIN TRANSACTION;

INSERT INTO cities (name) VALUES 
  ('Minsk'),
  ('Mogilev'),
  ('Grodno'),
  ('Vitebsk'),
  ('Gomel'),
  ('Brest');

INSERT INTO citizenships (name) VALUES 
  ('Belarus'),
  ('Russian'),
  ('Ukraine'),
  ('USA'),
  ('Canada'),
  ('Norway');

INSERT INTO disability (name) VALUES 
  ('no'),
  ('first group'),
  ('second group'),
  ('third group');

INSERT INTO marital_status (name) VALUES 
  ('single'),
  ('married'),
  ('divorced'),
  ('widowed');

END TRANSACTION;