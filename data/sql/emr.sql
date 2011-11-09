SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `afemr` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `afemr` ;

-- -----------------------------------------------------
-- Table `afemr`.`addresses`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`addresses` (
  `id` INT(11) NOT NULL DEFAULT '0' ,
  `line1` VARCHAR(255) NULL DEFAULT NULL ,
  `line2` VARCHAR(255) NULL DEFAULT NULL ,
  `city` VARCHAR(255) NULL DEFAULT NULL ,
  `state` VARCHAR(35) NULL DEFAULT NULL ,
  `zip` VARCHAR(10) NULL DEFAULT NULL ,
  `plus_four` VARCHAR(4) NULL DEFAULT NULL ,
  `country` VARCHAR(255) NULL DEFAULT NULL ,
  `foreign_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `foreign_id` (`foreign_id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`amc_misc_data`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`amc_misc_data` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `amc_id` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'Unique and maps to list_options list clinical_rules' ,
  `pid` BIGINT(20) NULL DEFAULT NULL ,
  `map_category` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Maps to an object category (such as prescriptions etc.)' ,
  `map_id` BIGINT(20) NOT NULL DEFAULT '0' COMMENT 'Maps to an object id (such as prescription id etc.)' ,
  `date_created` DATETIME NULL DEFAULT NULL ,
  `date_completed` DATETIME NULL DEFAULT NULL ,
  INDEX (`amc_id` ASC, `pid` ASC, `map_id` ASC) ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`settings`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`settings` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `array_key` VARCHAR(255) NULL DEFAULT NULL ,
  `array_value` LONGTEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`users` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `username` VARCHAR(255) NULL DEFAULT NULL ,
  `password` LONGTEXT NULL DEFAULT NULL ,
  `authorized` TINYINT(4) NULL DEFAULT NULL ,
  `info` LONGTEXT NULL DEFAULT NULL ,
  `source` TINYINT(4) NULL DEFAULT NULL ,
  `fname` VARCHAR(255) NULL DEFAULT NULL ,
  `mname` VARCHAR(255) NULL DEFAULT NULL ,
  `lname` VARCHAR(255) NULL DEFAULT NULL ,
  `federaltaxid` VARCHAR(255) NULL DEFAULT NULL ,
  `federaldrugid` VARCHAR(255) NULL DEFAULT NULL ,
  `upin` VARCHAR(255) NULL DEFAULT NULL ,
  `facility` VARCHAR(255) NULL DEFAULT NULL ,
  `facility_id` INT(11) NOT NULL DEFAULT '0' ,
  `see_auth` INT(11) NOT NULL DEFAULT '1' ,
  `active` TINYINT(1) NOT NULL DEFAULT '1' ,
  `npi` VARCHAR(15) NULL DEFAULT NULL ,
  `title` VARCHAR(30) NULL DEFAULT NULL ,
  `specialty` VARCHAR(255) NULL DEFAULT NULL ,
  `billname` VARCHAR(255) NULL DEFAULT NULL ,
  `email` VARCHAR(255) NULL DEFAULT NULL ,
  `url` VARCHAR(255) NULL DEFAULT NULL ,
  `assistant` VARCHAR(255) NULL DEFAULT NULL ,
  `organization` VARCHAR(255) NULL DEFAULT NULL ,
  `valedictory` VARCHAR(255) NULL DEFAULT NULL ,
  `street` VARCHAR(60) NULL DEFAULT NULL ,
  `streetb` VARCHAR(60) NULL DEFAULT NULL ,
  `city` VARCHAR(30) NULL DEFAULT NULL ,
  `state` VARCHAR(30) NULL DEFAULT NULL ,
  `zip` VARCHAR(20) NULL DEFAULT NULL ,
  `street2` VARCHAR(60) NULL DEFAULT NULL ,
  `streetb2` VARCHAR(60) NULL DEFAULT NULL ,
  `city2` VARCHAR(30) NULL DEFAULT NULL ,
  `state2` VARCHAR(30) NULL DEFAULT NULL ,
  `zip2` VARCHAR(20) NULL DEFAULT NULL ,
  `phone` VARCHAR(30) NULL DEFAULT NULL ,
  `fax` VARCHAR(30) NULL DEFAULT NULL ,
  `phonew1` VARCHAR(30) NULL DEFAULT NULL ,
  `phonew2` VARCHAR(30) NULL DEFAULT NULL ,
  `phonecell` VARCHAR(30) NULL DEFAULT NULL ,
  `notes` TEXT NULL DEFAULT NULL ,
  `cal_ui` TINYINT(4) NOT NULL DEFAULT '1' ,
  `taxonomy` VARCHAR(30) NOT NULL DEFAULT '207Q00000X' ,
  `ssi_relayhealth` VARCHAR(64) NULL DEFAULT NULL ,
  `calendar` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '1 = appears in calendar' ,
  `abook_type` VARCHAR(31) NOT NULL DEFAULT '' ,
  `pwd_expiration_date` DATE NULL DEFAULT NULL ,
  `pwd_history1` LONGTEXT NULL DEFAULT NULL ,
  `pwd_history2` LONGTEXT NULL DEFAULT NULL ,
  `default_warehouse` VARCHAR(31) NOT NULL DEFAULT '' ,
  `irnpool` VARCHAR(31) NOT NULL DEFAULT '' ,
  `state_license_number` VARCHAR(25) NULL DEFAULT NULL ,
  `newcrop_user_role` VARCHAR(30) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`audit_master`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`audit_master` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `pid` BIGINT(20) NOT NULL ,
  `user_id` BIGINT(20) NOT NULL COMMENT 'The Id of the user who approves or denies' ,
  `approval_status` TINYINT(4) NOT NULL COMMENT '1-Pending,2-Approved,3-Denied,4-Appointment directly updated to calendar table,5-Cancelled appointment' ,
  `comments` TEXT NOT NULL ,
  `created_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `modified_time` DATETIME NOT NULL ,
  `ip_address` VARCHAR(100) NOT NULL ,
  `type` TINYINT(4) NOT NULL COMMENT '1-new patient,2-existing patient,3-change is only in the document,5-random key,10-Appointment' ,
  PRIMARY KEY (`id`) ,
  INDEX `audit_master_FK_1` (`user_id` ASC) ,
  CONSTRAINT `audit_master_FK_1`
    FOREIGN KEY (`user_id` )
    REFERENCES `afemr`.`users` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`audit_details`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`audit_details` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `table` VARCHAR(100) NOT NULL COMMENT 'openemr table name' ,
  `field_name` VARCHAR(100) NOT NULL COMMENT 'openemr table\'s field name' ,
  `field_value` TEXT NOT NULL COMMENT 'openemr table\'s field value' ,
  `audit_master_id` BIGINT(20) NOT NULL COMMENT 'Id of the audit_master table' ,
  `entry_identification` VARCHAR(255) NOT NULL DEFAULT '1' COMMENT 'Used when multiple entry occurs from the same table.1 means no multiple entry' ,
  PRIMARY KEY (`id`) ,
  INDEX `audit_details_FK_1` (`audit_master_id` ASC) ,
  CONSTRAINT `audit_details_FK_1`
    FOREIGN KEY (`audit_master_id` )
    REFERENCES `afemr`.`audit_master` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `afemr`.`batchcom`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`batchcom` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `patient_id` INT(11) NOT NULL DEFAULT '0' ,
  `sent_by` BIGINT(20) NOT NULL DEFAULT '0' ,
  `msg_type` VARCHAR(60) NULL DEFAULT NULL ,
  `msg_subject` VARCHAR(255) NULL DEFAULT NULL ,
  `msg_text` MEDIUMTEXT NULL DEFAULT NULL ,
  `msg_date_sent` DATETIME NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`billing`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`billing` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `date` DATETIME NULL DEFAULT NULL ,
  `code_type` VARCHAR(7) NULL DEFAULT NULL ,
  `code` VARCHAR(9) NULL DEFAULT NULL ,
  `pid` INT(11) NULL DEFAULT NULL ,
  `provider_id` INT(11) NULL DEFAULT NULL ,
  `user` INT(11) NULL DEFAULT NULL ,
  `groupname` VARCHAR(255) NULL DEFAULT NULL ,
  `authorized` TINYINT(1) NULL DEFAULT NULL ,
  `encounter` INT(11) NULL DEFAULT NULL ,
  `code_text` LONGTEXT NULL DEFAULT NULL ,
  `billed` TINYINT(1) NULL DEFAULT NULL ,
  `activity` TINYINT(1) NULL DEFAULT NULL ,
  `payer_id` INT(11) NULL DEFAULT NULL ,
  `bill_process` TINYINT(2) NOT NULL DEFAULT '0' ,
  `bill_date` DATETIME NULL DEFAULT NULL ,
  `process_date` DATETIME NULL DEFAULT NULL ,
  `process_file` VARCHAR(255) NULL DEFAULT NULL ,
  `modifier` VARCHAR(5) NULL DEFAULT NULL ,
  `units` TINYINT(3) NULL DEFAULT NULL ,
  `fee` DECIMAL(12,2) NULL DEFAULT NULL ,
  `justify` VARCHAR(255) NULL DEFAULT NULL ,
  `target` VARCHAR(30) NULL DEFAULT NULL ,
  `x12_partner_id` INT(11) NULL DEFAULT NULL ,
  `ndc_info` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `pid` (`pid` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`categories`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`categories` (
  `id` INT(11) NOT NULL DEFAULT '0' ,
  `name` VARCHAR(255) NULL DEFAULT NULL ,
  `value` VARCHAR(255) NULL DEFAULT NULL ,
  `parent` INT(11) NOT NULL DEFAULT '0' ,
  `lft` INT(11) NOT NULL DEFAULT '0' ,
  `rght` INT(11) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`id`) ,
  INDEX `parent` (`parent` ASC) ,
  INDEX `lft` (`lft` ASC, `rght` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`categories_seq`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`categories_seq` (
  `id` INT(11) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`lists`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`lists` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `date` DATETIME NULL DEFAULT NULL ,
  `type` VARCHAR(255) NULL DEFAULT NULL ,
  `title` VARCHAR(255) NULL DEFAULT NULL ,
  `begdate` DATE NULL DEFAULT NULL ,
  `enddate` DATE NULL DEFAULT NULL ,
  `returndate` DATE NULL DEFAULT NULL ,
  `occurrence` INT(11) NULL DEFAULT '0' ,
  `classification` INT(11) NULL DEFAULT '0' ,
  `referredby` VARCHAR(255) NULL DEFAULT NULL ,
  `extrainfo` VARCHAR(255) NULL DEFAULT NULL ,
  `diagnosis` VARCHAR(255) NULL DEFAULT NULL ,
  `activity` TINYINT(4) NULL DEFAULT NULL ,
  `comments` LONGTEXT NULL DEFAULT NULL ,
  `pid` BIGINT(20) NULL DEFAULT NULL ,
  `user` VARCHAR(255) NULL DEFAULT NULL ,
  `groupname` VARCHAR(255) NULL DEFAULT NULL ,
  `outcome` INT(11) NOT NULL DEFAULT '0' ,
  `destination` VARCHAR(255) NULL DEFAULT NULL ,
  `reinjury_id` BIGINT(20) NOT NULL DEFAULT 0 ,
  `injury_part` VARCHAR(31) NOT NULL DEFAULT '' ,
  `injury_type` VARCHAR(31) NOT NULL DEFAULT '' ,
  `injury_grade` VARCHAR(31) NOT NULL DEFAULT '' ,
  `reaction` VARCHAR(255) NOT NULL DEFAULT '' ,
  `external_allergyid` INT(11) NULL DEFAULT NULL ,
  `erx_source` ENUM('0','1') NOT NULL DEFAULT '0' COMMENT '0-OpenEMR 1-External' ,
  `erx_uploaded` ENUM('0','1') NOT NULL DEFAULT '0' COMMENT '0-Pending NewCrop upload 1-Uploaded TO NewCrop' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`documents`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`documents` (
  `id` INT(11) NOT NULL DEFAULT '0' ,
  `type` ENUM('file_url','blob','web_url') NULL DEFAULT NULL ,
  `size` INT(11) NULL DEFAULT NULL ,
  `date` DATETIME NULL DEFAULT NULL ,
  `url` VARCHAR(255) NULL DEFAULT NULL ,
  `mimetype` VARCHAR(255) NULL DEFAULT NULL ,
  `pages` INT(11) NULL DEFAULT NULL ,
  `owner` INT(11) NULL DEFAULT NULL ,
  `revision` TIMESTAMP NOT NULL ,
  `foreign_id` INT(11) NULL DEFAULT NULL ,
  `docdate` DATE NULL DEFAULT NULL ,
  `hash` VARCHAR(40) NULL DEFAULT NULL COMMENT '40-character SHA-1 hash of document' ,
  `list_id` BIGINT(20) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`id`) ,
  INDEX `revision` (`revision` ASC) ,
  INDEX `foreign_id` (`foreign_id` ASC) ,
  INDEX `owner` (`owner` ASC) ,
  INDEX `documents_FK_1` (`list_id` ASC) ,
  CONSTRAINT `documents_FK_1`
    FOREIGN KEY (`list_id` )
    REFERENCES `afemr`.`lists` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`categories_to_documents`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`categories_to_documents` (
  `category_id` INT(11) NOT NULL DEFAULT '0' ,
  `document_id` INT(11) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`category_id`, `document_id`) ,
  INDEX `categories_to_documents_FK_1` (`category_id` ASC) ,
  INDEX `categories_to_documents_FK_2` (`document_id` ASC) ,
  CONSTRAINT `categories_to_documents_FK_1`
    FOREIGN KEY (`category_id` )
    REFERENCES `afemr`.`categories` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `categories_to_documents_FK_2`
    FOREIGN KEY (`document_id` )
    REFERENCES `afemr`.`documents` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`claims`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`claims` (
  `patient_id` INT(11) NOT NULL ,
  `encounter_id` INT(11) NOT NULL ,
  `version` INT(10) UNSIGNED NOT NULL ,
  `payer_id` INT(11) NOT NULL DEFAULT '0' ,
  `status` TINYINT(2) NOT NULL DEFAULT '0' ,
  `payer_type` TINYINT(4) NOT NULL DEFAULT '0' ,
  `bill_process` TINYINT(2) NOT NULL DEFAULT '0' ,
  `bill_time` DATETIME NULL DEFAULT NULL ,
  `process_time` DATETIME NULL DEFAULT NULL ,
  `process_file` VARCHAR(255) NULL DEFAULT NULL ,
  `target` VARCHAR(30) NULL DEFAULT NULL ,
  `x12_partner_id` INT(11) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`patient_id`, `encounter_id`, `version`) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`clinical_plans`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`clinical_plans` (
  `id` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'Unique and maps to list_options list clinical_plans' ,
  `pid` BIGINT(20) NOT NULL DEFAULT '0' COMMENT '0 is default for all patients, while > 0 is id from patient_data table' ,
  `normal_flag` TINYINT(1) NULL DEFAULT NULL COMMENT 'Normal Activation Flag' ,
  `cqm_flag` TINYINT(1) NULL DEFAULT NULL COMMENT 'Clinical Quality Measure flag (unable to customize per patient)' ,
  `cqm_measure_group` VARCHAR(10) NOT NULL DEFAULT '' COMMENT 'Clinical Quality Measure Group Identifier' ,
  PRIMARY KEY (`id`, `pid`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`clinical_rules`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`clinical_rules` (
  `id` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'Unique and maps to list_options list clinical_rules' ,
  `pid` BIGINT(20) NOT NULL DEFAULT '0' COMMENT '0 is default for all patients, while > 0 is id from patient_data table' ,
  `active_alert_flag` TINYINT(1) NULL DEFAULT NULL COMMENT 'Active Alert Widget Module flag - note not yet utilized' ,
  `passive_alert_flag` TINYINT(1) NULL DEFAULT NULL COMMENT 'Passive Alert Widget Module flag' ,
  `cqm_flag` TINYINT(1) NULL DEFAULT NULL COMMENT 'Clinical Quality Measure flag (unable to customize per patient)' ,
  `cqm_nqf_code` VARCHAR(10) NOT NULL DEFAULT '' COMMENT 'Clinical Quality Measure NQF identifier' ,
  `cqm_pqri_code` VARCHAR(10) NOT NULL DEFAULT '' COMMENT 'Clinical Quality Measure PQRI identifier' ,
  `amc_flag` TINYINT(1) NULL DEFAULT NULL COMMENT 'Automated Measure Calculation flag (unable to customize per patient)' ,
  `amc_code` VARCHAR(10) NOT NULL DEFAULT '' COMMENT 'Automated Measure Calculation indentifier (MU rule)' ,
  `patient_reminder_flag` TINYINT(1) NULL DEFAULT NULL COMMENT 'Clinical Reminder Module flag' ,
  PRIMARY KEY (`id`, `pid`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`clinical_plans_rules`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`clinical_plans_rules` (
  `plan_id` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'Unique and maps to list_options list clinical_plans' ,
  `rule_id` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'Unique and maps to list_options list clinical_rules' ,
  PRIMARY KEY (`plan_id`, `rule_id`) ,
  INDEX `clinical_plans_rules_FK_1` (`plan_id` ASC) ,
  INDEX `clinical_plans_rules_FK_2` (`rule_id` ASC) ,
  CONSTRAINT `clinical_plans_rules_FK_1`
    FOREIGN KEY (`plan_id` )
    REFERENCES `afemr`.`clinical_plans` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `clinical_plans_rules_FK_2`
    FOREIGN KEY (`rule_id` )
    REFERENCES `afemr`.`clinical_rules` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`codes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`codes` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `code_text` VARCHAR(255) NOT NULL DEFAULT '' ,
  `code_text_short` VARCHAR(24) NOT NULL DEFAULT '' ,
  `code` VARCHAR(10) NOT NULL DEFAULT '' ,
  `code_type` TINYINT(2) NULL DEFAULT NULL ,
  `modifier` VARCHAR(5) NOT NULL DEFAULT '' ,
  `units` TINYINT(3) NULL DEFAULT NULL ,
  `fee` DECIMAL(12,2) NULL DEFAULT NULL ,
  `superbill` VARCHAR(31) NOT NULL DEFAULT '' ,
  `related_code` VARCHAR(255) NOT NULL DEFAULT '' ,
  `taxrates` VARCHAR(255) NOT NULL DEFAULT '' ,
  `cyp_factor` FLOAT NOT NULL DEFAULT 0 COMMENT 'quantity representing a years supply' ,
  `active` TINYINT(1) NULL DEFAULT 1 COMMENT '0 = inactive, 1 = active' ,
  `reportable` TINYINT(1) NULL DEFAULT 0 COMMENT '0 = non-reportable, 1 = reportable' ,
  PRIMARY KEY (`id`) ,
  INDEX `code` (`code` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`syndromic_surveillance`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`syndromic_surveillance` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `lists_id` BIGINT(20) NOT NULL ,
  `submission_date` DATETIME NOT NULL ,
  `filename` VARCHAR(255) NOT NULL DEFAULT '' ,
  PRIMARY KEY (`id`) ,
  INDEX (`lists_id` ASC) ,
  INDEX `syndromic_surveillance_FK_1` (`lists_id` ASC) ,
  CONSTRAINT `syndromic_surveillance_FK_1`
    FOREIGN KEY (`lists_id` )
    REFERENCES `afemr`.`lists` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`config`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`config` (
  `id` INT(11) NOT NULL DEFAULT '0' ,
  `name` VARCHAR(255) NULL DEFAULT NULL ,
  `value` VARCHAR(255) NULL DEFAULT NULL ,
  `parent` INT(11) NOT NULL DEFAULT '0' ,
  `lft` INT(11) NOT NULL DEFAULT '0' ,
  `rght` INT(11) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`id`) ,
  INDEX `parent` (`parent` ASC) ,
  INDEX `lft` (`lft` ASC, `rght` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`config_seq`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`config_seq` (
  `id` INT(11) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`documents_legal_detail`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`documents_legal_detail` (
  `dld_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `dld_pid` INT(10) UNSIGNED NULL DEFAULT NULL ,
  `dld_facility` INT(10) UNSIGNED NULL DEFAULT NULL ,
  `dld_provider` INT(10) UNSIGNED NULL DEFAULT NULL ,
  `dld_encounter` INT(10) UNSIGNED NULL DEFAULT NULL ,
  `dld_master_docid` INT(10) UNSIGNED NOT NULL ,
  `dld_signed` SMALLINT(5) UNSIGNED NOT NULL COMMENT '0-Not Signed or Cannot Sign(Layout),1-Signed,2-Ready to sign,3-Denied(Pat Regi),10-Save(Layout)' ,
  `dld_signed_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `dld_filepath` VARCHAR(75) NULL DEFAULT NULL ,
  `dld_filename` VARCHAR(45) NOT NULL ,
  `dld_signing_person` VARCHAR(50) NOT NULL ,
  `dld_sign_level` INT(11) NOT NULL COMMENT 'Sign flow level' ,
  `dld_content` VARCHAR(50) NOT NULL COMMENT 'Layout sign position' ,
  `dld_file_for_pdf_generation` BLOB NOT NULL COMMENT 'The filled details in the fdf file is stored here.Patient Registration Screen' ,
  `dld_denial_reason` LONGTEXT NOT NULL ,
  PRIMARY KEY (`dld_id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`documents_legal_master`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`documents_legal_master` (
  `dlm_category` INT(10) UNSIGNED NULL DEFAULT NULL ,
  `dlm_subcategory` INT(10) UNSIGNED NULL DEFAULT NULL ,
  `dlm_document_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `dlm_document_name` VARCHAR(75) NOT NULL ,
  `dlm_filepath` VARCHAR(75) NOT NULL ,
  `dlm_facility` INT(10) UNSIGNED NULL DEFAULT NULL ,
  `dlm_provider` INT(10) UNSIGNED NULL DEFAULT NULL ,
  `dlm_sign_height` DOUBLE NOT NULL ,
  `dlm_sign_width` DOUBLE NOT NULL ,
  `dlm_filename` VARCHAR(45) NOT NULL ,
  `dlm_effective_date` DATETIME NOT NULL ,
  `dlm_version` INT(10) UNSIGNED NOT NULL ,
  `content` VARCHAR(255) NOT NULL ,
  `dlm_savedsign` VARCHAR(255) NULL DEFAULT NULL COMMENT '0-Yes 1-No' ,
  `dlm_review` VARCHAR(255) NULL DEFAULT NULL COMMENT '0-Yes 1-No' ,
  PRIMARY KEY (`dlm_document_id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 1, 
COMMENT = 'List of Master Docs to be signed' ;


-- -----------------------------------------------------
-- Table `afemr`.`documents_legal_categories`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`documents_legal_categories` (
  `dlc_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `dlc_category_type` INT(10) UNSIGNED NOT NULL COMMENT '1 category 2 subcategory' ,
  `dlc_category_name` VARCHAR(45) NOT NULL ,
  `dlc_category_parent` INT(10) UNSIGNED NULL DEFAULT NULL ,
  PRIMARY KEY (`dlc_id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 7;


-- -----------------------------------------------------
-- Table `afemr`.`drugs`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`drugs` (
  `drug_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NOT NULL DEFAULT '' ,
  `ndc_number` VARCHAR(20) NOT NULL DEFAULT '' ,
  `on_order` INT(11) NOT NULL DEFAULT '0' ,
  `reorder_point` INT(11) NOT NULL DEFAULT '0' ,
  `last_notify` DATE NOT NULL ,
  `reactions` TEXT NULL DEFAULT NULL ,
  `form` INT(3) NOT NULL DEFAULT '0' ,
  `size` FLOAT UNSIGNED NOT NULL DEFAULT '0' ,
  `unit` INT(11) NOT NULL DEFAULT '0' ,
  `route` INT(11) NOT NULL DEFAULT '0' ,
  `substitute` INT(11) NOT NULL DEFAULT '0' ,
  `related_code` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'may reference a related codes.code' ,
  `cyp_factor` FLOAT NOT NULL DEFAULT 0 COMMENT 'quantity representing a years supply' ,
  `active` TINYINT(1) NULL DEFAULT 1 COMMENT '0 = inactive, 1 = active' ,
  `allow_combining` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '1 = allow filling an order from multiple lots' ,
  `allow_multiple` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '1 = allow multiple lots at one warehouse' ,
  PRIMARY KEY (`drug_id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`drug_inventory`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`drug_inventory` (
  `inventory_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `drug_id` INT(11) NOT NULL ,
  `lot_number` VARCHAR(20) NULL DEFAULT NULL ,
  `expiration` DATE NULL DEFAULT NULL ,
  `manufacturer` VARCHAR(255) NULL DEFAULT NULL ,
  `on_hand` INT(11) NOT NULL DEFAULT '0' ,
  `warehouse_id` VARCHAR(31) NOT NULL DEFAULT '' ,
  `vendor_id` BIGINT(20) NOT NULL DEFAULT 0 ,
  `last_notify` DATE NOT NULL ,
  `destroy_date` DATE NULL DEFAULT NULL ,
  `destroy_method` VARCHAR(255) NULL DEFAULT NULL ,
  `destroy_witness` VARCHAR(255) NULL DEFAULT NULL ,
  `destroy_notes` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`inventory_id`) ,
  INDEX `drug_inventory_FK_1` (`drug_id` ASC) ,
  CONSTRAINT `drug_inventory_FK_1`
    FOREIGN KEY (`drug_id` )
    REFERENCES `afemr`.`drugs` (`drug_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`drug_sales`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`drug_sales` (
  `sale_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `drug_id` INT(11) NOT NULL ,
  `inventory_id` INT(11) NOT NULL ,
  `prescription_id` INT(11) NOT NULL DEFAULT '0' ,
  `pid` INT(11) NOT NULL DEFAULT '0' ,
  `encounter` INT(11) NOT NULL DEFAULT '0' ,
  `user` VARCHAR(255) NULL DEFAULT NULL ,
  `sale_date` DATE NOT NULL ,
  `quantity` INT(11) NOT NULL DEFAULT '0' ,
  `fee` DECIMAL(12,2) NOT NULL DEFAULT '0.00' ,
  `billed` TINYINT(1) NOT NULL DEFAULT '0' COMMENT 'indicates if the sale is posted to accounting' ,
  `xfer_inventory_id` INT(11) NOT NULL DEFAULT 0 ,
  `distributor_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT 'references users.id' ,
  `notes` VARCHAR(255) NOT NULL DEFAULT '' ,
  PRIMARY KEY (`sale_id`) ,
  INDEX `drug_sales_FK_1` (`drug_id` ASC) ,
  CONSTRAINT `drug_sales_FK_1`
    FOREIGN KEY (`drug_id` )
    REFERENCES `afemr`.`drugs` (`drug_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`drug_templates`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`drug_templates` (
  `drug_id` INT(11) NOT NULL ,
  `selector` VARCHAR(255) NOT NULL DEFAULT '' ,
  `dosage` VARCHAR(10) NULL DEFAULT NULL ,
  `period` INT(11) NOT NULL DEFAULT '0' ,
  `quantity` INT(11) NOT NULL DEFAULT '0' ,
  `refills` INT(11) NOT NULL DEFAULT '0' ,
  `taxrates` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`drug_id`, `selector`) ,
  INDEX `drug_templates_FK_1` (`drug_id` ASC) ,
  CONSTRAINT `drug_templates_FK_1`
    FOREIGN KEY (`drug_id` )
    REFERENCES `afemr`.`drugs` (`drug_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`eligibility_response`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`eligibility_response` (
  `response_id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `response_description` VARCHAR(255) NULL DEFAULT NULL ,
  `response_status` ENUM('A','D') NOT NULL DEFAULT 'A' ,
  `response_vendor_id` BIGINT(20) NULL DEFAULT NULL ,
  `response_create_date` DATE NULL DEFAULT NULL ,
  `response_modify_date` DATE NULL DEFAULT NULL ,
  PRIMARY KEY (`response_id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`eligibility_verification`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`eligibility_verification` (
  `verification_id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `response_id` BIGINT(20) NULL DEFAULT NULL ,
  `insurance_id` BIGINT(20) NULL DEFAULT NULL ,
  `eligibility_check_date` DATETIME NULL DEFAULT NULL ,
  `copay` INT(11) NULL DEFAULT NULL ,
  `deductible` INT(11) NULL DEFAULT NULL ,
  `deductiblemet` ENUM('Y','N') NULL DEFAULT 'Y' ,
  `create_date` DATE NULL DEFAULT NULL ,
  PRIMARY KEY (`verification_id`) ,
  INDEX `insurance_id` (`insurance_id` ASC) ,
  INDEX `eligibility_verification_FK_1` (`response_id` ASC) ,
  CONSTRAINT `eligibility_verification_FK_1`
    FOREIGN KEY (`response_id` )
    REFERENCES `afemr`.`eligibility_response` (`response_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`employer_data`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`employer_data` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NULL DEFAULT NULL ,
  `street` VARCHAR(255) NULL DEFAULT NULL ,
  `postal_code` VARCHAR(255) NULL DEFAULT NULL ,
  `city` VARCHAR(255) NULL DEFAULT NULL ,
  `state` VARCHAR(255) NULL DEFAULT NULL ,
  `country` VARCHAR(255) NULL DEFAULT NULL ,
  `date` DATETIME NULL DEFAULT NULL ,
  `pid` BIGINT(20) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`id`) ,
  INDEX `pid` (`pid` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`enc_category_map`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`enc_category_map` (
  `rule_enc_id` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'encounter id from rule_enc_types list in list_options' ,
  `main_cat_id` INT(11) NOT NULL DEFAULT 0 COMMENT 'category id from event category in openemr_postcalendar_categories' ,
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  INDEX (`rule_enc_id` ASC, `main_cat_id` ASC) ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`standardized_tables_track`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`standardized_tables_track` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `imported_date` DATETIME NULL DEFAULT NULL ,
  `name` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'name of standardized tables such as RXNORM' ,
  `revision_version` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'revision of standardized tables that were imported' ,
  `revision_date` DATETIME NULL DEFAULT NULL COMMENT 'revision of standardized tables that were imported' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`facility`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`facility` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NULL DEFAULT NULL ,
  `phone` VARCHAR(30) NULL DEFAULT NULL ,
  `fax` VARCHAR(30) NULL DEFAULT NULL ,
  `street` VARCHAR(255) NULL DEFAULT NULL ,
  `city` VARCHAR(255) NULL DEFAULT NULL ,
  `state` VARCHAR(50) NULL DEFAULT NULL ,
  `postal_code` VARCHAR(11) NULL DEFAULT NULL ,
  `country_code` VARCHAR(10) NULL DEFAULT NULL ,
  `federal_ein` VARCHAR(15) NULL DEFAULT NULL ,
  `service_location` TINYINT(1) NOT NULL DEFAULT '1' ,
  `billing_location` TINYINT(1) NOT NULL DEFAULT '0' ,
  `accepts_assignment` TINYINT(1) NOT NULL DEFAULT '0' ,
  `pos_code` TINYINT(4) NULL DEFAULT NULL ,
  `x12_sender_id` VARCHAR(25) NULL DEFAULT NULL ,
  `attn` VARCHAR(65) NULL DEFAULT NULL ,
  `domain_identifier` VARCHAR(60) NULL DEFAULT NULL ,
  `facility_npi` VARCHAR(15) NULL DEFAULT NULL ,
  `tax_id_type` VARCHAR(31) NOT NULL DEFAULT '' ,
  `color` VARCHAR(7) NOT NULL DEFAULT '' ,
  `primary_business_entity` INT(10) NOT NULL DEFAULT '0' COMMENT '0-Not Set as business entity 1-Set as business entity' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 4;


-- -----------------------------------------------------
-- Table `afemr`.`fee_sheet_options`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`fee_sheet_options` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `fs_category` VARCHAR(63) NULL DEFAULT NULL ,
  `fs_option` VARCHAR(63) NULL DEFAULT NULL ,
  `fs_codes` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`form_dictation`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`form_dictation` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `date` DATETIME NULL DEFAULT NULL ,
  `pid` BIGINT(20) NULL DEFAULT NULL ,
  `user` VARCHAR(255) NULL DEFAULT NULL ,
  `groupname` VARCHAR(255) NULL DEFAULT NULL ,
  `authorized` TINYINT(4) NULL DEFAULT NULL ,
  `activity` TINYINT(4) NULL DEFAULT NULL ,
  `dictation` LONGTEXT NULL DEFAULT NULL ,
  `additional_notes` LONGTEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`form_encounter`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`form_encounter` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `date` DATETIME NULL DEFAULT NULL ,
  `reason` LONGTEXT NULL DEFAULT NULL ,
  `facility_name` LONGTEXT NULL DEFAULT NULL ,
  `facility_id` INT(11) NOT NULL DEFAULT '0' ,
  `pid` BIGINT(20) NULL DEFAULT NULL ,
  `encounter` BIGINT(20) NULL DEFAULT NULL ,
  `onset_date` DATETIME NULL DEFAULT NULL ,
  `sensitivity` VARCHAR(30) NULL DEFAULT NULL ,
  `billing_note` TEXT NULL DEFAULT NULL ,
  `pc_catid` INT(11) NOT NULL DEFAULT '5' COMMENT 'event category from openemr_postcalendar_categories' ,
  `last_level_billed` INT NOT NULL DEFAULT 0 COMMENT '0=none, 1=ins1, 2=ins2, etc' ,
  `last_level_closed` INT NOT NULL DEFAULT 0 COMMENT '0=none, 1=ins1, 2=ins2, etc' ,
  `last_stmt_date` DATE NULL DEFAULT NULL ,
  `stmt_count` INT NOT NULL DEFAULT 0 ,
  `provider_id` INT(11) NULL DEFAULT '0' COMMENT 'default and main provider for this visit' ,
  `supervisor_id` INT(11) NULL DEFAULT '0' COMMENT 'supervising provider, if any, for this visit' ,
  `invoice_refno` VARCHAR(31) NOT NULL DEFAULT '' ,
  `referral_source` VARCHAR(31) NOT NULL DEFAULT '' ,
  `billing_facility` INT(11) NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`id`) ,
  INDEX `pid` (`pid` ASC) ,
  INDEX `form_encounter_FK_1` (`facility_id` ASC) ,
  CONSTRAINT `form_encounter_FK_1`
    FOREIGN KEY (`facility_id` )
    REFERENCES `afemr`.`facility` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`form_misc_billing_options`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`form_misc_billing_options` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `date` DATETIME NULL DEFAULT NULL ,
  `pid` BIGINT(20) NULL DEFAULT NULL ,
  `user` VARCHAR(255) NULL DEFAULT NULL ,
  `groupname` VARCHAR(255) NULL DEFAULT NULL ,
  `authorized` TINYINT(4) NULL DEFAULT NULL ,
  `activity` TINYINT(4) NULL DEFAULT NULL ,
  `employment_related` TINYINT(1) NULL DEFAULT NULL ,
  `auto_accident` TINYINT(1) NULL DEFAULT NULL ,
  `accident_state` VARCHAR(2) NULL DEFAULT NULL ,
  `other_accident` TINYINT(1) NULL DEFAULT NULL ,
  `outside_lab` TINYINT(1) NULL DEFAULT NULL ,
  `lab_amount` DECIMAL(5,2) NULL DEFAULT NULL ,
  `is_unable_to_work` TINYINT(1) NULL DEFAULT NULL ,
  `date_initial_treatment` DATE NULL DEFAULT NULL ,
  `off_work_from` DATE NULL DEFAULT NULL ,
  `off_work_to` DATE NULL DEFAULT NULL ,
  `is_hospitalized` TINYINT(1) NULL DEFAULT NULL ,
  `hospitalization_date_from` DATE NULL DEFAULT NULL ,
  `hospitalization_date_to` DATE NULL DEFAULT NULL ,
  `medicaid_resubmission_code` VARCHAR(10) NULL DEFAULT NULL ,
  `medicaid_original_reference` VARCHAR(15) NULL DEFAULT NULL ,
  `prior_auth_number` VARCHAR(20) NULL DEFAULT NULL ,
  `comments` VARCHAR(255) NULL DEFAULT NULL ,
  `replacement_claim` TINYINT(1) NULL DEFAULT 0 ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`form_reviewofs`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`form_reviewofs` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `date` DATETIME NULL DEFAULT NULL ,
  `pid` BIGINT(20) NULL DEFAULT NULL ,
  `user` VARCHAR(255) NULL DEFAULT NULL ,
  `groupname` VARCHAR(255) NULL DEFAULT NULL ,
  `authorized` TINYINT(4) NULL DEFAULT NULL ,
  `activity` TINYINT(4) NULL DEFAULT NULL ,
  `fever` VARCHAR(5) NULL DEFAULT NULL ,
  `chills` VARCHAR(5) NULL DEFAULT NULL ,
  `night_sweats` VARCHAR(5) NULL DEFAULT NULL ,
  `weight_loss` VARCHAR(5) NULL DEFAULT NULL ,
  `poor_appetite` VARCHAR(5) NULL DEFAULT NULL ,
  `insomnia` VARCHAR(5) NULL DEFAULT NULL ,
  `fatigued` VARCHAR(5) NULL DEFAULT NULL ,
  `depressed` VARCHAR(5) NULL DEFAULT NULL ,
  `hyperactive` VARCHAR(5) NULL DEFAULT NULL ,
  `exposure_to_foreign_countries` VARCHAR(5) NULL DEFAULT NULL ,
  `cataracts` VARCHAR(5) NULL DEFAULT NULL ,
  `cataract_surgery` VARCHAR(5) NULL DEFAULT NULL ,
  `glaucoma` VARCHAR(5) NULL DEFAULT NULL ,
  `double_vision` VARCHAR(5) NULL DEFAULT NULL ,
  `blurred_vision` VARCHAR(5) NULL DEFAULT NULL ,
  `poor_hearing` VARCHAR(5) NULL DEFAULT NULL ,
  `headaches` VARCHAR(5) NULL DEFAULT NULL ,
  `ringing_in_ears` VARCHAR(5) NULL DEFAULT NULL ,
  `bloody_nose` VARCHAR(5) NULL DEFAULT NULL ,
  `sinusitis` VARCHAR(5) NULL DEFAULT NULL ,
  `sinus_surgery` VARCHAR(5) NULL DEFAULT NULL ,
  `dry_mouth` VARCHAR(5) NULL DEFAULT NULL ,
  `strep_throat` VARCHAR(5) NULL DEFAULT NULL ,
  `tonsillectomy` VARCHAR(5) NULL DEFAULT NULL ,
  `swollen_lymph_nodes` VARCHAR(5) NULL DEFAULT NULL ,
  `throat_cancer` VARCHAR(5) NULL DEFAULT NULL ,
  `throat_cancer_surgery` VARCHAR(5) NULL DEFAULT NULL ,
  `heart_attack` VARCHAR(5) NULL DEFAULT NULL ,
  `irregular_heart_beat` VARCHAR(5) NULL DEFAULT NULL ,
  `chest_pains` VARCHAR(5) NULL DEFAULT NULL ,
  `shortness_of_breath` VARCHAR(5) NULL DEFAULT NULL ,
  `high_blood_pressure` VARCHAR(5) NULL DEFAULT NULL ,
  `heart_failure` VARCHAR(5) NULL DEFAULT NULL ,
  `poor_circulation` VARCHAR(5) NULL DEFAULT NULL ,
  `vascular_surgery` VARCHAR(5) NULL DEFAULT NULL ,
  `cardiac_catheterization` VARCHAR(5) NULL DEFAULT NULL ,
  `coronary_artery_bypass` VARCHAR(5) NULL DEFAULT NULL ,
  `heart_transplant` VARCHAR(5) NULL DEFAULT NULL ,
  `stress_test` VARCHAR(5) NULL DEFAULT NULL ,
  `emphysema` VARCHAR(5) NULL DEFAULT NULL ,
  `chronic_bronchitis` VARCHAR(5) NULL DEFAULT NULL ,
  `interstitial_lung_disease` VARCHAR(5) NULL DEFAULT NULL ,
  `shortness_of_breath_2` VARCHAR(5) NULL DEFAULT NULL ,
  `lung_cancer` VARCHAR(5) NULL DEFAULT NULL ,
  `lung_cancer_surgery` VARCHAR(5) NULL DEFAULT NULL ,
  `pheumothorax` VARCHAR(5) NULL DEFAULT NULL ,
  `stomach_pains` VARCHAR(5) NULL DEFAULT NULL ,
  `peptic_ulcer_disease` VARCHAR(5) NULL DEFAULT NULL ,
  `gastritis` VARCHAR(5) NULL DEFAULT NULL ,
  `endoscopy` VARCHAR(5) NULL DEFAULT NULL ,
  `polyps` VARCHAR(5) NULL DEFAULT NULL ,
  `colonoscopy` VARCHAR(5) NULL DEFAULT NULL ,
  `colon_cancer` VARCHAR(5) NULL DEFAULT NULL ,
  `colon_cancer_surgery` VARCHAR(5) NULL DEFAULT NULL ,
  `ulcerative_colitis` VARCHAR(5) NULL DEFAULT NULL ,
  `crohns_disease` VARCHAR(5) NULL DEFAULT NULL ,
  `appendectomy` VARCHAR(5) NULL DEFAULT NULL ,
  `divirticulitis` VARCHAR(5) NULL DEFAULT NULL ,
  `divirticulitis_surgery` VARCHAR(5) NULL DEFAULT NULL ,
  `gall_stones` VARCHAR(5) NULL DEFAULT NULL ,
  `cholecystectomy` VARCHAR(5) NULL DEFAULT NULL ,
  `hepatitis` VARCHAR(5) NULL DEFAULT NULL ,
  `cirrhosis_of_the_liver` VARCHAR(5) NULL DEFAULT NULL ,
  `splenectomy` VARCHAR(5) NULL DEFAULT NULL ,
  `kidney_failure` VARCHAR(5) NULL DEFAULT NULL ,
  `kidney_stones` VARCHAR(5) NULL DEFAULT NULL ,
  `kidney_cancer` VARCHAR(5) NULL DEFAULT NULL ,
  `kidney_infections` VARCHAR(5) NULL DEFAULT NULL ,
  `bladder_infections` VARCHAR(5) NULL DEFAULT NULL ,
  `bladder_cancer` VARCHAR(5) NULL DEFAULT NULL ,
  `prostate_problems` VARCHAR(5) NULL DEFAULT NULL ,
  `prostate_cancer` VARCHAR(5) NULL DEFAULT NULL ,
  `kidney_transplant` VARCHAR(5) NULL DEFAULT NULL ,
  `sexually_transmitted_disease` VARCHAR(5) NULL DEFAULT NULL ,
  `burning_with_urination` VARCHAR(5) NULL DEFAULT NULL ,
  `discharge_from_urethra` VARCHAR(5) NULL DEFAULT NULL ,
  `rashes` VARCHAR(5) NULL DEFAULT NULL ,
  `infections` VARCHAR(5) NULL DEFAULT NULL ,
  `ulcerations` VARCHAR(5) NULL DEFAULT NULL ,
  `pemphigus` VARCHAR(5) NULL DEFAULT NULL ,
  `herpes` VARCHAR(5) NULL DEFAULT NULL ,
  `osetoarthritis` VARCHAR(5) NULL DEFAULT NULL ,
  `rheumotoid_arthritis` VARCHAR(5) NULL DEFAULT NULL ,
  `lupus` VARCHAR(5) NULL DEFAULT NULL ,
  `ankylosing_sondlilitis` VARCHAR(5) NULL DEFAULT NULL ,
  `swollen_joints` VARCHAR(5) NULL DEFAULT NULL ,
  `stiff_joints` VARCHAR(5) NULL DEFAULT NULL ,
  `broken_bones` VARCHAR(5) NULL DEFAULT NULL ,
  `neck_problems` VARCHAR(5) NULL DEFAULT NULL ,
  `back_problems` VARCHAR(5) NULL DEFAULT NULL ,
  `back_surgery` VARCHAR(5) NULL DEFAULT NULL ,
  `scoliosis` VARCHAR(5) NULL DEFAULT NULL ,
  `herniated_disc` VARCHAR(5) NULL DEFAULT NULL ,
  `shoulder_problems` VARCHAR(5) NULL DEFAULT NULL ,
  `elbow_problems` VARCHAR(5) NULL DEFAULT NULL ,
  `wrist_problems` VARCHAR(5) NULL DEFAULT NULL ,
  `hand_problems` VARCHAR(5) NULL DEFAULT NULL ,
  `hip_problems` VARCHAR(5) NULL DEFAULT NULL ,
  `knee_problems` VARCHAR(5) NULL DEFAULT NULL ,
  `ankle_problems` VARCHAR(5) NULL DEFAULT NULL ,
  `foot_problems` VARCHAR(5) NULL DEFAULT NULL ,
  `insulin_dependent_diabetes` VARCHAR(5) NULL DEFAULT NULL ,
  `noninsulin_dependent_diabetes` VARCHAR(5) NULL DEFAULT NULL ,
  `hypothyroidism` VARCHAR(5) NULL DEFAULT NULL ,
  `hyperthyroidism` VARCHAR(5) NULL DEFAULT NULL ,
  `cushing_syndrom` VARCHAR(5) NULL DEFAULT NULL ,
  `addison_syndrom` VARCHAR(5) NULL DEFAULT NULL ,
  `additional_notes` LONGTEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`form_ros`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`form_ros` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `pid` INT(11) NOT NULL ,
  `activity` INT(11) NOT NULL DEFAULT '1' ,
  `date` DATETIME NULL DEFAULT NULL ,
  `weight_change` VARCHAR(3) NULL DEFAULT NULL ,
  `weakness` VARCHAR(3) NULL DEFAULT NULL ,
  `fatigue` VARCHAR(3) NULL DEFAULT NULL ,
  `anorexia` VARCHAR(3) NULL DEFAULT NULL ,
  `fever` VARCHAR(3) NULL DEFAULT NULL ,
  `chills` VARCHAR(3) NULL DEFAULT NULL ,
  `night_sweats` VARCHAR(3) NULL DEFAULT NULL ,
  `insomnia` VARCHAR(3) NULL DEFAULT NULL ,
  `irritability` VARCHAR(3) NULL DEFAULT NULL ,
  `heat_or_cold` VARCHAR(3) NULL DEFAULT NULL ,
  `intolerance` VARCHAR(3) NULL DEFAULT NULL ,
  `change_in_vision` VARCHAR(3) NULL DEFAULT NULL ,
  `glaucoma_history` VARCHAR(3) NULL DEFAULT NULL ,
  `eye_pain` VARCHAR(3) NULL DEFAULT NULL ,
  `irritation` VARCHAR(3) NULL DEFAULT NULL ,
  `redness` VARCHAR(3) NULL DEFAULT NULL ,
  `excessive_tearing` VARCHAR(3) NULL DEFAULT NULL ,
  `double_vision` VARCHAR(3) NULL DEFAULT NULL ,
  `blind_spots` VARCHAR(3) NULL DEFAULT NULL ,
  `photophobia` VARCHAR(3) NULL DEFAULT NULL ,
  `hearing_loss` VARCHAR(3) NULL DEFAULT NULL ,
  `discharge` VARCHAR(3) NULL DEFAULT NULL ,
  `pain` VARCHAR(3) NULL DEFAULT NULL ,
  `vertigo` VARCHAR(3) NULL DEFAULT NULL ,
  `tinnitus` VARCHAR(3) NULL DEFAULT NULL ,
  `frequent_colds` VARCHAR(3) NULL DEFAULT NULL ,
  `sore_throat` VARCHAR(3) NULL DEFAULT NULL ,
  `sinus_problems` VARCHAR(3) NULL DEFAULT NULL ,
  `post_nasal_drip` VARCHAR(3) NULL DEFAULT NULL ,
  `nosebleed` VARCHAR(3) NULL DEFAULT NULL ,
  `snoring` VARCHAR(3) NULL DEFAULT NULL ,
  `apnea` VARCHAR(3) NULL DEFAULT NULL ,
  `breast_mass` VARCHAR(3) NULL DEFAULT NULL ,
  `breast_discharge` VARCHAR(3) NULL DEFAULT NULL ,
  `biopsy` VARCHAR(3) NULL DEFAULT NULL ,
  `abnormal_mammogram` VARCHAR(3) NULL DEFAULT NULL ,
  `cough` VARCHAR(3) NULL DEFAULT NULL ,
  `sputum` VARCHAR(3) NULL DEFAULT NULL ,
  `shortness_of_breath` VARCHAR(3) NULL DEFAULT NULL ,
  `wheezing` VARCHAR(3) NULL DEFAULT NULL ,
  `hemoptsyis` VARCHAR(3) NULL DEFAULT NULL ,
  `asthma` VARCHAR(3) NULL DEFAULT NULL ,
  `copd` VARCHAR(3) NULL DEFAULT NULL ,
  `chest_pain` VARCHAR(3) NULL DEFAULT NULL ,
  `palpitation` VARCHAR(3) NULL DEFAULT NULL ,
  `syncope` VARCHAR(3) NULL DEFAULT NULL ,
  `pnd` VARCHAR(3) NULL DEFAULT NULL ,
  `doe` VARCHAR(3) NULL DEFAULT NULL ,
  `orthopnea` VARCHAR(3) NULL DEFAULT NULL ,
  `peripheal` VARCHAR(3) NULL DEFAULT NULL ,
  `edema` VARCHAR(3) NULL DEFAULT NULL ,
  `legpain_cramping` VARCHAR(3) NULL DEFAULT NULL ,
  `history_murmur` VARCHAR(3) NULL DEFAULT NULL ,
  `arrythmia` VARCHAR(3) NULL DEFAULT NULL ,
  `heart_problem` VARCHAR(3) NULL DEFAULT NULL ,
  `dysphagia` VARCHAR(3) NULL DEFAULT NULL ,
  `heartburn` VARCHAR(3) NULL DEFAULT NULL ,
  `bloating` VARCHAR(3) NULL DEFAULT NULL ,
  `belching` VARCHAR(3) NULL DEFAULT NULL ,
  `flatulence` VARCHAR(3) NULL DEFAULT NULL ,
  `nausea` VARCHAR(3) NULL DEFAULT NULL ,
  `vomiting` VARCHAR(3) NULL DEFAULT NULL ,
  `hematemesis` VARCHAR(3) NULL DEFAULT NULL ,
  `gastro_pain` VARCHAR(3) NULL DEFAULT NULL ,
  `food_intolerance` VARCHAR(3) NULL DEFAULT NULL ,
  `hepatitis` VARCHAR(3) NULL DEFAULT NULL ,
  `jaundice` VARCHAR(3) NULL DEFAULT NULL ,
  `hematochezia` VARCHAR(3) NULL DEFAULT NULL ,
  `changed_bowel` VARCHAR(3) NULL DEFAULT NULL ,
  `diarrhea` VARCHAR(3) NULL DEFAULT NULL ,
  `constipation` VARCHAR(3) NULL DEFAULT NULL ,
  `polyuria` VARCHAR(3) NULL DEFAULT NULL ,
  `polydypsia` VARCHAR(3) NULL DEFAULT NULL ,
  `dysuria` VARCHAR(3) NULL DEFAULT NULL ,
  `hematuria` VARCHAR(3) NULL DEFAULT NULL ,
  `frequency` VARCHAR(3) NULL DEFAULT NULL ,
  `urgency` VARCHAR(3) NULL DEFAULT NULL ,
  `incontinence` VARCHAR(3) NULL DEFAULT NULL ,
  `renal_stones` VARCHAR(3) NULL DEFAULT NULL ,
  `utis` VARCHAR(3) NULL DEFAULT NULL ,
  `hesitancy` VARCHAR(3) NULL DEFAULT NULL ,
  `dribbling` VARCHAR(3) NULL DEFAULT NULL ,
  `stream` VARCHAR(3) NULL DEFAULT NULL ,
  `nocturia` VARCHAR(3) NULL DEFAULT NULL ,
  `erections` VARCHAR(3) NULL DEFAULT NULL ,
  `ejaculations` VARCHAR(3) NULL DEFAULT NULL ,
  `g` VARCHAR(3) NULL DEFAULT NULL ,
  `p` VARCHAR(3) NULL DEFAULT NULL ,
  `ap` VARCHAR(3) NULL DEFAULT NULL ,
  `lc` VARCHAR(3) NULL DEFAULT NULL ,
  `mearche` VARCHAR(3) NULL DEFAULT NULL ,
  `menopause` VARCHAR(3) NULL DEFAULT NULL ,
  `lmp` VARCHAR(3) NULL DEFAULT NULL ,
  `f_frequency` VARCHAR(3) NULL DEFAULT NULL ,
  `f_flow` VARCHAR(3) NULL DEFAULT NULL ,
  `f_symptoms` VARCHAR(3) NULL DEFAULT NULL ,
  `abnormal_hair_growth` VARCHAR(3) NULL DEFAULT NULL ,
  `f_hirsutism` VARCHAR(3) NULL DEFAULT NULL ,
  `joint_pain` VARCHAR(3) NULL DEFAULT NULL ,
  `swelling` VARCHAR(3) NULL DEFAULT NULL ,
  `m_redness` VARCHAR(3) NULL DEFAULT NULL ,
  `m_warm` VARCHAR(3) NULL DEFAULT NULL ,
  `m_stiffness` VARCHAR(3) NULL DEFAULT NULL ,
  `muscle` VARCHAR(3) NULL DEFAULT NULL ,
  `m_aches` VARCHAR(3) NULL DEFAULT NULL ,
  `fms` VARCHAR(3) NULL DEFAULT NULL ,
  `arthritis` VARCHAR(3) NULL DEFAULT NULL ,
  `loc` VARCHAR(3) NULL DEFAULT NULL ,
  `seizures` VARCHAR(3) NULL DEFAULT NULL ,
  `stroke` VARCHAR(3) NULL DEFAULT NULL ,
  `tia` VARCHAR(3) NULL DEFAULT NULL ,
  `n_numbness` VARCHAR(3) NULL DEFAULT NULL ,
  `n_weakness` VARCHAR(3) NULL DEFAULT NULL ,
  `paralysis` VARCHAR(3) NULL DEFAULT NULL ,
  `intellectual_decline` VARCHAR(3) NULL DEFAULT NULL ,
  `memory_problems` VARCHAR(3) NULL DEFAULT NULL ,
  `dementia` VARCHAR(3) NULL DEFAULT NULL ,
  `n_headache` VARCHAR(3) NULL DEFAULT NULL ,
  `s_cancer` VARCHAR(3) NULL DEFAULT NULL ,
  `psoriasis` VARCHAR(3) NULL DEFAULT NULL ,
  `s_acne` VARCHAR(3) NULL DEFAULT NULL ,
  `s_other` VARCHAR(3) NULL DEFAULT NULL ,
  `s_disease` VARCHAR(3) NULL DEFAULT NULL ,
  `p_diagnosis` VARCHAR(3) NULL DEFAULT NULL ,
  `p_medication` VARCHAR(3) NULL DEFAULT NULL ,
  `depression` VARCHAR(3) NULL DEFAULT NULL ,
  `anxiety` VARCHAR(3) NULL DEFAULT NULL ,
  `social_difficulties` VARCHAR(3) NULL DEFAULT NULL ,
  `thyroid_problems` VARCHAR(3) NULL DEFAULT NULL ,
  `diabetes` VARCHAR(3) NULL DEFAULT NULL ,
  `abnormal_blood` VARCHAR(3) NULL DEFAULT NULL ,
  `anemia` VARCHAR(3) NULL DEFAULT NULL ,
  `fh_blood_problems` VARCHAR(3) NULL DEFAULT NULL ,
  `bleeding_problems` VARCHAR(3) NULL DEFAULT NULL ,
  `allergies` VARCHAR(3) NULL DEFAULT NULL ,
  `frequent_illness` VARCHAR(3) NULL DEFAULT NULL ,
  `hiv` VARCHAR(3) NULL DEFAULT NULL ,
  `hai_status` VARCHAR(3) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`form_soap`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`form_soap` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `date` DATETIME NULL DEFAULT NULL ,
  `pid` BIGINT(20) NULL DEFAULT '0' ,
  `user` VARCHAR(255) NULL DEFAULT NULL ,
  `groupname` VARCHAR(255) NULL DEFAULT NULL ,
  `authorized` TINYINT(4) NULL DEFAULT '0' ,
  `activity` TINYINT(4) NULL DEFAULT '0' ,
  `subjective` TEXT NULL DEFAULT NULL ,
  `objective` TEXT NULL DEFAULT NULL ,
  `assessment` TEXT NULL DEFAULT NULL ,
  `plan` TEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`form_vitals`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`form_vitals` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `date` DATETIME NULL DEFAULT NULL ,
  `pid` BIGINT(20) NULL DEFAULT '0' ,
  `user` VARCHAR(255) NULL DEFAULT NULL ,
  `groupname` VARCHAR(255) NULL DEFAULT NULL ,
  `authorized` TINYINT(4) NULL DEFAULT '0' ,
  `activity` TINYINT(4) NULL DEFAULT '0' ,
  `bps` VARCHAR(40) NULL DEFAULT NULL ,
  `bpd` VARCHAR(40) NULL DEFAULT NULL ,
  `weight` FLOAT(5,2) NULL DEFAULT '0.00' ,
  `height` FLOAT(5,2) NULL DEFAULT '0.00' ,
  `temperature` FLOAT(5,2) NULL DEFAULT '0.00' ,
  `temp_method` VARCHAR(255) NULL DEFAULT NULL ,
  `pulse` FLOAT(5,2) NULL DEFAULT '0.00' ,
  `respiration` FLOAT(5,2) NULL DEFAULT '0.00' ,
  `note` VARCHAR(255) NULL DEFAULT NULL ,
  `BMI` FLOAT(4,1) NULL DEFAULT '0.0' ,
  `BMI_status` VARCHAR(255) NULL DEFAULT NULL ,
  `waist_circ` FLOAT(5,2) NULL DEFAULT '0.00' ,
  `head_circ` FLOAT(4,2) NULL DEFAULT '0.00' ,
  `oxygen_saturation` FLOAT(5,2) NULL DEFAULT '0.00' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`forms`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`forms` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `date` DATETIME NULL DEFAULT NULL ,
  `encounter` BIGINT(20) NULL DEFAULT NULL ,
  `form_name` LONGTEXT NULL DEFAULT NULL ,
  `form_id` BIGINT(20) NULL DEFAULT NULL ,
  `pid` BIGINT(20) NULL DEFAULT NULL ,
  `user` VARCHAR(255) NULL DEFAULT NULL ,
  `groupname` VARCHAR(255) NULL DEFAULT NULL ,
  `authorized` TINYINT(4) NULL DEFAULT NULL ,
  `deleted` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'flag indicates form has been deleted' ,
  `formdir` LONGTEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`geo_country_reference`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`geo_country_reference` (
  `countries_id` INT(5) NOT NULL AUTO_INCREMENT ,
  `countries_name` VARCHAR(64) NULL DEFAULT NULL ,
  `countries_iso_code_2` CHAR(2) NOT NULL DEFAULT '' ,
  `countries_iso_code_3` CHAR(3) NOT NULL DEFAULT '' ,
  PRIMARY KEY (`countries_id`) ,
  INDEX `IDX_COUNTRIES_NAME` (`countries_name` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 240;


-- -----------------------------------------------------
-- Table `afemr`.`geo_zone_reference`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`geo_zone_reference` (
  `zone_id` INT(5) NOT NULL AUTO_INCREMENT ,
  `zone_country_id` INT(5) NOT NULL DEFAULT '0' ,
  `zone_code` VARCHAR(5) NULL DEFAULT NULL ,
  `zone_name` VARCHAR(32) NULL DEFAULT NULL ,
  PRIMARY KEY (`zone_id`) ,
  INDEX `geo_zone_reference_FK_1` (`zone_country_id` ASC) ,
  CONSTRAINT `geo_zone_reference_FK_1`
    FOREIGN KEY (`zone_country_id` )
    REFERENCES `afemr`.`geo_country_reference` (`countries_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 83;


-- -----------------------------------------------------
-- Table `afemr`.`groups`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`groups` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `name` LONGTEXT NULL DEFAULT NULL ,
  `user` LONGTEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`history_data`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`history_data` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `coffee` LONGTEXT NULL DEFAULT NULL ,
  `tobacco` LONGTEXT NULL DEFAULT NULL ,
  `alcohol` LONGTEXT NULL DEFAULT NULL ,
  `sleep_patterns` LONGTEXT NULL DEFAULT NULL ,
  `exercise_patterns` LONGTEXT NULL DEFAULT NULL ,
  `seatbelt_use` LONGTEXT NULL DEFAULT NULL ,
  `counseling` LONGTEXT NULL DEFAULT NULL ,
  `hazardous_activities` LONGTEXT NULL DEFAULT NULL ,
  `recreational_drugs` LONGTEXT NULL DEFAULT NULL ,
  `last_breast_exam` VARCHAR(255) NULL DEFAULT NULL ,
  `last_mammogram` VARCHAR(255) NULL DEFAULT NULL ,
  `last_gynocological_exam` VARCHAR(255) NULL DEFAULT NULL ,
  `last_rectal_exam` VARCHAR(255) NULL DEFAULT NULL ,
  `last_prostate_exam` VARCHAR(255) NULL DEFAULT NULL ,
  `last_physical_exam` VARCHAR(255) NULL DEFAULT NULL ,
  `last_sigmoidoscopy_colonoscopy` VARCHAR(255) NULL DEFAULT NULL ,
  `last_ecg` VARCHAR(255) NULL DEFAULT NULL ,
  `last_cardiac_echo` VARCHAR(255) NULL DEFAULT NULL ,
  `last_retinal` VARCHAR(255) NULL DEFAULT NULL ,
  `last_fluvax` VARCHAR(255) NULL DEFAULT NULL ,
  `last_pneuvax` VARCHAR(255) NULL DEFAULT NULL ,
  `last_ldl` VARCHAR(255) NULL DEFAULT NULL ,
  `last_hemoglobin` VARCHAR(255) NULL DEFAULT NULL ,
  `last_psa` VARCHAR(255) NULL DEFAULT NULL ,
  `last_exam_results` VARCHAR(255) NULL DEFAULT NULL ,
  `history_mother` LONGTEXT NULL DEFAULT NULL ,
  `history_father` LONGTEXT NULL DEFAULT NULL ,
  `history_siblings` LONGTEXT NULL DEFAULT NULL ,
  `history_offspring` LONGTEXT NULL DEFAULT NULL ,
  `history_spouse` LONGTEXT NULL DEFAULT NULL ,
  `relatives_cancer` LONGTEXT NULL DEFAULT NULL ,
  `relatives_tuberculosis` LONGTEXT NULL DEFAULT NULL ,
  `relatives_diabetes` LONGTEXT NULL DEFAULT NULL ,
  `relatives_high_blood_pressure` LONGTEXT NULL DEFAULT NULL ,
  `relatives_heart_problems` LONGTEXT NULL DEFAULT NULL ,
  `relatives_stroke` LONGTEXT NULL DEFAULT NULL ,
  `relatives_epilepsy` LONGTEXT NULL DEFAULT NULL ,
  `relatives_mental_illness` LONGTEXT NULL DEFAULT NULL ,
  `relatives_suicide` LONGTEXT NULL DEFAULT NULL ,
  `cataract_surgery` DATETIME NULL DEFAULT NULL ,
  `tonsillectomy` DATETIME NULL DEFAULT NULL ,
  `cholecystestomy` DATETIME NULL DEFAULT NULL ,
  `heart_surgery` DATETIME NULL DEFAULT NULL ,
  `hysterectomy` DATETIME NULL DEFAULT NULL ,
  `hernia_repair` DATETIME NULL DEFAULT NULL ,
  `hip_replacement` DATETIME NULL DEFAULT NULL ,
  `knee_replacement` DATETIME NULL DEFAULT NULL ,
  `appendectomy` DATETIME NULL DEFAULT NULL ,
  `date` DATETIME NULL DEFAULT NULL ,
  `pid` BIGINT(20) NOT NULL DEFAULT '0' ,
  `name_1` VARCHAR(255) NULL DEFAULT NULL ,
  `value_1` VARCHAR(255) NULL DEFAULT NULL ,
  `name_2` VARCHAR(255) NULL DEFAULT NULL ,
  `value_2` VARCHAR(255) NULL DEFAULT NULL ,
  `additional_history` TEXT NULL DEFAULT NULL ,
  `exams` TEXT NOT NULL ,
  `usertext11` VARCHAR(255) NOT NULL DEFAULT '' ,
  `usertext12` VARCHAR(255) NOT NULL DEFAULT '' ,
  `usertext13` VARCHAR(255) NOT NULL DEFAULT '' ,
  `usertext14` VARCHAR(255) NOT NULL DEFAULT '' ,
  `usertext15` VARCHAR(255) NOT NULL DEFAULT '' ,
  `usertext16` VARCHAR(255) NOT NULL DEFAULT '' ,
  `usertext17` VARCHAR(255) NOT NULL DEFAULT '' ,
  `usertext18` VARCHAR(255) NOT NULL DEFAULT '' ,
  `usertext19` VARCHAR(255) NOT NULL DEFAULT '' ,
  `usertext20` VARCHAR(255) NOT NULL DEFAULT '' ,
  `usertext21` VARCHAR(255) NOT NULL DEFAULT '' ,
  `usertext22` VARCHAR(255) NOT NULL DEFAULT '' ,
  `usertext23` VARCHAR(255) NOT NULL DEFAULT '' ,
  `usertext24` VARCHAR(255) NOT NULL DEFAULT '' ,
  `usertext25` VARCHAR(255) NOT NULL DEFAULT '' ,
  `usertext26` VARCHAR(255) NOT NULL DEFAULT '' ,
  `usertext27` VARCHAR(255) NOT NULL DEFAULT '' ,
  `usertext28` VARCHAR(255) NOT NULL DEFAULT '' ,
  `usertext29` VARCHAR(255) NOT NULL DEFAULT '' ,
  `usertext30` VARCHAR(255) NOT NULL DEFAULT '' ,
  `userdate11` DATE NULL DEFAULT NULL ,
  `userdate12` DATE NULL DEFAULT NULL ,
  `userdate13` DATE NULL DEFAULT NULL ,
  `userdate14` DATE NULL DEFAULT NULL ,
  `userdate15` DATE NULL DEFAULT NULL ,
  `userarea11` TEXT NOT NULL ,
  `userarea12` TEXT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `pid` (`pid` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`immunizations`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`immunizations` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `patient_id` INT(11) NULL DEFAULT NULL ,
  `administered_date` DATE NULL DEFAULT NULL ,
  `immunization_id` INT(11) NULL DEFAULT NULL ,
  `cvx_code` INT(11) NULL DEFAULT NULL ,
  `manufacturer` VARCHAR(100) NULL DEFAULT NULL ,
  `lot_number` VARCHAR(50) NULL DEFAULT NULL ,
  `administered_by_id` BIGINT(20) NULL DEFAULT NULL ,
  `administered_by` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Alternative to administered_by_id' ,
  `education_date` DATE NULL DEFAULT NULL ,
  `vis_date` DATE NULL DEFAULT NULL COMMENT 'Date of VIS Statement' ,
  `note` TEXT NULL DEFAULT NULL ,
  `create_date` DATETIME NULL DEFAULT NULL ,
  `update_date` TIMESTAMP NOT NULL ,
  `created_by` BIGINT(20) NULL DEFAULT NULL ,
  `updated_by` BIGINT(20) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`insurance_companies`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`insurance_companies` (
  `id` INT(11) NOT NULL DEFAULT '0' ,
  `name` VARCHAR(255) NULL DEFAULT NULL ,
  `attn` VARCHAR(255) NULL DEFAULT NULL ,
  `cms_id` VARCHAR(15) NULL DEFAULT NULL ,
  `freeb_type` TINYINT(2) NULL DEFAULT NULL ,
  `x12_receiver_id` VARCHAR(25) NULL DEFAULT NULL ,
  `x12_default_partner_id` INT(11) NULL DEFAULT NULL ,
  `alt_cms_id` VARCHAR(15) NOT NULL DEFAULT '' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`insurance_data`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`insurance_data` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `type` ENUM('primary','secondary','tertiary') NULL DEFAULT NULL ,
  `provider` VARCHAR(255) NULL DEFAULT NULL ,
  `plan_name` VARCHAR(255) NULL DEFAULT NULL ,
  `policy_number` VARCHAR(255) NULL DEFAULT NULL ,
  `group_number` VARCHAR(255) NULL DEFAULT NULL ,
  `subscriber_lname` VARCHAR(255) NULL DEFAULT NULL ,
  `subscriber_mname` VARCHAR(255) NULL DEFAULT NULL ,
  `subscriber_fname` VARCHAR(255) NULL DEFAULT NULL ,
  `subscriber_relationship` VARCHAR(255) NULL DEFAULT NULL ,
  `subscriber_ss` VARCHAR(255) NULL DEFAULT NULL ,
  `subscriber_DOB` DATE NULL DEFAULT NULL ,
  `subscriber_street` VARCHAR(255) NULL DEFAULT NULL ,
  `subscriber_postal_code` VARCHAR(255) NULL DEFAULT NULL ,
  `subscriber_city` VARCHAR(255) NULL DEFAULT NULL ,
  `subscriber_state` VARCHAR(255) NULL DEFAULT NULL ,
  `subscriber_country` VARCHAR(255) NULL DEFAULT NULL ,
  `subscriber_phone` VARCHAR(255) NULL DEFAULT NULL ,
  `subscriber_employer` VARCHAR(255) NULL DEFAULT NULL ,
  `subscriber_employer_street` VARCHAR(255) NULL DEFAULT NULL ,
  `subscriber_employer_postal_code` VARCHAR(255) NULL DEFAULT NULL ,
  `subscriber_employer_state` VARCHAR(255) NULL DEFAULT NULL ,
  `subscriber_employer_country` VARCHAR(255) NULL DEFAULT NULL ,
  `subscriber_employer_city` VARCHAR(255) NULL DEFAULT NULL ,
  `copay` VARCHAR(255) NULL DEFAULT NULL ,
  `date` DATE NOT NULL ,
  `pid` BIGINT(20) NOT NULL DEFAULT '0' ,
  `subscriber_sex` VARCHAR(25) NULL DEFAULT NULL ,
  `accept_assignment` VARCHAR(5) NOT NULL DEFAULT 'TRUE' ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `pid_type_date` (`pid` ASC, `type` ASC, `date` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`insurance_numbers`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`insurance_numbers` (
  `id` INT(11) NOT NULL DEFAULT '0' ,
  `provider_id` INT(11) NOT NULL DEFAULT '0' ,
  `insurance_company_id` INT(11) NULL DEFAULT NULL ,
  `provider_number` VARCHAR(20) NULL DEFAULT NULL ,
  `rendering_provider_number` VARCHAR(20) NULL DEFAULT NULL ,
  `group_number` VARCHAR(20) NULL DEFAULT NULL ,
  `provider_number_type` VARCHAR(4) NULL DEFAULT NULL ,
  `rendering_provider_number_type` VARCHAR(4) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `insurance_numbers_FK_1` (`insurance_company_id` ASC) ,
  CONSTRAINT `insurance_numbers_FK_1`
    FOREIGN KEY (`insurance_company_id` )
    REFERENCES `afemr`.`insurance_companies` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`integration_mapping`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`integration_mapping` (
  `id` INT(11) NOT NULL DEFAULT '0' ,
  `foreign_id` INT(11) NOT NULL DEFAULT '0' ,
  `foreign_table` VARCHAR(125) NULL DEFAULT NULL ,
  `local_id` INT(11) NOT NULL DEFAULT '0' ,
  `local_table` VARCHAR(125) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `foreign_id` (`foreign_id` ASC, `foreign_table` ASC, `local_id` ASC, `local_table` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`issue_encounter`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`issue_encounter` (
  `pid` INT(11) NOT NULL ,
  `list_id` INT(11) NOT NULL ,
  `encounter` INT(11) NOT NULL ,
  `resolved` TINYINT(1) NOT NULL ,
  PRIMARY KEY (`pid`, `list_id`, `encounter`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`lang_constants`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`lang_constants` (
  `cons_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `constant_name` VARCHAR(255) BINARY NULL DEFAULT NULL ,
  UNIQUE INDEX `cons_id` (`cons_id` ASC) ,
  INDEX `constant_name` (`constant_name` ASC) ,
  PRIMARY KEY (`cons_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`lang_languages`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`lang_languages` (
  `lang_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `lang_code` CHAR(2) NOT NULL DEFAULT '' ,
  `lang_description` VARCHAR(100) NULL DEFAULT NULL ,
  UNIQUE INDEX `lang_id` (`lang_id` ASC) ,
  PRIMARY KEY (`lang_id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 2;


-- -----------------------------------------------------
-- Table `afemr`.`lang_definitions`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`lang_definitions` (
  `def_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `cons_id` INT(11) NOT NULL DEFAULT '0' ,
  `lang_id` INT(11) NOT NULL DEFAULT '0' ,
  `definition` MEDIUMTEXT NULL DEFAULT NULL ,
  UNIQUE INDEX `def_id` (`def_id` ASC) ,
  INDEX `cons_id` (`cons_id` ASC) ,
  INDEX `language_definitions_FK_1` (`cons_id` ASC) ,
  INDEX `language_definitions_FK_2` (`lang_id` ASC) ,
  PRIMARY KEY (`def_id`) ,
  CONSTRAINT `language_definitions_FK_1`
    FOREIGN KEY (`cons_id` )
    REFERENCES `afemr`.`lang_constants` (`cons_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `language_definitions_FK_2`
    FOREIGN KEY (`lang_id` )
    REFERENCES `afemr`.`lang_languages` (`lang_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`lang_custom`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`lang_custom` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `lang_description` VARCHAR(100) NOT NULL DEFAULT '' ,
  `lang_code` CHAR(2) NOT NULL DEFAULT '' ,
  `constant_name` VARCHAR(255) NOT NULL DEFAULT '' ,
  `definition` MEDIUMTEXT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`layout_options`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`layout_options` (
  `form_id` VARCHAR(31) NOT NULL DEFAULT '' ,
  `field_id` VARCHAR(31) NOT NULL DEFAULT '' ,
  `group_name` VARCHAR(31) NOT NULL DEFAULT '' ,
  `title` VARCHAR(63) NOT NULL DEFAULT '' ,
  `seq` INT(11) NOT NULL DEFAULT '0' ,
  `data_type` TINYINT(3) NOT NULL DEFAULT '0' ,
  `uor` TINYINT(1) NOT NULL DEFAULT '1' ,
  `fld_length` INT(11) NOT NULL DEFAULT '15' ,
  `max_length` INT(11) NOT NULL DEFAULT '0' ,
  `list_id` VARCHAR(31) NOT NULL DEFAULT '' ,
  `titlecols` TINYINT(3) NOT NULL DEFAULT '1' ,
  `datacols` TINYINT(3) NOT NULL DEFAULT '1' ,
  `default_value` VARCHAR(255) NOT NULL DEFAULT '' ,
  `edit_options` VARCHAR(36) NOT NULL DEFAULT '' ,
  `description` TEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`form_id`, `field_id`, `seq`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`list_options`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`list_options` (
  `list_id` VARCHAR(31) NOT NULL DEFAULT '' ,
  `option_id` VARCHAR(31) NOT NULL DEFAULT '' ,
  `title` VARCHAR(255) NOT NULL DEFAULT '' ,
  `seq` INT(11) NOT NULL DEFAULT '0' ,
  `is_default` TINYINT(1) NOT NULL DEFAULT '0' ,
  `option_value` FLOAT NOT NULL DEFAULT '0' ,
  `mapping` VARCHAR(31) NOT NULL DEFAULT '' ,
  `notes` VARCHAR(255) NOT NULL DEFAULT '' ,
  PRIMARY KEY (`list_id`, `option_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`lists_touch`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`lists_touch` (
  `pid` BIGINT(20) NULL DEFAULT NULL ,
  `type` VARCHAR(255) NULL DEFAULT NULL ,
  `date` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`pid`, `type`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`log`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`log` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `date` DATETIME NULL DEFAULT NULL ,
  `event` VARCHAR(255) NULL DEFAULT NULL ,
  `user` VARCHAR(255) NULL DEFAULT NULL ,
  `groupname` VARCHAR(255) NULL DEFAULT NULL ,
  `comments` LONGTEXT NULL DEFAULT NULL ,
  `user_notes` LONGTEXT NULL DEFAULT NULL ,
  `patient_id` BIGINT(20) NULL DEFAULT NULL ,
  `success` TINYINT(1) NULL DEFAULT 1 ,
  `checksum` LONGTEXT NULL DEFAULT NULL ,
  `crt_user` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`notes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`notes` (
  `id` INT(11) NOT NULL DEFAULT '0' ,
  `foreign_id` INT(11) NOT NULL DEFAULT '0' ,
  `note` VARCHAR(255) NULL DEFAULT NULL ,
  `owner` INT(11) NULL DEFAULT NULL ,
  `date` DATETIME NULL DEFAULT NULL ,
  `revision` TIMESTAMP NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `foreign_id` (`owner` ASC) ,
  INDEX `foreign_id_2` (`foreign_id` ASC) ,
  INDEX `date` (`date` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`onotes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`onotes` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `date` DATETIME NULL DEFAULT NULL ,
  `body` LONGTEXT NULL DEFAULT NULL ,
  `user` VARCHAR(255) NULL DEFAULT NULL ,
  `groupname` VARCHAR(255) NULL DEFAULT NULL ,
  `activity` TINYINT(4) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`openemr_module_vars`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`openemr_module_vars` (
  `pn_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `pn_modname` VARCHAR(64) NULL DEFAULT NULL ,
  `pn_name` VARCHAR(64) NULL DEFAULT NULL ,
  `pn_value` LONGTEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`pn_id`) ,
  INDEX `pn_modname` (`pn_modname` ASC) ,
  INDEX `pn_name` (`pn_name` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 235;


-- -----------------------------------------------------
-- Table `afemr`.`openemr_modules`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`openemr_modules` (
  `pn_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `pn_name` VARCHAR(64) NULL DEFAULT NULL ,
  `pn_type` INT(6) NOT NULL DEFAULT '0' ,
  `pn_displayname` VARCHAR(64) NULL DEFAULT NULL ,
  `pn_description` VARCHAR(255) NULL DEFAULT NULL ,
  `pn_regid` INT(11) UNSIGNED NOT NULL DEFAULT '0' ,
  `pn_directory` VARCHAR(64) NULL DEFAULT NULL ,
  `pn_version` VARCHAR(10) NULL DEFAULT NULL ,
  `pn_admin_capable` TINYINT(1) NOT NULL DEFAULT '0' ,
  `pn_user_capable` TINYINT(1) NOT NULL DEFAULT '0' ,
  `pn_state` TINYINT(1) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`pn_id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 47;


-- -----------------------------------------------------
-- Table `afemr`.`openemr_postcalendar_categories`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`openemr_postcalendar_categories` (
  `pc_catid` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `pc_catname` VARCHAR(100) NULL DEFAULT NULL ,
  `pc_catcolor` VARCHAR(50) NULL DEFAULT NULL ,
  `pc_catdesc` TEXT NULL DEFAULT NULL ,
  `pc_recurrtype` INT(1) NOT NULL DEFAULT '0' ,
  `pc_enddate` DATE NULL DEFAULT NULL ,
  `pc_recurrspec` TEXT NULL DEFAULT NULL ,
  `pc_recurrfreq` INT(3) NOT NULL DEFAULT '0' ,
  `pc_duration` BIGINT(20) NOT NULL DEFAULT '0' ,
  `pc_end_date_flag` TINYINT(1) NOT NULL DEFAULT '0' ,
  `pc_end_date_type` INT(2) NULL DEFAULT NULL ,
  `pc_end_date_freq` INT(11) NOT NULL DEFAULT '0' ,
  `pc_end_all_day` TINYINT(1) NOT NULL DEFAULT '0' ,
  `pc_dailylimit` INT(2) NOT NULL DEFAULT '0' ,
  `pc_cattype` INT(11) NOT NULL COMMENT 'Used in grouping categories' ,
  PRIMARY KEY (`pc_catid`) ,
  INDEX `basic_cat` (`pc_catname` ASC, `pc_catcolor` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 11;


-- -----------------------------------------------------
-- Table `afemr`.`openemr_postcalendar_events`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`openemr_postcalendar_events` (
  `pc_eid` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `pc_catid` INT(11) NOT NULL DEFAULT '0' ,
  `pc_multiple` INT(10) UNSIGNED NOT NULL ,
  `pc_aid` VARCHAR(30) NULL DEFAULT NULL ,
  `pc_pid` VARCHAR(11) NULL DEFAULT NULL ,
  `pc_title` VARCHAR(150) NULL DEFAULT NULL ,
  `pc_time` DATETIME NULL DEFAULT NULL ,
  `pc_hometext` TEXT NULL DEFAULT NULL ,
  `pc_comments` INT(11) NULL DEFAULT '0' ,
  `pc_counter` MEDIUMINT(8) UNSIGNED NULL DEFAULT '0' ,
  `pc_topic` INT(3) NOT NULL DEFAULT '1' ,
  `pc_informant` VARCHAR(20) NULL DEFAULT NULL ,
  `pc_eventDate` DATE NOT NULL ,
  `pc_endDate` DATE NOT NULL ,
  `pc_duration` BIGINT(20) NOT NULL DEFAULT '0' ,
  `pc_recurrtype` INT(1) NOT NULL DEFAULT '0' ,
  `pc_recurrspec` TEXT NULL DEFAULT NULL ,
  `pc_recurrfreq` INT(3) NOT NULL DEFAULT '0' ,
  `pc_startTime` TIME NULL DEFAULT NULL ,
  `pc_endTime` TIME NULL DEFAULT NULL ,
  `pc_alldayevent` INT(1) NOT NULL DEFAULT '0' ,
  `pc_location` TEXT NULL DEFAULT NULL ,
  `pc_conttel` VARCHAR(50) NULL DEFAULT NULL ,
  `pc_contname` VARCHAR(50) NULL DEFAULT NULL ,
  `pc_contemail` VARCHAR(255) NULL DEFAULT NULL ,
  `pc_website` VARCHAR(255) NULL DEFAULT NULL ,
  `pc_fee` VARCHAR(50) NULL DEFAULT NULL ,
  `pc_eventstatus` INT(11) NOT NULL DEFAULT '0' ,
  `pc_sharing` INT(11) NOT NULL DEFAULT '0' ,
  `pc_language` VARCHAR(30) NULL DEFAULT NULL ,
  `pc_apptstatus` VARCHAR(15) NOT NULL DEFAULT '-' ,
  `pc_prefcatid` INT(11) NOT NULL DEFAULT '0' ,
  `pc_facility` SMALLINT(6) NOT NULL DEFAULT '0' COMMENT 'facility id for this event' ,
  `pc_sendalertsms` VARCHAR(3) NOT NULL DEFAULT 'NO' ,
  `pc_sendalertemail` VARCHAR(3) NOT NULL DEFAULT 'NO' ,
  `pc_billing_location` SMALLINT(6) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`pc_eid`) ,
  INDEX `basic_event` (`pc_catid` ASC, `pc_aid` ASC, `pc_eventDate` ASC, `pc_endDate` ASC, `pc_eventstatus` ASC, `pc_sharing` ASC, `pc_topic` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 7;


-- -----------------------------------------------------
-- Table `afemr`.`openemr_postcalendar_limits`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`openemr_postcalendar_limits` (
  `pc_limitid` INT(11) NOT NULL AUTO_INCREMENT ,
  `pc_catid` INT(11) NOT NULL DEFAULT '0' ,
  `pc_starttime` TIME NOT NULL DEFAULT '00:00:00' ,
  `pc_endtime` TIME NOT NULL DEFAULT '00:00:00' ,
  `pc_limit` INT(11) NOT NULL DEFAULT '1' ,
  PRIMARY KEY (`pc_limitid`) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`openemr_postcalendar_topics`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`openemr_postcalendar_topics` (
  `pc_catid` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `pc_catname` VARCHAR(100) NULL DEFAULT NULL ,
  `pc_catcolor` VARCHAR(50) NULL DEFAULT NULL ,
  `pc_catdesc` TEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`pc_catid`) ,
  INDEX `basic_cat` (`pc_catname` ASC, `pc_catcolor` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`openemr_session_info`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`openemr_session_info` (
  `pn_sessid` VARCHAR(32) NOT NULL DEFAULT '' ,
  `pn_ipaddr` VARCHAR(20) NULL DEFAULT NULL ,
  `pn_firstused` INT(11) NOT NULL DEFAULT '0' ,
  `pn_lastused` INT(11) NOT NULL DEFAULT '0' ,
  `pn_uid` INT(11) NOT NULL DEFAULT '0' ,
  `pn_vars` BLOB NULL DEFAULT NULL ,
  PRIMARY KEY (`pn_sessid`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`patient_access_onsite`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`patient_access_onsite` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `pid` INT(11) NULL DEFAULT NULL ,
  `portal_username` VARCHAR(100) NULL DEFAULT NULL ,
  `portal_pwd` VARCHAR(100) NULL DEFAULT NULL ,
  `portal_pwd_status` TINYINT NULL DEFAULT '1' COMMENT '0=>Password Created Through Demographics by The provider or staff. Patient Should Change it at first time it.1=>Pwd updated or created by patient itself' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`pharmacies`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`pharmacies` (
  `id` INT(11) NOT NULL DEFAULT '0' ,
  `name` VARCHAR(255) NULL DEFAULT NULL ,
  `transmit_method` INT(11) NOT NULL DEFAULT '1' ,
  `email` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`patient_data`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`patient_data` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(255) NOT NULL DEFAULT '' ,
  `language` VARCHAR(255) NOT NULL DEFAULT '' ,
  `financial` VARCHAR(255) NOT NULL DEFAULT '' ,
  `fname` VARCHAR(255) NOT NULL DEFAULT '' ,
  `lname` VARCHAR(255) NOT NULL DEFAULT '' ,
  `mname` VARCHAR(255) NOT NULL DEFAULT '' ,
  `DOB` DATE NULL DEFAULT NULL ,
  `street` VARCHAR(255) NOT NULL DEFAULT '' ,
  `postal_code` VARCHAR(255) NOT NULL DEFAULT '' ,
  `city` VARCHAR(255) NOT NULL DEFAULT '' ,
  `state` VARCHAR(255) NOT NULL DEFAULT '' ,
  `country_code` VARCHAR(255) NOT NULL DEFAULT '' ,
  `drivers_license` VARCHAR(255) NOT NULL DEFAULT '' ,
  `ss` VARCHAR(255) NOT NULL DEFAULT '' ,
  `occupation` LONGTEXT NULL DEFAULT NULL ,
  `phone_home` VARCHAR(255) NOT NULL DEFAULT '' ,
  `phone_biz` VARCHAR(255) NOT NULL DEFAULT '' ,
  `phone_contact` VARCHAR(255) NOT NULL DEFAULT '' ,
  `phone_cell` VARCHAR(255) NOT NULL DEFAULT '' ,
  `pharmacy_id` INT(11) NOT NULL DEFAULT '0' ,
  `status` VARCHAR(255) NOT NULL DEFAULT '' ,
  `contact_relationship` VARCHAR(255) NOT NULL DEFAULT '' ,
  `date` DATETIME NULL DEFAULT NULL ,
  `sex` VARCHAR(255) NOT NULL DEFAULT '' ,
  `referrer` VARCHAR(255) NOT NULL DEFAULT '' ,
  `referrerID` VARCHAR(255) NOT NULL DEFAULT '' ,
  `providerID` INT(11) NULL DEFAULT NULL ,
  `email` VARCHAR(255) NOT NULL DEFAULT '' ,
  `ethnoracial` VARCHAR(255) NOT NULL DEFAULT '' ,
  `race` VARCHAR(255) NOT NULL DEFAULT '' ,
  `ethnicity` VARCHAR(255) NOT NULL DEFAULT '' ,
  `interpretter` VARCHAR(255) NOT NULL DEFAULT '' ,
  `migrantseasonal` VARCHAR(255) NOT NULL DEFAULT '' ,
  `family_size` VARCHAR(255) NOT NULL DEFAULT '' ,
  `monthly_income` VARCHAR(255) NOT NULL DEFAULT '' ,
  `homeless` VARCHAR(255) NOT NULL DEFAULT '' ,
  `financial_review` DATETIME NULL DEFAULT NULL ,
  `pubpid` VARCHAR(255) NOT NULL DEFAULT '' ,
  `pid` BIGINT(20) NOT NULL DEFAULT '0' ,
  `genericname1` VARCHAR(255) NOT NULL DEFAULT '' ,
  `genericval1` VARCHAR(255) NOT NULL DEFAULT '' ,
  `genericname2` VARCHAR(255) NOT NULL DEFAULT '' ,
  `genericval2` VARCHAR(255) NOT NULL DEFAULT '' ,
  `hipaa_mail` VARCHAR(3) NOT NULL DEFAULT '' ,
  `hipaa_voice` VARCHAR(3) NOT NULL DEFAULT '' ,
  `hipaa_notice` VARCHAR(3) NOT NULL DEFAULT '' ,
  `hipaa_message` VARCHAR(20) NOT NULL DEFAULT '' ,
  `hipaa_allowsms` VARCHAR(3) NOT NULL DEFAULT 'NO' ,
  `hipaa_allowemail` VARCHAR(3) NOT NULL DEFAULT 'NO' ,
  `squad` VARCHAR(32) NOT NULL DEFAULT '' ,
  `fitness` INT(11) NOT NULL DEFAULT '0' ,
  `referral_source` VARCHAR(30) NOT NULL DEFAULT '' ,
  `usertext1` VARCHAR(255) NOT NULL DEFAULT '' ,
  `usertext2` VARCHAR(255) NOT NULL DEFAULT '' ,
  `usertext3` VARCHAR(255) NOT NULL DEFAULT '' ,
  `usertext4` VARCHAR(255) NOT NULL DEFAULT '' ,
  `usertext5` VARCHAR(255) NOT NULL DEFAULT '' ,
  `usertext6` VARCHAR(255) NOT NULL DEFAULT '' ,
  `usertext7` VARCHAR(255) NOT NULL DEFAULT '' ,
  `usertext8` VARCHAR(255) NOT NULL DEFAULT '' ,
  `userlist1` VARCHAR(255) NOT NULL DEFAULT '' ,
  `userlist2` VARCHAR(255) NOT NULL DEFAULT '' ,
  `userlist3` VARCHAR(255) NOT NULL DEFAULT '' ,
  `userlist4` VARCHAR(255) NOT NULL DEFAULT '' ,
  `userlist5` VARCHAR(255) NOT NULL DEFAULT '' ,
  `userlist6` VARCHAR(255) NOT NULL DEFAULT '' ,
  `userlist7` VARCHAR(255) NOT NULL DEFAULT '' ,
  `pricelevel` VARCHAR(255) NOT NULL DEFAULT 'standard' ,
  `regdate` DATE NULL DEFAULT NULL COMMENT 'Registration Date' ,
  `contrastart` DATE NULL DEFAULT NULL COMMENT 'Date contraceptives initially used' ,
  `completed_ad` VARCHAR(3) NOT NULL DEFAULT 'NO' ,
  `ad_reviewed` DATE NULL DEFAULT NULL ,
  `vfc` VARCHAR(255) NOT NULL DEFAULT '' ,
  `mothersname` VARCHAR(255) NOT NULL DEFAULT '' ,
  `guardiansname` VARCHAR(255) NOT NULL DEFAULT '' ,
  `allow_imm_reg_use` VARCHAR(255) NOT NULL DEFAULT '' ,
  `allow_imm_info_share` VARCHAR(255) NOT NULL DEFAULT '' ,
  `allow_health_info_ex` VARCHAR(255) NOT NULL DEFAULT '' ,
  `allow_patient_portal` VARCHAR(31) NOT NULL DEFAULT '' ,
  `deceased_date` DATETIME NULL DEFAULT NULL ,
  `deceased_reason` VARCHAR(255) NOT NULL DEFAULT '' ,
  `soap_import_status` TINYINT(4) NULL DEFAULT NULL COMMENT '1-Prescription Press 2-Prescription Import 3-Allergy Press 4-Allergy Import' ,
  UNIQUE INDEX `pid` (`pid` ASC) ,
  INDEX `id` (`id` ASC) ,
  INDEX `patient_data_FK_1` (`pharmacy_id` ASC) ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `patient_data_FK_1`
    FOREIGN KEY (`pharmacy_id` )
    REFERENCES `afemr`.`pharmacies` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`patient_reminders`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`patient_reminders` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `active` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '1 if active and 0 if not active' ,
  `date_inactivated` DATETIME NULL DEFAULT NULL ,
  `reason_inactivated` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'Maps to list_options list rule_reminder_inactive_opt' ,
  `due_status` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'Maps to list_options list rule_reminder_due_opt' ,
  `pid` BIGINT(20) NOT NULL COMMENT 'id from patient_data table' ,
  `category` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'Maps to the category item in the rule_action_item table' ,
  `item` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'Maps to the item column in the rule_action_item table' ,
  `date_created` DATETIME NULL DEFAULT NULL ,
  `date_sent` DATETIME NULL DEFAULT NULL ,
  `voice_status` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0 if not sent and 1 if sent' ,
  `sms_status` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0 if not sent and 1 if sent' ,
  `email_status` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0 if not sent and 1 if sent' ,
  `mail_status` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0 if not sent and 1 if sent' ,
  PRIMARY KEY (`id`) ,
  INDEX `pid` (`pid` ASC) ,
  INDEX (`category` ASC, `item` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`patient_access_offsite`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`patient_access_offsite` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `pid` INT(11) NOT NULL ,
  `portal_username` VARCHAR(100) NOT NULL ,
  `portal_pwd` VARCHAR(100) NOT NULL ,
  `portal_pwd_status` TINYINT(4) NULL DEFAULT '1' COMMENT '0=>Password Created Through Demographics by The provider or staff. Patient Should Change it at first time it.1=>Pwd updated or created by patient itself' ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `pid` (`pid` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`payments`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`payments` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `pid` BIGINT(20) NOT NULL DEFAULT '0' ,
  `dtime` DATETIME NOT NULL ,
  `encounter` BIGINT(20) NOT NULL DEFAULT '0' ,
  `user` VARCHAR(255) NULL DEFAULT NULL ,
  `method` VARCHAR(255) NULL DEFAULT NULL ,
  `source` VARCHAR(255) NULL DEFAULT NULL ,
  `amount1` DECIMAL(12,2) NOT NULL DEFAULT '0.00' ,
  `amount2` DECIMAL(12,2) NOT NULL DEFAULT '0.00' ,
  `posted1` DECIMAL(12,2) NOT NULL DEFAULT '0.00' ,
  `posted2` DECIMAL(12,2) NOT NULL DEFAULT '0.00' ,
  PRIMARY KEY (`id`) ,
  INDEX `pid` (`pid` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`phone_numbers`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`phone_numbers` (
  `id` INT(11) NOT NULL DEFAULT '0' ,
  `country_code` VARCHAR(5) NULL DEFAULT NULL ,
  `area_code` CHAR(3) NULL DEFAULT NULL ,
  `prefix` CHAR(3) NULL DEFAULT NULL ,
  `number` VARCHAR(4) NULL DEFAULT NULL ,
  `type` INT(11) NULL DEFAULT NULL ,
  `foreign_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `foreign_id` (`foreign_id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`pma_bookmark`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`pma_bookmark` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `dbase` VARCHAR(255) NULL DEFAULT NULL ,
  `user` VARCHAR(255) NULL DEFAULT NULL ,
  `label` VARCHAR(255) NULL DEFAULT NULL ,
  `query` TEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 10, 
COMMENT = 'Bookmarks' ;


-- -----------------------------------------------------
-- Table `afemr`.`pma_column_info`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`pma_column_info` (
  `id` INT(5) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `db_name` VARCHAR(64) NULL DEFAULT NULL ,
  `table` VARCHAR(64) NULL DEFAULT NULL ,
  `column_name` VARCHAR(64) NULL DEFAULT NULL ,
  `comment` VARCHAR(255) NULL DEFAULT NULL ,
  `mimetype` VARCHAR(255) NULL DEFAULT NULL ,
  `transformation` VARCHAR(255) NULL DEFAULT NULL ,
  `transformation_options` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `db_name` (`db_name` ASC, `table` ASC, `column_name` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 1, 
COMMENT = 'Column Information for phpMyAdmin' ;


-- -----------------------------------------------------
-- Table `afemr`.`pma_history`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`pma_history` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `username` VARCHAR(64) NULL DEFAULT NULL ,
  `db` VARCHAR(64) NULL DEFAULT NULL ,
  `table` VARCHAR(64) NULL DEFAULT NULL ,
  `timevalue` TIMESTAMP NOT NULL ,
  `sqlquery` TEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `username` (`username` ASC, `db` ASC, `table` ASC, `timevalue` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 1, 
COMMENT = 'SQL history' ;


-- -----------------------------------------------------
-- Table `afemr`.`pma_pdf_pages`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`pma_pdf_pages` (
  `db_name` VARCHAR(64) NULL DEFAULT NULL ,
  `page_nr` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `page_descr` VARCHAR(50) NULL DEFAULT NULL ,
  PRIMARY KEY (`page_nr`) ,
  INDEX `db_name` (`db_name` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 1, 
COMMENT = 'PDF Relationpages for PMA' ;


-- -----------------------------------------------------
-- Table `afemr`.`pma_relation`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`pma_relation` (
  `master_db` VARCHAR(64) NOT NULL DEFAULT '' ,
  `master_table` VARCHAR(64) NOT NULL DEFAULT '' ,
  `master_field` VARCHAR(64) NOT NULL DEFAULT '' ,
  `foreign_db` VARCHAR(64) NULL DEFAULT NULL ,
  `foreign_table` VARCHAR(64) NULL DEFAULT NULL ,
  `foreign_field` VARCHAR(64) NULL DEFAULT NULL ,
  PRIMARY KEY (`master_db`, `master_table`, `master_field`) ,
  INDEX `foreign_field` (`foreign_db` ASC, `foreign_table` ASC) )
ENGINE = InnoDB, 
COMMENT = 'Relation table' ;


-- -----------------------------------------------------
-- Table `afemr`.`pma_table_coords`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`pma_table_coords` (
  `db_name` VARCHAR(64) NOT NULL DEFAULT '' ,
  `table` VARCHAR(64) NOT NULL DEFAULT '' ,
  `pdf_page_number` INT(11) NOT NULL DEFAULT '0' ,
  `x` FLOAT UNSIGNED NOT NULL DEFAULT '0' ,
  `y` FLOAT UNSIGNED NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`db_name`, `table`, `pdf_page_number`) )
ENGINE = InnoDB, 
COMMENT = 'Table coordinates for phpMyAdmin PDF output' ;


-- -----------------------------------------------------
-- Table `afemr`.`pma_table_info`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`pma_table_info` (
  `db_name` VARCHAR(64) NOT NULL DEFAULT '' ,
  `table` VARCHAR(64) NOT NULL DEFAULT '' ,
  `display_field` VARCHAR(64) NULL DEFAULT NULL ,
  PRIMARY KEY (`db_name`, `table`) )
ENGINE = InnoDB, 
COMMENT = 'Table information for phpMyAdmin' ;


-- -----------------------------------------------------
-- Table `afemr`.`pnotes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`pnotes` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `date` DATETIME NULL DEFAULT NULL ,
  `body` LONGTEXT NULL DEFAULT NULL ,
  `pid` BIGINT(20) NULL DEFAULT NULL ,
  `user` VARCHAR(255) NULL DEFAULT NULL ,
  `groupname` VARCHAR(255) NULL DEFAULT NULL ,
  `activity` TINYINT(4) NULL DEFAULT NULL ,
  `authorized` TINYINT(4) NULL DEFAULT NULL ,
  `title` VARCHAR(255) NULL DEFAULT NULL ,
  `assigned_to` VARCHAR(255) NULL DEFAULT NULL ,
  `deleted` TINYINT(4) NULL DEFAULT 0 COMMENT 'flag indicates note is deleted' ,
  `message_status` VARCHAR(20) NOT NULL DEFAULT 'New' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`prescriptions`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`prescriptions` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `patient_id` INT(11) NULL DEFAULT NULL ,
  `filled_by_id` INT(11) NULL DEFAULT NULL ,
  `pharmacy_id` INT(11) NULL DEFAULT NULL ,
  `date_added` DATE NULL DEFAULT NULL ,
  `date_modified` DATE NULL DEFAULT NULL ,
  `provider_id` INT(11) NULL DEFAULT NULL ,
  `encounter` INT(11) NULL DEFAULT NULL ,
  `start_date` DATE NULL DEFAULT NULL ,
  `drug` VARCHAR(150) NULL DEFAULT NULL ,
  `drug_id` INT(11) NOT NULL DEFAULT '0' ,
  `rxnorm_drugcode` INT(11) NULL DEFAULT NULL ,
  `form` INT(3) NULL DEFAULT NULL ,
  `dosage` VARCHAR(100) NULL DEFAULT NULL ,
  `quantity` VARCHAR(31) NULL DEFAULT NULL ,
  `size` FLOAT UNSIGNED NULL DEFAULT NULL ,
  `unit` INT(11) NULL DEFAULT NULL ,
  `route` INT(11) NULL DEFAULT NULL ,
  `interval` INT(11) NULL DEFAULT NULL ,
  `substitute` INT(11) NULL DEFAULT NULL ,
  `refills` INT(11) NULL DEFAULT NULL ,
  `per_refill` INT(11) NULL DEFAULT NULL ,
  `filled_date` DATE NULL DEFAULT NULL ,
  `medication` INT(11) NULL DEFAULT NULL ,
  `note` TEXT NULL DEFAULT NULL ,
  `active` INT(11) NOT NULL DEFAULT '1' ,
  `datetime` DATETIME NULL DEFAULT NULL ,
  `user` VARCHAR(50) NULL DEFAULT NULL ,
  `site` VARCHAR(50) NULL DEFAULT NULL ,
  `prescriptionguid` VARCHAR(50) NULL DEFAULT NULL ,
  `erx_source` TINYINT(4) NOT NULL DEFAULT '0' COMMENT '0-OpenEMR 1-External' ,
  `erx_uploaded` TINYINT(4) NOT NULL DEFAULT '0' COMMENT '0-Pending NewCrop upload 1-Uploaded to NewCrop' ,
  PRIMARY KEY (`id`) ,
  INDEX `prescriptions_FK_1` (`drug_id` ASC) ,
  CONSTRAINT `prescriptions_FK_1`
    FOREIGN KEY (`drug_id` )
    REFERENCES `afemr`.`drugs` (`drug_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`prices`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`prices` (
  `pr_id` VARCHAR(11) NOT NULL DEFAULT '' ,
  `pr_selector` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'template selector for drugs, empty for codes' ,
  `pr_level` VARCHAR(31) NOT NULL DEFAULT '' ,
  `pr_price` DECIMAL(12,2) NOT NULL DEFAULT '0.00' COMMENT 'price in local currency' ,
  PRIMARY KEY (`pr_id`, `pr_selector`, `pr_level`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`registry`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`registry` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NULL DEFAULT NULL ,
  `state` TINYINT(4) NULL DEFAULT NULL ,
  `directory` VARCHAR(255) NULL DEFAULT NULL ,
  `sql_run` TINYINT(4) NULL DEFAULT NULL ,
  `unpackaged` TINYINT(4) NULL DEFAULT NULL ,
  `date` DATETIME NULL DEFAULT NULL ,
  `priority` INT(11) NULL DEFAULT '0' ,
  `category` VARCHAR(255) NULL DEFAULT NULL ,
  `nickname` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 16;


-- -----------------------------------------------------
-- Table `afemr`.`rule_action`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`rule_action` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(31) NOT NULL COMMENT 'Maps to the id column in the clinical_rules table' ,
  `group_id` BIGINT(20) NOT NULL DEFAULT 1 COMMENT 'Contains group id to identify collection of targets in a rule' ,
  `category` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'Maps to the category item in the rule_action_item table' ,
  `item` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'Maps to the item column in the rule_action_item table' ,
  INDEX (`name` ASC) ,
  INDEX `rule_action_FK_1` (`group_id` ASC) ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `rule_action_FK_1`
    FOREIGN KEY (`group_id` )
    REFERENCES `afemr`.`groups` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`rule_action_item`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`rule_action_item` (
  `category` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'Maps to list_options list rule_action_category' ,
  `item` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'Maps to list_options list rule_action' ,
  `clin_rem_link` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Custom html link in clinical reminder widget' ,
  `reminder_message` TEXT NOT NULL COMMENT 'Custom message in patient reminder' ,
  `custom_flag` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '1 indexed to rule_patient_data, 0 indexed within main schema' ,
  PRIMARY KEY (`category`, `item`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`rule_filter`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`rule_filter` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'Maps to the id column in the clinical_rules table' ,
  `include_flag` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0 is exclude and 1 is include' ,
  `required_flag` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0 is required and 1 is optional' ,
  `method` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'Maps to list_options list rule_filters' ,
  `method_detail` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'Maps to list_options lists rule__intervals' ,
  `value` VARCHAR(255) NOT NULL DEFAULT '' ,
  INDEX (`name` ASC) ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`rule_patient_data`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`rule_patient_data` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `date` DATETIME NULL DEFAULT NULL ,
  `pid` BIGINT(20) NOT NULL ,
  `category` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'Maps to the category item in the rule_action_item table' ,
  `item` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'Maps to the item column in the rule_action_item table' ,
  `complete` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'Maps to list_options list yesno' ,
  `result` VARCHAR(255) NOT NULL DEFAULT '' ,
  INDEX (`pid` ASC) ,
  INDEX (`category` ASC, `item` ASC) ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`rule_reminder`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`rule_reminder` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'Maps to the id column in the clinical_rules table' ,
  `method` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'Maps to list_options list rule_reminder_methods' ,
  `method_detail` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'Maps to list_options list rule_reminder_intervals' ,
  `value` VARCHAR(255) NOT NULL DEFAULT '' ,
  INDEX (`name` ASC) ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`rule_target`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`rule_target` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'Maps to the id column in the clinical_rules table' ,
  `group_id` BIGINT(20) NOT NULL DEFAULT 1 COMMENT 'Contains group id to identify collection of targets in a rule' ,
  `include_flag` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0 is exclude and 1 is include' ,
  `required_flag` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0 is required and 1 is optional' ,
  `method` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'Maps to list_options list rule_targets' ,
  `value` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Data is dependent on the method' ,
  `interval` BIGINT(20) NOT NULL DEFAULT 0 COMMENT 'Only used in interval entries' ,
  INDEX (`name` ASC) ,
  INDEX `rule_target_FK_1` (`group_id` ASC) ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `rule_target_FK_1`
    FOREIGN KEY (`group_id` )
    REFERENCES `afemr`.`groups` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`sequences`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`sequences` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`transactions`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`transactions` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `date` DATETIME NULL DEFAULT NULL ,
  `title` VARCHAR(255) NOT NULL DEFAULT '' ,
  `body` LONGTEXT NOT NULL ,
  `pid` BIGINT(20) NULL DEFAULT NULL ,
  `user` VARCHAR(255) NOT NULL DEFAULT '' ,
  `groupname` VARCHAR(255) NOT NULL DEFAULT '' ,
  `authorized` TINYINT(4) NULL DEFAULT NULL ,
  `refer_date` DATE NULL ,
  `refer_from` INT(11) NOT NULL DEFAULT 0 ,
  `refer_to` INT(11) NOT NULL DEFAULT 0 ,
  `refer_diag` VARCHAR(255) NOT NULL DEFAULT '' ,
  `refer_risk_level` VARCHAR(255) NOT NULL DEFAULT '' ,
  `refer_vitals` TINYINT(1) NOT NULL DEFAULT 0 ,
  `refer_external` TINYINT(1) NOT NULL DEFAULT 0 ,
  `refer_related_code` VARCHAR(255) NOT NULL DEFAULT '' ,
  `refer_reply_date` DATE NULL ,
  `reply_date` DATE NULL ,
  `reply_from` VARCHAR(255) NOT NULL DEFAULT '' ,
  `reply_init_diag` VARCHAR(255) NOT NULL DEFAULT '' ,
  `reply_final_diag` VARCHAR(255) NOT NULL DEFAULT '' ,
  `reply_documents` VARCHAR(255) NOT NULL DEFAULT '' ,
  `reply_findings` TEXT NOT NULL ,
  `reply_services` TEXT NOT NULL ,
  `reply_recommend` TEXT NOT NULL ,
  `reply_rx_refer` TEXT NOT NULL ,
  `reply_related_code` VARCHAR(255) NOT NULL DEFAULT '' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`user_settings`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`user_settings` (
  `setting_user` BIGINT(20) NOT NULL DEFAULT 0 ,
  `setting_label` VARCHAR(63) NOT NULL ,
  `setting_value` VARCHAR(255) NOT NULL DEFAULT '' ,
  PRIMARY KEY (`setting_user`, `setting_label`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`x12_partners`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`x12_partners` (
  `id` INT(11) NOT NULL DEFAULT '0' ,
  `name` VARCHAR(255) NULL DEFAULT NULL ,
  `id_number` VARCHAR(255) NULL DEFAULT NULL ,
  `x12_sender_id` VARCHAR(255) NULL DEFAULT NULL ,
  `x12_receiver_id` VARCHAR(255) NULL DEFAULT NULL ,
  `x12_version` VARCHAR(255) NULL DEFAULT NULL ,
  `processing_format` ENUM('standard','medi-cal','cms','proxymed') NULL DEFAULT NULL ,
  `x12_isa05` CHAR(2) NOT NULL DEFAULT 'ZZ' ,
  `x12_isa07` CHAR(2) NOT NULL DEFAULT 'ZZ' ,
  `x12_isa14` CHAR(1) NOT NULL DEFAULT '0' ,
  `x12_isa15` CHAR(1) NOT NULL DEFAULT 'P' ,
  `x12_gs02` VARCHAR(15) NOT NULL DEFAULT '' ,
  `x12_per06` VARCHAR(80) NOT NULL DEFAULT '' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`automatic_notification`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`automatic_notification` (
  `notification_id` INT(5) NOT NULL AUTO_INCREMENT ,
  `sms_gateway_type` VARCHAR(255) NOT NULL ,
  `next_app_date` DATE NOT NULL ,
  `next_app_time` VARCHAR(10) NOT NULL ,
  `provider_name` VARCHAR(100) NOT NULL ,
  `message` TEXT NOT NULL ,
  `email_sender` VARCHAR(100) NOT NULL ,
  `email_subject` VARCHAR(100) NOT NULL ,
  `type` VARCHAR(64) NOT NULL DEFAULT 'SMS' ,
  `notification_sent_date` DATETIME NOT NULL ,
  PRIMARY KEY (`notification_id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3;


-- -----------------------------------------------------
-- Table `afemr`.`notification_log`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`notification_log` (
  `iLogId` INT(11) NOT NULL AUTO_INCREMENT ,
  `pid` INT(7) NOT NULL ,
  `pc_eid` INT(11) UNSIGNED NULL DEFAULT NULL ,
  `sms_gateway_type` VARCHAR(50) NOT NULL ,
  `smsgateway_info` VARCHAR(255) NOT NULL ,
  `message` TEXT NOT NULL ,
  `email_sender` VARCHAR(255) NOT NULL ,
  `email_subject` VARCHAR(255) NOT NULL ,
  `type` ENUM('SMS','Email') NOT NULL ,
  `patient_info` TEXT NOT NULL ,
  `pc_eventDate` DATE NOT NULL ,
  `pc_endDate` DATE NOT NULL ,
  `pc_startTime` TIME NOT NULL ,
  `pc_endTime` TIME NOT NULL ,
  `dSentDateTime` DATETIME NOT NULL ,
  PRIMARY KEY (`iLogId`) )
ENGINE = InnoDB
AUTO_INCREMENT = 5;


-- -----------------------------------------------------
-- Table `afemr`.`notification_settings`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`notification_settings` (
  `SettingsId` INT(3) NOT NULL AUTO_INCREMENT ,
  `Send_SMS_Before_Hours` INT(3) NOT NULL ,
  `Send_Email_Before_Hours` INT(3) NOT NULL ,
  `SMS_gateway_username` VARCHAR(100) NOT NULL ,
  `SMS_gateway_password` VARCHAR(100) NOT NULL ,
  `SMS_gateway_apikey` VARCHAR(100) NOT NULL ,
  `type` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`SettingsId`) )
ENGINE = InnoDB
AUTO_INCREMENT = 2;


-- -----------------------------------------------------
-- Table `afemr`.`chart_tracker`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`chart_tracker` (
  `ct_pid` INT(11) NOT NULL ,
  `ct_when` DATETIME NOT NULL ,
  `ct_userid` BIGINT(20) NOT NULL DEFAULT 0 ,
  `ct_location` VARCHAR(31) NOT NULL DEFAULT '' ,
  PRIMARY KEY (`ct_pid`, `ct_when`) ,
  INDEX `chart_tracker_FK_1` (`ct_userid` ASC) ,
  CONSTRAINT `chart_tracker_FK_1`
    FOREIGN KEY (`ct_userid` )
    REFERENCES `afemr`.`users` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`ar_session`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`ar_session` (
  `session_id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `payer_id` INT(11) NOT NULL COMMENT '0=pt else references insurance_companies.id' ,
  `user_id` INT(11) NOT NULL COMMENT 'references users.id for session owner' ,
  `closed` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0=no, 1=yes' ,
  `reference` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'check or EOB number' ,
  `check_date` DATE NULL DEFAULT NULL ,
  `deposit_date` DATE NULL DEFAULT NULL ,
  `pay_total` DECIMAL(12,2) NOT NULL DEFAULT 0 ,
  `created_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `modified_time` DATETIME NOT NULL ,
  `global_amount` DECIMAL(12,2) NOT NULL ,
  `payment_type` VARCHAR(50) NOT NULL ,
  `description` TEXT NOT NULL ,
  `adjustment_code` VARCHAR(50) NOT NULL ,
  `post_to_date` DATE NOT NULL ,
  `patient_id` INT(11) NOT NULL ,
  `payment_method` VARCHAR(25) NOT NULL ,
  PRIMARY KEY (`session_id`) ,
  INDEX `user_closed` (`user_id` ASC, `closed` ASC) ,
  INDEX `deposit_date` (`deposit_date` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`ar_activity`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`ar_activity` (
  `pid` INT(11) NOT NULL ,
  `encounter` INT(11) NOT NULL ,
  `sequence_no` INT UNSIGNED NOT NULL ,
  `code` VARCHAR(9) NOT NULL COMMENT 'empty means claim level' ,
  `modifier` VARCHAR(5) NOT NULL DEFAULT '' ,
  `payer_type` INT NOT NULL COMMENT '0=pt, 1=ins1, 2=ins2, etc' ,
  `post_time` DATETIME NOT NULL ,
  `post_user` INT(11) NOT NULL COMMENT 'references users.id' ,
  `session_id` INT UNSIGNED NOT NULL COMMENT 'references ar_session.session_id' ,
  `memo` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'adjustment reasons go here' ,
  `pay_amount` DECIMAL(12,2) NOT NULL DEFAULT 0 COMMENT 'either pay or adj will always be 0' ,
  `adj_amount` DECIMAL(12,2) NOT NULL DEFAULT 0 ,
  `modified_time` DATETIME NOT NULL ,
  `follow_up` CHAR(1) NOT NULL ,
  `follow_up_note` TEXT NOT NULL ,
  `account_code` VARCHAR(15) NOT NULL ,
  `reason_code` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Use as needed to show the primary payer adjustment reason code' ,
  PRIMARY KEY (`pid`, `encounter`, `sequence_no`) ,
  INDEX `session_id` (`session_id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`users_facility`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`users_facility` (
  `tablename` VARCHAR(64) NOT NULL ,
  `table_id` INT(11) NOT NULL ,
  `facility_id` INT(11) NOT NULL ,
  PRIMARY KEY (`tablename`, `table_id`, `facility_id`) ,
  INDEX `users_facility_FK_1` (`facility_id` ASC) ,
  CONSTRAINT `users_facility_FK_1`
    FOREIGN KEY (`facility_id` )
    REFERENCES `afemr`.`facility` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB, 
COMMENT = 'joins users or patient_data to facility table' ;


-- -----------------------------------------------------
-- Table `afemr`.`lbf_data`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`lbf_data` (
  `form_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'references forms.form_id' ,
  `field_id` VARCHAR(31) NOT NULL COMMENT 'references layout_options.field_id' ,
  `field_value` TEXT NOT NULL ,
  PRIMARY KEY (`form_id`, `field_id`) )
ENGINE = InnoDB, 
COMMENT = 'contains all data from layout-based forms' ;


-- -----------------------------------------------------
-- Table `afemr`.`gprelations`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`gprelations` (
  `type1` INT(2) NOT NULL ,
  `id1` BIGINT(20) NOT NULL ,
  `type2` INT(2) NOT NULL ,
  `id2` BIGINT(20) NOT NULL ,
  PRIMARY KEY (`type1`, `id1`, `type2`, `id2`) ,
  INDEX `key2` (`type2` ASC, `id2` ASC) )
ENGINE = InnoDB, 
COMMENT = 'general purpose relations' ;


-- -----------------------------------------------------
-- Table `afemr`.`procedure_type`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`procedure_type` (
  `procedure_type_id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `parent` BIGINT(20) NOT NULL DEFAULT 0 COMMENT 'references procedure_type.procedure_type_id' ,
  `name` VARCHAR(63) NOT NULL DEFAULT '' COMMENT 'name for this category, procedure or result type' ,
  `lab_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT 'references users.id, 0 means default to parent' ,
  `procedure_code` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'code identifying this procedure' ,
  `procedure_type` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'see list proc_type' ,
  `body_site` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'where to do injection, e.g. arm, buttok' ,
  `specimen` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'blood, urine, saliva, etc.' ,
  `route_admin` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'oral, injection' ,
  `laterality` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'left, right, ...' ,
  `description` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'descriptive text for procedure_code' ,
  `standard_code` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'industry standard code type and code (e.g. CPT4:12345)' ,
  `related_code` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'suggested code(s) for followup services if result is abnormal' ,
  `units` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'default for procedure_result.units' ,
  `range` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'default for procedure_result.range' ,
  `seq` INT(11) NOT NULL DEFAULT 0 COMMENT 'sequence number for ordering' ,
  PRIMARY KEY (`procedure_type_id`) ,
  INDEX `parent` (`parent` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`procedure_order`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`procedure_order` (
  `procedure_order_id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `procedure_type_id` BIGINT(20) NOT NULL COMMENT 'references procedure_type.procedure_type_id' ,
  `provider_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT 'references users.id' ,
  `patient_id` BIGINT(20) NOT NULL COMMENT 'references patient_data.pid' ,
  `encounter_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT 'references form_encounter.encounter' ,
  `date_collected` DATETIME NULL DEFAULT NULL COMMENT 'time specimen collected' ,
  `date_ordered` DATE NULL DEFAULT NULL ,
  `order_priority` VARCHAR(31) NOT NULL DEFAULT '' ,
  `order_status` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'pending,routed,complete,canceled' ,
  `patient_instructions` TEXT NOT NULL ,
  `activity` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '0 if deleted' ,
  `control_id` BIGINT(20) NOT NULL COMMENT 'This is the CONTROL ID that is sent back from lab' ,
  PRIMARY KEY (`procedure_order_id`) ,
  INDEX `datepid` (`date_ordered` ASC, `patient_id` ASC) ,
  INDEX `procedure_order_FK_1` (`procedure_type_id` ASC) ,
  CONSTRAINT `procedure_order_FK_1`
    FOREIGN KEY (`procedure_type_id` )
    REFERENCES `afemr`.`procedure_type` (`procedure_type_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`procedure_report`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`procedure_report` (
  `procedure_report_id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `procedure_order_id` BIGINT(20) NULL DEFAULT NULL COMMENT 'references procedure_order.procedure_order_id' ,
  `date_collected` DATETIME NULL DEFAULT NULL ,
  `date_report` DATE NULL DEFAULT NULL ,
  `source` BIGINT(20) NOT NULL DEFAULT 0 COMMENT 'references users.id, who entered this data' ,
  `specimen_num` VARCHAR(63) NOT NULL DEFAULT '' ,
  `report_status` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'received,complete,error' ,
  `review_status` VARCHAR(31) NOT NULL DEFAULT 'received' COMMENT 'panding reivew status: received,reviewed' ,
  PRIMARY KEY (`procedure_report_id`) ,
  INDEX `procedure_order_id` (`procedure_order_id` ASC) ,
  INDEX `procedure_report_FK_1` (`procedure_order_id` ASC) ,
  CONSTRAINT `procedure_report_FK_1`
    FOREIGN KEY (`procedure_order_id` )
    REFERENCES `afemr`.`procedure_order` (`procedure_order_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`procedure_result`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`procedure_result` (
  `procedure_result_id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `procedure_report_id` BIGINT(20) NOT NULL COMMENT 'references procedure_report.procedure_report_id' ,
  `procedure_type_id` BIGINT(20) NOT NULL COMMENT 'references procedure_type.procedure_type_id' ,
  `date` DATETIME NULL COMMENT 'lab-provided date specific to this result' ,
  `facility` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'lab-provided testing facility ID' ,
  `units` VARCHAR(31) NOT NULL DEFAULT '' ,
  `result` VARCHAR(255) NOT NULL DEFAULT '' ,
  `range` VARCHAR(255) NOT NULL DEFAULT '' ,
  `abnormal` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'no,yes,high,low' ,
  `comments` TEXT NOT NULL COMMENT 'comments from the lab' ,
  `document_id` BIGINT(20) NOT NULL DEFAULT 0 COMMENT 'references documents.id if this result is a document' ,
  `result_status` VARCHAR(31) NOT NULL DEFAULT '' COMMENT 'preliminary, cannot be done, final, corrected, incompete...etc.' ,
  PRIMARY KEY (`procedure_result_id`) ,
  INDEX `procedure_report_id` (`procedure_report_id` ASC) ,
  INDEX `procedure_result_FK_1` (`procedure_report_id` ASC) ,
  INDEX `procedure_result_FK_2` (`procedure_type_id` ASC) ,
  CONSTRAINT `procedure_result_FK_1`
    FOREIGN KEY (`procedure_report_id` )
    REFERENCES `afemr`.`procedure_report` (`procedure_report_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `procedure_result_FK_2`
    FOREIGN KEY (`procedure_type_id` )
    REFERENCES `afemr`.`procedure_type` (`procedure_type_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`globals`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`globals` (
  `gl_name` VARCHAR(63) NOT NULL ,
  `gl_index` INT(11) NOT NULL DEFAULT 0 ,
  `gl_value` VARCHAR(255) NOT NULL DEFAULT '' ,
  PRIMARY KEY (`gl_name`, `gl_index`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`code_types`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`code_types` (
  `ct_key` VARCHAR(15) NOT NULL COMMENT 'short alphanumeric name' ,
  `ct_id` INT(11) NOT NULL COMMENT 'numeric identifier' ,
  `ct_seq` INT(11) NOT NULL DEFAULT 0 COMMENT 'sort order' ,
  `ct_mod` INT(11) NOT NULL DEFAULT 0 COMMENT 'length of modifier field' ,
  `ct_just` VARCHAR(15) NOT NULL DEFAULT '' COMMENT 'ct_key of justify type, if any' ,
  `ct_mask` VARCHAR(9) NOT NULL DEFAULT '' COMMENT 'formatting mask for code values' ,
  `ct_fee` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '1 if fees are used' ,
  `ct_rel` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '1 if can relate to other code types' ,
  `ct_nofs` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '1 if to be hidden in the fee sheet' ,
  `ct_diag` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '1 if this is a diagnosis type' ,
  UNIQUE INDEX (`ct_id` ASC) ,
  PRIMARY KEY (`ct_key`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`extended_log`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`extended_log` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `date` DATETIME NULL DEFAULT NULL ,
  `event` VARCHAR(255) NULL DEFAULT NULL ,
  `user` VARCHAR(255) NULL DEFAULT NULL ,
  `recipient` VARCHAR(255) NULL DEFAULT NULL ,
  `description` LONGTEXT NULL DEFAULT NULL ,
  `patient_id` BIGINT(20) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`version`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`version` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `v_major` INT(11) NOT NULL DEFAULT 0 ,
  `v_minor` INT(11) NOT NULL DEFAULT 0 ,
  `v_patch` INT(11) NOT NULL DEFAULT 0 ,
  `v_tag` VARCHAR(31) NOT NULL DEFAULT '' ,
  `v_database` INT(11) NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afemr`.`customlists`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`customlists` (
  `cl_list_slno` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `cl_list_id` INT(10) UNSIGNED NOT NULL COMMENT 'ID OF THE lIST FOR NEW TAKE SELECT MAX(cl_list_id)+1' ,
  `cl_list_item_id` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'ID OF THE lIST FOR NEW TAKE SELECT MAX(cl_list_item_id)+1' ,
  `cl_list_type` INT(10) UNSIGNED NOT NULL COMMENT '0=>List Name 1=>list items 2=>Context 3=>Template 4=>Sentence 5=> SavedTemplate 6=>CustomButton' ,
  `cl_list_item_short` VARCHAR(10) NULL DEFAULT NULL ,
  `cl_list_item_long` TEXT NOT NULL ,
  `cl_list_item_level` INT(11) NULL DEFAULT NULL COMMENT 'Flow level for List Designation' ,
  `cl_order` INT(11) NULL DEFAULT NULL ,
  `cl_deleted` TINYINT(1) NULL DEFAULT '0' ,
  `cl_creator` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`cl_list_slno`) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `afemr`.`template_users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `afemr`.`template_users` (
  `tu_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `tu_user_id` INT(11) NULL DEFAULT NULL ,
  `tu_facility_id` INT(11) NULL DEFAULT NULL ,
  `tu_template_id` INT(11) NULL DEFAULT NULL ,
  `tu_template_order` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`tu_id`) ,
  UNIQUE INDEX `templateuser` (`tu_user_id` ASC, `tu_template_id` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
