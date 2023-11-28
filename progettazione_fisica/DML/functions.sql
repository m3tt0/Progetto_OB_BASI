CREATE OR REPLACE FUNCTION calcoloNumeroSalvataggiRaccolta(raccolta raccolta.cod_raccolta%TYPE)
RETURNS INTEGER AS
$$
BEGIN
    RETURN (SELECT COUNT(*) FROM utente_salvataggio_raccolta AS r
                           WHERE r.raccolta = raccolta)
END;
$$