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

/*INSERT INTO clients (id, surname, name, patronymic, dob, sex, pensioner, bpl, city_of_residence_id, city_of_registration_id, marital_status_id, citizenship_id, disability_id)
VALUES
  (1, 'test', 'test', 'test', '2010-10-10', TRUE, FALSE, 'test', 1, 1, 1, 1, 1);

INSERT INTO passports (id, passport_series, passport_number, passport_authority, passport_date_of_issue, passport_identification_number)
VALUES
  (1, 'test', '1234567', 'test authority', '2010-10-10', '1234567M123PB6');

INSERT INTO contacts (id, address, phone_home, phone_mobile, email)
VALUES
  (1, 'test', '123456', '+375(12)1234567', 'test@test.te');*/

END TRANSACTION;