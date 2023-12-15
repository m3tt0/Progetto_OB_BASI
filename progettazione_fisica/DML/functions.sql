CREATE OR REPLACE FUNCTION calcoloNumeroSalvataggiRaccolta(cod_raccolta Raccolta.cod_raccolta%TYPE)
RETURNS INTEGER AS
$$
BEGIN
    RETURN (SELECT COUNT(r.utente) FROM Utente_Salvataggio_Raccolta AS r
                           WHERE r.raccolta = cod_raccolta);
END
$$
LANGUAGE plpgsql;