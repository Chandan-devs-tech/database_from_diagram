/*Database Creation*/
createdb -U postgres clinic-database
psql -U postgres clinic-database

/*All Table Creation*/

CREATE TABLE patients (id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,name VARCHAR(50),date_of_birth DATE);
CREATE TABLE medical_history (id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,admitted_at TIMESTAMP,patient_id INT REFERENCES patients(id),STATUS VARCHAR(50));