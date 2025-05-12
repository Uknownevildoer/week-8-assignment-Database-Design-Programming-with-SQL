-- Create table for storing doctor information
CREATE TABLE Doctors (
    doctorID INT PRIMARY KEY AUTO_INCREMENT,   -- Unique ID for each doctor
    name VARCHAR(100) NOT NULL,                -- Doctor's full name
    specialization VARCHAR(100),               -- Medical specialty
    email VARCHAR(100) UNIQUE,                 -- Email (must be unique)
    phone VARCHAR(15)                          -- Contact number
);

-- Create table for storing patient information
CREATE TABLE Patients (
    patientID INT PRIMARY KEY AUTO_INCREMENT,  -- Unique ID for each patient
    name VARCHAR(100) NOT NULL,                -- Patient's full name
    birthDate DATE,                            -- Date of birth
    email VARCHAR(100) UNIQUE,                 -- Email (must be unique)
    phone VARCHAR(15)                          -- Contact number
);

-- Table to schedule appointments between patients and doctors
CREATE TABLE Appointments (
    appointmentID INT PRIMARY KEY AUTO_INCREMENT,    -- Unique ID for each appointment
    patientID INT NOT NULL,                          -- Link to patient
    doctorID INT NOT NULL,                           -- Link to doctor
    appointmentDate DATETIME NOT NULL,               -- Date and time of appointment
    status VARCHAR(50) DEFAULT 'Scheduled',          -- Status: Scheduled, Completed, Cancelled, etc.
    FOREIGN KEY (patientID) REFERENCES Patients(patientID),  -- FK to Patients
    FOREIGN KEY (doctorID) REFERENCES Doctors(doctorID)      -- FK to Doctors
);

-- Table for storing available treatments
CREATE TABLE Treatments (
    treatmentID INT PRIMARY KEY AUTO_INCREMENT,      -- Unique ID for each treatment
    name VARCHAR(100) NOT NULL,                      -- Treatment name
    description TEXT,                                -- Optional detailed description
    cost DECIMAL(10, 2) NOT NULL                     -- Cost of the treatment
);

-- Join table to link treatments to specific appointments (Many-to-Many)
CREATE TABLE Appointment_Treatments (
    appointmentID INT,                               -- FK to Appointments
    treatmentID INT,                                 -- FK to Treatments
    PRIMARY KEY (appointmentID, treatmentID),        -- Composite PK
    FOREIGN KEY (appointmentID) REFERENCES Appointments(appointmentID),
    FOREIGN KEY (treatmentID) REFERENCES Treatments(treatmentID)
);

-- Table to track payments made for appointments
CREATE TABLE Payments (
    paymentID INT PRIMARY KEY AUTO_INCREMENT,        -- Unique ID for each payment
    appointmentID INT UNIQUE,                        -- FK to Appointment (1-to-1)
    amount DECIMAL(10, 2) NOT NULL,                  -- Payment amount
    paymentDate DATETIME NOT NULL,                   -- When the payment was made
    method VARCHAR(50),                              -- Payment method: Cash, Card, etc.
    FOREIGN KEY (appointmentID) REFERENCES Appointments(appointmentID)
);
