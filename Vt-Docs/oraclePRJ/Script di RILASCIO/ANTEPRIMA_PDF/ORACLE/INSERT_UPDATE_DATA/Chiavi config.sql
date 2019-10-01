INSERT
INTO DPA_CHIAVI_CONFIGURAZIONE
  (
    SYSTEM_ID,
    ID_AMM,
    VAR_CODICE,
    VAR_DESCRIZIONE,
    VAR_VALORE,
    CHA_TIPO_CHIAVE,
    CHA_VISIBILE,
    CHA_MODIFICABILE,
    CHA_GLOBALE,
    VAR_CODICE_OLD_WEBCONFIG,
    DTA_INSERIMENTO,
    VERSIONE_CD,
    CHA_CONSERVAZIONE
  )
  VALUES
  (
    SEQ_DPA_CHIAVI_CONFIG.NEXTVAL,
    '361',
    'FE_PREVIEW_PDF',
    'ATTIVA DISATTIVA ANTEPRIME FILE PDF',
    '1',
    'F',
    '1',
    '1',
    '0',
    null,
    SYSDATE,
    '3.19',
    '0'
  );

INSERT
INTO DPA_CHIAVI_CONFIGURAZIONE
  (
    SYSTEM_ID,
    ID_AMM,
    VAR_CODICE,
    VAR_DESCRIZIONE,
    VAR_VALORE,
    CHA_TIPO_CHIAVE,
    CHA_VISIBILE,
    CHA_MODIFICABILE,
    CHA_GLOBALE,
    VAR_CODICE_OLD_WEBCONFIG,
    DTA_INSERIMENTO,
    VERSIONE_CD,
    CHA_CONSERVAZIONE
  )
  VALUES
  (
    SEQ_DPA_CHIAVI_CONFIG.NEXTVAL,
    '361',
    'FE_PREVIEW_PDF_UP_DOWN',
    'ATTIVA DISATTIVA PULSANTI DI NAVIGAZIONE TRA LE ANTEPRIME PDF',
    '1',
    'F',
    '1',
    '1',
    '0',
    null,
    SYSDATE,
    '3.19',
    '0'
  );

/*
INSERT
INTO DPA_CHIAVI_CONFIGURAZIONE
  (
    SYSTEM_ID,
    ID_AMM,
    VAR_CODICE,
    VAR_DESCRIZIONE,
    VAR_VALORE,
    CHA_TIPO_CHIAVE,
    CHA_VISIBILE,
    CHA_MODIFICABILE,
    CHA_GLOBALE,
    VAR_CODICE_OLD_WEBCONFIG,
    DTA_INSERIMENTO,
    VERSIONE_CD,
    CHA_CONSERVAZIONE
  )
  VALUES
  (
    SEQ_DPA_CHIAVI_CONFIG.NEXTVAL,
    '361',
    'FE_PREVIEW_FULL_DOWNLOAD',
    'ATTIVA DISATTIVA LA VISUALIZZAZIONE DEL FILE PDF ORIGINALE',
    '1',
    'F',
    '1',
    '1',
    '0',
    null,
    SYSDATE,
    '3.19',
    '0'
  );
*/

INSERT
INTO DPA_CHIAVI_CONFIGURAZIONE
  (
    SYSTEM_ID,
    ID_AMM,
    VAR_CODICE,
    VAR_DESCRIZIONE,
    VAR_VALORE,
    CHA_TIPO_CHIAVE,
    CHA_VISIBILE,
    CHA_MODIFICABILE,
    CHA_GLOBALE,
    VAR_CODICE_OLD_WEBCONFIG,
    DTA_INSERIMENTO,
    VERSIONE_CD,
    CHA_CONSERVAZIONE
  )
  VALUES
  (
    SEQ_DPA_CHIAVI_CONFIG.NEXTVAL,
    '361',
    'FE_PREVIEW_PAGE_MAX',
    'DEFINISCE IL NUMERO MASSINO DI PAGINE PER ANTEPRIMA PDF',
    '3',
    'F',
    '1',
    '1',
    '0',
    null,
    SYSDATE,
    '3.19',
    '0'
  );

INSERT
INTO DPA_CHIAVI_CONFIGURAZIONE
  (
    SYSTEM_ID,
    ID_AMM,
    VAR_CODICE,
    VAR_DESCRIZIONE,
    VAR_VALORE,
    CHA_TIPO_CHIAVE,
    CHA_VISIBILE,
    CHA_MODIFICABILE,
    CHA_GLOBALE,
    VAR_CODICE_OLD_WEBCONFIG,
    DTA_INSERIMENTO,
    VERSIONE_CD,
    CHA_CONSERVAZIONE
  )
  VALUES
  (
    SEQ_DPA_CHIAVI_CONFIG.NEXTVAL,
    '361',
    'FE_PREVIEW_MB_LIMIT',
    'INDICA LA DIMENSIONE IN MB MINIMA PER AVVIARE LA CREAZIONE DI ANTEPRIMA PDF',
    '3',
    'F',
    '1',
    '1',
    '0',
    null,
    SYSDATE,
    '3.19',
    '0'
  );