# Base_Summary_Combos_BS

> **Note**
> This document serves the purpose of providing a high-level overview of the `Base_SummaryCombos_BS` dataset and the workflows involved with deriving the table.

## Contents

- Raw CSV uploaded to S3: [Base_Summary_Combos_BS.csv](./CSV/Base_Summary_Combos_BS.csv)

- DynamoDB JSON Configs:
	+ Actuarial FILE.METADATA
	+ Actuarial JOB.METADATA - ELEB
	+ Actuarial JOB.METADATA - EBEX
	+ Actuarial JOB.METADATA - EXCC
	+ Enterprise JOB.METADATA - CCEX

- SQL Transformation Queries (Part of DynDB):
	+ Actuarial JOB.METADATA - EBEX

- Schema/Data Dictionary CSV: Base_Summary_Combos_BS.schema.csv

- Documentation:

- Archive:

- Test Evidence:

## Overview

The `Base_SummaryCombos_BS` table is a *derived* table built from various mapping and process tables. Its primary purpose is to serve the foundation for the `Current_ValAcct_BS` *Summary* table, which is one of the core output tables derived by the valuation ingestion pipeline.

The first step in deriving the summary table is to correctly identify all possible valid combinations of entities 
as a "base" table from which the summary table will rely on to map in attributes. 

In other words, the initial step is to create a "skeleton" base table that is composed of all possible 
valid combinations of the primary entities used in the `Current_ValAcct_BS` table, and this workflow 
results in a table named `Base_SummaryCombos_BS`.

### Primary Entities and Granularity

The summary table's granularity is composed of the following entities, that when taken as a group, 
represent a single, unique record in the summary table:

- **Valuation Date**: Current valuation date (single date for all "current" records)
- **Valuation Block**: Unique blocks, enumerated in the `Map_Block` table.
- **Balance (Description)**: Unique balance (descriptions), enumerated in the `Map_Balance_BS` table.
- **Reinsurance SubDeal**: Unique reinsurance subdeal treaties, enumerated in the `Map_SubDeal` table.
- **Input Source**: Various unique input tables, enumerated in the `Map_InputSource` table.
- **Entry Type**: Identifiers for flagging the "type" of record based off its input source and the types of entries and measures that source’s values represent; enumerated in the `Map_EntryType` table and mapped with Input Source in the `Map_Source_Balance` table.
- **Direct, Ceded, or Assumed (DCA) / Insurance Code**: Identifiers for flagging *Direct vs. Ceded vs. Assumed* amounts (this is the primary driver for the base table, due to the fact that combinations of the entities above are duplicated, where necessary, across all three possible values for Direct vs. Ceded vs. Assumed)

### Pre-Requisite Tables

The workflow described in this document depends on the following tables from the data lake:

**Mapping Tables:**

Direct dependencies:

- `Map_Balance_BS`
- `Map_SubDeal`
- `Map_FinReins`
- `Map_Source_Balance`

Indirect dependencies:

- `Map_Block` - Note: this table is not actually used directly in the SQL script(s), however, it is still a dependency due to other table’s depending on it and for purposes of Enumerating the possible valuation blocks.
- `Map_EntryType`
- `Map_InsCode`
- `Map_InputSource` - Note: this table is not actually used directly in the SQL script(s), however, it is still a dependency due to other table’s depending on it and for purposes of Enumerating the possible input sources.

**Process Tables:**

- `Process_ComboExcld_Balance_BS`
- `Process_ComboExcld_SubDeal_BS`
- `Process_ComboExcld_Custom_BS`

## Workflow

- [ ] TODO: Add Workflow Diagram

Please refer to the dedicated [Base_SummaryCombos_BS Table's Workflow Document](Docs/Workflow.md).

## Appendices

### Files

### Scripts

