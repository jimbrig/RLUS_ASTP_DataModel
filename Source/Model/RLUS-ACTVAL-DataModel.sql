CREATE TABLE "Map_Block" (
  "block id" INTEGER UNIQUE PRIMARY KEY NOT NULL DEFAULT 'increment',
  "valuation_block" VARCHAR(38) UNIQUE NOT NULL,
  "valuation_block_description" VARCHAR(100) DEFAULT 'null',
  "direct_le" CHAR(3) NOT NULL,
  "le_start" CHAR(3) NOT NULL,
  "prod_type" VARCHAR(17) NOT NULL,
  "par_code" VARCHAR(6) NOT NULL,
  "insureds" CHAR(3) NOT NULL,
  "rlus_gaap_cohort" VARCHAR(34),
  "tpa_gaap_cohort" VARCHAR(38),
  "grp_srvconly" VARCHAR(3),
  "grp_block" VARCHAR(7),
  "grp_sub_block" VARCHAR(7),
  "financing_deal" VARCHAR(7),
  "cft_modeled" INTEGER,
  "ledger_segment" VARCHAR(16) DEFAULT 'null',
  "ledger_product" VARCHAR(58) DEFAULT 'null',
  "ledger_treaty" VARCHAR(18) DEFAULT 'null'
);

COMMENT ON TABLE "Map_Block" IS 'mapping table for the direct business accounting attributes of each valuation block';

COMMENT ON COLUMN "Map_Block"."block id" IS 'Unique Identifier and Primary Key for Individual Valuation Blocks as an auto-incrementing integer.';

COMMENT ON COLUMN "Map_Block"."valuation_block" IS 'Valuation block represented as text.';

COMMENT ON COLUMN "Map_Block"."valuation_block_description" IS 'Valuation Block Descriptions - default to NULL until filled out by an analyst.';

COMMENT ON COLUMN "Map_Block"."direct_le" IS 'Direct Legal Entity. Should be one of the unique legal entities from Map_LE to maintain referential integrity.';

COMMENT ON COLUMN "Map_Block"."le_start" IS 'Starting Legal Entity. Should be one of the unique legal entities from Map_LE to maintain referential integrity.';

COMMENT ON COLUMN "Map_Block"."prod_type" IS 'Product Types. Should be one of the unique Product Types from Map_ProdType to maintain referential integrity.';

COMMENT ON COLUMN "Map_Block"."par_code" IS 'PAR Code - either Par or NonPar.';

COMMENT ON COLUMN "Map_Block"."insureds" IS 'Insureds - either Ind (Individual) or Grp (Group).';

COMMENT ON COLUMN "Map_Block"."rlus_gaap_cohort" IS 'Resolution Specific GAAP Cohort. Can be NULL for non-cohort blocks.';

COMMENT ON COLUMN "Map_Block"."tpa_gaap_cohort" IS 'TPA Specific GAAP Cohort. Can be NULL for non-cohort blocks.';

COMMENT ON COLUMN "Map_Block"."grp_srvconly" IS 'Grouping for Service Only Blocks. Can be NULL.';

COMMENT ON COLUMN "Map_Block"."grp_block" IS 'Block Grouping. Can be NULL.';

COMMENT ON COLUMN "Map_Block"."grp_sub_block" IS 'Sub-Block Level Grouping. Can be NULL.';

COMMENT ON COLUMN "Map_Block"."financing_deal" IS 'Financing Deal';

COMMENT ON COLUMN "Map_Block"."cft_modeled" IS 'Boolean field represented as 0 or 1 (bit) for CFT Modeled.';

COMMENT ON COLUMN "Map_Block"."ledger_segment" IS 'Segment pertaining to the ledger.';

COMMENT ON COLUMN "Map_Block"."ledger_product" IS 'Product pertaining to the ledger';

COMMENT ON COLUMN "Map_Block"."ledger_treaty" IS 'Treaty pertaining to the ledger.';
