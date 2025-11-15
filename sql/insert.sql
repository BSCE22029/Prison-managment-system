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
(1, 'assistant_admin_karachi@jail.pk', 'securepassword999', 2),
(2, 'admin_rawalpindi@jail.pk', 'securepassword456', 2),
(3, 'admin_mach@jail.pk', 'securepassword789', 2);

-- Insert into Guards
INSERT INTO Guards (prision_id, person, joining_date, shift, qr_code)
VALUES 
(1, ROW('Ali', 'Khan', '1985-01-15', 39, 'Pakistani', 'Male'), '2020-01-01', 'Morning', 12345),
(2, ROW('Ahmed', 'Raza', '1990-05-20', 34, 'Pakistani', 'Male'), '2019-05-15', 'Evening', 67890),
(3, ROW('Sara', 'Ali', '1992-09-10', 32, 'Pakistani', 'Female'), '2021-03-10', 'Night', 11223);

-- Insert into Prisoner
INSERT INTO Prisoner (prision_id, person, sentence_start_date, sentence_end_date, prisoner_status, visitor_1, visitor_2, sentence, crime)
VALUES 
(1, ROW('Riaz', 'Ahmed', '1985-07-20', 39, 'Pakistani', 'Male'), '2023-01-01', NULL, 'Active', 101, 102, '5 years', 'Theft'),
(2, ROW('Zainab', 'Riaz', '1993-04-15', 31, 'Pakistani', 'Female'), '2022-08-15', '2026-08-14', 'Active', 103, NULL, '4 years', 'Fraud'),
(3, ROW('Usman', 'Farooq', '1988-12-30', 35, 'Pakistani', 'Male'), '2021-09-10', '2024-09-09', 'Released', 104, NULL, '3 years', 'Assault'),

-- Insert into visitingDetails
INSERT INTO visitingDetails (prision_id, day_of_week, start_time, end_time)
VALUES 
(1, 'Monday', '09:00:00', '17:00:00'),


-- Insert into visitingSlots
INSERT INTO visitingSlots (visiting_id, slot_time, capacity)
VALUES 
(1, '10:00:00', 10),


-- Insert into visitingReservations
INSERT INTO visitingReservations (slot_id, prisoner_id, reservation_time, visitor_id, visit_date)
VALUES 
(1, 1, '10:00:00', 201, '2023-11-01'),


-- Insert into Prisoner_Medical_Records
INSERT INTO Prisoner_Medical_Records (prisoner_id, checkup_date, diagnosis, treatment, doctor_name, follow_up_date, special_care_required)
VALUES 
(1, '2023-01-10', 'Fever', 'Paracetamol', 'Dr. Ahmed', '2023-01-20', FALSE),


-- Insert into Incident_Reports
INSERT INTO Incident_Reports (reported_by_guard_id, prisoner_involved_id, incident_date, incident_time, incident_description, action_taken, resolution_date, additional_notes)
VALUES 
(1, 1, '2023-06-01', '12:30:00', 'Prisoner attempted to escape', 'Increased surveillance', '2023-06-05', 'None'),

