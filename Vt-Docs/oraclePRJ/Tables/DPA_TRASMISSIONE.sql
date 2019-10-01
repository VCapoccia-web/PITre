--------------------------------------------------------
--  DDL for Table DPA_TRASMISSIONE
--------------------------------------------------------

  CREATE TABLE "ITCOLL_6GIU12"."DPA_TRASMISSIONE" 
   (	"SYSTEM_ID" NUMBER(10,0), 
	"ID_RUOLO_IN_UO" NUMBER(10,0), 
	"ID_PEOPLE" NUMBER(10,0), 
	"CHA_TIPO_OGGETTO" VARCHAR2(1 BYTE), 
	"ID_PROFILE" NUMBER(10,0), 
	"ID_PROJECT" NUMBER(10,0), 
	"DTA_INVIO" DATE, 
	"VAR_NOTE_GENERALI" VARCHAR2(2000 BYTE), 
	"CHA_CESSIONE" CHAR(1 BYTE), 
	"CHA_SALVATA_CON_CESSIONE" CHAR(1 BYTE), 
	"ID_PEOPLE_DELEGATO" NUMBER(10,0)
   ) ;