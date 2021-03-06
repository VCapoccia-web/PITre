USE [PCM_DEPOSITO_1]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================
-- Author:		Giovanni Olivari
-- Create date: 04/07/2013
-- Description:	Esegue i job schedulati per l'entità Disposal
-- ==========================================================
ALTER PROCEDURE [DOCSADM].[sp_ARCHIVE_BE_ExecuteJobDisposal]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;



	-- Chiude e dealloca eventuali cursori rimasti aperti
	--
	execute sp_ARCHIVE_BE_CleanUpCursor 'executeDisposal_cursor'


	
	DECLARE @systemID INT
	DECLARE @disposalID INT
	DECLARE @jobType INT
	DECLARE @returnValue INT
	--DECLARE @NumberOfObjectsPerTransaction INT
	--DECLARE @DatetimeLimit Datetime

	DECLARE @log VARCHAR(2000)
	DECLARE @logType VARCHAR(10)
	DECLARE @logObject VARCHAR(50) = OBJECT_NAME(@@PROCID)
	DECLARE @logObjectType VARCHAR(50)
	DECLARE @logObjectID INT


	
	SET @logType = 'INFO'
	SET @log = 'Start execution job Disposal'

	EXECUTE sp_ARCHIVE_BE_InsertLog @log, @logType, @logObject

	
	
	DECLARE executeDisposal_cursor CURSOR
	FOR SELECT 
		[SYSTEM_ID]
		,[DISPOSAL_ID]
		,[JOBTYPE_ID]
		--,[INSERTJOBTIMESTAMP]
		--,[STARTJOBTIMESTAMP]
		--,[ENDJOBTIMESTAMP]
		--,[EXECUTED]
	FROM [DOCSADM].[ARCHIVE_JOB_DISPOSAL]
	WHERE [EXECUTED] = 0
	     
	OPEN executeDisposal_cursor
	FETCH executeDisposal_cursor INTO @systemID, @disposalID, @jobType
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		
		SET @returnValue = 1
	 
		PRINT 'DisposalID: ' + CAST(@disposalID AS NVARCHAR(MAX))
		PRINT 'JobType: ' + CAST(@jobType AS NVARCHAR(MAX))
		
		-- Aggiorna la data di start
		--
		UPDATE [DOCSADM].[ARCHIVE_JOB_DISPOSAL]
		SET [STARTJOBTIMESTAMP] = GETDATE()
		WHERE [SYSTEM_ID] = @systemID
		
		-- Esegue il comando schedulato in base al jobType
		--		
		-- 1 - RICERCA
		-- 3 - ESECUZIONE

		IF (@jobType = 1)
			-- RICERCA
			BEGIN
				SET @logType = 'INFO'
				SET @log = 'Job RICERCA per il Disposal: ' + CAST(@disposalID AS NVARCHAR(MAX))
				
				EXECUTE sp_ARCHIVE_BE_InsertLog @log, @logType, @logObject

				EXECUTE sp_ARCHIVE_BE_StartSearchForDisposal @disposalID
			END
		ELSE
			BEGIN
			
				IF (@jobType = 3)
					-- ESECUZIONE
					BEGIN
						SET @logType = 'INFO'
						SET @log = 'Job ESECUZIONE per il Disposal: ' + CAST(@disposalID AS NVARCHAR(MAX))
						
						EXECUTE sp_ARCHIVE_BE_InsertLog @log, @logType, @logObject

						EXECUTE sp_ARCHIVE_BE_ExecuteDisposalByID @disposalID
					END
				ELSE
					-- Qualsiasi altro valore non è previsto per i job schedulati per il Disposal
					BEGIN
		
						set @logType = 'WARNING'
						set @log = 'JobType non previsto per la schedulazione Disposal - Valore: ' + CAST(@jobType AS NVARCHAR(MAX))
						
						EXECUTE sp_ARCHIVE_BE_InsertLog @log, @logType, @logObject
					
					END
					
			END
		
		-- Aggiorna la data di end e il flag di esecuzione
		--
		UPDATE ARCHIVE_JOB_Disposal
			SET ENDJOBTIMESTAMP = GETDATE()
			, EXECUTED = 1
		WHERE SYSTEM_ID = @systemID
	   
		FETCH executeDisposal_cursor INTO @systemID, @disposalID, @jobType
	END
	  
	CLOSE executeDisposal_cursor
	DEALLOCATE executeDisposal_cursor


	
	SET @logType = 'INFO'
	SET @log = 'End execution job Disposal'

	EXECUTE sp_ARCHIVE_BE_InsertLog @log, @logType, @logObject

END
