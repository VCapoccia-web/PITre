USE [PCM_DEPOSITO_1]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================
-- Author:		Giovanni Olivari
-- Create date: 29/04/2013
-- Description:	Restituisce la lista dei documenti aggregati
--              , coinvolti nello scarto passato come parametro
-- ============================================================
ALTER PROCEDURE [DOCSADM].[sp_ARCHIVE_BE_GetDocumentsByDisposalID]
(	
	@disposalID int
)
AS
BEGIN

	DECLARE @sql_string nvarchar(MAX)
	DECLARE @countDistinct int = 0

	-- Conteggio DISTINCT dei documenti
	--
	SELECT @countDistinct = COUNT(DISTINCT Profile_ID) 
	FROM ARCHIVE_TEMPPROFILEDISPOSAL
	WHERE DISPOSAL_ID = @disposalID

	PRINT @countDistinct


	SET @sql_string = CAST(N'	
		SELECT REGISTRO, TITOLARIO, CLASSETITOLARIO, TIPOLOGIA, ANNO_CREAZIONE
		, COUNT(*) TOTALE, ' AS NVARCHAR(MAX)) + CAST(@countDistinct AS NVARCHAR(MAX)) + CAST(' COUNTDISTINCT
		FROM
			(
			SELECT 
				R.VAR_CODICE REGISTRO
				, CASE TIT.CHA_STATO
					WHEN ''A'' THEN ''Titolario attivo''
					WHEN ''C'' THEN ''Titolario in vigore dal '' + CONVERT(VARCHAR(10), TIT.DTA_ATTIVAZIONE, 103) + '' al '' + CONVERT(VARCHAR(10), TIT.DTA_CESSAZIONE, 103)
					WHEN ''D'' THEN ''Titolario in definizione''
					ELSE ''Stato titolario sconosciuto''
				END TITOLARIO
				, FP.VAR_CODICE CLASSETITOLARIO
				, TA.VAR_DESC_ATTO TIPOLOGIA
				, YEAR(P.CREATION_DATE) ANNO_CREAZIONE
			FROM ARCHIVE_TEMPPROFILEDISPOSAL TP INNER JOIN PROFILE P ON TP.PROFILE_ID = P.SYSTEM_ID
			LEFT OUTER JOIN DPA_EL_REGISTRI R ON P.ID_REGISTRO = R.SYSTEM_ID
			LEFT OUTER JOIN DPA_TIPO_ATTO TA ON P.ID_TIPO_ATTO = TA.SYSTEM_ID
			LEFT OUTER JOIN PROJECT_COMPONENTS PC ON P.SYSTEM_ID = PC.LINK
			LEFT OUTER JOIN PROJECT F ON PC.PROJECT_ID = F.SYSTEM_ID
			LEFT OUTER JOIN PROJECT FP ON F.ID_PARENT = FP.SYSTEM_ID
			LEFT OUTER JOIN PROJECT TIT ON FP.ID_TITOLARIO = TIT.SYSTEM_ID
			WHERE TP.DISPOSAL_ID = ' AS NVARCHAR(MAX)) + CAST(@disposalID AS NVARCHAR(MAX)) + CAST('
			AND TP.DASCARTARE = 1
			) T1
		GROUP BY REGISTRO, TITOLARIO, CLASSETITOLARIO, TIPOLOGIA, ANNO_CREAZIONE'AS NVARCHAR(MAX))
		
	PRINT @sql_string
		
	EXECUTE sp_executesql @sql_string;

END
