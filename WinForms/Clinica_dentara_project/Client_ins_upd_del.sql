-- CODE TO INSERT, UPDATE, DELETE CLIENT INFO FOR CLINICA_PROJECT IN EMBARCADERO --

INSERT INTO CLIENT(NUME, PRENUME, DATA_NASTERII, IDNP, TELEFON, ADRESA)
VALUES(:NUME, :PRENUME, :DATA_NASTERII, :IDNP, :TELEFON, :ADRESA)

UPDATE CLIENT SET NUME=:NUME, PRENUME=:PRENUME, DATA_NASTERII=:DATA_NASTERII, 
				  IDNP=:IDNP, TELEFON=:TELEFON, ADRESA=:ADRESA
	WHERE CLIENT_ID =:CLIENT_ID

DELETE CLIENT
	WHERE CLIENT_ID =:CLIENT_ID

DELETE CLIENT
	WHERE CLIENT_ID = 2