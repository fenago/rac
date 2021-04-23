set echo off
set verify on
set feedback on
set numwidth 16
set pagesize 43
set linesize 132
set echo off
set numwidth 10
set sqlprompt '_user@&_CONNECT_IDENTIFIER SQL> ';
rem set sqlprompt 'SQL> '
set sqlnumber on
col value for 99999999999999999
-- Used for the SHOW ERRORS command
COLUMN LINE/COL FORMAT A8
COLUMN ERROR    FORMAT A65  WORD_WRAPPED
-- Used for the SHOW SGA command
COLUMN name_col_plus_show_sga FORMAT a28
-- Defaults for SHOW PARAMETERS
COLUMN name_col_plus_show_param FORMAT a35 HEADING NAME
COLUMN value_col_plus_show_param FORMAT a55 HEADING VALUE
-- Defaults for SET AUTOTRACE EXPLAIN report
COLUMN id_plus_exp FORMAT 990 HEADING i
COLUMN parent_id_plus_exp FORMAT 990 HEADING p
COLUMN plan_plus_exp FORMAT a70
COLUMN object_node_plus_exp FORMAT a16
COLUMN other_tag_plus_exp FORMAT a29
COLUMN other_plus_exp FORMAT a44
break on inst_id skip 1
define _editor = "vi"
define p=&_CONNECT_IDENTIFIER
define sys='sys/oracle_4U@&p as sysdba'
define hr='hr/hr@&p'
define sh='sh/sh@&p'
define scott='scott/tiger@&p'
set serveroutput on size 5000
set termout off
REM store set mysettings replace
set echo on
alter session set nls_date_format = 'dd-mon-rrrr HH24:MI:SS';
set echo off
set termout on
set pause on
set pause "Hit Any Key to Continue"
rem clear screen
