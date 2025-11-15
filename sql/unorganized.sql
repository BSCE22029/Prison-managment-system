-- Database: Prison

-- DROP DATABASE IF EXISTS "Prison";

CREATE DATABASE "Prison"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;


	-- Step 1: Create a custom type for Person
CREATE TYPE Person AS (
    first_name VARCHAR,
    last_name VARCHAR,
    dob DATE,
    age INTEGER,
    nationality VARCHAR,
    gender VARCHAR
);

-- Table: Prisions
CREATE TABLE Prisions (
    prision_id SERIAL PRIMARY KEY,
    prision_name VARCHAR NOT NULL,
    prision_location VARCHAR NOT NULL
);

-- Table: Admins
CREATE TABLE Admins (
    admin_id SERIAL PRIMARY KEY,
    prision_id INTEGER REFERENCES Prisions(prision_id),
    admin_email VARCHAR UNIQUE NOT NULL,
    admin_password VARCHAR NOT NULL,
    access_level INTEGER NOT NULL
);




-- Add new foreign key with cascading deletes
ALTER TABLE visitingDetails
ADD CONSTRAINT visitingdetails_prision_id_fkey
FOREIGN KEY (prision_id) REFERENCES Prisions(prision_id) ON DELETE CASCADE;


-- visiting slots
-- Drop existing foreign key
ALTER TABLE visitingSlots DROP CONSTRAINT visitingslots_visiting_id_fkey;

-- Add new foreign key with cascading deletes
ALTER TABLE visitingSlots
ADD CONSTRAINT visitingslots_visiting_id_fkey
FOREIGN KEY (visiting_id) REFERENCES visitingDetails(visiting_id) ON DELETE CASCADE;


-- visiting reservations
-- Drop existing foreign keys
ALTER TABLE visitingReservations DROP CONSTRAINT visitingreservations_slot_id_fkey;
ALTER TABLE visitingReservations DROP CONSTRAINT visitingreservations_prisoner_id_fkey;

-- Add new foreign keys with cascading deletes
ALTER TABLE visitingReservations
ADD CONSTRAINT visitingreservations_slot_id_fkey
FOREIGN KEY (slot_id) REFERENCES visitingSlots(slot_id) ON DELETE CASCADE;

ALTER TABLE visitingReservations
ADD CONSTRAINT visitingreservations_prisoner_id_fkey
FOREIGN KEY (prisoner_id) REFERENCES Prisoner(prisoner_id) ON DELETE CASCADE;


-- medical records
-- Drop existing foreign key
ALTER TABLE Prisoner_Medical_Records DROP CONSTRAINT prisoner_medical_records_prisoner_id_fkey;

ALTER TABLE Prisoner_Medical_Records
ADD CONSTRAINT prisonermedicalrecords_prisoner_id_fkey
FOREIGN KEY (prisoner_id) REFERENCES Prisoner(prisoner_id) ON DELETE CASCADE;


-- incident reports
ALTER TABLE Incident_Reports DROP CONSTRAINT incidentreports_reported_by_guard_id_fkey;

ALTER TABLE Incident_Reports
ADD CONSTRAINT incidentreports_reported_by_guard_id_fkey
FOREIGN KEY (reported_by_guard_id) REFERENCES Guards(guard_id) ON DELETE CASCADE;

ALTER TABLE Incident_Reports DROP CONSTRAINT incidentreports_prisoner_involved_id_fkey;

ALTER TABLE Incident_Reports
ADD CONSTRAINT incidentreports_prisoner_involved_id_fkey
FOREIGN KEY (prisoner_involved_id) REFERENCES Prisoner(prisoner_id) ON DELETE CASCADE;




-- Insert into Prisions
INSERT INTO Prisions (prision_name, prision_location)
VALUES 
('Central Jail Karachi', 'Karachi, Sindh'),
('Adiala Jail', 'Rawalpindi, Punjab'),
('Mach Jail', 'Mach, Balochistan');

-- Insert into Admins
INSERT INTO Admins (prision_id, admin_email, admin_password, access_level)
VALUES 
(NULL, 'admin_karachi@jail.pk', 'securepassword123', 1),
(1, 'assistant_admin_karachi@jail.pk', 'securepassword999', 2);

-- Insert into Guards
INSERT INTO Guards (prision_id, person, joining_date, shift, qr_code)
VALUES 
(1, ROW('Ali', 'Khan', '1985-01-15', 39, 'Pakistani', 'Male'), '2020-01-01', 'Morning', 12345)'


-- Insert into Prisoner
INSERT INTO Prisoner (prision_id, person, sentence_start_date, sentence_end_date, prisoner_status, visitor_1, visitor_2, sentence, crime)
VALUES 
(1, ROW('Riaz', 'Ahmed', '1985-07-20', 39, 'Pakistani', 'Male'), '2023-01-01', NULL, 'Active', 101, 102, '5 years', 'Theft');


-- Insert into visitingDetails
INSERT INTO visitingDetails (prision_id, day_of_week, start_time, end_time)
VALUES 
(1, 'Monday', '09:00:00', '17:00:00');


-- Insert into visitingSlots
INSERT INTO visitingSlots (visiting_id, slot_time, capacity)
VALUES 
(1, '10:00:00', 10);


-- Insert into visitingReservations
INSERT INTO visitingReservations (slot_id, prisoner_id, reservation_time, visitor_id, visit_date)
VALUES 
(1, 1, '10:00:00', 201, '2023-11-01');


-- Insert into Prisoner_Medical_Records
INSERT INTO Prisoner_Medical_Records (prisoner_id, checkup_date, diagnosis, treatment, doctor_name, follow_up_date, special_care_required)
VALUES 
(1, '2023-01-10', 'Fever', 'Paracetamol', 'Dr. Ahmed', '2023-01-20', FALSE);


-- Insert into Incident_Reports
INSERT INTO Incident_Reports (reported_by_guard_id, prisoner_involved_id, incident_date, incident_time, incident_description, action_taken, resolution_date, additional_notes)
VALUES 
(1, 1, '2023-06-01', '12:30:00', 'Prisoner attempted to escape', 'Increased surveillance', '2023-06-05', 'None');


Select * from Prisions
Select * from Admins
Select * from Guards
Select * from Prisoner
Select * from visitingDetails
Select * from visitingSlots
Select * from visitingReservations
Select * from Incident_Reports
Select * from Prisoner_Medical_Records
Select * from GuardAttendance


ALTER TABLE Guards
DROP COLUMN check_in_time,
DROP COLUMN check_out_time;

