CREATE TABLE Doctors (
    doctorID INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);

CREATE TABLE Patients (
    patientID INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    birthDate DATE,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);
CREATE TABLE Appointments (
    appointmentID INT PRIMARY KEY AUTO_INCREMENT,
    patientID INT NOT NULL,
    doctorID INT NOT NULL,
    appointmentDate DATETIME NOT NULL,
    status VARCHAR(50) DEFAULT 'Scheduled',
    FOREIGN KEY (patientID) REFERENCES Patients(patientID),
    FOREIGN KEY (doctorID) REFERENCES Doctors(doctorID)
);
CREATE TABLE Treatments (
    treatmentID INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    cost DECIMAL(10, 2) NOT NULL
);
CREATE TABLE Appointment_Treatments (
    appointmentID INT,
    treatmentID INT,
    PRIMARY KEY (appointmentID, treatmentID),
    FOREIGN KEY (appointmentID) REFERENCES Appointments(appointmentID),
    FOREIGN KEY (treatmentID) REFERENCES Treatments(treatmentID)
);
CREATE TABLE Payments (
    paymentID INT PRIMARY KEY AUTO_INCREMENT,
    appointmentID INT UNIQUE,
    amount DECIMAL(10, 2) NOT NULL,
    paymentDate DATETIME NOT NULL,
    method VARCHAR(50),
    FOREIGN KEY (appointmentID) REFERENCES Appointments(appointmentID)
);
