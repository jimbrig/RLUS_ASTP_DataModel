# Data Tables Directory

> This folder houses sub-folders for every table involved with the ASTP AWS Data Ingestion Pipeline.

---

## Table Types

Tables are split into folders based off their category/type:

- Meta Tables: Metadata
- Map Tables: Dimensional Mapping Tables
- Input Tables: Inputs uploaded to data lake
- Process Tables: Tables incorporating a "process"
- Base Tables: Tables serving as a foundation for a summary table
- Summary Tables: Derived Summary Tables (Current + Historical)
- Current Tables: Summary Tables for Current Quarter Only
- Historical Tables: Initial tables uploaded for populating summary tables with historical values
- Ledger Tables: Upload/Ledger filtered tables acting on summary tables
- Recon Tables: Tables used for reconciliations and checks
- Reporting Tables: Curated (QuickSight) tables

## Folder Structure

```bash
Tables\{{TableType}}\Tables\
│
│   README.txt
│
│   Tables.csv
│   Tables.schema.csv
│
├───Archive
│       <Archived Content>
│
├───Documentation
│       <Notes / Docs For Table>
│
├───DynDB
│       <DynamoDB JSON/CSV Exports for Table and Pipeline Steps>
│
│       DL-ACT-PRO-ACTVAL-Tables-EBEX.json
│       DL-ACT-PRO-ACTVAL-Tables-ELEB.json
│       DL-ACT-PRO-ACTVAL-Tables-EXCC.json
│       DL-ENT-PRO-ACTVAL-Tables-CCEX.json
│       DynDB-Tables_Actuarial_FILE.METADATA.csv
│       DynDB-Tables_Actuarial_JOB.METADATA.csv
│       DynDB-Tables_Enterprise_JOB.METADATA.csv
│
├───Scripts
│       Invoke-AWSCleanup.ps1
│       Invoke-S3Upload.ps1
│
└───Testing
    │   <Test Case Evidence Files by Date>
    │   
    ├───<YYYY-MM-DD>
    │
    │       <DynDB Audit Logs | DynDB ETL Audit Logs | DynDB File Audit Logs>
    │	
    │       <Step Function Execution Details | Step Function Graphs>
    │
    │	    <Athena Query Results | Glue Catalog Schemas | SQL Queries>
    │
    │	    <ScreenShots, etc.>
```

