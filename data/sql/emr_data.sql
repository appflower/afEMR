-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 07, 2011 at 09:12 PM
-- Server version: 5.1.57
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `emr`
--

--
-- Dumping data for table `addresses`
--


--
-- Dumping data for table `amc_misc_data`
--


--
-- Dumping data for table `ar_activity`
--


--
-- Dumping data for table `ar_session`
--


--
-- Dumping data for table `audit_details`
--


--
-- Dumping data for table `audit_master`
--


--
-- Dumping data for table `automatic_notification`
--

INSERT INTO `automatic_notification` (`notification_id`, `sms_gateway_type`, `next_app_date`, `next_app_time`, `provider_name`, `message`, `email_sender`, `email_subject`, `type`, `notification_sent_date`) VALUES
(1, 'CLICKATELL', '0000-00-00', ':', 'EMR GROUP 1 .. SMS', 'Welcome to EMR GROUP 1.. SMS', '', '', 'SMS', '0000-00-00 00:00:00'),
(2, '', '2007-10-02', '05:50', 'EMR GROUP', 'Welcome to EMR GROUP . Email', 'EMR Group', 'Welcome to EMR GROUP', 'Email', '2007-09-30 00:00:00');

--
-- Dumping data for table `batchcom`
--


--
-- Dumping data for table `billing`
--


--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `value`, `parent`, `lft`, `rght`) VALUES
(1, 'Categories', '', 0, 0, 23),
(2, 'Lab Report', '', 1, 1, 2),
(3, 'Medical Record', '', 1, 3, 4),
(4, 'Patient Information', '', 1, 5, 10),
(5, 'Patient ID card', '', 4, 6, 7),
(6, 'Advance Directive', '', 1, 11, 18),
(7, 'Do Not Resuscitate Order', '', 6, 12, 13),
(8, 'Durable Power of Attorney', '', 6, 14, 15),
(9, 'Living Will', '', 6, 16, 17),
(10, 'Patient Photograph', '', 4, 8, 9),
(11, 'CCR', '', 1, 19, 20),
(12, 'CCD', '', 1, 21, 22);

--
-- Dumping data for table `categories_seq`
--

INSERT INTO `categories_seq` (`id`) VALUES
(12);

--
-- Dumping data for table `categories_to_documents`
--


--
-- Dumping data for table `chart_tracker`
--


--
-- Dumping data for table `claims`
--


--
-- Dumping data for table `clinical_plans`
--

INSERT INTO `clinical_plans` (`id`, `pid`, `normal_flag`, `cqm_flag`, `cqm_measure_group`) VALUES
('dm_plan_cqm', 0, 0, 1, 'A'),
('ckd_plan_cqm', 0, 0, 1, 'C'),
('prevent_plan_cqm', 0, 0, 1, 'D'),
('periop_plan_cqm', 0, 0, 1, 'E'),
('rheum_arth_plan_cqm', 0, 0, 1, 'F'),
('back_pain_plan_cqm', 0, 0, 1, 'G'),
('cabg_plan_cqm', 0, 0, 1, 'H'),
('dm_plan', 0, 1, 0, ''),
('prevent_plan', 0, 1, 0, '');

--
-- Dumping data for table `clinical_rules`
--

INSERT INTO `clinical_rules` (`id`, `pid`, `active_alert_flag`, `passive_alert_flag`, `cqm_flag`, `cqm_nqf_code`, `cqm_pqri_code`, `amc_flag`, `amc_code`, `patient_reminder_flag`) VALUES
('problem_list_amc', 0, 0, 0, 0, '', '', 1, '170.302(c)', 0),
('med_list_amc', 0, 0, 0, 0, '', '', 1, '170.302(d)', 0),
('med_allergy_list_amc', 0, 0, 0, 0, '', '', 1, '170.302(e)', 0),
('record_vitals_amc', 0, 0, 0, 0, '', '', 1, '170.302(f)', 0),
('record_smoke_amc', 0, 0, 0, 0, '', '', 1, '170.302(g)', 0),
('lab_result_amc', 0, 0, 0, 0, '', '', 1, '170.302(h)', 0),
('med_reconc_amc', 0, 0, 0, 0, '', '', 1, '170.302(j)', 0),
('patient_edu_amc', 0, 0, 0, 0, '', '', 1, '170.302(m)', 0),
('cpoe_med_amc', 0, 0, 0, 0, '', '', 1, '170.304(a)', 0),
('e_prescribe_amc', 0, 0, 0, 0, '', '', 1, '170.304(b)', 0),
('record_dem_amc', 0, 0, 0, 0, '', '', 1, '170.304(c)', 0),
('send_reminder_amc', 0, 0, 0, 0, '', '', 1, '170.304(d)', 0),
('provide_rec_pat_amc', 0, 0, 0, 0, '', '', 1, '170.304(f)', 0),
('timely_access_amc', 0, 0, 0, 0, '', '', 1, '170.304(g)', 0),
('provide_sum_pat_amc', 0, 0, 0, 0, '', '', 1, '170.304(h)', 0),
('send_sum_amc', 0, 0, 0, 0, '', '', 1, '170.304(i)', 0),
('rule_htn_bp_measure_cqm', 0, 0, 0, 1, '0013', '', 0, '', 0),
('rule_tob_use_assess_cqm', 0, 0, 0, 1, '0028a', '', 0, '', 0),
('rule_tob_cess_inter_cqm', 0, 0, 0, 1, '0028b', '', 0, '', 0),
('rule_adult_wt_screen_fu_cqm', 0, 0, 0, 1, '0421', '128', 0, '', 0),
('rule_wt_assess_couns_child_cqm', 0, 0, 0, 1, '0024', '', 0, '', 0),
('rule_influenza_ge_50_cqm', 0, 0, 0, 1, '0041', '110', 0, '', 0),
('rule_child_immun_stat_cqm', 0, 0, 0, 1, '0038', '', 0, '', 0),
('rule_pneumovacc_ge_65_cqm', 0, 0, 0, 1, '0043', '111', 0, '', 0),
('rule_dm_eye_cqm', 0, 0, 0, 1, '0055', '117', 0, '', 0),
('rule_dm_foot_cqm', 0, 0, 0, 1, '0056', '163', 0, '', 0),
('rule_dm_a1c_cqm', 0, 0, 0, 1, '0059', '1', 0, '', 0),
('rule_dm_bp_control_cqm', 0, 0, 0, 1, '0061', '3', 0, '', 0),
('rule_dm_ldl_cqm', 0, 0, 0, 1, '0064', '2', 0, '', 0),
('rule_htn_bp_measure', 0, 0, 1, 0, '', '', 0, '', 0),
('rule_tob_use_assess', 0, 0, 1, 0, '', '', 0, '', 0),
('rule_tob_cess_inter', 0, 0, 1, 0, '', '', 0, '', 0),
('rule_adult_wt_screen_fu', 0, 0, 1, 0, '', '', 0, '', 0),
('rule_wt_assess_couns_child', 0, 0, 1, 0, '', '', 0, '', 0),
('rule_influenza_ge_50', 0, 0, 1, 0, '', '', 0, '', 0),
('rule_pneumovacc_ge_65', 0, 0, 1, 0, '', '', 0, '', 0),
('rule_dm_hemo_a1c', 0, 0, 1, 0, '', '', 0, '', 0),
('rule_dm_urine_alb', 0, 0, 1, 0, '', '', 0, '', 0),
('rule_dm_eye', 0, 0, 1, 0, '', '', 0, '', 0),
('rule_dm_foot', 0, 0, 1, 0, '', '', 0, '', 0),
('rule_cs_mammo', 0, 0, 1, 0, '', '', 0, '', 0),
('rule_cs_pap', 0, 0, 1, 0, '', '', 0, '', 0),
('rule_cs_colon', 0, 0, 1, 0, '', '', 0, '', 0),
('rule_cs_prostate', 0, 0, 1, 0, '', '', 0, '', 0),
('rule_inr_monitor', 0, 0, 1, 0, '', '', 0, '', 0);


--
-- Dumping data for table `clinical_plans_rules`
--

INSERT INTO `clinical_plans_rules` (`plan_id`, `rule_id`) VALUES
('dm_plan', 'rule_dm_eye'),
('dm_plan', 'rule_dm_foot'),
('dm_plan', 'rule_dm_hemo_a1c'),
('dm_plan', 'rule_dm_urine_alb'),
('dm_plan_cqm', 'rule_dm_a1c_cqm'),
('dm_plan_cqm', 'rule_dm_bp_control_cqm'),
('dm_plan_cqm', 'rule_dm_eye_cqm'),
('dm_plan_cqm', 'rule_dm_foot_cqm'),
('dm_plan_cqm', 'rule_dm_ldl_cqm'),
('prevent_plan', 'rule_adult_wt_screen_fu'),
('prevent_plan', 'rule_cs_colon'),
('prevent_plan', 'rule_cs_mammo'),
('prevent_plan', 'rule_cs_pap'),
('prevent_plan', 'rule_cs_prostate'),
('prevent_plan', 'rule_htn_bp_measure'),
('prevent_plan', 'rule_influenza_ge_50'),
('prevent_plan', 'rule_pneumovacc_ge_65'),
('prevent_plan', 'rule_tob_cess_inter'),
('prevent_plan', 'rule_tob_use_assess'),
('prevent_plan', 'rule_wt_assess_couns_child'),
('prevent_plan_cqm', 'rule_adult_wt_screen_fu_cqm'),
('prevent_plan_cqm', 'rule_influenza_ge_50_cqm'),
('prevent_plan_cqm', 'rule_pneumovacc_ge_65_cqm');

--
-- Dumping data for table `codes`
--


--
-- Dumping data for table `code_types`
--

INSERT INTO `code_types` (`ct_key`, `ct_id`, `ct_seq`, `ct_mod`, `ct_just`, `ct_mask`, `ct_fee`, `ct_rel`, `ct_nofs`, `ct_diag`) VALUES
('ICD9', 2, 1, 2, '', '', 0, 0, 0, 1),
('CPT4', 1, 2, 2, 'ICD9', '', 1, 0, 0, 0),
('HCPCS', 3, 3, 2, 'ICD9', '', 1, 0, 0, 0),
('CVX', 100, 100, 0, '', '', 0, 0, 1, 0);

--
-- Dumping data for table `config`
--


--
-- Dumping data for table `config_seq`
--

INSERT INTO `config_seq` (`id`) VALUES
(0);

--
-- Dumping data for table `customlists`
--

INSERT INTO `customlists` (`cl_list_slno`, `cl_list_id`, `cl_list_item_id`, `cl_list_type`, `cl_list_item_short`, `cl_list_item_long`, `cl_list_item_level`, `cl_order`, `cl_deleted`, `cl_creator`) VALUES
(1, 1, NULL, 2, NULL, 'Subjective', NULL, NULL, 0, NULL),
(2, 2, NULL, 2, NULL, 'Objective', NULL, NULL, 0, NULL),
(3, 3, NULL, 2, NULL, 'Assessment', NULL, NULL, 0, NULL),
(4, 4, NULL, 2, NULL, 'Plan', NULL, NULL, 0, NULL);

--
-- Dumping data for table `documents`
--


--
-- Dumping data for table `documents_legal_categories`
--

INSERT INTO `documents_legal_categories` (`dlc_id`, `dlc_category_type`, `dlc_category_name`, `dlc_category_parent`) VALUES
(3, 1, 'Category', NULL),
(4, 2, 'Sub Category', 1),
(5, 1, 'Layout Form', 0),
(6, 2, 'Layout Signed', 5);

--
-- Dumping data for table `documents_legal_detail`
--


--
-- Dumping data for table `documents_legal_master`
--


--
-- Dumping data for table `drugs`
--


--
-- Dumping data for table `drug_inventory`
--


--
-- Dumping data for table `drug_sales`
--


--
-- Dumping data for table `drug_templates`
--


--
-- Dumping data for table `eligibility_response`
--


--
-- Dumping data for table `eligibility_verification`
--


--
-- Dumping data for table `employer_data`
--


--
-- Dumping data for table `enc_category_map`
--

INSERT INTO `enc_category_map` (`rule_enc_id`, `main_cat_id`) VALUES
('enc_acute_inp_or_ed', 5),
('enc_acute_inp_or_ed', 9),
('enc_acute_inp_or_ed', 10),
('enc_hea_and_beh', 5),
('enc_hea_and_beh', 9),
('enc_hea_and_beh', 10),
('enc_influenza', 5),
('enc_influenza', 9),
('enc_influenza', 10),
('enc_nonac_inp_out_or_opth', 5),
('enc_nonac_inp_out_or_opth', 9),
('enc_nonac_inp_out_or_opth', 10),
('enc_nurs_discharge', 5),
('enc_nurs_discharge', 9),
('enc_nurs_discharge', 10),
('enc_nurs_fac', 5),
('enc_nurs_fac', 9),
('enc_nurs_fac', 10),
('enc_occ_ther', 5),
('enc_occ_ther', 9),
('enc_occ_ther', 10),
('enc_off_vis', 5),
('enc_off_vis', 9),
('enc_off_vis', 10),
('enc_outpatient', 5),
('enc_outpatient', 9),
('enc_outpatient', 10),
('enc_out_pcp_obgyn', 5),
('enc_out_pcp_obgyn', 9),
('enc_out_pcp_obgyn', 10),
('enc_pregnancy', 5),
('enc_pregnancy', 9),
('enc_pregnancy', 10),
('enc_pre_ind_counsel', 5),
('enc_pre_ind_counsel', 9),
('enc_pre_ind_counsel', 10),
('enc_pre_med_group_counsel', 5),
('enc_pre_med_group_counsel', 9),
('enc_pre_med_group_counsel', 10),
('enc_pre_med_other_serv', 5),
('enc_pre_med_other_serv', 9),
('enc_pre_med_other_serv', 10),
('enc_pre_med_ser_18_older', 5),
('enc_pre_med_ser_18_older', 9),
('enc_pre_med_ser_18_older', 10),
('enc_pre_med_ser_40_older', 5),
('enc_pre_med_ser_40_older', 9),
('enc_pre_med_ser_40_older', 10),
('enc_psych_and_psych', 5),
('enc_psych_and_psych', 9),
('enc_psych_and_psych', 10);

--
-- Dumping data for table `extended_log`
--


--
-- Dumping data for table `facility`
--

INSERT INTO `facility` (`id`, `name`, `phone`, `fax`, `street`, `city`, `state`, `postal_code`, `country_code`, `federal_ein`, `service_location`, `billing_location`, `accepts_assignment`, `pos_code`, `x12_sender_id`, `attn`, `domain_identifier`, `facility_npi`, `tax_id_type`, `color`, `primary_business_entity`) VALUES
(3, 'Your Clinic Name Here', '000-000-0000', '000-000-0000', '', '', '', '', '', '', 1, 1, 0, NULL, '', '', '', '', '', '#99FFFF', 0);

--
-- Dumping data for table `fee_sheet_options`
--

INSERT INTO `fee_sheet_options` (`fs_category`, `fs_option`, `fs_codes`) VALUES
('1New Patient', '1Brief', 'CPT4|99201|'),
('1New Patient', '2Limited', 'CPT4|99202|'),
('1New Patient', '3Detailed', 'CPT4|99203|'),
('1New Patient', '4Extended', 'CPT4|99204|'),
('1New Patient', '5Comprehensive', 'CPT4|99205|'),
('2Established Patient', '1Brief', 'CPT4|99211|'),
('2Established Patient', '2Limited', 'CPT4|99212|'),
('2Established Patient', '3Detailed', 'CPT4|99213|'),
('2Established Patient', '4Extended', 'CPT4|99214|'),
('2Established Patient', '5Comprehensive', 'CPT4|99215|');

--
-- Dumping data for table `forms`
--


--
-- Dumping data for table `form_dictation`
--


--
-- Dumping data for table `form_encounter`
--


--
-- Dumping data for table `form_misc_billing_options`
--


--
-- Dumping data for table `form_reviewofs`
--


--
-- Dumping data for table `form_ros`
--


--
-- Dumping data for table `form_soap`
--


--
-- Dumping data for table `form_vitals`
--


--
-- Dumping data for table `geo_country_reference`
--

INSERT INTO `geo_country_reference` (`countries_id`, `countries_name`, `countries_iso_code_2`, `countries_iso_code_3`) VALUES
(1, 'Afghanistan', 'AF', 'AFG'),
(2, 'Albania', 'AL', 'ALB'),
(3, 'Algeria', 'DZ', 'DZA'),
(4, 'American Samoa', 'AS', 'ASM'),
(5, 'Andorra', 'AD', 'AND'),
(6, 'Angola', 'AO', 'AGO'),
(7, 'Anguilla', 'AI', 'AIA'),
(8, 'Antarctica', 'AQ', 'ATA'),
(9, 'Antigua and Barbuda', 'AG', 'ATG'),
(10, 'Argentina', 'AR', 'ARG'),
(11, 'Armenia', 'AM', 'ARM'),
(12, 'Aruba', 'AW', 'ABW'),
(13, 'Australia', 'AU', 'AUS'),
(14, 'Austria', 'AT', 'AUT'),
(15, 'Azerbaijan', 'AZ', 'AZE'),
(16, 'Bahamas', 'BS', 'BHS'),
(17, 'Bahrain', 'BH', 'BHR'),
(18, 'Bangladesh', 'BD', 'BGD'),
(19, 'Barbados', 'BB', 'BRB'),
(20, 'Belarus', 'BY', 'BLR'),
(21, 'Belgium', 'BE', 'BEL'),
(22, 'Belize', 'BZ', 'BLZ'),
(23, 'Benin', 'BJ', 'BEN'),
(24, 'Bermuda', 'BM', 'BMU'),
(25, 'Bhutan', 'BT', 'BTN'),
(26, 'Bolivia', 'BO', 'BOL'),
(27, 'Bosnia and Herzegowina', 'BA', 'BIH'),
(28, 'Botswana', 'BW', 'BWA'),
(29, 'Bouvet Island', 'BV', 'BVT'),
(30, 'Brazil', 'BR', 'BRA'),
(31, 'British Indian Ocean Territory', 'IO', 'IOT'),
(32, 'Brunei Darussalam', 'BN', 'BRN'),
(33, 'Bulgaria', 'BG', 'BGR'),
(34, 'Burkina Faso', 'BF', 'BFA'),
(35, 'Burundi', 'BI', 'BDI'),
(36, 'Cambodia', 'KH', 'KHM'),
(37, 'Cameroon', 'CM', 'CMR'),
(38, 'Canada', 'CA', 'CAN'),
(39, 'Cape Verde', 'CV', 'CPV'),
(40, 'Cayman Islands', 'KY', 'CYM'),
(41, 'Central African Republic', 'CF', 'CAF'),
(42, 'Chad', 'TD', 'TCD'),
(43, 'Chile', 'CL', 'CHL'),
(44, 'China', 'CN', 'CHN'),
(45, 'Christmas Island', 'CX', 'CXR'),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK'),
(47, 'Colombia', 'CO', 'COL'),
(48, 'Comoros', 'KM', 'COM'),
(49, 'Congo', 'CG', 'COG'),
(50, 'Cook Islands', 'CK', 'COK'),
(51, 'Costa Rica', 'CR', 'CRI'),
(52, 'Cote D Ivoire', 'CI', 'CIV'),
(53, 'Croatia', 'HR', 'HRV'),
(54, 'Cuba', 'CU', 'CUB'),
(55, 'Cyprus', 'CY', 'CYP'),
(56, 'Czech Republic', 'CZ', 'CZE'),
(57, 'Denmark', 'DK', 'DNK'),
(58, 'Djibouti', 'DJ', 'DJI'),
(59, 'Dominica', 'DM', 'DMA'),
(60, 'Dominican Republic', 'DO', 'DOM'),
(61, 'East Timor', 'TP', 'TMP'),
(62, 'Ecuador', 'EC', 'ECU'),
(63, 'Egypt', 'EG', 'EGY'),
(64, 'El Salvador', 'SV', 'SLV'),
(65, 'Equatorial Guinea', 'GQ', 'GNQ'),
(66, 'Eritrea', 'ER', 'ERI'),
(67, 'Estonia', 'EE', 'EST'),
(68, 'Ethiopia', 'ET', 'ETH'),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK'),
(70, 'Faroe Islands', 'FO', 'FRO'),
(71, 'Fiji', 'FJ', 'FJI'),
(72, 'Finland', 'FI', 'FIN'),
(73, 'France', 'FR', 'FRA'),
(74, 'France, MEtropolitan', 'FX', 'FXX'),
(75, 'French Guiana', 'GF', 'GUF'),
(76, 'French Polynesia', 'PF', 'PYF'),
(77, 'French Southern Territories', 'TF', 'ATF'),
(78, 'Gabon', 'GA', 'GAB'),
(79, 'Gambia', 'GM', 'GMB'),
(80, 'Georgia', 'GE', 'GEO'),
(81, 'Germany', 'DE', 'DEU'),
(82, 'Ghana', 'GH', 'GHA'),
(83, 'Gibraltar', 'GI', 'GIB'),
(84, 'Greece', 'GR', 'GRC'),
(85, 'Greenland', 'GL', 'GRL'),
(86, 'Grenada', 'GD', 'GRD'),
(87, 'Guadeloupe', 'GP', 'GLP'),
(88, 'Guam', 'GU', 'GUM'),
(89, 'Guatemala', 'GT', 'GTM'),
(90, 'Guinea', 'GN', 'GIN'),
(91, 'Guinea-bissau', 'GW', 'GNB'),
(92, 'Guyana', 'GY', 'GUY'),
(93, 'Haiti', 'HT', 'HTI'),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD'),
(95, 'Honduras', 'HN', 'HND'),
(96, 'Hong Kong', 'HK', 'HKG'),
(97, 'Hungary', 'HU', 'HUN'),
(98, 'Iceland', 'IS', 'ISL'),
(99, 'India', 'IN', 'IND'),
(100, 'Indonesia', 'ID', 'IDN'),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN'),
(102, 'Iraq', 'IQ', 'IRQ'),
(103, 'Ireland', 'IE', 'IRL'),
(104, 'Israel', 'IL', 'ISR'),
(105, 'Italy', 'IT', 'ITA'),
(106, 'Jamaica', 'JM', 'JAM'),
(107, 'Japan', 'JP', 'JPN'),
(108, 'Jordan', 'JO', 'JOR'),
(109, 'Kazakhstan', 'KZ', 'KAZ'),
(110, 'Kenya', 'KE', 'KEN'),
(111, 'Kiribati', 'KI', 'KIR'),
(112, 'Korea, Democratic Peoples Republic of', 'KP', 'PRK'),
(113, 'Korea, Republic of', 'KR', 'KOR'),
(114, 'Kuwait', 'KW', 'KWT'),
(115, 'Kyrgyzstan', 'KG', 'KGZ'),
(116, 'Lao Peoples Democratic Republic', 'LA', 'LAO'),
(117, 'Latvia', 'LV', 'LVA'),
(118, 'Lebanon', 'LB', 'LBN'),
(119, 'Lesotho', 'LS', 'LSO'),
(120, 'Liberia', 'LR', 'LBR'),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY'),
(122, 'Liechtenstein', 'LI', 'LIE'),
(123, 'Lithuania', 'LT', 'LTU'),
(124, 'Luxembourg', 'LU', 'LUX'),
(125, 'Macau', 'MO', 'MAC'),
(126, 'Macedonia, The Former Yugoslav Republic of', 'MK', 'MKD'),
(127, 'Madagascar', 'MG', 'MDG'),
(128, 'Malawi', 'MW', 'MWI'),
(129, 'Malaysia', 'MY', 'MYS'),
(130, 'Maldives', 'MV', 'MDV'),
(131, 'Mali', 'ML', 'MLI'),
(132, 'Malta', 'MT', 'MLT'),
(133, 'Marshall Islands', 'MH', 'MHL'),
(134, 'Martinique', 'MQ', 'MTQ'),
(135, 'Mauritania', 'MR', 'MRT'),
(136, 'Mauritius', 'MU', 'MUS'),
(137, 'Mayotte', 'YT', 'MYT'),
(138, 'Mexico', 'MX', 'MEX'),
(139, 'Micronesia, Federated States of', 'FM', 'FSM'),
(140, 'Moldova, Republic of', 'MD', 'MDA'),
(141, 'Monaco', 'MC', 'MCO'),
(142, 'Mongolia', 'MN', 'MNG'),
(143, 'Montserrat', 'MS', 'MSR'),
(144, 'Morocco', 'MA', 'MAR'),
(145, 'Mozambique', 'MZ', 'MOZ'),
(146, 'Myanmar', 'MM', 'MMR'),
(147, 'Namibia', 'NA', 'NAM'),
(148, 'Nauru', 'NR', 'NRU'),
(149, 'Nepal', 'NP', 'NPL'),
(150, 'Netherlands', 'NL', 'NLD'),
(151, 'Netherlands Antilles', 'AN', 'ANT'),
(152, 'New Caledonia', 'NC', 'NCL'),
(153, 'New Zealand', 'NZ', 'NZL'),
(154, 'Nicaragua', 'NI', 'NIC'),
(155, 'Niger', 'NE', 'NER'),
(156, 'Nigeria', 'NG', 'NGA'),
(157, 'Niue', 'NU', 'NIU'),
(158, 'Norfolk Island', 'NF', 'NFK'),
(159, 'Northern Mariana Islands', 'MP', 'MNP'),
(160, 'Norway', 'NO', 'NOR'),
(161, 'Oman', 'OM', 'OMN'),
(162, 'Pakistan', 'PK', 'PAK'),
(163, 'Palau', 'PW', 'PLW'),
(164, 'Panama', 'PA', 'PAN'),
(165, 'Papua New Guinea', 'PG', 'PNG'),
(166, 'Paraguay', 'PY', 'PRY'),
(167, 'Peru', 'PE', 'PER'),
(168, 'Philippines', 'PH', 'PHL'),
(169, 'Pitcairn', 'PN', 'PCN'),
(170, 'Poland', 'PL', 'POL'),
(171, 'Portugal', 'PT', 'PRT'),
(172, 'Puerto Rico', 'PR', 'PRI'),
(173, 'Qatar', 'QA', 'QAT'),
(174, 'Reunion', 'RE', 'REU'),
(175, 'Romania', 'RO', 'ROM'),
(176, 'Russian Federation', 'RU', 'RUS'),
(177, 'Rwanda', 'RW', 'RWA'),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA'),
(179, 'Saint Lucia', 'LC', 'LCA'),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT'),
(181, 'Samoa', 'WS', 'WSM'),
(182, 'San Marino', 'SM', 'SMR'),
(183, 'Sao Tome and Principe', 'ST', 'STP'),
(184, 'Saudi Arabia', 'SA', 'SAU'),
(185, 'Senegal', 'SN', 'SEN'),
(186, 'Seychelles', 'SC', 'SYC'),
(187, 'Sierra Leone', 'SL', 'SLE'),
(188, 'Singapore', 'SG', 'SGP'),
(189, 'Slovakia (Slovak Republic)', 'SK', 'SVK'),
(190, 'Slovenia', 'SI', 'SVN'),
(191, 'Solomon Islands', 'SB', 'SLB'),
(192, 'Somalia', 'SO', 'SOM'),
(193, 'south Africa', 'ZA', 'ZAF'),
(194, 'South Georgia and the South Sandwich Islands', 'GS', 'SGS'),
(195, 'Spain', 'ES', 'ESP'),
(196, 'Sri Lanka', 'LK', 'LKA'),
(197, 'St. Helena', 'SH', 'SHN'),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM'),
(199, 'Sudan', 'SD', 'SDN'),
(200, 'Suriname', 'SR', 'SUR'),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM'),
(202, 'Swaziland', 'SZ', 'SWZ'),
(203, 'Sweden', 'SE', 'SWE'),
(204, 'Switzerland', 'CH', 'CHE'),
(205, 'Syrian Arab Republic', 'SY', 'SYR'),
(206, 'Taiwan, Province of China', 'TW', 'TWN'),
(207, 'Tajikistan', 'TJ', 'TJK'),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA'),
(209, 'Thailand', 'TH', 'THA'),
(210, 'Togo', 'TG', 'TGO'),
(211, 'Tokelau', 'TK', 'TKL'),
(212, 'Tonga', 'TO', 'TON'),
(213, 'Trinidad and Tobago', 'TT', 'TTO'),
(214, 'Tunisia', 'TN', 'TUN'),
(215, 'Turkey', 'TR', 'TUR'),
(216, 'Turkmenistan', 'TM', 'TKM'),
(217, 'Turks and Caicos Islands', 'TC', 'TCA'),
(218, 'Tuvalu', 'TV', 'TUV'),
(219, 'Uganda', 'UG', 'UGA'),
(220, 'Ukraine', 'UA', 'UKR'),
(221, 'United Arab Emirates', 'AE', 'ARE'),
(222, 'United Kingdom', 'GB', 'GBR'),
(223, 'United States', 'US', 'USA'),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI'),
(225, 'Uruguay', 'UY', 'URY'),
(226, 'Uzbekistan', 'UZ', 'UZB'),
(227, 'Vanuatu', 'VU', 'VUT'),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT'),
(229, 'Venezuela', 'VE', 'VEN'),
(230, 'Viet Nam', 'VN', 'VNM'),
(231, 'Virgin Islands (British)', 'VG', 'VGB'),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR'),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF'),
(234, 'Western Sahara', 'EH', 'ESH'),
(235, 'Yemen', 'YE', 'YEM'),
(236, 'Yugoslavia', 'YU', 'YUG'),
(237, 'Zaire', 'ZR', 'ZAR'),
(238, 'Zambia', 'ZM', 'ZMB'),
(239, 'Zimbabwe', 'ZW', 'ZWE');

--
-- Dumping data for table `geo_zone_reference`
--

INSERT INTO `geo_zone_reference` (`zone_id`, `zone_country_id`, `zone_code`, `zone_name`) VALUES
(1, 223, 'AL', 'Alabama'),
(2, 223, 'AK', 'Alaska'),
(3, 223, 'AS', 'American Samoa'),
(4, 223, 'AZ', 'Arizona'),
(5, 223, 'AR', 'Arkansas'),
(6, 223, 'AF', 'Armed Forces Africa'),
(7, 223, 'AA', 'Armed Forces Americas'),
(8, 223, 'AC', 'Armed Forces Canada'),
(9, 223, 'AE', 'Armed Forces Europe'),
(10, 223, 'AM', 'Armed Forces Middle East'),
(11, 223, 'AP', 'Armed Forces Pacific'),
(12, 223, 'CA', 'California'),
(13, 223, 'CO', 'Colorado'),
(14, 223, 'CT', 'Connecticut'),
(15, 223, 'DE', 'Delaware'),
(16, 223, 'DC', 'District of Columbia'),
(17, 223, 'FM', 'Federated States Of Micronesia'),
(18, 223, 'FL', 'Florida'),
(19, 223, 'GA', 'Georgia'),
(20, 223, 'GU', 'Guam'),
(21, 223, 'HI', 'Hawaii'),
(22, 223, 'ID', 'Idaho'),
(23, 223, 'IL', 'Illinois'),
(24, 223, 'IN', 'Indiana'),
(25, 223, 'IA', 'Iowa'),
(26, 223, 'KS', 'Kansas'),
(27, 223, 'KY', 'Kentucky'),
(28, 223, 'LA', 'Louisiana'),
(29, 223, 'ME', 'Maine'),
(30, 223, 'MH', 'Marshall Islands'),
(31, 223, 'MD', 'Maryland'),
(32, 223, 'MA', 'Massachusetts'),
(33, 223, 'MI', 'Michigan'),
(34, 223, 'MN', 'Minnesota'),
(35, 223, 'MS', 'Mississippi'),
(36, 223, 'MO', 'Missouri'),
(37, 223, 'MT', 'Montana'),
(38, 223, 'NE', 'Nebraska'),
(39, 223, 'NV', 'Nevada'),
(40, 223, 'NH', 'New Hampshire'),
(41, 223, 'NJ', 'New Jersey'),
(42, 223, 'NM', 'New Mexico'),
(43, 223, 'NY', 'New York'),
(44, 223, 'NC', 'North Carolina'),
(45, 223, 'ND', 'North Dakota'),
(46, 223, 'MP', 'Northern Mariana Islands'),
(47, 223, 'OH', 'Ohio'),
(48, 223, 'OK', 'Oklahoma'),
(49, 223, 'OR', 'Oregon'),
(50, 223, 'PW', 'Palau'),
(51, 223, 'PA', 'Pennsylvania'),
(52, 223, 'PR', 'Puerto Rico'),
(53, 223, 'RI', 'Rhode Island'),
(54, 223, 'SC', 'South Carolina'),
(55, 223, 'SD', 'South Dakota'),
(56, 223, 'TN', 'Tenessee'),
(57, 223, 'TX', 'Texas'),
(58, 223, 'UT', 'Utah'),
(59, 223, 'VT', 'Vermont'),
(60, 223, 'VI', 'Virgin Islands'),
(61, 223, 'VA', 'Virginia'),
(62, 223, 'WA', 'Washington'),
(63, 223, 'WV', 'West Virginia'),
(64, 223, 'WI', 'Wisconsin'),
(65, 223, 'WY', 'Wyoming'),
(66, 38, 'AB', 'Alberta'),
(67, 38, 'BC', 'British Columbia'),
(68, 38, 'MB', 'Manitoba'),
(69, 38, 'NF', 'Newfoundland'),
(70, 38, 'NB', 'New Brunswick'),
(71, 38, 'NS', 'Nova Scotia'),
(72, 38, 'NT', 'Northwest Territories'),
(73, 38, 'NU', 'Nunavut'),
(74, 38, 'ON', 'Ontario'),
(75, 38, 'PE', 'Prince Edward Island'),
(76, 38, 'QC', 'Quebec'),
(77, 38, 'SK', 'Saskatchewan'),
(78, 38, 'YT', 'Yukon Territory'),
(79, 61, 'QLD', 'Queensland'),
(80, 61, 'SA', 'South Australia'),
(81, 61, 'ACT', 'Australian Capital Territory'),
(82, 61, 'VIC', 'Victoria');

--
-- Dumping data for table `globals`
--


--
-- Dumping data for table `gprelations`
--


--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`name`) VALUES
('test_1'),
('test_2'),
('test_3'),
('test_4'),
('test_5');



--
-- Dumping data for table `history_data`
--


--
-- Dumping data for table `immunizations`
--


--
-- Dumping data for table `insurance_companies`
--


--
-- Dumping data for table `insurance_data`
--


--
-- Dumping data for table `insurance_numbers`
--


--
-- Dumping data for table `integration_mapping`
--


--
-- Dumping data for table `issue_encounter`
--


--
-- Dumping data for table `lang_constants`
--


--
-- Dumping data for table `lang_custom`
--


--
-- Dumping data for table `lang_definitions`
--


--
-- Dumping data for table `lang_languages`
--

INSERT INTO `lang_languages` (`lang_id`, `lang_code`, `lang_description`) VALUES
(1, 'en', 'English');

--
-- Dumping data for table `layout_options`
--

INSERT INTO `layout_options` (`form_id`, `field_id`, `group_name`, `title`, `seq`, `data_type`, `uor`, `fld_length`, `max_length`, `list_id`, `titlecols`, `datacols`, `default_value`, `edit_options`, `description`) VALUES
('DEM', 'title', '1Who', 'Name', 1, 1, 1, 0, 0, 'titles', 1, 1, '', 'N', 'Title'),
('DEM', 'fname', '1Who', '', 2, 2, 2, 10, 63, '', 0, 0, '', 'CD', 'First Name'),
('DEM', 'mname', '1Who', '', 3, 2, 1, 2, 63, '', 0, 0, '', 'C', 'Middle Name'),
('DEM', 'lname', '1Who', '', 4, 2, 2, 10, 63, '', 0, 0, '', 'CD', 'Last Name'),
('DEM', 'pubpid', '1Who', 'External ID', 5, 2, 1, 10, 15, '', 1, 1, '', 'ND', 'External identifier'),
('DEM', 'DOB', '1Who', 'DOB', 6, 4, 2, 10, 10, '', 1, 1, '', 'D', 'Date of Birth'),
('DEM', 'sex', '1Who', 'Sex', 7, 1, 2, 0, 0, 'sex', 1, 1, '', 'N', 'Sex'),
('DEM', 'ss', '1Who', 'S.S.', 8, 2, 1, 11, 11, '', 1, 1, '', '', 'Social Security Number'),
('DEM', 'drivers_license', '1Who', 'License/ID', 9, 2, 1, 15, 63, '', 1, 1, '', '', 'Drivers License or State ID'),
('DEM', 'status', '1Who', 'Marital Status', 10, 1, 1, 0, 0, 'marital', 1, 3, '', '', 'Marital Status'),
('DEM', 'genericname1', '1Who', 'User Defined', 11, 2, 1, 15, 63, '', 1, 3, '', '', 'User Defined Field'),
('DEM', 'genericval1', '1Who', '', 12, 2, 1, 15, 63, '', 0, 0, '', '', 'User Defined Field'),
('DEM', 'genericname2', '1Who', '', 13, 2, 1, 15, 63, '', 0, 0, '', '', 'User Defined Field'),
('DEM', 'genericval2', '1Who', '', 14, 2, 1, 15, 63, '', 0, 0, '', '', 'User Defined Field'),
('DEM', 'squad', '1Who', 'Squad', 15, 13, 0, 0, 0, '', 1, 3, '', '', 'Squad Membership'),
('DEM', 'pricelevel', '1Who', 'Price Level', 16, 1, 0, 0, 0, 'pricelevel', 1, 1, '', '', 'Discount Level'),
('DEM', 'street', '2Contact', 'Address', 1, 2, 1, 25, 63, '', 1, 1, '', 'C', 'Street and Number'),
('DEM', 'city', '2Contact', 'City', 2, 2, 1, 15, 63, '', 1, 1, '', 'C', 'City Name'),
('DEM', 'state', '2Contact', 'State', 3, 26, 1, 0, 0, 'state', 1, 1, '', '', 'State/Locality'),
('DEM', 'postal_code', '2Contact', 'Postal Code', 4, 2, 1, 6, 63, '', 1, 1, '', '', 'Postal Code'),
('DEM', 'country_code', '2Contact', 'Country', 5, 26, 1, 0, 0, 'country', 1, 1, '', '', 'Country'),
('DEM', 'mothersname', '2Contact', 'Mother''s Name', 6, 2, 1, 20, 63, '', 1, 1, '', '', ''),
('DEM', 'guardiansname', '2Contact', 'Guardian''s Name', 7, 2, 1, 20, 63, '', 1, 1, '', '', ''),
('DEM', 'contact_relationship', '2Contact', 'Emergency Contact', 8, 2, 1, 10, 63, '', 1, 1, '', 'C', 'Emergency Contact Person'),
('DEM', 'phone_contact', '2Contact', 'Emergency Phone', 9, 2, 1, 20, 63, '', 1, 1, '', 'P', 'Emergency Contact Phone Number'),
('DEM', 'phone_home', '2Contact', 'Home Phone', 10, 2, 1, 20, 63, '', 1, 1, '', 'P', 'Home Phone Number'),
('DEM', 'phone_biz', '2Contact', 'Work Phone', 11, 2, 1, 20, 63, '', 1, 1, '', 'P', 'Work Phone Number'),
('DEM', 'phone_cell', '2Contact', 'Mobile Phone', 12, 2, 1, 20, 63, '', 1, 1, '', 'P', 'Cell Phone Number'),
('DEM', 'email', '2Contact', 'Contact Email', 13, 2, 1, 30, 95, '', 1, 1, '', '', 'Contact Email Address'),
('DEM', 'providerID', '3Choices', 'Provider', 1, 11, 1, 0, 0, '', 1, 3, '', '', 'Referring Provider'),
('DEM', 'pharmacy_id', '3Choices', 'Pharmacy', 2, 12, 1, 0, 0, '', 1, 3, '', '', 'Preferred Pharmacy'),
('DEM', 'hipaa_notice', '3Choices', 'HIPAA Notice Received', 3, 1, 1, 0, 0, 'yesno', 1, 1, '', '', 'Did you receive a copy of the HIPAA Notice?'),
('DEM', 'hipaa_voice', '3Choices', 'Allow Voice Message', 4, 1, 1, 0, 0, 'yesno', 1, 1, '', '', 'Allow telephone messages?'),
('DEM', 'hipaa_message', '3Choices', 'Leave Message With', 5, 2, 1, 20, 63, '', 1, 1, '', '', 'With whom may we leave a message?'),
('DEM', 'hipaa_mail', '3Choices', 'Allow Mail Message', 6, 1, 1, 0, 0, 'yesno', 1, 1, '', '', 'Allow email messages?'),
('DEM', 'hipaa_allowsms', '3Choices', 'Allow SMS', 7, 1, 1, 0, 0, 'yesno', 1, 1, '', '', 'Allow SMS (text messages)?'),
('DEM', 'hipaa_allowemail', '3Choices', 'Allow Email', 8, 1, 1, 0, 0, 'yesno', 1, 1, '', '', 'Allow Email?'),
('DEM', 'allow_imm_reg_use', '3Choices', 'Allow Immunization Registry Use', 9, 1, 1, 0, 0, 'yesno', 1, 1, '', '', ''),
('DEM', 'allow_imm_info_share', '3Choices', 'Allow Immunization Info Sharing', 10, 1, 1, 0, 0, 'yesno', 1, 1, '', '', ''),
('DEM', 'allow_health_info_ex', '3Choices', 'Allow Health Information Exchange', 11, 1, 1, 0, 0, 'yesno', 1, 1, '', '', ''),
('DEM', 'allow_patient_portal', '3Choices', 'Allow Patient Portal', 12, 1, 1, 0, 0, 'yesno', 1, 1, '', '', ''),
('DEM', 'occupation', '4Employer', 'Occupation', 1, 2, 1, 20, 63, '', 1, 1, '', 'C', 'Occupation'),
('DEM', 'em_name', '4Employer', 'Employer Name', 2, 2, 1, 20, 63, '', 1, 1, '', 'C', 'Employer Name'),
('DEM', 'em_street', '4Employer', 'Employer Address', 3, 2, 1, 25, 63, '', 1, 1, '', 'C', 'Street and Number'),
('DEM', 'em_city', '4Employer', 'City', 4, 2, 1, 15, 63, '', 1, 1, '', 'C', 'City Name'),
('DEM', 'em_state', '4Employer', 'State', 5, 26, 1, 0, 0, 'state', 1, 1, '', '', 'State/Locality'),
('DEM', 'em_postal_code', '4Employer', 'Postal Code', 6, 2, 1, 6, 63, '', 1, 1, '', '', 'Postal Code'),
('DEM', 'em_country', '4Employer', 'Country', 7, 26, 1, 0, 0, 'country', 1, 1, '', '', 'Country'),
('DEM', 'language', '5Stats', 'Language', 1, 26, 1, 0, 0, 'language', 1, 1, '', '', 'Preferred Language'),
('DEM', 'ethnicity', '5Stats', 'Ethnicity', 2, 33, 1, 0, 0, 'ethnicity', 1, 1, '', '', 'Ethnicity'),
('DEM', 'race', '5Stats', 'Race', 3, 33, 1, 0, 0, 'race', 1, 1, '', '', 'Race'),
('DEM', 'financial_review', '5Stats', 'Financial Review Date', 4, 2, 1, 10, 10, '', 1, 1, '', 'D', 'Financial Review Date'),
('DEM', 'family_size', '5Stats', 'Family Size', 4, 2, 1, 20, 63, '', 1, 1, '', '', 'Family Size'),
('DEM', 'monthly_income', '5Stats', 'Monthly Income', 5, 2, 1, 20, 63, '', 1, 1, '', '', 'Monthly Income'),
('DEM', 'homeless', '5Stats', 'Homeless, etc.', 6, 2, 1, 20, 63, '', 1, 1, '', '', 'Homeless or similar?'),
('DEM', 'interpretter', '5Stats', 'Interpreter', 7, 2, 1, 20, 63, '', 1, 1, '', '', 'Interpreter needed?'),
('DEM', 'migrantseasonal', '5Stats', 'Migrant/Seasonal', 8, 2, 1, 20, 63, '', 1, 1, '', '', 'Migrant or seasonal worker?'),
('DEM', 'contrastart', '5Stats', 'Contraceptives Start', 9, 4, 0, 10, 10, '', 1, 1, '', '', 'Date contraceptive services initially provided'),
('DEM', 'referral_source', '5Stats', 'Referral Source', 10, 26, 1, 0, 0, 'refsource', 1, 1, '', '', 'How did they hear about us'),
('DEM', 'vfc', '5Stats', 'VFC', 12, 1, 1, 20, 0, 'eligibility', 1, 1, '', '', 'Eligibility status for Vaccine for Children supplied vaccine'),
('DEM', 'deceased_date', '6Misc', 'Date Deceased', 1, 4, 1, 20, 20, '', 1, 3, '', 'D', 'If person is deceased, then enter date of death.'),
('DEM', 'deceased_reason', '6Misc', 'Reason Deceased', 2, 2, 1, 30, 255, '', 1, 3, '', '', 'Reason for Death'),
('DEM', 'usertext1', '6Misc', 'User Defined Text 1', 3, 2, 0, 10, 63, '', 1, 1, '', '', 'User Defined'),
('DEM', 'usertext2', '6Misc', 'User Defined Text 2', 4, 2, 0, 10, 63, '', 1, 1, '', '', 'User Defined'),
('DEM', 'usertext3', '6Misc', 'User Defined Text 3', 5, 2, 0, 10, 63, '', 1, 1, '', '', 'User Defined'),
('DEM', 'usertext4', '6Misc', 'User Defined Text 4', 6, 2, 0, 10, 63, '', 1, 1, '', '', 'User Defined'),
('DEM', 'usertext5', '6Misc', 'User Defined Text 5', 7, 2, 0, 10, 63, '', 1, 1, '', '', 'User Defined'),
('DEM', 'usertext6', '6Misc', 'User Defined Text 6', 8, 2, 0, 10, 63, '', 1, 1, '', '', 'User Defined'),
('DEM', 'usertext7', '6Misc', 'User Defined Text 7', 9, 2, 0, 10, 63, '', 1, 1, '', '', 'User Defined'),
('DEM', 'usertext8', '6Misc', 'User Defined Text 8', 10, 2, 0, 10, 63, '', 1, 1, '', '', 'User Defined'),
('DEM', 'userlist1', '6Misc', 'User Defined List 1', 11, 1, 0, 0, 0, 'userlist1', 1, 1, '', '', 'User Defined'),
('DEM', 'userlist2', '6Misc', 'User Defined List 2', 12, 1, 0, 0, 0, 'userlist2', 1, 1, '', '', 'User Defined'),
('DEM', 'userlist3', '6Misc', 'User Defined List 3', 13, 1, 0, 0, 0, 'userlist3', 1, 1, '', '', 'User Defined'),
('DEM', 'userlist4', '6Misc', 'User Defined List 4', 14, 1, 0, 0, 0, 'userlist4', 1, 1, '', '', 'User Defined'),
('DEM', 'userlist5', '6Misc', 'User Defined List 5', 15, 1, 0, 0, 0, 'userlist5', 1, 1, '', '', 'User Defined'),
('DEM', 'userlist6', '6Misc', 'User Defined List 6', 16, 1, 0, 0, 0, 'userlist6', 1, 1, '', '', 'User Defined'),
('DEM', 'userlist7', '6Misc', 'User Defined List 7', 17, 1, 0, 0, 0, 'userlist7', 1, 1, '', '', 'User Defined'),
('DEM', 'regdate', '6Misc', 'Registration Date', 18, 4, 0, 10, 10, '', 1, 1, '', 'D', 'Start Date at This Clinic'),
('REF', 'refer_date', '1Referral', 'Referral Date', 1, 4, 2, 0, 0, '', 1, 1, 'C', 'D', 'Date of referral'),
('REF', 'refer_from', '1Referral', 'Refer By', 2, 10, 2, 0, 0, '', 1, 1, '', '', 'Referral By'),
('REF', 'refer_external', '1Referral', 'External Referral', 3, 1, 1, 0, 0, 'boolean', 1, 1, '', '', 'External referral?'),
('REF', 'refer_to', '1Referral', 'Refer To', 4, 14, 2, 0, 0, '', 1, 1, '', '', 'Referral To'),
('REF', 'body', '1Referral', 'Reason', 5, 3, 2, 30, 3, '', 1, 1, '', '', 'Reason for referral'),
('REF', 'refer_diag', '1Referral', 'Referrer Diagnosis', 6, 2, 1, 30, 255, '', 1, 1, '', 'X', 'Referrer diagnosis'),
('REF', 'refer_risk_level', '1Referral', 'Risk Level', 7, 1, 1, 0, 0, 'risklevel', 1, 1, '', '', 'Level of urgency'),
('REF', 'refer_vitals', '1Referral', 'Include Vitals', 8, 1, 1, 0, 0, 'boolean', 1, 1, '', '', 'Include vitals data?'),
('REF', 'refer_related_code', '1Referral', 'Requested Service', 9, 15, 1, 30, 255, '', 1, 1, '', '', 'Billing Code for Requested Service'),
('REF', 'reply_date', '2Counter-Referral', 'Reply Date', 10, 4, 1, 0, 0, '', 1, 1, '', 'D', 'Date of reply'),
('REF', 'reply_from', '2Counter-Referral', 'Reply From', 11, 2, 1, 30, 255, '', 1, 1, '', '', 'Who replied?'),
('REF', 'reply_init_diag', '2Counter-Referral', 'Presumed Diagnosis', 12, 2, 1, 30, 255, '', 1, 1, '', '', 'Presumed diagnosis by specialist'),
('REF', 'reply_final_diag', '2Counter-Referral', 'Final Diagnosis', 13, 2, 1, 30, 255, '', 1, 1, '', '', 'Final diagnosis by specialist'),
('REF', 'reply_documents', '2Counter-Referral', 'Documents', 14, 2, 1, 30, 255, '', 1, 1, '', '', 'Where may related scanned or paper documents be found?'),
('REF', 'reply_findings', '2Counter-Referral', 'Findings', 15, 3, 1, 30, 3, '', 1, 1, '', '', 'Findings by specialist'),
('REF', 'reply_services', '2Counter-Referral', 'Services Provided', 16, 3, 1, 30, 3, '', 1, 1, '', '', 'Service provided by specialist'),
('REF', 'reply_recommend', '2Counter-Referral', 'Recommendations', 17, 3, 1, 30, 3, '', 1, 1, '', '', 'Recommendations by specialist'),
('REF', 'reply_rx_refer', '2Counter-Referral', 'Prescriptions/Referrals', 18, 3, 1, 30, 3, '', 1, 1, '', '', 'Prescriptions and/or referrals by specialist'),
('HIS', 'usertext11', '1General', 'Risk Factors', 1, 21, 1, 0, 0, 'riskfactors', 1, 1, '', '', 'Risk Factors'),
('HIS', 'exams', '1General', 'Exams/Tests', 2, 23, 1, 0, 0, 'exams', 1, 1, '', '', 'Exam and test results'),
('HIS', 'history_father', '2Family History', 'Father', 1, 2, 1, 20, 255, '', 1, 1, '', '', ''),
('HIS', 'history_mother', '2Family History', 'Mother', 2, 2, 1, 20, 255, '', 1, 1, '', '', ''),
('HIS', 'history_siblings', '2Family History', 'Siblings', 3, 2, 1, 20, 255, '', 1, 1, '', '', ''),
('HIS', 'history_spouse', '2Family History', 'Spouse', 4, 2, 1, 20, 255, '', 1, 1, '', '', ''),
('HIS', 'history_offspring', '2Family History', 'Offspring', 5, 2, 1, 20, 255, '', 1, 3, '', '', ''),
('HIS', 'relatives_cancer', '3Relatives', 'Cancer', 1, 2, 1, 20, 255, '', 1, 1, '', '', ''),
('HIS', 'relatives_tuberculosis', '3Relatives', 'Tuberculosis', 2, 2, 1, 20, 255, '', 1, 1, '', '', ''),
('HIS', 'relatives_diabetes', '3Relatives', 'Diabetes', 3, 2, 1, 20, 255, '', 1, 1, '', '', ''),
('HIS', 'relatives_high_blood_pressure', '3Relatives', 'High Blood Pressure', 4, 2, 1, 20, 255, '', 1, 1, '', '', ''),
('HIS', 'relatives_heart_problems', '3Relatives', 'Heart Problems', 5, 2, 1, 20, 255, '', 1, 1, '', '', ''),
('HIS', 'relatives_stroke', '3Relatives', 'Stroke', 6, 2, 1, 20, 255, '', 1, 1, '', '', ''),
('HIS', 'relatives_epilepsy', '3Relatives', 'Epilepsy', 7, 2, 1, 20, 255, '', 1, 1, '', '', ''),
('HIS', 'relatives_mental_illness', '3Relatives', 'Mental Illness', 8, 2, 1, 20, 255, '', 1, 1, '', '', ''),
('HIS', 'relatives_suicide', '3Relatives', 'Suicide', 9, 2, 1, 20, 255, '', 1, 3, '', '', ''),
('HIS', 'coffee', '4Lifestyle', 'Coffee', 2, 28, 1, 20, 255, '', 1, 3, '', '', 'Caffeine consumption'),
('HIS', 'tobacco', '4Lifestyle', 'Tobacco', 1, 32, 1, 0, 255, 'smoking_status', 1, 3, '', '', 'Tobacco use'),
('HIS', 'alcohol', '4Lifestyle', 'Alcohol', 3, 28, 1, 20, 255, '', 1, 3, '', '', 'Alcohol consumption'),
('HIS', 'recreational_drugs', '4Lifestyle', 'Recreational Drugs', 4, 28, 1, 20, 255, '', 1, 3, '', '', 'Recreational drug use'),
('HIS', 'counseling', '4Lifestyle', 'Counseling', 5, 28, 1, 20, 255, '', 1, 3, '', '', 'Counseling activities'),
('HIS', 'exercise_patterns', '4Lifestyle', 'Exercise Patterns', 6, 28, 1, 20, 255, '', 1, 3, '', '', 'Exercise patterns'),
('HIS', 'hazardous_activities', '4Lifestyle', 'Hazardous Activities', 7, 28, 1, 20, 255, '', 1, 3, '', '', 'Hazardous activities'),
('HIS', 'sleep_patterns', '4Lifestyle', 'Sleep Patterns', 8, 2, 1, 20, 255, '', 1, 3, '', '', 'Sleep patterns'),
('HIS', 'seatbelt_use', '4Lifestyle', 'Seatbelt Use', 9, 2, 1, 20, 255, '', 1, 3, '', '', 'Seatbelt use'),
('HIS', 'name_1', '5Other', 'Name/Value', 1, 2, 1, 10, 255, '', 1, 1, '', '', 'Name 1'),
('HIS', 'value_1', '5Other', '', 2, 2, 1, 10, 255, '', 0, 0, '', '', 'Value 1'),
('HIS', 'name_2', '5Other', 'Name/Value', 3, 2, 1, 10, 255, '', 1, 1, '', '', 'Name 2'),
('HIS', 'value_2', '5Other', '', 4, 2, 1, 10, 255, '', 0, 0, '', '', 'Value 2'),
('HIS', 'additional_history', '5Other', 'Additional History', 5, 3, 1, 30, 3, '', 1, 3, '', '', 'Additional history notes'),
('HIS', 'userarea11', '5Other', 'User Defined Area 11', 6, 3, 0, 30, 3, '', 1, 3, '', '', 'User Defined'),
('HIS', 'userarea12', '5Other', 'User Defined Area 12', 7, 3, 0, 30, 3, '', 1, 3, '', '', 'User Defined');

--
-- Dumping data for table `lbf_data`
--


--
-- Dumping data for table `lists`
--


--
-- Dumping data for table `lists_touch`
--


--
-- Dumping data for table `list_options`
--

INSERT INTO `list_options` (`list_id`, `option_id`, `title`, `seq`, `is_default`, `option_value`, `mapping`, `notes`) VALUES
('yesno', 'NO', 'NO', 1, 0, 0, '', ''),
('yesno', 'YES', 'YES', 2, 0, 0, '', ''),
('titles', 'Mr.', 'Mr.', 1, 0, 0, '', ''),
('titles', 'Mrs.', 'Mrs.', 2, 0, 0, '', ''),
('titles', 'Ms.', 'Ms.', 3, 0, 0, '', ''),
('titles', 'Dr.', 'Dr.', 4, 0, 0, '', ''),
('sex', 'Female', 'Female', 1, 0, 0, '', ''),
('sex', 'Male', 'Male', 2, 0, 0, '', ''),
('marital', 'married', 'Married', 1, 0, 0, '', ''),
('marital', 'single', 'Single', 2, 0, 0, '', ''),
('marital', 'divorced', 'Divorced', 3, 0, 0, '', ''),
('marital', 'widowed', 'Widowed', 4, 0, 0, '', ''),
('marital', 'separated', 'Separated', 5, 0, 0, '', ''),
('marital', 'domestic partner', 'Domestic Partner', 6, 0, 0, '', ''),
('language', 'armenian', 'Armenian', 10, 0, 0, '', ''),
('language', 'chinese', 'Chinese', 20, 0, 0, '', ''),
('language', 'danish', 'Danish', 30, 0, 0, '', ''),
('language', 'deaf', 'Deaf', 40, 0, 0, '', ''),
('language', 'English', 'English', 50, 0, 0, '', ''),
('language', 'farsi', 'Farsi', 60, 0, 0, '', ''),
('language', 'french', 'French', 70, 0, 0, '', ''),
('language', 'german', 'German', 80, 0, 0, '', ''),
('language', 'greek', 'Greek', 90, 0, 0, '', ''),
('language', 'hmong', 'Hmong', 100, 0, 0, '', ''),
('language', 'italian', 'Italian', 110, 0, 0, '', ''),
('language', 'japanese', 'Japanese', 120, 0, 0, '', ''),
('language', 'korean', 'Korean', 130, 0, 0, '', ''),
('language', 'laotian', 'Laotian', 140, 0, 0, '', ''),
('language', 'mien', 'Mien', 150, 0, 0, '', ''),
('language', 'norwegian', 'Norwegian', 160, 0, 0, '', ''),
('language', 'othrs', 'Others', 170, 0, 0, '', ''),
('language', 'portuguese', 'Portuguese', 180, 0, 0, '', ''),
('language', 'punjabi', 'Punjabi', 190, 0, 0, '', ''),
('language', 'russian', 'Russian', 200, 0, 0, '', ''),
('language', 'Spanish', 'Spanish', 210, 0, 0, '', ''),
('language', 'tagalog', 'Tagalog', 220, 0, 0, '', ''),
('language', 'turkish', 'Turkish', 230, 0, 0, '', ''),
('language', 'vietnamese', 'Vietnamese', 240, 0, 0, '', ''),
('language', 'yiddish', 'Yiddish', 250, 0, 0, '', ''),
('language', 'zulu', 'Zulu', 260, 0, 0, '', ''),
('ethrace', 'aleut', 'ALEUT', 10, 0, 0, '', ''),
('ethrace', 'amer_indian', 'American Indian', 20, 0, 0, '', ''),
('ethrace', 'Asian', 'Asian', 30, 0, 0, '', ''),
('ethrace', 'Black', 'Black', 40, 0, 0, '', ''),
('ethrace', 'cambodian', 'Cambodian', 50, 0, 0, '', ''),
('ethrace', 'Caucasian', 'Caucasian', 60, 0, 0, '', ''),
('ethrace', 'cs_american', 'Central/South American', 70, 0, 0, '', ''),
('ethrace', 'chinese', 'Chinese', 80, 0, 0, '', ''),
('ethrace', 'cuban', 'Cuban', 90, 0, 0, '', ''),
('ethrace', 'eskimo', 'Eskimo', 100, 0, 0, '', ''),
('ethrace', 'filipino', 'Filipino', 110, 0, 0, '', ''),
('ethrace', 'guamanian', 'Guamanian', 120, 0, 0, '', ''),
('ethrace', 'hawaiian', 'Hawaiian', 130, 0, 0, '', ''),
('ethrace', 'Hispanic', 'Hispanic', 140, 0, 0, '', ''),
('ethrace', 'othr_us', 'Hispanic - Other (Born in US)', 150, 0, 0, '', ''),
('ethrace', 'othr_non_us', 'Hispanic - Other (Born outside US)', 160, 0, 0, '', ''),
('ethrace', 'hmong', 'Hmong', 170, 0, 0, '', ''),
('ethrace', 'indian', 'Indian', 180, 0, 0, '', ''),
('ethrace', 'japanese', 'Japanese', 190, 0, 0, '', ''),
('ethrace', 'korean', 'Korean', 200, 0, 0, '', ''),
('ethrace', 'laotian', 'Laotian', 210, 0, 0, '', ''),
('ethrace', 'mexican', 'Mexican/MexAmer/Chicano', 220, 0, 0, '', ''),
('ethrace', 'mlt-race', 'Multiracial', 230, 0, 0, '', ''),
('ethrace', 'othr', 'Other', 240, 0, 0, '', ''),
('ethrace', 'othr_spec', 'Other - Specified', 250, 0, 0, '', ''),
('ethrace', 'pac_island', 'Pacific Islander', 260, 0, 0, '', ''),
('ethrace', 'puerto_rican', 'Puerto Rican', 270, 0, 0, '', ''),
('ethrace', 'refused', 'Refused To State', 280, 0, 0, '', ''),
('ethrace', 'samoan', 'Samoan', 290, 0, 0, '', ''),
('ethrace', 'spec', 'Specified', 300, 0, 0, '', ''),
('ethrace', 'thai', 'Thai', 310, 0, 0, '', ''),
('ethrace', 'unknown', 'Unknown', 320, 0, 0, '', ''),
('ethrace', 'unspec', 'Unspecified', 330, 0, 0, '', ''),
('ethrace', 'vietnamese', 'Vietnamese', 340, 0, 0, '', ''),
('ethrace', 'white', 'White', 350, 0, 0, '', ''),
('ethrace', 'withheld', 'Withheld', 360, 0, 0, '', ''),
('userlist1', 'sample', 'Sample', 1, 0, 0, '', ''),
('userlist2', 'sample', 'Sample', 1, 0, 0, '', ''),
('userlist3', 'sample', 'Sample', 1, 0, 0, '', ''),
('userlist4', 'sample', 'Sample', 1, 0, 0, '', ''),
('userlist5', 'sample', 'Sample', 1, 0, 0, '', ''),
('userlist6', 'sample', 'Sample', 1, 0, 0, '', ''),
('userlist7', 'sample', 'Sample', 1, 0, 0, '', ''),
('pricelevel', 'standard', 'Standard', 1, 1, 0, '', ''),
('risklevel', 'low', 'Low', 1, 0, 0, '', ''),
('risklevel', 'medium', 'Medium', 2, 1, 0, '', ''),
('risklevel', 'high', 'High', 3, 0, 0, '', ''),
('boolean', '0', 'No', 1, 0, 0, '', ''),
('boolean', '1', 'Yes', 2, 0, 0, '', ''),
('country', 'USA', 'USA', 1, 0, 0, '', ''),
('state', 'AL', 'Alabama', 1, 0, 0, '', ''),
('state', 'AK', 'Alaska', 2, 0, 0, '', ''),
('state', 'AZ', 'Arizona', 3, 0, 0, '', ''),
('state', 'AR', 'Arkansas', 4, 0, 0, '', ''),
('state', 'CA', 'California', 5, 0, 0, '', ''),
('state', 'CO', 'Colorado', 6, 0, 0, '', ''),
('state', 'CT', 'Connecticut', 7, 0, 0, '', ''),
('state', 'DE', 'Delaware', 8, 0, 0, '', ''),
('state', 'DC', 'District of Columbia', 9, 0, 0, '', ''),
('state', 'FL', 'Florida', 10, 0, 0, '', ''),
('state', 'GA', 'Georgia', 11, 0, 0, '', ''),
('state', 'HI', 'Hawaii', 12, 0, 0, '', ''),
('state', 'ID', 'Idaho', 13, 0, 0, '', ''),
('state', 'IL', 'Illinois', 14, 0, 0, '', ''),
('state', 'IN', 'Indiana', 15, 0, 0, '', ''),
('state', 'IA', 'Iowa', 16, 0, 0, '', ''),
('state', 'KS', 'Kansas', 17, 0, 0, '', ''),
('state', 'KY', 'Kentucky', 18, 0, 0, '', ''),
('state', 'LA', 'Louisiana', 19, 0, 0, '', ''),
('state', 'ME', 'Maine', 20, 0, 0, '', ''),
('state', 'MD', 'Maryland', 21, 0, 0, '', ''),
('state', 'MA', 'Massachusetts', 22, 0, 0, '', ''),
('state', 'MI', 'Michigan', 23, 0, 0, '', ''),
('state', 'MN', 'Minnesota', 24, 0, 0, '', ''),
('state', 'MS', 'Mississippi', 25, 0, 0, '', ''),
('state', 'MO', 'Missouri', 26, 0, 0, '', ''),
('state', 'MT', 'Montana', 27, 0, 0, '', ''),
('state', 'NE', 'Nebraska', 28, 0, 0, '', ''),
('state', 'NV', 'Nevada', 29, 0, 0, '', ''),
('state', 'NH', 'New Hampshire', 30, 0, 0, '', ''),
('state', 'NJ', 'New Jersey', 31, 0, 0, '', ''),
('state', 'NM', 'New Mexico', 32, 0, 0, '', ''),
('state', 'NY', 'New York', 33, 0, 0, '', ''),
('state', 'NC', 'North Carolina', 34, 0, 0, '', ''),
('state', 'ND', 'North Dakota', 35, 0, 0, '', ''),
('state', 'OH', 'Ohio', 36, 0, 0, '', ''),
('state', 'OK', 'Oklahoma', 37, 0, 0, '', ''),
('state', 'OR', 'Oregon', 38, 0, 0, '', ''),
('state', 'PA', 'Pennsylvania', 39, 0, 0, '', ''),
('state', 'RI', 'Rhode Island', 40, 0, 0, '', ''),
('state', 'SC', 'South Carolina', 41, 0, 0, '', ''),
('state', 'SD', 'South Dakota', 42, 0, 0, '', ''),
('state', 'TN', 'Tennessee', 43, 0, 0, '', ''),
('state', 'TX', 'Texas', 44, 0, 0, '', ''),
('state', 'UT', 'Utah', 45, 0, 0, '', ''),
('state', 'VT', 'Vermont', 46, 0, 0, '', ''),
('state', 'VA', 'Virginia', 47, 0, 0, '', ''),
('state', 'WA', 'Washington', 48, 0, 0, '', ''),
('state', 'WV', 'West Virginia', 49, 0, 0, '', ''),
('state', 'WI', 'Wisconsin', 50, 0, 0, '', ''),
('state', 'WY', 'Wyoming', 51, 0, 0, '', ''),
('refsource', 'Patient', 'Patient', 1, 0, 0, '', ''),
('refsource', 'Employee', 'Employee', 2, 0, 0, '', ''),
('refsource', 'Walk-In', 'Walk-In', 3, 0, 0, '', ''),
('refsource', 'Newspaper', 'Newspaper', 4, 0, 0, '', ''),
('refsource', 'Radio', 'Radio', 5, 0, 0, '', ''),
('refsource', 'T.V.', 'T.V.', 6, 0, 0, '', ''),
('refsource', 'Direct Mail', 'Direct Mail', 7, 0, 0, '', ''),
('refsource', 'Coupon', 'Coupon', 8, 0, 0, '', ''),
('refsource', 'Referral Card', 'Referral Card', 9, 0, 0, '', ''),
('refsource', 'Other', 'Other', 10, 0, 0, '', ''),
('riskfactors', 'vv', 'Varicose Veins', 1, 0, 0, '', ''),
('riskfactors', 'ht', 'Hypertension', 2, 0, 0, '', ''),
('riskfactors', 'db', 'Diabetes', 3, 0, 0, '', ''),
('riskfactors', 'sc', 'Sickle Cell', 4, 0, 0, '', ''),
('riskfactors', 'fib', 'Fibroids', 5, 0, 0, '', ''),
('riskfactors', 'pid', 'PID (Pelvic Inflammatory Disease)', 6, 0, 0, '', ''),
('riskfactors', 'mig', 'Severe Migraine', 7, 0, 0, '', ''),
('riskfactors', 'hd', 'Heart Disease', 8, 0, 0, '', ''),
('riskfactors', 'str', 'Thrombosis/Stroke', 9, 0, 0, '', ''),
('riskfactors', 'hep', 'Hepatitis', 10, 0, 0, '', ''),
('riskfactors', 'gb', 'Gall Bladder Condition', 11, 0, 0, '', ''),
('riskfactors', 'br', 'Breast Disease', 12, 0, 0, '', ''),
('riskfactors', 'dpr', 'Depression', 13, 0, 0, '', ''),
('riskfactors', 'all', 'Allergies', 14, 0, 0, '', ''),
('riskfactors', 'inf', 'Infertility', 15, 0, 0, '', ''),
('riskfactors', 'ast', 'Asthma', 16, 0, 0, '', ''),
('riskfactors', 'ep', 'Epilepsy', 17, 0, 0, '', ''),
('riskfactors', 'cl', 'Contact Lenses', 18, 0, 0, '', ''),
('riskfactors', 'coc', 'Contraceptive Complication (specify)', 19, 0, 0, '', ''),
('riskfactors', 'oth', 'Other (specify)', 20, 0, 0, '', ''),
('exams', 'brs', 'Breast Exam', 1, 0, 0, '', ''),
('exams', 'cec', 'Cardiac Echo', 2, 0, 0, '', ''),
('exams', 'ecg', 'ECG', 3, 0, 0, '', ''),
('exams', 'gyn', 'Gynecological Exam', 4, 0, 0, '', ''),
('exams', 'mam', 'Mammogram', 5, 0, 0, '', ''),
('exams', 'phy', 'Physical Exam', 6, 0, 0, '', ''),
('exams', 'pro', 'Prostate Exam', 7, 0, 0, '', ''),
('exams', 'rec', 'Rectal Exam', 8, 0, 0, '', ''),
('exams', 'sic', 'Sigmoid/Colonoscopy', 9, 0, 0, '', ''),
('exams', 'ret', 'Retinal Exam', 10, 0, 0, '', ''),
('exams', 'flu', 'Flu Vaccination', 11, 0, 0, '', ''),
('exams', 'pne', 'Pneumonia Vaccination', 12, 0, 0, '', ''),
('exams', 'ldl', 'LDL', 13, 0, 0, '', ''),
('exams', 'hem', 'Hemoglobin', 14, 0, 0, '', ''),
('exams', 'psa', 'PSA', 15, 0, 0, '', ''),
('drug_form', '0', '', 0, 0, 0, '', ''),
('drug_form', '1', 'suspension', 1, 0, 0, '', ''),
('drug_form', '2', 'tablet', 2, 0, 0, '', ''),
('drug_form', '3', 'capsule', 3, 0, 0, '', ''),
('drug_form', '4', 'solution', 4, 0, 0, '', ''),
('drug_form', '5', 'tsp', 5, 0, 0, '', ''),
('drug_form', '6', 'ml', 6, 0, 0, '', ''),
('drug_form', '7', 'units', 7, 0, 0, '', ''),
('drug_form', '8', 'inhalations', 8, 0, 0, '', ''),
('drug_form', '9', 'gtts(drops)', 9, 0, 0, '', ''),
('drug_form', '10', 'cream', 10, 0, 0, '', ''),
('drug_form', '11', 'ointment', 11, 0, 0, '', ''),
('drug_units', '0', '', 0, 0, 0, '', ''),
('drug_units', '1', 'mg', 1, 0, 0, '', ''),
('drug_units', '2', 'mg/1cc', 2, 0, 0, '', ''),
('drug_units', '3', 'mg/2cc', 3, 0, 0, '', ''),
('drug_units', '4', 'mg/3cc', 4, 0, 0, '', ''),
('drug_units', '5', 'mg/4cc', 5, 0, 0, '', ''),
('drug_units', '6', 'mg/5cc', 6, 0, 0, '', ''),
('drug_units', '7', 'mcg', 7, 0, 0, '', ''),
('drug_units', '8', 'grams', 8, 0, 0, '', ''),
('drug_route', '0', '', 0, 0, 0, '', ''),
('drug_route', '1', 'Per Oris', 1, 0, 0, '', ''),
('drug_route', '2', 'Per Rectum', 2, 0, 0, '', ''),
('drug_route', '3', 'To Skin', 3, 0, 0, '', ''),
('drug_route', '4', 'To Affected Area', 4, 0, 0, '', ''),
('drug_route', '5', 'Sublingual', 5, 0, 0, '', ''),
('drug_route', '6', 'OS', 6, 0, 0, '', ''),
('drug_route', '7', 'OD', 7, 0, 0, '', ''),
('drug_route', '8', 'OU', 8, 0, 0, '', ''),
('drug_route', '9', 'SQ', 9, 0, 0, '', ''),
('drug_route', '10', 'IM', 10, 0, 0, '', ''),
('drug_route', '11', 'IV', 11, 0, 0, '', ''),
('drug_route', '12', 'Per Nostril', 12, 0, 0, '', ''),
('drug_route', '13', 'Both Ears', 13, 0, 0, '', ''),
('drug_route', '14', 'Left Ear', 14, 0, 0, '', ''),
('drug_route', '15', 'Right Ear', 15, 0, 0, '', ''),
('drug_interval', '0', '', 0, 0, 0, '', ''),
('drug_interval', '1', 'b.i.d.', 1, 0, 0, '', ''),
('drug_interval', '2', 't.i.d.', 2, 0, 0, '', ''),
('drug_interval', '3', 'q.i.d.', 3, 0, 0, '', ''),
('drug_interval', '4', 'q.3h', 4, 0, 0, '', ''),
('drug_interval', '5', 'q.4h', 5, 0, 0, '', ''),
('drug_interval', '6', 'q.5h', 6, 0, 0, '', ''),
('drug_interval', '7', 'q.6h', 7, 0, 0, '', ''),
('drug_interval', '8', 'q.8h', 8, 0, 0, '', ''),
('drug_interval', '9', 'q.d.', 9, 0, 0, '', ''),
('drug_interval', '10', 'a.c.', 10, 0, 0, '', ''),
('drug_interval', '11', 'p.c.', 11, 0, 0, '', ''),
('drug_interval', '12', 'a.m.', 12, 0, 0, '', ''),
('drug_interval', '13', 'p.m.', 13, 0, 0, '', ''),
('drug_interval', '14', 'ante', 14, 0, 0, '', ''),
('drug_interval', '15', 'h', 15, 0, 0, '', ''),
('drug_interval', '16', 'h.s.', 16, 0, 0, '', ''),
('drug_interval', '17', 'p.r.n.', 17, 0, 0, '', ''),
('drug_interval', '18', 'stat', 18, 0, 0, '', ''),
('chartloc', 'fileroom', 'File Room', 1, 0, 0, '', ''),
('lists', 'boolean', 'Boolean', 1, 0, 0, '', ''),
('lists', 'chartloc', 'Chart Storage Locations', 1, 0, 0, '', ''),
('lists', 'country', 'Country', 2, 0, 0, '', ''),
('lists', 'drug_form', 'Drug Forms', 3, 0, 0, '', ''),
('lists', 'drug_units', 'Drug Units', 4, 0, 0, '', ''),
('lists', 'drug_route', 'Drug Routes', 5, 0, 0, '', ''),
('lists', 'drug_interval', 'Drug Intervals', 6, 0, 0, '', ''),
('lists', 'exams', 'Exams/Tests', 7, 0, 0, '', ''),
('lists', 'feesheet', 'Fee Sheet', 8, 0, 0, '', ''),
('lists', 'language', 'Language', 9, 0, 0, '', ''),
('lists', 'lbfnames', 'Layout-Based Visit Forms', 9, 0, 0, '', ''),
('lists', 'marital', 'Marital Status', 10, 0, 0, '', ''),
('lists', 'pricelevel', 'Price Level', 11, 0, 0, '', ''),
('lists', 'ethrace', 'Race/Ethnicity', 12, 0, 0, '', ''),
('lists', 'refsource', 'Referral Source', 13, 0, 0, '', ''),
('lists', 'riskfactors', 'Risk Factors', 14, 0, 0, '', ''),
('lists', 'risklevel', 'Risk Level', 15, 0, 0, '', ''),
('lists', 'superbill', 'Service Category', 16, 0, 0, '', ''),
('lists', 'sex', 'Sex', 17, 0, 0, '', ''),
('lists', 'state', 'State', 18, 0, 0, '', ''),
('lists', 'taxrate', 'Tax Rate', 19, 0, 0, '', ''),
('lists', 'titles', 'Titles', 20, 0, 0, '', ''),
('lists', 'yesno', 'Yes/No', 21, 0, 0, '', ''),
('lists', 'userlist1', 'User Defined List 1', 22, 0, 0, '', ''),
('lists', 'userlist2', 'User Defined List 2', 23, 0, 0, '', ''),
('lists', 'userlist3', 'User Defined List 3', 24, 0, 0, '', ''),
('lists', 'userlist4', 'User Defined List 4', 25, 0, 0, '', ''),
('lists', 'userlist5', 'User Defined List 5', 26, 0, 0, '', ''),
('lists', 'userlist6', 'User Defined List 6', 27, 0, 0, '', ''),
('lists', 'userlist7', 'User Defined List 7', 28, 0, 0, '', ''),
('lists', 'adjreason', 'Adjustment Reasons', 1, 0, 0, '', ''),
('adjreason', 'Adm adjust', 'Adm adjust', 5, 0, 1, '', ''),
('adjreason', 'After hrs calls', 'After hrs calls', 10, 0, 1, '', ''),
('adjreason', 'Bad check', 'Bad check', 15, 0, 1, '', ''),
('adjreason', 'Bad debt', 'Bad debt', 20, 0, 1, '', ''),
('adjreason', 'Coll w/o', 'Coll w/o', 25, 0, 1, '', ''),
('adjreason', 'Discount', 'Discount', 30, 0, 1, '', ''),
('adjreason', 'Hardship w/o', 'Hardship w/o', 35, 0, 1, '', ''),
('adjreason', 'Ins adjust', 'Ins adjust', 40, 0, 1, '', ''),
('adjreason', 'Ins bundling', 'Ins bundling', 45, 0, 1, '', ''),
('adjreason', 'Ins overpaid', 'Ins overpaid', 50, 0, 5, '', ''),
('adjreason', 'Ins refund', 'Ins refund', 55, 0, 5, '', ''),
('adjreason', 'Pt overpaid', 'Pt overpaid', 60, 0, 5, '', ''),
('adjreason', 'Pt refund', 'Pt refund', 65, 0, 5, '', ''),
('adjreason', 'Pt released', 'Pt released', 70, 0, 1, '', ''),
('adjreason', 'Sm debt w/o', 'Sm debt w/o', 75, 0, 1, '', ''),
('adjreason', 'To copay', 'To copay', 80, 0, 2, '', ''),
('adjreason', 'To ded''ble', 'To ded''ble', 85, 0, 3, '', ''),
('adjreason', 'Untimely filing', 'Untimely filing', 90, 0, 1, '', ''),
('lists', 'sub_relation', 'Subscriber Relationship', 18, 0, 0, '', ''),
('sub_relation', 'self', 'Self', 1, 0, 0, '', ''),
('sub_relation', 'spouse', 'Spouse', 2, 0, 0, '', ''),
('sub_relation', 'child', 'Child', 3, 0, 0, '', ''),
('sub_relation', 'other', 'Other', 4, 0, 0, '', ''),
('lists', 'occurrence', 'Occurrence', 10, 0, 0, '', ''),
('occurrence', '0', 'Unknown or N/A', 5, 0, 0, '', ''),
('occurrence', '1', 'First', 10, 0, 0, '', ''),
('occurrence', '6', 'Early Recurrence (<2 Mo)', 15, 0, 0, '', ''),
('occurrence', '7', 'Late Recurrence (2-12 Mo)', 20, 0, 0, '', ''),
('occurrence', '8', 'Delayed Recurrence (> 12 Mo)', 25, 0, 0, '', ''),
('occurrence', '4', 'Chronic/Recurrent', 30, 0, 0, '', ''),
('occurrence', '5', 'Acute on Chronic', 35, 0, 0, '', ''),
('lists', 'outcome', 'Outcome', 10, 0, 0, '', ''),
('outcome', '0', 'Unassigned', 2, 0, 0, '', ''),
('outcome', '1', 'Resolved', 5, 0, 0, '', ''),
('outcome', '2', 'Improved', 10, 0, 0, '', ''),
('outcome', '3', 'Status quo', 15, 0, 0, '', ''),
('outcome', '4', 'Worse', 20, 0, 0, '', ''),
('outcome', '5', 'Pending followup', 25, 0, 0, '', ''),
('lists', 'note_type', 'Patient Note Types', 10, 0, 0, '', ''),
('note_type', 'Unassigned', 'Unassigned', 1, 0, 0, '', ''),
('note_type', 'Chart Note', 'Chart Note', 2, 0, 0, '', ''),
('note_type', 'Insurance', 'Insurance', 3, 0, 0, '', ''),
('note_type', 'New Document', 'New Document', 4, 0, 0, '', ''),
('note_type', 'Pharmacy', 'Pharmacy', 5, 0, 0, '', ''),
('note_type', 'Prior Auth', 'Prior Auth', 6, 0, 0, '', ''),
('note_type', 'Referral', 'Referral', 7, 0, 0, '', ''),
('note_type', 'Test Scheduling', 'Test Scheduling', 8, 0, 0, '', ''),
('note_type', 'Bill/Collect', 'Bill/Collect', 9, 0, 0, '', ''),
('note_type', 'Other', 'Other', 10, 0, 0, '', ''),
('lists', 'immunizations', 'Immunizations', 8, 0, 0, '', ''),
('immunizations', '1', 'DTaP 1', 30, 0, 0, '', ''),
('immunizations', '2', 'DTaP 2', 35, 0, 0, '', ''),
('immunizations', '3', 'DTaP 3', 40, 0, 0, '', ''),
('immunizations', '4', 'DTaP 4', 45, 0, 0, '', ''),
('immunizations', '5', 'DTaP 5', 50, 0, 0, '', ''),
('immunizations', '6', 'DT 1', 5, 0, 0, '', ''),
('immunizations', '7', 'DT 2', 10, 0, 0, '', ''),
('immunizations', '8', 'DT 3', 15, 0, 0, '', ''),
('immunizations', '9', 'DT 4', 20, 0, 0, '', ''),
('immunizations', '10', 'DT 5', 25, 0, 0, '', ''),
('immunizations', '11', 'IPV 1', 110, 0, 0, '', ''),
('immunizations', '12', 'IPV 2', 115, 0, 0, '', ''),
('immunizations', '13', 'IPV 3', 120, 0, 0, '', ''),
('immunizations', '14', 'IPV 4', 125, 0, 0, '', ''),
('immunizations', '15', 'Hib 1', 80, 0, 0, '', ''),
('immunizations', '16', 'Hib 2', 85, 0, 0, '', ''),
('immunizations', '17', 'Hib 3', 90, 0, 0, '', ''),
('immunizations', '18', 'Hib 4', 95, 0, 0, '', ''),
('immunizations', '19', 'Pneumococcal Conjugate 1', 140, 0, 0, '', ''),
('immunizations', '20', 'Pneumococcal Conjugate 2', 145, 0, 0, '', ''),
('immunizations', '21', 'Pneumococcal Conjugate 3', 150, 0, 0, '', ''),
('immunizations', '22', 'Pneumococcal Conjugate 4', 155, 0, 0, '', ''),
('immunizations', '23', 'MMR 1', 130, 0, 0, '', ''),
('immunizations', '24', 'MMR 2', 135, 0, 0, '', ''),
('immunizations', '25', 'Varicella 1', 165, 0, 0, '', ''),
('immunizations', '26', 'Varicella 2', 170, 0, 0, '', ''),
('immunizations', '27', 'Hepatitis B 1', 65, 0, 0, '', ''),
('immunizations', '28', 'Hepatitis B 2', 70, 0, 0, '', ''),
('immunizations', '29', 'Hepatitis B 3', 75, 0, 0, '', ''),
('immunizations', '30', 'Influenza 1', 100, 0, 0, '', ''),
('immunizations', '31', 'Influenza 2', 105, 0, 0, '', ''),
('immunizations', '32', 'Td', 160, 0, 0, '', ''),
('immunizations', '33', 'Hepatitis A 1', 55, 0, 0, '', ''),
('immunizations', '34', 'Hepatitis A 2', 60, 0, 0, '', ''),
('immunizations', '35', 'Other', 175, 0, 0, '', ''),
('lists', 'apptstat', 'Appointment Statuses', 1, 0, 0, '', ''),
('apptstat', '-', '- None', 5, 0, 0, '', ''),
('apptstat', '*', '* Reminder done', 10, 0, 0, '', ''),
('apptstat', '+', '+ Chart pulled', 15, 0, 0, '', ''),
('apptstat', 'x', 'x Canceled', 20, 0, 0, '', ''),
('apptstat', '?', '? No show', 25, 0, 0, '', ''),
('apptstat', '@', '@ Arrived', 30, 0, 0, '', ''),
('apptstat', '~', '~ Arrived late', 35, 0, 0, '', ''),
('apptstat', '!', '! Left w/o visit', 40, 0, 0, '', ''),
('apptstat', '#', '# Ins/fin issue', 45, 0, 0, '', ''),
('apptstat', '<', '< In exam room', 50, 0, 0, '', ''),
('apptstat', '>', '> Checked out', 55, 0, 0, '', ''),
('apptstat', '$', '$ Coding done', 60, 0, 0, '', ''),
('apptstat', '%', '% Canceled < 24h', 65, 0, 0, '', ''),
('lists', 'warehouse', 'Warehouses', 21, 0, 0, '', ''),
('warehouse', 'onsite', 'On Site', 5, 0, 0, '', ''),
('lists', 'abook_type', 'Address Book Types', 1, 0, 0, '', ''),
('abook_type', 'ord_img', 'Imaging Service', 5, 0, 3, '', ''),
('abook_type', 'ord_imm', 'Immunization Service', 10, 0, 3, '', ''),
('abook_type', 'ord_lab', 'Lab Service', 15, 0, 3, '', ''),
('abook_type', 'spe', 'Specialist', 20, 0, 2, '', ''),
('abook_type', 'vendor', 'Vendor', 25, 0, 3, '', ''),
('abook_type', 'dist', 'Distributor', 30, 0, 3, '', ''),
('abook_type', 'oth', 'Other', 95, 0, 1, '', ''),
('lists', 'proc_type', 'Procedure Types', 1, 0, 0, '', ''),
('proc_type', 'grp', 'Group', 10, 0, 0, '', ''),
('proc_type', 'ord', 'Procedure Order', 20, 0, 0, '', ''),
('proc_type', 'res', 'Discrete Result', 30, 0, 0, '', ''),
('proc_type', 'rec', 'Recommendation', 40, 0, 0, '', ''),
('lists', 'proc_body_site', 'Procedure Body Sites', 1, 0, 0, '', ''),
('proc_body_site', 'arm', 'Arm', 10, 0, 0, '', ''),
('proc_body_site', 'buttock', 'Buttock', 20, 0, 0, '', ''),
('proc_body_site', 'oth', 'Other', 90, 0, 0, '', ''),
('lists', 'proc_specimen', 'Procedure Specimen Types', 1, 0, 0, '', ''),
('proc_specimen', 'blood', 'Blood', 10, 0, 0, '', ''),
('proc_specimen', 'saliva', 'Saliva', 20, 0, 0, '', ''),
('proc_specimen', 'urine', 'Urine', 30, 0, 0, '', ''),
('proc_specimen', 'oth', 'Other', 90, 0, 0, '', ''),
('lists', 'proc_route', 'Procedure Routes', 1, 0, 0, '', ''),
('proc_route', 'inj', 'Injection', 10, 0, 0, '', ''),
('proc_route', 'oral', 'Oral', 20, 0, 0, '', ''),
('proc_route', 'oth', 'Other', 90, 0, 0, '', ''),
('lists', 'proc_lat', 'Procedure Lateralities', 1, 0, 0, '', ''),
('proc_lat', 'left', 'Left', 10, 0, 0, '', ''),
('proc_lat', 'right', 'Right', 20, 0, 0, '', ''),
('proc_lat', 'bilat', 'Bilateral', 30, 0, 0, '', ''),
('lists', 'proc_unit', 'Procedure Units', 1, 0, 0, '', ''),
('proc_unit', 'bool', 'Boolean', 5, 0, 0, '', ''),
('proc_unit', 'cu_mm', 'CU.MM', 10, 0, 0, '', ''),
('proc_unit', 'fl', 'FL', 20, 0, 0, '', ''),
('proc_unit', 'g_dl', 'G/DL', 30, 0, 0, '', ''),
('proc_unit', 'gm_dl', 'GM/DL', 40, 0, 0, '', ''),
('proc_unit', 'hmol_l', 'HMOL/L', 50, 0, 0, '', ''),
('proc_unit', 'iu_l', 'IU/L', 60, 0, 0, '', ''),
('proc_unit', 'mg_dl', 'MG/DL', 70, 0, 0, '', ''),
('proc_unit', 'mil_cu_mm', 'Mil/CU.MM', 80, 0, 0, '', ''),
('proc_unit', 'percent', 'Percent', 90, 0, 0, '', ''),
('proc_unit', 'percentile', 'Percentile', 100, 0, 0, '', ''),
('proc_unit', 'pg', 'PG', 110, 0, 0, '', ''),
('proc_unit', 'ratio', 'Ratio', 120, 0, 0, '', ''),
('proc_unit', 'thous_cu_mm', 'Thous/CU.MM', 130, 0, 0, '', ''),
('proc_unit', 'units', 'Units', 140, 0, 0, '', ''),
('proc_unit', 'units_l', 'Units/L', 150, 0, 0, '', ''),
('proc_unit', 'days', 'Days', 600, 0, 0, '', ''),
('proc_unit', 'weeks', 'Weeks', 610, 0, 0, '', ''),
('proc_unit', 'months', 'Months', 620, 0, 0, '', ''),
('proc_unit', 'oth', 'Other', 990, 0, 0, '', ''),
('lists', 'ord_priority', 'Order Priorities', 1, 0, 0, '', ''),
('ord_priority', 'high', 'High', 10, 0, 0, '', ''),
('ord_priority', 'normal', 'Normal', 20, 0, 0, '', ''),
('lists', 'ord_status', 'Order Statuses', 1, 0, 0, '', ''),
('ord_status', 'pending', 'Pending', 10, 0, 0, '', ''),
('ord_status', 'routed', 'Routed', 20, 0, 0, '', ''),
('ord_status', 'complete', 'Complete', 30, 0, 0, '', ''),
('ord_status', 'canceled', 'Canceled', 40, 0, 0, '', ''),
('lists', 'proc_rep_status', 'Procedure Report Statuses', 1, 0, 0, '', ''),
('proc_rep_status', 'final', 'Final', 10, 0, 0, '', ''),
('proc_rep_status', 'review', 'Reviewed', 20, 0, 0, '', ''),
('proc_rep_status', 'prelim', 'Preliminary', 30, 0, 0, '', ''),
('proc_rep_status', 'cancel', 'Canceled', 40, 0, 0, '', ''),
('proc_rep_status', 'error', 'Error', 50, 0, 0, '', ''),
('proc_rep_status', 'correct', 'Corrected', 60, 0, 0, '', ''),
('lists', 'proc_res_abnormal', 'Procedure Result Abnormal', 1, 0, 0, '', ''),
('proc_res_abnormal', 'no', 'No', 10, 0, 0, '', ''),
('proc_res_abnormal', 'yes', 'Yes', 20, 0, 0, '', ''),
('proc_res_abnormal', 'high', 'High', 30, 0, 0, '', ''),
('proc_res_abnormal', 'low', 'Low', 40, 0, 0, '', ''),
('lists', 'proc_res_status', 'Procedure Result Statuses', 1, 0, 0, '', ''),
('proc_res_status', 'final', 'Final', 10, 0, 0, '', ''),
('proc_res_status', 'prelim', 'Preliminary', 20, 0, 0, '', ''),
('proc_res_status', 'cancel', 'Canceled', 30, 0, 0, '', ''),
('proc_res_status', 'error', 'Error', 40, 0, 0, '', ''),
('proc_res_status', 'correct', 'Corrected', 50, 0, 0, '', ''),
('proc_res_status', 'incomplete', 'Incomplete', 60, 0, 0, '', ''),
('lists', 'proc_res_bool', 'Procedure Boolean Results', 1, 0, 0, '', ''),
('proc_res_bool', 'neg', 'Negative', 10, 0, 0, '', ''),
('proc_res_bool', 'pos', 'Positive', 20, 0, 0, '', ''),
('lists', 'message_status', 'Message Status', 45, 0, 0, '', ''),
('message_status', 'Done', 'Done', 5, 0, 0, '', ''),
('message_status', 'Forwarded', 'Forwarded', 10, 0, 0, '', ''),
('message_status', 'New', 'New', 15, 0, 0, '', ''),
('message_status', 'Read', 'Read', 20, 0, 0, '', ''),
('note_type', 'Lab Results', 'Lab Results', 15, 0, 0, '', ''),
('note_type', 'New Orders', 'New Orders', 20, 0, 0, '', ''),
('note_type', 'Patient Reminders', 'Patient Reminders', 25, 0, 0, '', ''),
('lists', 'irnpool', 'Invoice Reference Number Pools', 1, 0, 0, '', ''),
('irnpool', 'main', 'Main', 1, 1, 0, '', '000001'),
('lists', 'eligibility', 'Eligibility', 60, 0, 0, '', ''),
('eligibility', 'eligible', 'Eligible', 10, 0, 0, '', ''),
('eligibility', 'ineligible', 'Ineligible', 20, 0, 0, '', ''),
('lists', 'transactions', 'Transactions', 20, 0, 0, '', ''),
('transactions', 'Referral', 'Referral', 10, 0, 0, '', ''),
('transactions', 'Patient Request', 'Patient Request', 20, 0, 0, '', ''),
('transactions', 'Physician Request', 'Physician Request', 30, 0, 0, '', ''),
('transactions', 'Legal', 'Legal', 40, 0, 0, '', ''),
('transactions', 'Billing', 'Billing', 50, 0, 0, '', ''),
('lists', 'payment_adjustment_code', 'Payment Adjustment Code', 1, 0, 0, '', ''),
('payment_adjustment_code', 'family_payment', 'Family Payment', 20, 0, 0, '', ''),
('payment_adjustment_code', 'group_payment', 'Group Payment', 30, 0, 0, '', ''),
('payment_adjustment_code', 'insurance_payment', 'Insurance Payment', 40, 0, 0, '', ''),
('payment_adjustment_code', 'patient_payment', 'Patient Payment', 50, 0, 0, '', ''),
('payment_adjustment_code', 'pre_payment', 'Pre Payment', 60, 0, 0, '', ''),
('lists', 'payment_ins', 'Payment Ins', 1, 0, 0, '', ''),
('payment_ins', '0', 'Pat', 40, 0, 0, '', ''),
('payment_ins', '1', 'Ins1', 10, 0, 0, '', ''),
('payment_ins', '2', 'Ins2', 20, 0, 0, '', ''),
('payment_ins', '3', 'Ins3', 30, 0, 0, '', ''),
('lists', 'payment_method', 'Payment Method', 1, 0, 0, '', ''),
('payment_method', 'bank_draft', 'Bank Draft', 50, 0, 0, '', ''),
('payment_method', 'cash', 'Cash', 20, 0, 0, '', ''),
('payment_method', 'check_payment', 'Check Payment', 10, 0, 0, '', ''),
('payment_method', 'credit_card', 'Credit Card', 30, 0, 0, '', ''),
('payment_method', 'electronic', 'Electronic', 40, 0, 0, '', ''),
('lists', 'payment_sort_by', 'Payment Sort By', 1, 0, 0, '', ''),
('payment_sort_by', 'check_date', 'Check Date', 20, 0, 0, '', ''),
('payment_sort_by', 'payer_id', 'Ins Code', 40, 0, 0, '', ''),
('payment_sort_by', 'payment_method', 'Payment Method', 50, 0, 0, '', ''),
('payment_sort_by', 'payment_type', 'Paying Entity', 30, 0, 0, '', ''),
('payment_sort_by', 'pay_total', 'Amount', 70, 0, 0, '', ''),
('payment_sort_by', 'reference', 'Check Number', 60, 0, 0, '', ''),
('payment_sort_by', 'session_id', 'Id', 10, 0, 0, '', ''),
('lists', 'payment_status', 'Payment Status', 1, 0, 0, '', ''),
('payment_status', 'fully_paid', 'Fully Paid', 10, 0, 0, '', ''),
('payment_status', 'unapplied', 'Unapplied', 20, 0, 0, '', ''),
('lists', 'payment_type', 'Payment Type', 1, 0, 0, '', ''),
('payment_type', 'insurance', 'Insurance', 10, 0, 0, '', ''),
('payment_type', 'patient', 'Patient', 20, 0, 0, '', ''),
('lists', 'date_master_criteria', 'Date Master Criteria', 33, 1, 0, '', ''),
('date_master_criteria', 'all', 'All', 10, 0, 0, '', ''),
('date_master_criteria', 'today', 'Today', 20, 0, 0, '', ''),
('date_master_criteria', 'this_month_to_date', 'This Month to Date', 30, 0, 0, '', ''),
('date_master_criteria', 'last_month', 'Last Month', 40, 0, 0, '', ''),
('date_master_criteria', 'this_week_to_date', 'This Week to Date', 50, 0, 0, '', ''),
('date_master_criteria', 'this_calendar_year', 'This Calendar Year', 60, 0, 0, '', ''),
('date_master_criteria', 'last_calendar_year', 'Last Calendar Year', 70, 0, 0, '', ''),
('date_master_criteria', 'custom', 'Custom', 80, 0, 0, '', ''),
('lists', 'clinical_plans', 'Clinical Plans', 3, 0, 0, '', ''),
('clinical_plans', 'dm_plan_cqm', 'Diabetes Mellitus', 5, 0, 0, '', ''),
('clinical_plans', 'ckd_plan_cqm', 'Chronic Kidney Disease (CKD)', 10, 0, 0, '', ''),
('clinical_plans', 'prevent_plan_cqm', 'Preventative Care', 15, 0, 0, '', ''),
('clinical_plans', 'periop_plan_cqm', 'Perioperative Care', 20, 0, 0, '', ''),
('clinical_plans', 'rheum_arth_plan_cqm', 'Rheumatoid Arthritis', 25, 0, 0, '', ''),
('clinical_plans', 'back_pain_plan_cqm', 'Back Pain', 30, 0, 0, '', ''),
('clinical_plans', 'cabg_plan_cqm', 'Coronary Artery Bypass Graft (CABG)', 35, 0, 0, '', ''),
('clinical_plans', 'dm_plan', 'Diabetes Mellitus', 500, 0, 0, '', ''),
('clinical_plans', 'prevent_plan', 'Preventative Care', 510, 0, 0, '', ''),
('lists', 'clinical_rules', 'Clinical Rules', 3, 0, 0, '', ''),
('clinical_rules', 'problem_list_amc', 'Maintain an up-to-date problem list of current and active diagnoses.', 5, 0, 0, '', ''),
('clinical_rules', 'med_list_amc', 'Maintain active medication list.', 10, 0, 0, '', ''),
('clinical_rules', 'med_allergy_list_amc', 'Maintain active medication allergy list.', 15, 0, 0, '', ''),
('clinical_rules', 'record_vitals_amc', 'Record and chart changes in vital signs.', 20, 0, 0, '', ''),
('clinical_rules', 'record_smoke_amc', 'Record smoking status for patients 13 years old or older.', 25, 0, 0, '', ''),
('clinical_rules', 'lab_result_amc', 'Incorporate clinical lab-test results into certified EHR technology as structured data.', 30, 0, 0, '', ''),
('clinical_rules', 'med_reconc_amc', 'The EP, eligible hospital or CAH who receives a patient from another setting of care or provider of care or believes an encounter is relevant should perform medication reconciliation.', 35, 0, 0, '', ''),
('clinical_rules', 'patient_edu_amc', 'Use certified EHR technology to identify patient-specific education resources and provide those resources to the patient if appropriate.', 40, 0, 0, '', ''),
('clinical_rules', 'cpoe_med_amc', 'Use CPOE for medication orders directly entered by any licensed healthcare professional who can enter orders into the medical record per state, local and professional guidelines.', 45, 0, 0, '', ''),
('clinical_rules', 'e_prescribe_amc', 'Generate and transmit permissible prescriptions electronically.', 50, 0, 0, '', ''),
('clinical_rules', 'record_dem_amc', 'Record demographics.', 55, 0, 0, '', ''),
('clinical_rules', 'send_reminder_amc', 'Send reminders to patients per patient preference for preventive/follow up care.', 60, 0, 0, '', ''),
('clinical_rules', 'provide_rec_pat_amc', 'Provide patients with an electronic copy of their health information (including diagnostic test results, problem list, medication lists, medication allergies), upon request.', 65, 0, 0, '', ''),
('clinical_rules', 'timely_access_amc', 'Provide patients with timely electronic access to their health information (including lab results, problem list, medication lists, medication allergies) within four business days of the information being available to the EP.', 70, 0, 0, '', ''),
('clinical_rules', 'provide_sum_pat_amc', 'Provide clinical summaries for patients for each office visit.', 75, 0, 0, '', ''),
('clinical_rules', 'send_sum_amc', 'The EP, eligible hospital or CAH who transitions their patient to another setting of care or provider of care or refers their patient to another provider of care should provide summary of care record for each transition of care or referral.', 80, 0, 0, '', ''),
('clinical_rules', 'rule_htn_bp_measure_cqm', 'Hypertension: Blood Pressure Measurement (CQM)', 200, 0, 0, '', ''),
('clinical_rules', 'rule_tob_use_assess_cqm', 'Tobacco Use Assessment (CQM)', 205, 0, 0, '', ''),
('clinical_rules', 'rule_tob_cess_inter_cqm', 'Tobacco Cessation Intervention (CQM)', 210, 0, 0, '', ''),
('clinical_rules', 'rule_adult_wt_screen_fu_cqm', 'Adult Weight Screening and Follow-Up (CQM)', 220, 0, 0, '', ''),
('clinical_rules', 'rule_wt_assess_couns_child_cqm', 'Weight Assessment and Counseling for Children and Adolescents (CQM)', 230, 0, 0, '', ''),
('clinical_rules', 'rule_influenza_ge_50_cqm', 'Influenza Immunization for Patients >= 50 Years Old (CQM)', 240, 0, 0, '', ''),
('clinical_rules', 'rule_child_immun_stat_cqm', 'Childhood immunization Status (CQM)', 250, 0, 0, '', ''),
('clinical_rules', 'rule_pneumovacc_ge_65_cqm', 'Pneumonia Vaccination Status for Older Adults (CQM)', 260, 0, 0, '', ''),
('clinical_rules', 'rule_dm_eye_cqm', 'Diabetes: Eye Exam (CQM)', 270, 0, 0, '', ''),
('clinical_rules', 'rule_dm_foot_cqm', 'Diabetes: Foot Exam (CQM)', 280, 0, 0, '', ''),
('clinical_rules', 'rule_dm_a1c_cqm', 'Diabetes: HbA1c Poor Control (CQM)', 285, 0, 0, '', ''),
('clinical_rules', 'rule_dm_bp_control_cqm', 'Diabetes: Blood Pressure Management (CQM)', 290, 0, 0, '', ''),
('clinical_rules', 'rule_dm_ldl_cqm', 'Diabetes: LDL Management & Control (CQM)', 300, 0, 0, '', ''),
('clinical_rules', 'rule_htn_bp_measure', 'Hypertension: Blood Pressure Measurement', 500, 0, 0, '', ''),
('clinical_rules', 'rule_tob_use_assess', 'Tobacco Use Assessment', 510, 0, 0, '', ''),
('clinical_rules', 'rule_tob_cess_inter', 'Tobacco Cessation Intervention', 520, 0, 0, '', ''),
('clinical_rules', 'rule_adult_wt_screen_fu', 'Adult Weight Screening and Follow-Up', 530, 0, 0, '', ''),
('clinical_rules', 'rule_wt_assess_couns_child', 'Weight Assessment and Counseling for Children and Adolescents', 540, 0, 0, '', ''),
('clinical_rules', 'rule_influenza_ge_50', 'Influenza Immunization for Patients >= 50 Years Old', 550, 0, 0, '', ''),
('clinical_rules', 'rule_pneumovacc_ge_65', 'Pneumonia Vaccination Status for Older Adults', 570, 0, 0, '', ''),
('clinical_rules', 'rule_dm_hemo_a1c', 'Diabetes: Hemoglobin A1C', 570, 0, 0, '', ''),
('clinical_rules', 'rule_dm_urine_alb', 'Diabetes: Urine Microalbumin', 590, 0, 0, '', ''),
('clinical_rules', 'rule_dm_eye', 'Diabetes: Eye Exam', 600, 0, 0, '', ''),
('clinical_rules', 'rule_dm_foot', 'Diabetes: Foot Exam', 610, 0, 0, '', ''),
('clinical_rules', 'rule_cs_mammo', 'Cancer Screening: Mammogram', 620, 0, 0, '', ''),
('clinical_rules', 'rule_cs_pap', 'Cancer Screening: Pap Smear', 630, 0, 0, '', ''),
('clinical_rules', 'rule_cs_colon', 'Cancer Screening: Colon Cancer Screening', 640, 0, 0, '', ''),
('clinical_rules', 'rule_cs_prostate', 'Cancer Screening: Prostate Cancer Screening', 650, 0, 0, '', ''),
('clinical_rules', 'rule_inr_monitor', 'Coumadin Management - INR Monitoring', 1000, 0, 0, '', ''),
('clinical_rules', 'rule_appt_reminder', 'Appointment Reminder Rule', 2000, 0, 0, '', ''),
('lists', 'rule_targets', 'Clinical Rule Target Methods', 3, 0, 0, '', ''),
('rule_targets', 'target_database', 'Database', 10, 0, 0, '', ''),
('rule_targets', 'target_interval', 'Interval', 20, 0, 0, '', ''),
('rule_targets', 'target_proc', 'Procedure', 20, 0, 0, '', ''),
('rule_targets', 'target_appt', 'Appointment', 30, 0, 0, '', ''),
('lists', 'rule_target_intervals', 'Clinical Rules Target Intervals', 3, 0, 0, '', ''),
('rule_target_intervals', 'year', 'Year', 10, 0, 0, '', ''),
('rule_target_intervals', 'month', 'Month', 20, 0, 0, '', ''),
('rule_target_intervals', 'week', 'Week', 30, 0, 0, '', ''),
('rule_target_intervals', 'day', 'Day', 40, 0, 0, '', ''),
('rule_target_intervals', 'hour', 'Hour', 50, 0, 0, '', ''),
('rule_target_intervals', 'minute', 'Minute', 60, 0, 0, '', ''),
('rule_target_intervals', 'second', 'Second', 70, 0, 0, '', ''),
('rule_target_intervals', 'flu_season', 'Flu Season', 80, 0, 0, '', ''),
('lists', 'rule_comparisons', 'Clinical Rules Comparisons', 3, 0, 0, '', ''),
('rule_comparisons', 'EXIST', 'Exist', 10, 0, 0, '', ''),
('rule_comparisons', 'lt', 'Less Than', 20, 0, 0, '', ''),
('rule_comparisons', 'le', 'Less Than or Equal To', 30, 0, 0, '', ''),
('rule_comparisons', 'gt', 'Greater Than', 40, 0, 0, '', ''),
('rule_comparisons', 'ge', 'Greater Than or Equal To', 50, 0, 0, '', ''),
('lists', 'rule_filters', 'Clinical Rule Filter Methods', 3, 0, 0, '', ''),
('rule_filters', 'filt_database', 'Database', 10, 0, 0, '', ''),
('rule_filters', 'filt_diagnosis', 'Diagnosis', 20, 0, 0, '', ''),
('rule_filters', 'filt_sex', 'Gender', 30, 0, 0, '', ''),
('rule_filters', 'filt_age_max', 'Maximum Age', 40, 0, 0, '', ''),
('rule_filters', 'filt_age_min', 'Minimum Age', 50, 0, 0, '', ''),
('rule_filters', 'filt_proc', 'Procedure', 60, 0, 0, '', ''),
('rule_filters', 'filt_lists', 'Lists', 70, 0, 0, '', ''),
('lists', 'rule_age_intervals', 'Clinical Rules Age Intervals', 3, 0, 0, '', ''),
('rule_age_intervals', 'year', 'Year', 10, 0, 0, '', ''),
('rule_age_intervals', 'month', 'Month', 20, 0, 0, '', ''),
('lists', 'rule_enc_types', 'Clinical Rules Encounter Types', 3, 0, 0, '', ''),
('rule_enc_types', 'enc_outpatient', 'encounter outpatient', 10, 0, 0, '', ''),
('rule_enc_types', 'enc_nurs_fac', 'encounter nursing facility', 20, 0, 0, '', ''),
('rule_enc_types', 'enc_off_vis', 'encounter office visit', 30, 0, 0, '', ''),
('rule_enc_types', 'enc_hea_and_beh', 'encounter health and behavior assessment', 40, 0, 0, '', ''),
('rule_enc_types', 'enc_occ_ther', 'encounter occupational therapy', 50, 0, 0, '', ''),
('rule_enc_types', 'enc_psych_and_psych', 'encounter psychiatric & psychologic', 60, 0, 0, '', ''),
('rule_enc_types', 'enc_pre_med_ser_18_older', 'encounter preventive medicine services 18 and older', 70, 0, 0, '', ''),
('rule_enc_types', 'enc_pre_med_ser_40_older', 'encounter preventive medicine 40 and older', 75, 0, 0, '', ''),
('rule_enc_types', 'enc_pre_ind_counsel', 'encounter preventive medicine - individual counseling', 80, 0, 0, '', ''),
('rule_enc_types', 'enc_pre_med_group_counsel', 'encounter preventive medicine group counseling', 90, 0, 0, '', ''),
('rule_enc_types', 'enc_pre_med_other_serv', 'encounter preventive medicine other services', 100, 0, 0, '', ''),
('rule_enc_types', 'enc_out_pcp_obgyn', 'encounter outpatient w/PCP & obgyn', 110, 0, 0, '', ''),
('rule_enc_types', 'enc_pregnancy', 'encounter pregnancy', 120, 0, 0, '', ''),
('rule_enc_types', 'enc_nurs_discharge', 'encounter nursing discharge', 130, 0, 0, '', ''),
('rule_enc_types', 'enc_acute_inp_or_ed', 'encounter acute inpatient or ED', 130, 0, 0, '', ''),
('rule_enc_types', 'enc_nonac_inp_out_or_opth', 'Encounter: encounter non-acute inpt, outpatient, or ophthalmology', 140, 0, 0, '', ''),
('rule_enc_types', 'enc_influenza', 'encounter influenza', 150, 0, 0, '', ''),
('lists', 'rule_action_category', 'Clinical Rule Action Category', 3, 0, 0, '', ''),
('rule_action_category', 'act_cat_assess', 'Assessment', 10, 0, 0, '', ''),
('rule_action_category', 'act_cat_edu', 'Education', 20, 0, 0, '', ''),
('rule_action_category', 'act_cat_exam', 'Examination', 30, 0, 0, '', ''),
('rule_action_category', 'act_cat_inter', 'Intervention', 40, 0, 0, '', ''),
('rule_action_category', 'act_cat_measure', 'Measurement', 50, 0, 0, '', ''),
('rule_action_category', 'act_cat_treat', 'Treatment', 60, 0, 0, '', ''),
('rule_action_category', 'act_cat_remind', 'Reminder', 70, 0, 0, '', ''),
('lists', 'rule_action', 'Clinical Rule Action Item', 3, 0, 0, '', ''),
('rule_action', 'act_bp', 'Blood Pressure', 10, 0, 0, '', ''),
('rule_action', 'act_influvacc', 'Influenza Vaccine', 20, 0, 0, '', ''),
('rule_action', 'act_tobacco', 'Tobacco', 30, 0, 0, '', ''),
('rule_action', 'act_wt', 'Weight', 40, 0, 0, '', ''),
('rule_action', 'act_bmi', 'BMI', 43, 0, 0, '', ''),
('rule_action', 'act_nutrition', 'Nutrition', 45, 0, 0, '', ''),
('rule_action', 'act_exercise', 'Exercise', 47, 0, 0, '', ''),
('rule_action', 'act_pneumovacc', 'Pneumococcal Vaccine', 60, 0, 0, '', ''),
('rule_action', 'act_hemo_a1c', 'Hemoglobin A1C', 70, 0, 0, '', ''),
('rule_action', 'act_urine_alb', 'Urine Microalbumin', 80, 0, 0, '', ''),
('rule_action', 'act_eye', 'Opthalmic', 90, 0, 0, '', ''),
('rule_action', 'act_foot', 'Podiatric', 100, 0, 0, '', ''),
('rule_action', 'act_mammo', 'Mammogram', 110, 0, 0, '', ''),
('rule_action', 'act_pap', 'Pap Smear', 120, 0, 0, '', ''),
('rule_action', 'act_colon_cancer_screen', 'Colon Cancer Screening', 130, 0, 0, '', ''),
('rule_action', 'act_prostate_cancer_screen', 'Prostate Cancer Screening', 140, 0, 0, '', ''),
('rule_action', 'act_lab_inr', 'INR', 150, 0, 0, '', ''),
('rule_action', 'act_appointment', 'Appointment', 160, 0, 0, '', ''),
('lists', 'rule_reminder_intervals', 'Clinical Rules Reminder Intervals', 3, 0, 0, '', ''),
('rule_reminder_intervals', 'month', 'Month', 10, 0, 0, '', ''),
('rule_reminder_intervals', 'week', 'Week', 20, 0, 0, '', ''),
('lists', 'rule_reminder_methods', 'Clinical Rules Reminder Methods', 3, 0, 0, '', ''),
('rule_reminder_methods', 'clinical_reminder_pre', 'Past Due Interval (Clinical Reminders)', 10, 0, 0, '', ''),
('rule_reminder_methods', 'patient_reminder_pre', 'Past Due Interval (Patient Reminders)', 20, 0, 0, '', ''),
('rule_reminder_methods', 'clinical_reminder_post', 'Soon Due Interval (Clinical Reminders)', 30, 0, 0, '', ''),
('rule_reminder_methods', 'patient_reminder_post', 'Soon Due Interval (Patient Reminders)', 40, 0, 0, '', ''),
('lists', 'rule_reminder_due_opt', 'Clinical Rules Reminder Due Options', 3, 0, 0, '', ''),
('rule_reminder_due_opt', 'due', 'Due', 10, 0, 0, '', ''),
('rule_reminder_due_opt', 'soon_due', 'Due Soon', 20, 0, 0, '', ''),
('rule_reminder_due_opt', 'past_due', 'Past Due', 30, 0, 0, '', ''),
('rule_reminder_due_opt', 'not_due', 'Not Due', 30, 0, 0, '', ''),
('lists', 'rule_reminder_inactive_opt', 'Clinical Rules Reminder Inactivation Options', 3, 0, 0, '', ''),
('rule_reminder_inactive_opt', 'auto', 'Automatic', 10, 0, 0, '', ''),
('rule_reminder_inactive_opt', 'due_status_update', 'Due Status Update', 20, 0, 0, '', ''),
('rule_reminder_inactive_opt', 'manual', 'Manual', 20, 0, 0, '', ''),
('newcrop_erx_role', 'erxadmin', 'NewCrop Admin', 5, 0, 0, '', ''),
('newcrop_erx_role', 'erxdoctor', 'NewCrop Doctor', 20, 0, 0, '', ''),
('newcrop_erx_role', 'erxmanager', 'NewCrop Manager', 15, 0, 0, '', ''),
('newcrop_erx_role', 'erxmidlevelPrescriber', 'NewCrop Midlevel Prescriber', 25, 0, 0, '', ''),
('newcrop_erx_role', 'erxnurse', 'NewCrop Nurse', 10, 0, 0, '', ''),
('newcrop_erx_role', 'erxsupervisingDoctor', 'NewCrop Supervising Doctor', 30, 0, 0, '', ''),
('lists', 'newcrop_erx_role', 'NewCrop eRx Role', 221, 0, 0, '', ''),
('lists', 'msp_remit_codes', 'MSP Remit Codes', 221, 0, 0, '', ''),
('msp_remit_codes', '1', '1', 1, 0, 0, '', 'Deductible Amount'),
('msp_remit_codes', '2', '2', 2, 0, 0, '', 'Coinsurance Amount'),
('msp_remit_codes', '3', '3', 3, 0, 0, '', 'Co-payment Amount'),
('msp_remit_codes', '4', '4', 4, 0, 0, '', 'The procedure code is inconsistent with the modifier used or a required modifier is missing. Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 Service Payment Information REF), if present.'),
('msp_remit_codes', '9', '9', 9, 0, 0, '', 'The diagnosis is inconsistent with the patient''s age. Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 Service Payment Information REF), if present.'),
('msp_remit_codes', '10', '10', 10, 0, 0, '', 'The diagnosis is inconsistent with the patient''s gender. Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 Service Payment Information REF), if present.'),
('msp_remit_codes', '11', '11', 11, 0, 0, '', 'The diagnosis is inconsistent with the procedure. Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 Service Payment Information REF), if present.'),
('msp_remit_codes', '12', '12', 12, 0, 0, '', 'The diagnosis is inconsistent with the provider type. Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 Service Payment Information REF), if present.'),
('msp_remit_codes', '13', '13', 13, 0, 0, '', 'The date of death precedes the date of service.'),
('msp_remit_codes', '14', '14', 14, 0, 0, '', 'The date of birth follows the date of service.'),
('msp_remit_codes', '15', '15', 15, 0, 0, '', 'The authorization number is missing, invalid, or does not apply to the billed services or provider.'),
('msp_remit_codes', '16', '16', 16, 0, 0, '', 'Claim/service lacks information which is needed for adjudication. At least one Remark Code must be provided (may be comprised of either the NCPDP Reject Reason Code, or Remittance Advice Remark Code that is not an ALERT.)'),
('msp_remit_codes', '18', '18', 17, 0, 0, '', 'Duplicate claim/service.'),
('msp_remit_codes', '19', '19', 18, 0, 0, '', 'This is a work-related injury/illness and thus the liability of the Worker''s Compensation Carrier.'),
('msp_remit_codes', '20', '20', 19, 0, 0, '', 'This injury/illness is covered by the liability carrier.'),
('msp_remit_codes', '21', '21', 20, 0, 0, '', 'This injury/illness is the liability of the no-fault carrier.'),
('msp_remit_codes', '22', '22', 21, 0, 0, '', 'This care may be covered by another payer per coordination of benefits.'),
('msp_remit_codes', '23', '23', 22, 0, 0, '', 'The impact of prior payer(s) adjudication including payments and/or adjustments.'),
('msp_remit_codes', '24', '24', 23, 0, 0, '', 'Charges are covered under a capitation agreement/managed care plan.'),
('msp_remit_codes', '26', '26', 24, 0, 0, '', 'Expenses incurred prior to coverage.'),
('msp_remit_codes', '27', '27', 25, 0, 0, '', 'Expenses incurred after coverage terminated.'),
('msp_remit_codes', '29', '29', 26, 0, 0, '', 'The time limit for filing has expired.'),
('msp_remit_codes', '31', '31', 27, 0, 0, '', 'Patient cannot be identified as our insured.'),
('msp_remit_codes', '32', '32', 28, 0, 0, '', 'Our records indicate that this dependent is not an eligible dependent as defined.'),
('msp_remit_codes', '33', '33', 29, 0, 0, '', 'Insured has no dependent coverage.'),
('msp_remit_codes', '34', '34', 30, 0, 0, '', 'Insured has no coverage for newborns.'),
('msp_remit_codes', '35', '35', 31, 0, 0, '', 'Lifetime benefit maximum has been reached.'),
('msp_remit_codes', '38', '38', 32, 0, 0, '', 'Services not provided or authorized by designated (network/primary care) providers.'),
('msp_remit_codes', '39', '39', 33, 0, 0, '', 'Services denied at the time authorization/pre-certification was requested.'),
('msp_remit_codes', '40', '40', 34, 0, 0, '', 'Charges do not meet qualifications for emergent/urgent care. Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 Service Payment Information REF), if present.'),
('msp_remit_codes', '44', '44', 35, 0, 0, '', 'Prompt-pay discount.'),
('msp_remit_codes', '45', '45', 36, 0, 0, '', 'Charge exceeds fee schedule/maximum allowable or contracted/legislated fee arrangement. (Use Group Codes PR or CO depending upon liability).'),
('msp_remit_codes', '49', '49', 37, 0, 0, '', 'These are non-covered services because this is a routine exam or screening procedure done in conjunction with a routine exam. Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 Service Payment Information REF), if present.'),
('msp_remit_codes', '50', '50', 38, 0, 0, '', 'These are non-covered services because this is not deemed a ''medical necessity'' by the payer. Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 Service Payment Information REF), if present.'),
('msp_remit_codes', '51', '51', 39, 0, 0, '', 'These are non-covered services because this is a pre-existing condition. Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 Service Payment Information REF), if present.'),
('msp_remit_codes', '53', '53', 40, 0, 0, '', 'Services by an immediate relative or a member of the same household are not covered.'),
('msp_remit_codes', '54', '54', 41, 0, 0, '', 'Multiple physicians/assistants are not covered in this case. Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 Service Payment Information REF), if present.'),
('msp_remit_codes', '55', '55', 42, 0, 0, '', 'Procedure/treatment is deemed experimental/investigational by the payer. Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 Service Payment Information REF), if present.'),
('msp_remit_codes', '56', '56', 43, 0, 0, '', 'Procedure/treatment has not been deemed ''proven to be effective'' by the payer. Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 Service Payment Information REF), if present.'),
('msp_remit_codes', '58', '58', 44, 0, 0, '', 'Treatment was deemed by the payer to have been rendered in an inappropriate or invalid place of service. Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 Service Payment Information REF), if present.'),
('msp_remit_codes', '59', '59', 45, 0, 0, '', 'Processed based on multiple or concurrent procedure rules. (For example multiple surgery or diagnostic imaging, concurrent anesthesia.) Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 Service Payment Information REF), if present'),
('msp_remit_codes', '60', '60', 46, 0, 0, '', 'Charges for outpatient services are not covered when performed within a period of time prior to or after inpatient services.'),
('msp_remit_codes', '61', '61', 47, 0, 0, '', 'Penalty for failure to obtain second surgical opinion. Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 Service Payment Information REF), if present.'),
('msp_remit_codes', '66', '66', 48, 0, 0, '', 'Blood Deductible.'),
('msp_remit_codes', '69', '69', 49, 0, 0, '', 'Day outlier amount.'),
('msp_remit_codes', '70', '70', 50, 0, 0, '', 'Cost outlier - Adjustment to compensate for additional costs.'),
('msp_remit_codes', '74', '74', 51, 0, 0, '', 'Indirect Medical Education Adjustment.'),
('msp_remit_codes', '75', '75', 52, 0, 0, '', 'Direct Medical Education Adjustment.'),
('msp_remit_codes', '76', '76', 53, 0, 0, '', 'Disproportionate Share Adjustment.'),
('msp_remit_codes', '78', '78', 54, 0, 0, '', 'Non-Covered days/Room charge adjustment.'),
('msp_remit_codes', '85', '85', 55, 0, 0, '', 'Patient Interest Adjustment (Use Only Group code PR)'),
('msp_remit_codes', '87', '87', 56, 0, 0, '', 'Transfer amount.'),
('msp_remit_codes', '89', '89', 57, 0, 0, '', 'Professional fees removed from charges.'),
('msp_remit_codes', '90', '90', 58, 0, 0, '', 'Ingredient cost adjustment. Note: To be used for pharmaceuticals only.'),
('msp_remit_codes', '91', '91', 59, 0, 0, '', 'Dispensing fee adjustment.'),
('msp_remit_codes', '94', '94', 60, 0, 0, '', 'Processed in Excess of charges.'),
('msp_remit_codes', '95', '95', 61, 0, 0, '', 'Plan procedures not followed.');
INSERT INTO `list_options` (`list_id`, `option_id`, `title`, `seq`, `is_default`, `option_value`, `mapping`, `notes`) VALUES
('msp_remit_codes', '96', '96', 62, 0, 0, '', 'Non-covered charge(s). At least one Remark Code must be provided (may be comprised of either the NCPDP Reject Reason Code, or Remittance Advice Remark Code that is not an ALERT.) Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 S'),
('msp_remit_codes', '97', '97', 63, 0, 0, '', 'The benefit for this service is included in the payment/allowance for another service/procedure that has already been adjudicated. Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 Service Payment Information REF), if present.'),
('msp_remit_codes', '100', '100', 64, 0, 0, '', 'Payment made to patient/insured/responsible party/employer.'),
('msp_remit_codes', '101', '101', 65, 0, 0, '', 'Predetermination: anticipated payment upon completion of services or claim adjudication.'),
('msp_remit_codes', '102', '102', 66, 0, 0, '', 'Major Medical Adjustment.'),
('msp_remit_codes', '103', '103', 67, 0, 0, '', 'Provider promotional discount (e.g., Senior citizen discount).'),
('msp_remit_codes', '104', '104', 68, 0, 0, '', 'Managed care withholding.'),
('msp_remit_codes', '105', '105', 69, 0, 0, '', 'Tax withholding.'),
('msp_remit_codes', '106', '106', 70, 0, 0, '', 'Patient payment option/election not in effect.'),
('msp_remit_codes', '107', '107', 71, 0, 0, '', 'The related or qualifying claim/service was not identified on this claim. Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 Service Payment Information REF), if present.'),
('msp_remit_codes', '108', '108', 72, 0, 0, '', 'Rent/purchase guidelines were not met. Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 Service Payment Information REF), if present.'),
('msp_remit_codes', '109', '109', 73, 0, 0, '', 'Claim not covered by this payer/contractor. You must send the claim to the correct payer/contractor.'),
('msp_remit_codes', '110', '110', 74, 0, 0, '', 'Billing date predates service date.'),
('msp_remit_codes', '111', '111', 75, 0, 0, '', 'Not covered unless the provider accepts assignment.'),
('msp_remit_codes', '112', '112', 76, 0, 0, '', 'Service not furnished directly to the patient and/or not documented.'),
('msp_remit_codes', '114', '114', 77, 0, 0, '', 'Procedure/product not approved by the Food and Drug Administration.'),
('msp_remit_codes', '115', '115', 78, 0, 0, '', 'Procedure postponed, canceled, or delayed.'),
('msp_remit_codes', '116', '116', 79, 0, 0, '', 'The advance indemnification notice signed by the patient did not comply with requirements.'),
('msp_remit_codes', '117', '117', 80, 0, 0, '', 'Transportation is only covered to the closest facility that can provide the necessary care.'),
('msp_remit_codes', '118', '118', 81, 0, 0, '', 'ESRD network support adjustment.'),
('msp_remit_codes', '119', '119', 82, 0, 0, '', 'Benefit maximum for this time period or occurrence has been reached.'),
('msp_remit_codes', '121', '121', 83, 0, 0, '', 'Indemnification adjustment - compensation for outstanding member responsibility.'),
('msp_remit_codes', '122', '122', 84, 0, 0, '', 'Psychiatric reduction.'),
('msp_remit_codes', '125', '125', 85, 0, 0, '', 'Submission/billing error(s). At least one Remark Code must be provided (may be comprised of either the NCPDP Reject Reason Code, or Remittance Advice Remark Code that is not an ALERT.)'),
('msp_remit_codes', '128', '128', 86, 0, 0, '', 'Newborn''s services are covered in the mother''s Allowance.'),
('msp_remit_codes', '129', '129', 87, 0, 0, '', 'Prior processing information appears incorrect. At least one Remark Code must be provided (may be comprised of either the NCPDP Reject Reason Code, or Remittance Advice Remark Code that is not an ALERT.)'),
('msp_remit_codes', '130', '130', 88, 0, 0, '', 'Claim submission fee.'),
('msp_remit_codes', '131', '131', 89, 0, 0, '', 'Claim specific negotiated discount.'),
('msp_remit_codes', '132', '132', 90, 0, 0, '', 'Prearranged demonstration project adjustment.'),
('msp_remit_codes', '133', '133', 91, 0, 0, '', 'The disposition of this claim/service is pending further review.'),
('msp_remit_codes', '134', '134', 92, 0, 0, '', 'Technical fees removed from charges.'),
('msp_remit_codes', '135', '135', 93, 0, 0, '', 'Interim bills cannot be processed.'),
('msp_remit_codes', '136', '136', 94, 0, 0, '', 'Failure to follow prior payer''s coverage rules. (Use Group Code OA).'),
('msp_remit_codes', '137', '137', 95, 0, 0, '', 'Regulatory Surcharges, Assessments, Allowances or Health Related Taxes.'),
('msp_remit_codes', '138', '138', 96, 0, 0, '', 'Appeal procedures not followed or time limits not met.'),
('msp_remit_codes', '139', '139', 97, 0, 0, '', 'Contracted funding agreement - Subscriber is employed by the provider of services.'),
('msp_remit_codes', '140', '140', 98, 0, 0, '', 'Patient/Insured health identification number and name do not match.'),
('msp_remit_codes', '141', '141', 99, 0, 0, '', 'Claim spans eligible and ineligible periods of coverage.'),
('msp_remit_codes', '142', '142', 100, 0, 0, '', 'Monthly Medicaid patient liability amount.'),
('msp_remit_codes', '143', '143', 101, 0, 0, '', 'Portion of payment deferred.'),
('msp_remit_codes', '144', '144', 102, 0, 0, '', 'Incentive adjustment, e.g. preferred product/service.'),
('msp_remit_codes', '146', '146', 103, 0, 0, '', 'Diagnosis was invalid for the date(s) of service reported.'),
('msp_remit_codes', '147', '147', 104, 0, 0, '', 'Provider contracted/negotiated rate expired or not on file.'),
('msp_remit_codes', '148', '148', 105, 0, 0, '', 'Information from another provider was not provided or was insufficient/incomplete. At least one Remark Code must be provided (may be comprised of either the NCPDP Reject Reason Code, or Remittance Advice Remark Code that is not an ALERT.)'),
('msp_remit_codes', '149', '149', 106, 0, 0, '', 'Lifetime benefit maximum has been reached for this service/benefit category.'),
('msp_remit_codes', '150', '150', 107, 0, 0, '', 'Payer deems the information submitted does not support this level of service.'),
('msp_remit_codes', '151', '151', 108, 0, 0, '', 'Payment adjusted because the payer deems the information submitted does not support this many/frequency of services.'),
('msp_remit_codes', '152', '152', 109, 0, 0, '', 'Payer deems the information submitted does not support this length of service. Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 Service Payment Information REF), if present.'),
('msp_remit_codes', '153', '153', 110, 0, 0, '', 'Payer deems the information submitted does not support this dosage.'),
('msp_remit_codes', '154', '154', 111, 0, 0, '', 'Payer deems the information submitted does not support this day''s supply.'),
('msp_remit_codes', '155', '155', 112, 0, 0, '', 'Patient refused the service/procedure.'),
('msp_remit_codes', '157', '157', 113, 0, 0, '', 'Service/procedure was provided as a result of an act of war.'),
('msp_remit_codes', '158', '158', 114, 0, 0, '', 'Service/procedure was provided outside of the United States.'),
('msp_remit_codes', '159', '159', 115, 0, 0, '', 'Service/procedure was provided as a result of terrorism.'),
('msp_remit_codes', '160', '160', 116, 0, 0, '', 'Injury/illness was the result of an activity that is a benefit exclusion.'),
('msp_remit_codes', '161', '161', 117, 0, 0, '', 'Provider performance bonus'),
('msp_remit_codes', '162', '162', 118, 0, 0, '', 'State-mandated Requirement for Property and Casualty, see Claim Payment Remarks Code for specific explanation.'),
('msp_remit_codes', '163', '163', 119, 0, 0, '', 'Attachment referenced on the claim was not received.'),
('msp_remit_codes', '164', '164', 120, 0, 0, '', 'Attachment referenced on the claim was not received in a timely fashion.'),
('msp_remit_codes', '165', '165', 121, 0, 0, '', 'Referral absent or exceeded.'),
('msp_remit_codes', '166', '166', 122, 0, 0, '', 'These services were submitted after this payers responsibility for processing claims under this plan ended.'),
('msp_remit_codes', '167', '167', 123, 0, 0, '', 'This (these) diagnosis(es) is (are) not covered. Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 Service Payment Information REF), if present.'),
('msp_remit_codes', '168', '168', 124, 0, 0, '', 'Service(s) have been considered under the patient''s medical plan. Benefits are not available under this dental plan.'),
('msp_remit_codes', '169', '169', 125, 0, 0, '', 'Alternate benefit has been provided.'),
('msp_remit_codes', '170', '170', 126, 0, 0, '', 'Payment is denied when performed/billed by this type of provider. Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 Service Payment Information REF), if present.'),
('msp_remit_codes', '171', '171', 127, 0, 0, '', 'Payment is denied when performed/billed by this type of provider in this type of facility. Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 Service Payment Information REF), if present.'),
('msp_remit_codes', '172', '172', 128, 0, 0, '', 'Payment is adjusted when performed/billed by a provider of this specialty. Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 Service Payment Information REF), if present.'),
('msp_remit_codes', '173', '173', 129, 0, 0, '', 'Service was not prescribed by a physician.'),
('msp_remit_codes', '174', '174', 130, 0, 0, '', 'Service was not prescribed prior to delivery.'),
('msp_remit_codes', '175', '175', 131, 0, 0, '', 'Prescription is incomplete.'),
('msp_remit_codes', '176', '176', 132, 0, 0, '', 'Prescription is not current.'),
('msp_remit_codes', '177', '177', 133, 0, 0, '', 'Patient has not met the required eligibility requirements.'),
('msp_remit_codes', '178', '178', 134, 0, 0, '', 'Patient has not met the required spend down requirements.'),
('msp_remit_codes', '179', '179', 135, 0, 0, '', 'Patient has not met the required waiting requirements. Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 Service Payment Information REF), if present.'),
('msp_remit_codes', '180', '180', 136, 0, 0, '', 'Patient has not met the required residency requirements.'),
('msp_remit_codes', '181', '181', 137, 0, 0, '', 'Procedure code was invalid on the date of service.'),
('msp_remit_codes', '182', '182', 138, 0, 0, '', 'Procedure modifier was invalid on the date of service.'),
('msp_remit_codes', '183', '183', 139, 0, 0, '', 'The referring provider is not eligible to refer the service billed. Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 Service Payment Information REF), if present.'),
('msp_remit_codes', '184', '184', 140, 0, 0, '', 'The prescribing/ordering provider is not eligible to prescribe/order the service billed. Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 Service Payment Information REF), if present.'),
('msp_remit_codes', '185', '185', 141, 0, 0, '', 'The rendering provider is not eligible to perform the service billed. Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 Service Payment Information REF), if present.'),
('msp_remit_codes', '186', '186', 142, 0, 0, '', 'Level of care change adjustment.'),
('msp_remit_codes', '187', '187', 143, 0, 0, '', 'Consumer Spending Account payments (includes but is not limited to Flexible Spending Account, Health Savings Account, Health Reimbursement Account, etc.)'),
('msp_remit_codes', '188', '188', 144, 0, 0, '', 'This product/procedure is only covered when used according to FDA recommendations.'),
('msp_remit_codes', '189', '189', 145, 0, 0, '', '''''Not otherwise classified'' or ''unlisted'' procedure code (CPT/HCPCS) was billed when there is a specific procedure code for this procedure/service'''),
('msp_remit_codes', '190', '190', 146, 0, 0, '', 'Payment is included in the allowance for a Skilled Nursing Facility (SNF) qualified stay.'),
('msp_remit_codes', '191', '191', 147, 0, 0, '', 'Not a work related injury/illness and thus not the liability of the workers'' compensation carrier Note: If adjustment is at the Claim Level, the payer must send and the provider should refer to the 835 Insurance Policy Number Segment (Loop 2100 Other Clai'),
('msp_remit_codes', '192', '192', 148, 0, 0, '', 'Non standard adjustment code from paper remittance. Note: This code is to be used by providers/payers providing Coordination of Benefits information to another payer in the 837 transaction only. This code is only used when the non-standard code cannot be '),
('msp_remit_codes', '193', '193', 149, 0, 0, '', 'Original payment decision is being maintained. Upon review, it was determined that this claim was processed properly.'),
('msp_remit_codes', '194', '194', 150, 0, 0, '', 'Anesthesia performed by the operating physician, the assistant surgeon or the attending physician.'),
('msp_remit_codes', '195', '195', 151, 0, 0, '', 'Refund issued to an erroneous priority payer for this claim/service.'),
('msp_remit_codes', '197', '197', 152, 0, 0, '', 'Precertification/authorization/notification absent.'),
('msp_remit_codes', '198', '198', 153, 0, 0, '', 'Precertification/authorization exceeded.'),
('msp_remit_codes', '199', '199', 154, 0, 0, '', 'Revenue code and Procedure code do not match.'),
('msp_remit_codes', '200', '200', 155, 0, 0, '', 'Expenses incurred during lapse in coverage'),
('msp_remit_codes', '201', '201', 156, 0, 0, '', 'Workers Compensation case settled. Patient is responsible for amount of this claim/service through WC ''Medicare set aside arrangement'' or other agreement. (Use group code PR).'),
('msp_remit_codes', '202', '202', 157, 0, 0, '', 'Non-covered personal comfort or convenience services.'),
('msp_remit_codes', '203', '203', 158, 0, 0, '', 'Discontinued or reduced service.'),
('msp_remit_codes', '204', '204', 159, 0, 0, '', 'This service/equipment/drug is not covered under the patient?s current benefit plan'),
('msp_remit_codes', '205', '205', 160, 0, 0, '', 'Pharmacy discount card processing fee'),
('msp_remit_codes', '206', '206', 161, 0, 0, '', 'National Provider Identifier - missing.'),
('msp_remit_codes', '207', '207', 162, 0, 0, '', 'National Provider identifier - Invalid format'),
('msp_remit_codes', '208', '208', 163, 0, 0, '', 'National Provider Identifier - Not matched.'),
('msp_remit_codes', '209', '209', 164, 0, 0, '', 'Per regulatory or other agreement. The provider cannot collect this amount from the patient. However, this amount may be billed to subsequent payer. Refund to patient if collected. (Use Group code OA)'),
('msp_remit_codes', '210', '210', 165, 0, 0, '', 'Payment adjusted because pre-certification/authorization not received in a timely fashion'),
('msp_remit_codes', '211', '211', 166, 0, 0, '', 'National Drug Codes (NDC) not eligible for rebate, are not covered.'),
('msp_remit_codes', '212', '212', 167, 0, 0, '', 'Administrative surcharges are not covered'),
('msp_remit_codes', '213', '213', 168, 0, 0, '', 'Non-compliance with the physician self referral prohibition legislation or payer policy.'),
('msp_remit_codes', '214', '214', 169, 0, 0, '', 'Workers'' Compensation claim adjudicated as non-compensable. This Payer not liable for claim or service/treatment. Note: If adjustment is at the Claim Level, the payer must send and the provider should refer to the 835 Insurance Policy Number Segment (Loop'),
('msp_remit_codes', '215', '215', 170, 0, 0, '', 'Based on subrogation of a third party settlement'),
('msp_remit_codes', '216', '216', 171, 0, 0, '', 'Based on the findings of a review organization'),
('msp_remit_codes', '217', '217', 172, 0, 0, '', 'Based on payer reasonable and customary fees. No maximum allowable defined by legislated fee arrangement. (Note: To be used for Workers'' Compensation only)'),
('msp_remit_codes', '218', '218', 173, 0, 0, '', 'Based on entitlement to benefits. Note: If adjustment is at the Claim Level, the payer must send and the provider should refer to the 835 Insurance Policy Number Segment (Loop 2100 Other Claim Related Information REF qualifier ''IG'') for the jurisdictional'),
('msp_remit_codes', '219', '219', 174, 0, 0, '', 'Based on extent of injury. Note: If adjustment is at the Claim Level, the payer must send and the provider should refer to the 835 Insurance Policy Number Segment (Loop 2100 Other Claim Related Information REF qualifier ''IG'') for the jurisdictional regula'),
('msp_remit_codes', '220', '220', 175, 0, 0, '', 'The applicable fee schedule does not contain the billed code. Please resubmit a bill with the appropriate fee schedule code(s) that best describe the service(s) provided and supporting documentation if required. (Note: To be used for Workers'' Compensation'),
('msp_remit_codes', '221', '221', 176, 0, 0, '', 'Workers'' Compensation claim is under investigation. Note: If adjustment is at the Claim Level, the payer must send and the provider should refer to the 835 Insurance Policy Number Segment (Loop 2100 Other Claim Related Information REF qualifier ''IG'') for '),
('msp_remit_codes', '222', '222', 177, 0, 0, '', 'Exceeds the contracted maximum number of hours/days/units by this provider for this period. This is not patient specific. Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 Service Payment Information REF), if present.'),
('msp_remit_codes', '223', '223', 178, 0, 0, '', 'Adjustment code for mandated federal, state or local law/regulation that is not already covered by another code and is mandated before a new code can be created.'),
('msp_remit_codes', '224', '224', 179, 0, 0, '', 'Patient identification compromised by identity theft. Identity verification required for processing this and future claims.'),
('msp_remit_codes', '225', '225', 180, 0, 0, '', 'Penalty or Interest Payment by Payer (Only used for plan to plan encounter reporting within the 837)'),
('msp_remit_codes', '226', '226', 181, 0, 0, '', 'Information requested from the Billing/Rendering Provider was not provided or was insufficient/incomplete. At least one Remark Code must be provided (may be comprised of either the NCPDP Reject Reason Code, or Remittance Advice Remark Code that is not an '),
('msp_remit_codes', '227', '227', 182, 0, 0, '', 'Information requested from the patient/insured/responsible party was not provided or was insufficient/incomplete. At least one Remark Code must be provided (may be comprised of either the NCPDP Reject Reason Code, or Remittance Advice Remark Code that is '),
('msp_remit_codes', '228', '228', 183, 0, 0, '', 'Denied for failure of this provider, another provider or the subscriber to supply requested information to a previous payer for their adjudication'),
('msp_remit_codes', '229', '229', 184, 0, 0, '', 'Partial charge amount not considered by Medicare due to the initial claim Type of Bill being 12X. Note: This code can only be used in the 837 transaction to convey Coordination of Benefits information when the secondary payer?s cost avoidance policy allow'),
('msp_remit_codes', '230', '230', 185, 0, 0, '', 'No available or correlating CPT/HCPCS code to describe this service. Note: Used only by Property and Casualty.'),
('msp_remit_codes', '231', '231', 186, 0, 0, '', 'Mutually exclusive procedures cannot be done in the same day/setting. Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 Service Payment Information REF), if present.'),
('msp_remit_codes', '232', '232', 187, 0, 0, '', 'Institutional Transfer Amount. Note - Applies to institutional claims only and explains the DRG amount difference when the patient care crosses multiple institutions.'),
('msp_remit_codes', '233', '233', 188, 0, 0, '', 'Services/charges related to the treatment of a hospital-acquired condition or preventable medical error.'),
('msp_remit_codes', '234', '234', 189, 0, 0, '', 'This procedure is not paid separately. At least one Remark Code must be provided (may be comprised of either the NCPDP Reject Reason Code, or Remittance Advice Remark Code that is not an ALERT.)'),
('msp_remit_codes', '235', '235', 190, 0, 0, '', 'Sales Tax'),
('msp_remit_codes', '236', '236', 191, 0, 0, '', 'This procedure or procedure/modifier combination is not compatible with another procedure or procedure/modifier combination provided on the same day according to the National Correct Coding Initiative.'),
('msp_remit_codes', '237', '237', 192, 0, 0, '', 'Legislated/Regulatory Penalty. At least one Remark Code must be provided (may be comprised of either the NCPDP Reject Reason Code, or Remittance Advice Remark Code that is not an ALERT.)'),
('msp_remit_codes', 'A0', 'A0', 193, 0, 0, '', 'Patient refund amount.'),
('msp_remit_codes', 'A1', 'A1', 194, 0, 0, '', 'Claim/Service denied. At least one Remark Code must be provided (may be comprised of either the NCPDP Reject Reason Code, or Remittance Advice Remark Code that is not an ALERT.)'),
('msp_remit_codes', 'A5', 'A5', 195, 0, 0, '', 'Medicare Claim PPS Capital Cost Outlier Amount.'),
('msp_remit_codes', 'A6', 'A6', 196, 0, 0, '', 'Prior hospitalization or 30 day transfer requirement not met.'),
('msp_remit_codes', 'A7', 'A7', 197, 0, 0, '', 'Presumptive Payment Adjustment'),
('msp_remit_codes', 'A8', 'A8', 198, 0, 0, '', 'Ungroupable DRG.'),
('msp_remit_codes', 'B1', 'B1', 199, 0, 0, '', 'Non-covered visits.'),
('msp_remit_codes', 'B10', 'B10', 200, 0, 0, '', 'Allowed amount has been reduced because a component of the basic procedure/test was paid. The beneficiary is not liable for more than the charge limit for the basic procedure/test.'),
('msp_remit_codes', 'B11', 'B11', 201, 0, 0, '', 'The claim/service has been transferred to the proper payer/processor for processing. Claim/service not covered by this payer/processor.'),
('msp_remit_codes', 'B12', 'B12', 202, 0, 0, '', 'Services not documented in patients'' medical records.'),
('msp_remit_codes', 'B13', 'B13', 203, 0, 0, '', 'Previously paid. Payment for this claim/service may have been provided in a previous payment.'),
('msp_remit_codes', 'B14', 'B14', 204, 0, 0, '', 'Only one visit or consultation per physician per day is covered.'),
('msp_remit_codes', 'B15', 'B15', 205, 0, 0, '', 'This service/procedure requires that a qualifying service/procedure be received and covered. The qualifying other service/procedure has not been received/adjudicated. Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 Service Payme'),
('msp_remit_codes', 'B16', 'B16', 206, 0, 0, '', '''''New Patient'' qualifications were not met.'''),
('msp_remit_codes', 'B20', 'B20', 207, 0, 0, '', 'Procedure/service was partially or fully furnished by another provider.'),
('msp_remit_codes', 'B22', 'B22', 208, 0, 0, '', 'This payment is adjusted based on the diagnosis.'),
('msp_remit_codes', 'B23', 'B23', 209, 0, 0, '', 'Procedure billed is not authorized per your Clinical Laboratory Improvement Amendment (CLIA) proficiency test.'),
('msp_remit_codes', 'B4', 'B4', 210, 0, 0, '', 'Late filing penalty.'),
('msp_remit_codes', 'B5', 'B5', 211, 0, 0, '', 'Coverage/program guidelines were not met or were exceeded.'),
('msp_remit_codes', 'B7', 'B7', 212, 0, 0, '', 'This provider was not certified/eligible to be paid for this procedure/service on this date of service. Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 Service Payment Information REF), if present.'),
('msp_remit_codes', 'B8', 'B8', 213, 0, 0, '', 'Alternative services were available, and should have been utilized. Note: Refer to the 835 Healthcare Policy Identification Segment (loop 2110 Service Payment Information REF), if present.'),
('msp_remit_codes', 'B9', 'B9', 214, 0, 0, '', 'Patient is enrolled in a Hospice.'),
('msp_remit_codes', 'D23', 'D23', 215, 0, 0, '', 'This dual eligible patient is covered by Medicare Part D per Medicare Retro-Eligibility. At least one Remark Code must be provided (may be comprised of either the NCPDP Reject Reason Code, or Remittance Advice Remark Code that is not an ALERT.)'),
('msp_remit_codes', 'W1', 'W1', 216, 0, 0, '', 'Workers'' compensation jurisdictional fee schedule adjustment. Note: If adjustment is at the Claim Level, the payer must send and the provider should refer to the 835 Class of Contract Code Identification Segment (Loop 2100 Other Claim Related Information '),
('msp_remit_codes', 'W2', 'W2', 217, 0, 0, '', 'Payment reduced or denied based on workers'' compensation jurisdictional regulations or payment policies, use only if no other code is applicable. Note: If adjustment is at the Claim Level, the payer must send and the provider should refer to the 835 Insur'),
('lists', 'code_types', 'Code Types', 1, 0, 0, '', ''),
('lists', 'disclosure_type', 'Disclosure Type', 3, 0, 0, '', ''),
('disclosure_type', 'disclosure-treatment', 'Treatment', 10, 0, 0, '', ''),
('disclosure_type', 'disclosure-payment', 'Payment', 20, 0, 0, '', ''),
('disclosure_type', 'disclosure-healthcareoperations', 'Health Care Operations', 30, 0, 0, '', ''),
('lists', 'smoking_status', 'Smoking Status', 1, 0, 0, '', ''),
('smoking_status', '1', 'Current every day smoker', 10, 0, 0, '', ''),
('smoking_status', '2', 'Current some day smoker', 20, 0, 0, '', ''),
('smoking_status', '3', 'Former smoker', 30, 0, 0, '', ''),
('smoking_status', '4', 'Never smoker', 40, 0, 0, '', ''),
('smoking_status', '5', 'Smoker, current status unknown', 50, 0, 0, '', ''),
('smoking_status', '9', 'Unknown if ever smoked', 60, 0, 0, '', ''),
('lists', 'race', 'Race', 1, 0, 0, '', ''),
('race', 'amer_ind_or_alaska_native', 'American Indian or Alaska Native', 10, 0, 0, '', ''),
('race', 'Asian', 'Asian', 20, 0, 0, '', ''),
('race', 'black_or_afri_amer', 'Black or African American', 30, 0, 0, '', ''),
('race', 'native_hawai_or_pac_island', 'Native Hawaiian or Other Pacific Islander', 40, 0, 0, '', ''),
('race', 'white', 'White', 50, 0, 0, '', ''),
('lists', 'ethnicity', 'Ethnicity', 1, 0, 0, '', ''),
('ethnicity', 'hisp_or_latin', 'Hispanic or Latino', 10, 0, 0, '', ''),
('ethnicity', 'not_hisp_or_latin', 'Not Hispanic or Latino', 10, 0, 0, '', ''),
('lists', 'payment_date', 'Payment Date', 1, 0, 0, '', ''),
('payment_date', 'date_val', 'Date', 10, 0, 0, '', ''),
('payment_date', 'post_to_date', 'Post To Date', 20, 0, 0, '', ''),
('payment_date', 'deposit_date', 'Deposit Date', 30, 0, 0, '', '');

--
-- Dumping data for table `log`
--


--
-- Dumping data for table `notes`
--


--
-- Dumping data for table `notification_log`
--


--
-- Dumping data for table `notification_settings`
--

INSERT INTO `notification_settings` (`SettingsId`, `Send_SMS_Before_Hours`, `Send_Email_Before_Hours`, `SMS_gateway_username`, `SMS_gateway_password`, `SMS_gateway_apikey`, `type`) VALUES
(1, 150, 150, 'sms username', 'sms password', 'sms api key', 'SMS/Email Settings');

--
-- Dumping data for table `onotes`
--


--
-- Dumping data for table `openemr_modules`
--

INSERT INTO `openemr_modules` (`pn_id`, `pn_name`, `pn_type`, `pn_displayname`, `pn_description`, `pn_regid`, `pn_directory`, `pn_version`, `pn_admin_capable`, `pn_user_capable`, `pn_state`) VALUES
(46, 'PostCalendar', 2, 'PostCalendar', 'PostNuke Calendar Module', 0, 'PostCalendar', '4.0.0', 1, 1, 3);

--
-- Dumping data for table `openemr_module_vars`
--

INSERT INTO `openemr_module_vars` (`pn_id`, `pn_modname`, `pn_name`, `pn_value`) VALUES
(234, 'PostCalendar', 'pcNotifyEmail', ''),
(233, 'PostCalendar', 'pcNotifyAdmin', '0'),
(232, 'PostCalendar', 'pcCacheLifetime', '3600'),
(231, 'PostCalendar', 'pcUseCache', '0'),
(230, 'PostCalendar', 'pcDefaultView', 'day'),
(229, 'PostCalendar', 'pcTimeIncrement', '5'),
(228, 'PostCalendar', 'pcAllowUserCalendar', '1'),
(227, 'PostCalendar', 'pcAllowSiteWide', '1'),
(226, 'PostCalendar', 'pcTemplate', 'default'),
(225, 'PostCalendar', 'pcEventDateFormat', '%Y-%m-%d'),
(224, 'PostCalendar', 'pcDisplayTopics', '0'),
(223, 'PostCalendar', 'pcListHowManyEvents', '15'),
(222, 'PostCalendar', 'pcAllowDirectSubmit', '1'),
(221, 'PostCalendar', 'pcUsePopups', '0'),
(220, 'PostCalendar', 'pcDayHighlightColor', '#EEEEEE'),
(219, 'PostCalendar', 'pcFirstDayOfWeek', '1'),
(218, 'PostCalendar', 'pcUseInternationalDates', '0'),
(217, 'PostCalendar', 'pcEventsOpenInNewWindow', '0'),
(216, 'PostCalendar', 'pcTime24Hours', '0');

--
-- Dumping data for table `openemr_postcalendar_categories`
--

INSERT INTO `openemr_postcalendar_categories` (`pc_catid`, `pc_catname`, `pc_catcolor`, `pc_catdesc`, `pc_recurrtype`, `pc_enddate`, `pc_recurrspec`, `pc_recurrfreq`, `pc_duration`, `pc_end_date_flag`, `pc_end_date_type`, `pc_end_date_freq`, `pc_end_all_day`, `pc_dailylimit`, `pc_cattype`) VALUES
(5, 'Office Visit', '#FFFFCC', 'Normal Office Visit', 0, NULL, 'a:5:{s:17:"event_repeat_freq";s:1:"0";s:22:"event_repeat_freq_type";s:1:"0";s:19:"event_repeat_on_num";s:1:"1";s:19:"event_repeat_on_day";s:1:"0";s:20:"event_repeat_on_freq";s:1:"0";}', 0, 900, 0, 0, 0, 0, 0, 0),
(4, 'Vacation', '#EFEFEF', 'Reserved for use to define Scheduled Vacation Time', 0, NULL, 'a:5:{s:17:"event_repeat_freq";s:1:"0";s:22:"event_repeat_freq_type";s:1:"0";s:19:"event_repeat_on_num";s:1:"1";s:19:"event_repeat_on_day";s:1:"0";s:20:"event_repeat_on_freq";s:1:"0";}', 0, 0, 0, 0, 0, 1, 0, 1),
(1, 'No Show', '#DDDDDD', 'Reserved to define when an event did not occur as specified.', 0, NULL, 'a:5:{s:17:"event_repeat_freq";s:1:"0";s:22:"event_repeat_freq_type";s:1:"0";s:19:"event_repeat_on_num";s:1:"1";s:19:"event_repeat_on_day";s:1:"0";s:20:"event_repeat_on_freq";s:1:"0";}', 0, 0, 0, 0, 0, 0, 0, 0),
(2, 'In Office', '#99CCFF', 'Reserved todefine when a provider may haveavailable appointments after.', 1, NULL, 'a:5:{s:17:"event_repeat_freq";s:1:"1";s:22:"event_repeat_freq_type";s:1:"4";s:19:"event_repeat_on_num";s:1:"1";s:19:"event_repeat_on_day";s:1:"0";s:20:"event_repeat_on_freq";s:1:"0";}', 0, 0, 1, 3, 2, 0, 0, 1),
(3, 'Out Of Office', '#99FFFF', 'Reserved to define when a provider may not have available appointments after.', 1, NULL, 'a:5:{s:17:"event_repeat_freq";s:1:"1";s:22:"event_repeat_freq_type";s:1:"4";s:19:"event_repeat_on_num";s:1:"1";s:19:"event_repeat_on_day";s:1:"0";s:20:"event_repeat_on_freq";s:1:"0";}', 0, 0, 1, 3, 2, 0, 0, 1),
(8, 'Lunch', '#FFFF33', 'Lunch', 1, NULL, 'a:5:{s:17:"event_repeat_freq";s:1:"1";s:22:"event_repeat_freq_type";s:1:"4";s:19:"event_repeat_on_num";s:1:"1";s:19:"event_repeat_on_day";s:1:"0";s:20:"event_repeat_on_freq";s:1:"0";}', 0, 3600, 0, 3, 2, 0, 0, 1),
(9, 'Established Patient', '#CCFF33', '', 0, NULL, 'a:5:{s:17:"event_repeat_freq";s:1:"0";s:22:"event_repeat_freq_type";s:1:"0";s:19:"event_repeat_on_num";s:1:"1";s:19:"event_repeat_on_day";s:1:"0";s:20:"event_repeat_on_freq";s:1:"0";}', 0, 900, 0, 0, 0, 0, 0, 0),
(10, 'New Patient', '#CCFFFF', '', 0, NULL, 'a:5:{s:17:"event_repeat_freq";s:1:"0";s:22:"event_repeat_freq_type";s:1:"0";s:19:"event_repeat_on_num";s:1:"1";s:19:"event_repeat_on_day";s:1:"0";s:20:"event_repeat_on_freq";s:1:"0";}', 0, 1800, 0, 0, 0, 0, 0, 0),
(11, 'Reserved', '#FF7777', 'Reserved', 1, NULL, 'a:5:{s:17:"event_repeat_freq";s:1:"1";s:22:"event_repeat_freq_type";s:1:"4";s:19:"event_repeat_on_num";s:1:"1";s:19:"event_repeat_on_day";s:1:"0";s:20:"event_repeat_on_freq";s:1:"0";}', 0, 900, 0, 3, 2, 0, 0, 1);

--
-- Dumping data for table `openemr_postcalendar_events`
--


--
-- Dumping data for table `openemr_postcalendar_limits`
--


--
-- Dumping data for table `openemr_postcalendar_topics`
--


--
-- Dumping data for table `openemr_session_info`
--

INSERT INTO `openemr_session_info` (`pn_sessid`, `pn_ipaddr`, `pn_firstused`, `pn_lastused`, `pn_uid`, `pn_vars`) VALUES
('978d31441dccd350d406bfab98978f20', '127.0.0.1', 1109233952, 1109234177, 0, NULL);

--
-- Dumping data for table `patient_access_offsite`
--


--
-- Dumping data for table `patient_access_onsite`
--


--
-- Dumping data for table `patient_data`
--


--
-- Dumping data for table `patient_reminders`
--


--
-- Dumping data for table `payments`
--


--
-- Dumping data for table `pharmacies`
--


--
-- Dumping data for table `phone_numbers`
--


--
-- Dumping data for table `pma_bookmark`
--

INSERT INTO `pma_bookmark` (`id`, `dbase`, `user`, `label`, `query`) VALUES
(2, 'openemr', 'openemr', 'Aggregate Race Statistics', 'SELECT ethnoracial as "Race/Ethnicity", count(*) as Count FROM  `patient_data` WHERE 1 group by ethnoracial'),
(9, 'openemr', 'openemr', 'Search by Code', 'SELECT  b.code, concat(pd.fname," ", pd.lname) as "Patient Name", concat(u.fname," ", u.lname) as "Provider Name", en.reason as "Encounter Desc.", en.date\r\nFROM billing as b\r\nLEFT JOIN users AS u ON b.user = u.id\r\nLEFT JOIN patient_data as pd on b.pid = pd.pid\r\nLEFT JOIN form_encounter as en on b.encounter = en.encounter and b.pid = en.pid\r\nWHERE 1 /* and b.code like ''%[VARIABLE]%'' */ ORDER BY b.code'),
(8, 'openemr', 'openemr', 'Count No Shows By Provider since Interval ago', 'SELECT concat( u.fname,  " ", u.lname )  AS  "Provider Name", u.id AS  "Provider ID", count(  DISTINCT ev.pc_eid )  AS  "Number of No Shows"/* , concat(DATE_FORMAT(NOW(),''%Y-%m-%d''), '' and '',DATE_FORMAT(DATE_ADD(now(), INTERVAL [VARIABLE]),''%Y-%m-%d'') ) as "Between Dates" */ FROM  `openemr_postcalendar_events`  AS ev LEFT  JOIN users AS u ON ev.pc_aid = u.id WHERE ev.pc_catid =1/* and ( ev.pc_eventDate >= DATE_SUB(now(), INTERVAL [VARIABLE]) )  */\r\nGROUP  BY u.id;'),
(6, 'openemr', 'openemr', 'Appointments By Race/Ethnicity from today plus interval', 'SELECT  count(pd.ethnoracial) as "Number of Appointments", pd.ethnoracial AS  "Race/Ethnicity" /* , concat(DATE_FORMAT(NOW(),''%Y-%m-%d''), '' and '',DATE_FORMAT(DATE_ADD(now(), INTERVAL [VARIABLE]),''%Y-%m-%d'') ) as "Between Dates" */ FROM openemr_postcalendar_events AS ev LEFT  JOIN   `patient_data`  AS pd ON  pd.pid = ev.pc_pid where ev.pc_eventstatus=1 and ev.pc_catid = 5 and ev.pc_eventDate >= now()  /* and ( ev.pc_eventDate <= DATE_ADD(now(), INTERVAL [VARIABLE]) )  */ group by pd.ethnoracial');

--
-- Dumping data for table `pma_column_info`
--


--
-- Dumping data for table `pma_history`
--


--
-- Dumping data for table `pma_pdf_pages`
--


--
-- Dumping data for table `pma_relation`
--


--
-- Dumping data for table `pma_table_coords`
--


--
-- Dumping data for table `pma_table_info`
--


--
-- Dumping data for table `pnotes`
--


--
-- Dumping data for table `prescriptions`
--


--
-- Dumping data for table `prices`
--


--
-- Dumping data for table `procedure_order`
--


--
-- Dumping data for table `procedure_report`
--


--
-- Dumping data for table `procedure_result`
--


--
-- Dumping data for table `procedure_type`
--


--
-- Dumping data for table `registry`
--

INSERT INTO `registry` (`name`, `state`, `directory`, `id`, `sql_run`, `unpackaged`, `date`, `priority`, `category`, `nickname`) VALUES
('New Encounter Form', 1, 'newpatient', 1, 1, 1, '2003-09-14 15:16:45', 0, 'Administrative', ''),
('Review of Systems Checks', 1, 'reviewofs', 9, 1, 1, '2003-09-14 15:16:45', 0, 'Clinical', ''),
('Speech Dictation', 1, 'dictation', 10, 1, 1, '2003-09-14 15:16:45', 0, 'Clinical', ''),
('SOAP', 1, 'soap', 11, 1, 1, '2005-03-03 00:16:35', 0, 'Clinical', ''),
('Vitals', 1, 'vitals', 12, 1, 1, '2005-03-03 00:16:34', 0, 'Clinical', ''),
('Review Of Systems', 1, 'ros', 13, 1, 1, '2005-03-03 00:16:30', 0, 'Clinical', ''),
('Fee Sheet', 1, 'fee_sheet', 14, 1, 1, '2007-07-28 00:00:00', 0, 'Administrative', ''),
('Misc Billing Options HCFA', 1, 'misc_billing_options', 15, 1, 1, '2007-07-28 00:00:00', 0, 'Administrative', ''),
('Procedure Order', 1, 'procedure_order', 16, 1, 1, '2010-02-25 00:00:00', 0, 'Administrative', '');

--
-- Dumping data for table `rule_action`
--

INSERT INTO `rule_action` (`name`, `group_id`, `category`, `item`) VALUES
('rule_htn_bp_measure', 1, 'act_cat_measure', 'act_bp'),
('rule_tob_use_assess', 1, 'act_cat_assess', 'act_tobacco'),
('rule_tob_cess_inter', 1, 'act_cat_inter', 'act_tobacco'),
('rule_adult_wt_screen_fu', 1, 'act_cat_measure', 'act_wt'),
('rule_wt_assess_couns_child', 1, 'act_cat_measure', 'act_wt'),
('rule_wt_assess_couns_child', 2, 'act_cat_edu', 'act_wt'),
('rule_wt_assess_couns_child', 3, 'act_cat_edu', 'act_nutrition'),
('rule_wt_assess_couns_child', 4, 'act_cat_edu', 'act_exercise'),
('rule_wt_assess_couns_child', 5, 'act_cat_measure', 'act_bmi'),
('rule_influenza_ge_50', 1, 'act_cat_treat', 'act_influvacc'),
('rule_pneumovacc_ge_65', 1, 'act_cat_treat', 'act_pneumovacc'),
('rule_dm_hemo_a1c', 1, 'act_cat_measure', 'act_hemo_a1c'),
('rule_dm_urine_alb', 1, 'act_cat_measure', 'act_urine_alb'),
('rule_dm_eye', 1, 'act_cat_exam', 'act_eye'),
('rule_dm_foot', 1, 'act_cat_exam', 'act_foot'),
('rule_cs_mammo', 1, 'act_cat_measure', 'act_mammo'),
('rule_cs_pap', 1, 'act_cat_exam', 'act_pap'),
('rule_cs_colon', 1, 'act_cat_assess', 'act_colon_cancer_screen'),
('rule_cs_prostate', 1, 'act_cat_assess', 'act_prostate_cancer_screen'),
('rule_inr_monitor', 1, 'act_cat_measure', 'act_lab_inr');

--
-- Dumping data for table `rule_action_item`
--

INSERT INTO `rule_action_item` (`category`, `item`, `clin_rem_link`, `reminder_message`, `custom_flag`) VALUES
('act_cat_measure', 'act_bp', '', '', 0),
('act_cat_assess', 'act_tobacco', '', '', 0),
('act_cat_inter', 'act_tobacco', '', '', 1),
('act_cat_measure', 'act_wt', '', '', 0),
('act_cat_edu', 'act_wt', '', '', 1),
('act_cat_measure', 'act_bmi', '', '', 0),
('act_cat_edu', 'act_nutrition', '', '', 1),
('act_cat_edu', 'act_exercise', '', '', 1),
('act_cat_treat', 'act_influvacc', '', '', 0),
('act_cat_treat', 'act_pneumovacc', '', '', 0),
('act_cat_measure', 'act_hemo_a1c', '', '', 1),
('act_cat_measure', 'act_urine_alb', '', '', 1),
('act_cat_exam', 'act_eye', '', '', 1),
('act_cat_exam', 'act_foot', '', '', 1),
('act_cat_measure', 'act_mammo', '', '', 1),
('act_cat_exam', 'act_pap', '', '', 1),
('act_cat_assess', 'act_colon_cancer_screen', '', '', 1),
('act_cat_assess', 'act_prostate_cancer_screen', '', '', 1),
('act_cat_measure', 'act_lab_inr', '', '', 0);

--
-- Dumping data for table `rule_filter`
--

INSERT INTO `rule_filter` (`name`, `include_flag`, `required_flag`, `method`, `method_detail`, `value`) VALUES
('rule_htn_bp_measure', 1, 0, 'filt_lists', 'medical_problem', 'CUSTOM::HTN'),
('rule_htn_bp_measure', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::401.0'),
('rule_htn_bp_measure', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::401.1'),
('rule_htn_bp_measure', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::401.9'),
('rule_htn_bp_measure', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::402.00'),
('rule_htn_bp_measure', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::402.01'),
('rule_htn_bp_measure', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::402.10'),
('rule_htn_bp_measure', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::402.11'),
('rule_htn_bp_measure', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::402.90'),
('rule_htn_bp_measure', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::402.91'),
('rule_htn_bp_measure', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::403.00'),
('rule_htn_bp_measure', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::403.01'),
('rule_htn_bp_measure', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::403.10'),
('rule_htn_bp_measure', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::403.11'),
('rule_htn_bp_measure', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::403.90'),
('rule_htn_bp_measure', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::403.91'),
('rule_htn_bp_measure', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::404.00'),
('rule_htn_bp_measure', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::404.01'),
('rule_htn_bp_measure', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::404.02'),
('rule_htn_bp_measure', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::404.03'),
('rule_htn_bp_measure', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::404.10'),
('rule_htn_bp_measure', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::404.11'),
('rule_htn_bp_measure', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::404.12'),
('rule_htn_bp_measure', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::404.13'),
('rule_htn_bp_measure', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::404.90'),
('rule_htn_bp_measure', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::404.91'),
('rule_htn_bp_measure', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::404.92'),
('rule_htn_bp_measure', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::404.93'),
('rule_tob_cess_inter', 1, 1, 'filt_database', '', 'LIFESTYLE::tobacco::current'),
('rule_adult_wt_screen_fu', 1, 1, 'filt_age_min', 'year', '18'),
('rule_wt_assess_couns_child', 1, 1, 'filt_age_max', 'year', '18'),
('rule_wt_assess_couns_child', 1, 1, 'filt_age_min', 'year', '2'),
('rule_influenza_ge_50', 1, 1, 'filt_age_min', 'year', '50'),
('rule_pneumovacc_ge_65', 1, 1, 'filt_age_min', 'year', '65'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'CUSTOM::diabetes'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.0'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.00'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.01'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.02'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.03'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.10'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.11'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.12'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.13'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.20'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.21'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.22'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.23'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.30'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.31'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.32'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.33'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.4'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.40'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.41'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.42'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.43'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.50'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.51'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.52'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.53'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.60'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.61'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.62'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.63'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.7'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.70'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.71'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.72'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.73'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.80'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.81'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.82'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.83'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.9'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.90'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.91'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.92'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.93'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::357.2'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::362.0'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::362.01'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::362.02'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::362.03'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::362.04'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::362.05'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::362.06'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::366.41'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::648.0'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::648.00'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::648.01'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::648.02'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::648.03'),
('rule_dm_hemo_a1c', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::648.04'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'CUSTOM::diabetes'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.0'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.00'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.01'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.02'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.03'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.10'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.11'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.12'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.13'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.20'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.21'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.22'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.23'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.30'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.31'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.32'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.33'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.4'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.40'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.41'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.42'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.43'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.50'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.51'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.52'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.53'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.60'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.61'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.62'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.63'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.7'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.70'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.71'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.72'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.73'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.80'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.81'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.82'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.83'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.9'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.90'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.91'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.92'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.93'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::357.2'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::362.0'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::362.01'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::362.02'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::362.03'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::362.04'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::362.05'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::362.06'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::366.41'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::648.0'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::648.00'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::648.01'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::648.02'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::648.03'),
('rule_dm_urine_alb', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::648.04'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'CUSTOM::diabetes'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.0'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.00'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.01'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.02'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.03'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.10'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.11'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.12'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.13'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.20'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.21'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.22'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.23'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.30'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.31'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.32'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.33'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.4'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.40'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.41'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.42'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.43'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.50'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.51'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.52'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.53'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.60'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.61'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.62'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.63'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.7'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.70'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.71'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.72'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.73'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.80'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.81'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.82'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.83'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.9'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.90'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.91'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.92'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.93'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::357.2'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::362.0'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::362.01'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::362.02'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::362.03'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::362.04'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::362.05'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::362.06'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::366.41'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::648.0'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::648.00'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::648.01'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::648.02'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::648.03'),
('rule_dm_eye', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::648.04'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'CUSTOM::diabetes'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.0'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.00'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.01'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.02'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.03'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.10'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.11'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.12'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.13'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.20'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.21'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.22'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.23'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.30'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.31'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.32'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.33'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.4'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.40'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.41'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.42'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.43'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.50'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.51'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.52'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.53'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.60'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.61'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.62'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.63'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.7'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.70'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.71'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.72'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.73'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.80'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.81'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.82'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.83'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.9'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.90'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.91'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.92'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::250.93'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::357.2'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::362.0'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::362.01'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::362.02'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::362.03'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::362.04'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::362.05'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::362.06'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::366.41'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::648.0'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::648.00'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::648.01'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::648.02'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::648.03'),
('rule_dm_foot', 1, 0, 'filt_lists', 'medical_problem', 'ICD9::648.04'),
('rule_cs_mammo', 1, 1, 'filt_age_min', 'year', '40'),
('rule_cs_mammo', 1, 1, 'filt_sex', '', 'Female'),
('rule_cs_pap', 1, 1, 'filt_age_min', 'year', '18'),
('rule_cs_pap', 1, 1, 'filt_sex', '', 'Female'),
('rule_cs_colon', 1, 1, 'filt_age_min', 'year', '50'),
('rule_cs_prostate', 1, 1, 'filt_age_min', 'year', '50'),
('rule_cs_prostate', 1, 1, 'filt_sex', '', 'Male'),
('rule_inr_monitor', 1, 0, 'filt_lists', 'medication', 'coumadin'),
('rule_inr_monitor', 1, 0, 'filt_lists', 'medication', 'warfarin');

--
-- Dumping data for table `rule_patient_data`
--


--
-- Dumping data for table `rule_reminder`
--

INSERT INTO `rule_reminder` (`name`, `method`, `method_detail`, `value`) VALUES
('rule_htn_bp_measure', 'clinical_reminder_pre', 'week', '2'),
('rule_htn_bp_measure', 'clinical_reminder_post', 'month', '1'),
('rule_htn_bp_measure', 'patient_reminder_pre', 'week', '2'),
('rule_htn_bp_measure', 'patient_reminder_post', 'month', '1'),
('rule_tob_use_assess', 'clinical_reminder_pre', 'week', '2'),
('rule_tob_use_assess', 'clinical_reminder_post', 'month', '1'),
('rule_tob_use_assess', 'patient_reminder_pre', 'week', '2'),
('rule_tob_use_assess', 'patient_reminder_post', 'month', '1'),
('rule_tob_cess_inter', 'clinical_reminder_pre', 'week', '2'),
('rule_tob_cess_inter', 'clinical_reminder_post', 'month', '1'),
('rule_tob_cess_inter', 'patient_reminder_pre', 'week', '2'),
('rule_tob_cess_inter', 'patient_reminder_post', 'month', '1'),
('rule_adult_wt_screen_fu', 'clinical_reminder_pre', 'week', '2'),
('rule_adult_wt_screen_fu', 'clinical_reminder_post', 'month', '1'),
('rule_adult_wt_screen_fu', 'patient_reminder_pre', 'week', '2'),
('rule_adult_wt_screen_fu', 'patient_reminder_post', 'month', '1'),
('rule_wt_assess_couns_child', 'clinical_reminder_pre', 'week', '2'),
('rule_wt_assess_couns_child', 'clinical_reminder_post', 'month', '1'),
('rule_wt_assess_couns_child', 'patient_reminder_pre', 'week', '2'),
('rule_wt_assess_couns_child', 'patient_reminder_post', 'month', '1'),
('rule_influenza_ge_50', 'clinical_reminder_pre', 'week', '2'),
('rule_influenza_ge_50', 'clinical_reminder_post', 'month', '1'),
('rule_influenza_ge_50', 'patient_reminder_pre', 'week', '2'),
('rule_influenza_ge_50', 'patient_reminder_post', 'month', '1'),
('rule_pneumovacc_ge_65', 'clinical_reminder_pre', 'week', '2'),
('rule_pneumovacc_ge_65', 'clinical_reminder_post', 'month', '1'),
('rule_pneumovacc_ge_65', 'patient_reminder_pre', 'week', '2'),
('rule_pneumovacc_ge_65', 'patient_reminder_post', 'month', '1'),
('rule_dm_hemo_a1c', 'clinical_reminder_pre', 'week', '2'),
('rule_dm_hemo_a1c', 'clinical_reminder_post', 'month', '1'),
('rule_dm_hemo_a1c', 'patient_reminder_pre', 'week', '2'),
('rule_dm_hemo_a1c', 'patient_reminder_post', 'month', '1'),
('rule_dm_urine_alb', 'clinical_reminder_pre', 'week', '2'),
('rule_dm_urine_alb', 'clinical_reminder_post', 'month', '1'),
('rule_dm_urine_alb', 'patient_reminder_pre', 'week', '2'),
('rule_dm_urine_alb', 'patient_reminder_post', 'month', '1'),
('rule_dm_eye', 'clinical_reminder_pre', 'week', '2'),
('rule_dm_eye', 'clinical_reminder_post', 'month', '1'),
('rule_dm_eye', 'patient_reminder_pre', 'week', '2'),
('rule_dm_eye', 'patient_reminder_post', 'month', '1'),
('rule_dm_foot', 'clinical_reminder_pre', 'week', '2'),
('rule_dm_foot', 'clinical_reminder_post', 'month', '1'),
('rule_dm_foot', 'patient_reminder_pre', 'week', '2'),
('rule_dm_foot', 'patient_reminder_post', 'month', '1'),
('rule_cs_mammo', 'clinical_reminder_pre', 'week', '2'),
('rule_cs_mammo', 'clinical_reminder_post', 'month', '1'),
('rule_cs_mammo', 'patient_reminder_pre', 'week', '2'),
('rule_cs_mammo', 'patient_reminder_post', 'month', '1'),
('rule_cs_pap', 'clinical_reminder_pre', 'week', '2'),
('rule_cs_pap', 'clinical_reminder_post', 'month', '1'),
('rule_cs_pap', 'patient_reminder_pre', 'week', '2'),
('rule_cs_pap', 'patient_reminder_post', 'month', '1'),
('rule_cs_colon', 'clinical_reminder_pre', 'week', '2'),
('rule_cs_colon', 'clinical_reminder_post', 'month', '1'),
('rule_cs_colon', 'patient_reminder_pre', 'week', '2'),
('rule_cs_colon', 'patient_reminder_post', 'month', '1'),
('rule_cs_prostate', 'clinical_reminder_pre', 'week', '2'),
('rule_cs_prostate', 'clinical_reminder_post', 'month', '1'),
('rule_cs_prostate', 'patient_reminder_pre', 'week', '2'),
('rule_cs_prostate', 'patient_reminder_post', 'month', '1'),
('rule_inr_monitor', 'clinical_reminder_pre', 'week', '2'),
('rule_inr_monitor', 'clinical_reminder_post', 'month', '1'),
('rule_inr_monitor', 'patient_reminder_pre', 'week', '2'),
('rule_inr_monitor', 'patient_reminder_post', 'month', '1');

--
-- Dumping data for table `rule_target`
--

INSERT INTO `rule_target` (`name`, `group_id`, `include_flag`, `required_flag`, `method`, `value`, `interval`) VALUES
('rule_htn_bp_measure', 1, 1, 1, 'target_interval', 'year', 1),
('rule_htn_bp_measure', 1, 1, 1, 'target_database', '::form_vitals::bps::::::ge::1', 0),
('rule_htn_bp_measure', 1, 1, 1, 'target_database', '::form_vitals::bpd::::::ge::1', 0),
('rule_tob_use_assess', 1, 1, 1, 'target_database', 'LIFESTYLE::tobacco::', 0),
('rule_tob_cess_inter', 1, 1, 1, 'target_interval', 'year', 1),
('rule_tob_cess_inter', 1, 1, 1, 'target_database', 'CUSTOM::act_cat_inter::act_tobacco::YES::ge::1', 0),
('rule_adult_wt_screen_fu', 1, 1, 1, 'target_database', '::form_vitals::weight::::::ge::1', 0),
('rule_wt_assess_couns_child', 1, 1, 1, 'target_database', '::form_vitals::weight::::::ge::1', 0),
('rule_wt_assess_couns_child', 1, 1, 1, 'target_interval', 'year', 3),
('rule_wt_assess_couns_child', 2, 1, 1, 'target_database', 'CUSTOM::act_cat_edu::act_wt::YES::ge::1', 0),
('rule_wt_assess_couns_child', 2, 1, 1, 'target_interval', 'year', 3),
('rule_wt_assess_couns_child', 3, 1, 1, 'target_database', 'CUSTOM::act_cat_edu::act_nutrition::YES::ge::1', 0),
('rule_wt_assess_couns_child', 3, 1, 1, 'target_interval', 'year', 3),
('rule_wt_assess_couns_child', 4, 1, 1, 'target_database', 'CUSTOM::act_cat_edu::act_exercise::YES::ge::1', 0),
('rule_wt_assess_couns_child', 4, 1, 1, 'target_interval', 'year', 3),
('rule_wt_assess_couns_child', 5, 1, 1, 'target_database', '::form_vitals::BMI::::::ge::1', 0),
('rule_wt_assess_couns_child', 5, 1, 1, 'target_interval', 'year', 3),
('rule_influenza_ge_50', 1, 1, 1, 'target_interval', 'flu_season', 1),
('rule_influenza_ge_50', 1, 1, 0, 'target_database', '::immunizations::cvx_code::eq::15::ge::1', 0),
('rule_influenza_ge_50', 1, 1, 0, 'target_database', '::immunizations::cvx_code::eq::16::ge::1', 0),
('rule_influenza_ge_50', 1, 1, 0, 'target_database', '::immunizations::cvx_code::eq::88::ge::1', 0),
('rule_influenza_ge_50', 1, 1, 0, 'target_database', '::immunizations::cvx_code::eq::111::ge::1', 0),
('rule_influenza_ge_50', 1, 1, 0, 'target_database', '::immunizations::cvx_code::eq::125::ge::1', 0),
('rule_influenza_ge_50', 1, 1, 0, 'target_database', '::immunizations::cvx_code::eq::126::ge::1', 0),
('rule_influenza_ge_50', 1, 1, 0, 'target_database', '::immunizations::cvx_code::eq::127::ge::1', 0),
('rule_influenza_ge_50', 1, 1, 0, 'target_database', '::immunizations::cvx_code::eq::128::ge::1', 0),
('rule_influenza_ge_50', 1, 1, 0, 'target_database', '::immunizations::cvx_code::eq::135::ge::1', 0),
('rule_influenza_ge_50', 1, 1, 0, 'target_database', '::immunizations::cvx_code::eq::140::ge::1', 0),
('rule_influenza_ge_50', 1, 1, 0, 'target_database', '::immunizations::cvx_code::eq::141::ge::1', 0),
('rule_influenza_ge_50', 1, 1, 0, 'target_database', '::immunizations::cvx_code::eq::144::ge::1', 0),
('rule_pneumovacc_ge_65', 1, 1, 0, 'target_database', '::immunizations::cvx_code::eq::33::ge::1', 0),
('rule_pneumovacc_ge_65', 1, 1, 0, 'target_database', '::immunizations::cvx_code::eq::100::ge::1', 0),
('rule_pneumovacc_ge_65', 1, 1, 0, 'target_database', '::immunizations::cvx_code::eq::109::ge::1', 0),
('rule_pneumovacc_ge_65', 1, 1, 0, 'target_database', '::immunizations::cvx_code::eq::133::ge::1', 0),
('rule_dm_hemo_a1c', 1, 1, 1, 'target_interval', 'month', 3),
('rule_dm_hemo_a1c', 1, 1, 1, 'target_database', 'CUSTOM::act_cat_measure::act_hemo_a1c::YES::ge::1', 0),
('rule_dm_urine_alb', 1, 1, 1, 'target_interval', 'year', 1),
('rule_dm_urine_alb', 1, 1, 1, 'target_database', 'CUSTOM::act_cat_measure::act_urine_alb::YES::ge::1', 0),
('rule_dm_eye', 1, 1, 1, 'target_interval', 'year', 1),
('rule_dm_eye', 1, 1, 1, 'target_database', 'CUSTOM::act_cat_exam::act_eye::YES::ge::1', 0),
('rule_dm_foot', 1, 1, 1, 'target_interval', 'year', 1),
('rule_dm_foot', 1, 1, 1, 'target_database', 'CUSTOM::act_cat_exam::act_foot::YES::ge::1', 0),
('rule_cs_mammo', 1, 1, 1, 'target_interval', 'year', 1),
('rule_cs_mammo', 1, 1, 1, 'target_database', 'CUSTOM::act_cat_measure::act_mammo::YES::ge::1', 0),
('rule_cs_pap', 1, 1, 1, 'target_interval', 'year', 1),
('rule_cs_pap', 1, 1, 1, 'target_database', 'CUSTOM::act_cat_exam::act_pap::YES::ge::1', 0),
('rule_cs_colon', 1, 1, 1, 'target_database', 'CUSTOM::act_cat_assess::act_colon_cancer_screen::YES::ge::1', 0),
('rule_cs_prostate', 1, 1, 1, 'target_database', 'CUSTOM::act_cat_assess::act_prostate_cancer_screen::YES::ge::1', 0),
('rule_inr_monitor', 1, 1, 1, 'target_interval', 'week', 3),
('rule_inr_monitor', 1, 1, 1, 'target_proc', 'INR::CPT4:85610::::::ge::1', 0);

--
-- Dumping data for table `sequences`
--

INSERT INTO `sequences` (`id`) VALUES
(1);

--
-- Dumping data for table `settings`
--


--
-- Dumping data for table `standardized_tables_track`
--


--
-- Dumping data for table `syndromic_surveillance`
--


--
-- Dumping data for table `template_users`
--


--
-- Dumping data for table `transactions`
--


--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `info`) VALUES
('admin', 'Administrator');

--
-- Dumping data for table `users_facility`
--


--
-- Dumping data for table `user_settings`
--

INSERT INTO `user_settings` (`setting_user`, `setting_label`, `setting_value`) VALUES
(0, 'allergy_ps_expand', '1'),
(0, 'appointments_ps_expand', '1'),
(0, 'billing_ps_expand', '0'),
(0, 'clinical_reminders_ps_expand', '1'),
(0, 'demographics_ps_expand', '0'),
(0, 'dental_ps_expand', '1'),
(0, 'directives_ps_expand', '1'),
(0, 'disclosures_ps_expand', '0'),
(0, 'immunizations_ps_expand', '1'),
(0, 'insurance_ps_expand', '0'),
(0, 'medical_problem_ps_expand', '1'),
(0, 'medication_ps_expand', '1'),
(0, 'patient_reminders_ps_expand', '0'),
(0, 'pnotes_ps_expand', '0'),
(0, 'prescriptions_ps_expand', '1'),
(0, 'surgery_ps_expand', '1'),
(0, 'vitals_ps_expand', '1'),
(0, 'gacl_protect', '0'),
(1, 'gacl_protect', '1');

--
-- Dumping data for table `version`
--

INSERT INTO `version` (`v_major`, `v_minor`, `v_patch`, `v_tag`, `v_database`) VALUES
(0, 0, 0, '', 0);

--
-- Dumping data for table `x12_partners`
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
