CREATE OR REPLACE TRIGGER TR_STAFF_RENT
AFTER INSERT OR DELETE ON PROPERTY_FOR_RENT FOR EACH ROW
--DECLARE
BEGIN
	IF INSERTING THEN
		UPDATE STAFF 
		SET KOL_RENT = KOL_RENT + 1
		WHERE SNO = :NEW.SNO;
	END IF;
	IF DELETING THEN
		UPDATE STAFF 
		SET KOL_RENT = KOL_RENT - 1
		WHERE SNO = :OLD.SNO;
	END IF;
END TR_STAFF_RENT;
