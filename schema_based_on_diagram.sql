/*Database Creation*/
createdb -U postgres clinic-database
psql -U postgres clinic-database

/*All Table Creation*/

CREATE TABLE patients (id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,name VARCHAR(50),date_of_birth DATE);

CREATE TABLE medical_history (id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,admitted_at TIMESTAMP,patient_id INT REFERENCES patients(id),STATUS VARCHAR(50));

CREATE TABLE invoices (id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,total_amount DECIMAL,generated_at TIMESTAMP,payed_at TIMESTAMP, medical_history_id INT REFERENCES medical_history(id));

CREATE TABLE invoice_items(id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, unit_price DECIMAL, quantity INT, total_price DECIMAL, invoice_id INT REFERENCES invoices(id), treatment_id INT);

CREATE TABLE treatments(id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, type VARCHAR(50), name VARCHAR(50));

ALTER TABLE invoice_items ADD CONSTRAINT fk_treatments FOREIGN KEY (treatment_id) REFERENCES treatments(id);

CREATE TABLE medical_histories_treatments (id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, medical_histories_id INT REFERENCES medical_history (id), treatments_id INT REFERENCES treatments (id));

CREATE INDEX idx_treatment_id ON invoice_items (treatment_id ASC);
CREATE INDEX idx_invoice_id ON invoice_items (invoice_id ASC);
CREATE INDEX idx_medical_history_id ON invoices (medical_history_id ASC);
CREATE INDEX idx_medical_histories_treatments_id ON medical_histories_treatments (medical_histories_id ASC);
CREATE INDEX idx_treatments_id2 ON medical_histories_treatments (treatments_id ASC);
CREATE INDEX idx_patient_id ON  medical_history (patient_id ASC);


