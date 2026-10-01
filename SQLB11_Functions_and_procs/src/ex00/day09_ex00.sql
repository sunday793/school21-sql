CREATE TABLE IF NOT EXISTS person_audit (
    created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
    type_event CHAR(1) DEFAULT 'I' NOT NULL,
    row_id BIGINT NOT NULL,
    name VARCHAR,
    age INTEGER,
    gender VARCHAR,
    address VARCHAR,
    CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'U', 'D'))
);

-- Database Trigger Function for INSERT
CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() 
RETURNS TRIGGER AS $fnc_trg_person_insert_audit$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        
        INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
        VALUES (NOW(), 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
        
        RETURN NEW;
    END IF;
    
    RETURN NULL; 
END;
$fnc_trg_person_insert_audit$ LANGUAGE plpgsql;

-- Database Trigger for INSERT
CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
FOR EACH ROW 
EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');

SELECT * FROM person_audit;