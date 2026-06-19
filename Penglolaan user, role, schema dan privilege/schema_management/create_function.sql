CREATE FUNCTION sc.hitung_bonus(gaji INT) RETURNS INT AS $$ BEGIN RETURN gaji * 10 / 100; END; $$ LANGUAGE plpgsql;
