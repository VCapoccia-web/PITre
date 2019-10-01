-- =============================================
-- Author:		FRANCESCO FONZO
-- Create date: 21/02/2013
-- Description:	CONVERSIONE DA ORACLE A SQL SERVER
-- =============================================

DECLARE @db_user	VARCHAR(1024)
SET @db_user = 'DOCSADM'

-- INSERIMENTO NELLA DPA_AREA_CONSERVAZIONE DI UNA NUOVA COLONNA VALIDATION_MASK (MASCHERA DI BIT PER VALIDAZIONE VERIFICA)
-- ES. DATO CONTENUTO: 0,1,2,4,8.. A POTENZE DI DUE
-- 0 = NON VERIFICATO
-- 1 = ...

DECLARE @COUNT	INT

SET @COUNT = (SELECT COUNT(*) FROM SYS.columns WHERE name = 'VALIDATION_MASK' AND OBJECT_ID = (SELECT OBJECT_ID FROM SYS.tables WHERE name = 'DPA_AREA_CONSERVAZIONE'))

IF (@COUNT = 0)
BEGIN
	EXECUTE DOCSADM.Utl_Add_Column '3.23',@db_user,'DPA_AREA_CONSERVAZIONE','VALIDATION_MASK','INT',0, NULL, NULL, NULL
END