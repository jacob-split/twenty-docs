--
-- PostgreSQL database dump
--

\restrict SCYFlpdLr1jGlMfIxIqnOZ7WObMQEyLhemFxvTR6pf4ZbzV1Pl0zfC8ZRPXarku

-- Dumped from database version 16.11 (Debian 16.11-1.pgdg13+1)
-- Dumped by pg_dump version 16.11 (Debian 16.11-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: core; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA core;


ALTER SCHEMA core OWNER TO cloudsqlsuperuser;

--
-- Name: workspace_cjj1w48f60br2q6wtz6trrdb6; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA workspace_cjj1w48f60br2q6wtz6trrdb6;


ALTER SCHEMA workspace_cjj1w48f60br2q6wtz6trrdb6 OWNER TO cloudsqlsuperuser;

--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: agentChatMessage_role_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."agentChatMessage_role_enum" AS ENUM (
    'user',
    'assistant'
);


ALTER TYPE core."agentChatMessage_role_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: agentMessage_role_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."agentMessage_role_enum" AS ENUM (
    'user',
    'assistant',
    'system'
);


ALTER TYPE core."agentMessage_role_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: dataSource_type_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."dataSource_type_enum" AS ENUM (
    'postgres'
);


ALTER TYPE core."dataSource_type_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: emailingDomain_driver_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."emailingDomain_driver_enum" AS ENUM (
    'AWS_SES'
);


ALTER TYPE core."emailingDomain_driver_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: emailingDomain_status_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."emailingDomain_status_enum" AS ENUM (
    'PENDING',
    'VERIFIED',
    'FAILED',
    'TEMPORARY_FAILURE'
);


ALTER TYPE core."emailingDomain_status_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: indexMetadata_indextype_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."indexMetadata_indextype_enum" AS ENUM (
    'BTREE',
    'GIN'
);


ALTER TYPE core."indexMetadata_indextype_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: keyValuePair_type_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."keyValuePair_type_enum" AS ENUM (
    'USER_VARIABLE',
    'FEATURE_FLAG',
    'CONFIG_VARIABLE'
);


ALTER TYPE core."keyValuePair_type_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: pageLayoutWidget_type_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."pageLayoutWidget_type_enum" AS ENUM (
    'VIEW',
    'IFRAME',
    'FIELD',
    'FIELDS',
    'GRAPH',
    'STANDALONE_RICH_TEXT',
    'TIMELINE',
    'TASKS',
    'NOTES',
    'FILES',
    'EMAILS',
    'CALENDAR',
    'FIELD_RICH_TEXT',
    'WORKFLOW',
    'WORKFLOW_VERSION',
    'WORKFLOW_RUN'
);


ALTER TYPE core."pageLayoutWidget_type_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: pageLayout_type_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."pageLayout_type_enum" AS ENUM (
    'RECORD_INDEX',
    'RECORD_PAGE',
    'DASHBOARD'
);


ALTER TYPE core."pageLayout_type_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: routeTrigger_httpmethod_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."routeTrigger_httpmethod_enum" AS ENUM (
    'GET',
    'POST',
    'PUT',
    'PATCH',
    'DELETE'
);


ALTER TYPE core."routeTrigger_httpmethod_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: twoFactorAuthenticationMethod_status_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."twoFactorAuthenticationMethod_status_enum" AS ENUM (
    'PENDING',
    'VERIFIED'
);


ALTER TYPE core."twoFactorAuthenticationMethod_status_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: twoFactorAuthenticationMethod_strategy_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."twoFactorAuthenticationMethod_strategy_enum" AS ENUM (
    'TOTP'
);


ALTER TYPE core."twoFactorAuthenticationMethod_strategy_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: viewField_aggregateoperation_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."viewField_aggregateoperation_enum" AS ENUM (
    'MIN',
    'MAX',
    'AVG',
    'SUM',
    'COUNT',
    'COUNT_UNIQUE_VALUES',
    'COUNT_EMPTY',
    'COUNT_NOT_EMPTY',
    'COUNT_TRUE',
    'COUNT_FALSE',
    'PERCENTAGE_EMPTY',
    'PERCENTAGE_NOT_EMPTY'
);


ALTER TYPE core."viewField_aggregateoperation_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: viewFilterGroup_logicaloperator_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."viewFilterGroup_logicaloperator_enum" AS ENUM (
    'AND',
    'OR',
    'NOT'
);


ALTER TYPE core."viewFilterGroup_logicaloperator_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: viewFilter_operand_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."viewFilter_operand_enum" AS ENUM (
    'IS',
    'IS_NOT_NULL',
    'IS_NOT',
    'LESS_THAN_OR_EQUAL',
    'GREATER_THAN_OR_EQUAL',
    'IS_BEFORE',
    'IS_AFTER',
    'CONTAINS',
    'DOES_NOT_CONTAIN',
    'IS_EMPTY',
    'IS_NOT_EMPTY',
    'IS_RELATIVE',
    'IS_IN_PAST',
    'IS_IN_FUTURE',
    'IS_TODAY',
    'VECTOR_SEARCH'
);


ALTER TYPE core."viewFilter_operand_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: viewSort_direction_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."viewSort_direction_enum" AS ENUM (
    'ASC',
    'DESC'
);


ALTER TYPE core."viewSort_direction_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: view_calendarlayout_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core.view_calendarlayout_enum AS ENUM (
    'DAY',
    'WEEK',
    'MONTH'
);


ALTER TYPE core.view_calendarlayout_enum OWNER TO cloudsqlsuperuser;

--
-- Name: view_kanbanaggregateoperation_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core.view_kanbanaggregateoperation_enum AS ENUM (
    'MIN',
    'MAX',
    'AVG',
    'SUM',
    'COUNT',
    'COUNT_UNIQUE_VALUES',
    'COUNT_EMPTY',
    'COUNT_NOT_EMPTY',
    'COUNT_TRUE',
    'COUNT_FALSE',
    'PERCENTAGE_EMPTY',
    'PERCENTAGE_NOT_EMPTY'
);


ALTER TYPE core.view_kanbanaggregateoperation_enum OWNER TO cloudsqlsuperuser;

--
-- Name: view_key_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core.view_key_enum AS ENUM (
    'INDEX'
);


ALTER TYPE core.view_key_enum OWNER TO cloudsqlsuperuser;

--
-- Name: view_openrecordin_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core.view_openrecordin_enum AS ENUM (
    'SIDE_PANEL',
    'RECORD_PAGE'
);


ALTER TYPE core.view_openrecordin_enum OWNER TO cloudsqlsuperuser;

--
-- Name: view_type_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core.view_type_enum AS ENUM (
    'TABLE',
    'KANBAN',
    'CALENDAR'
);


ALTER TYPE core.view_type_enum OWNER TO cloudsqlsuperuser;

--
-- Name: view_visibility_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core.view_visibility_enum AS ENUM (
    'WORKSPACE',
    'UNLISTED'
);


ALTER TYPE core.view_visibility_enum OWNER TO cloudsqlsuperuser;

--
-- Name: workspaceSSOIdentityProvider_status_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."workspaceSSOIdentityProvider_status_enum" AS ENUM (
    'Active',
    'Inactive',
    'Error'
);


ALTER TYPE core."workspaceSSOIdentityProvider_status_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: workspaceSSOIdentityProvider_type_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."workspaceSSOIdentityProvider_type_enum" AS ENUM (
    'OIDC',
    'SAML'
);


ALTER TYPE core."workspaceSSOIdentityProvider_type_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: workspace_activationStatus_enum; Type: TYPE; Schema: core; Owner: postgres
--

CREATE TYPE core."workspace_activationStatus_enum" AS ENUM (
    'ONGOING_CREATION',
    'PENDING_CREATION',
    'ACTIVE',
    'INACTIVE',
    'SUSPENDED'
);


ALTER TYPE core."workspace_activationStatus_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: attachment_createdBySource_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."attachment_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."attachment_createdBySource_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: attachment_fileCategory_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."attachment_fileCategory_enum" AS ENUM (
    'ARCHIVE',
    'AUDIO',
    'IMAGE',
    'PRESENTATION',
    'SPREADSHEET',
    'TEXT_DOCUMENT',
    'VIDEO',
    'OTHER'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."attachment_fileCategory_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: calendarChannel_contactAutoCreationPolicy_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."calendarChannel_contactAutoCreationPolicy_enum" AS ENUM (
    'AS_PARTICIPANT_AND_ORGANIZER',
    'AS_PARTICIPANT',
    'AS_ORGANIZER',
    'NONE'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."calendarChannel_contactAutoCreationPolicy_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: calendarChannel_syncStage_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."calendarChannel_syncStage_enum" AS ENUM (
    'CALENDAR_EVENT_LIST_FETCH_PENDING',
    'CALENDAR_EVENT_LIST_FETCH_SCHEDULED',
    'CALENDAR_EVENT_LIST_FETCH_ONGOING',
    'CALENDAR_EVENTS_IMPORT_PENDING',
    'CALENDAR_EVENTS_IMPORT_SCHEDULED',
    'CALENDAR_EVENTS_IMPORT_ONGOING',
    'FAILED',
    'PENDING_CONFIGURATION'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."calendarChannel_syncStage_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: calendarChannel_syncStatus_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."calendarChannel_syncStatus_enum" AS ENUM (
    'ONGOING',
    'NOT_SYNCED',
    'ACTIVE',
    'FAILED_INSUFFICIENT_PERMISSIONS',
    'FAILED_UNKNOWN'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."calendarChannel_syncStatus_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: calendarChannel_visibility_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."calendarChannel_visibility_enum" AS ENUM (
    'METADATA',
    'SHARE_EVERYTHING'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."calendarChannel_visibility_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: calendarEventParticipant_responseStatus_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."calendarEventParticipant_responseStatus_enum" AS ENUM (
    'NEEDS_ACTION',
    'DECLINED',
    'TENTATIVE',
    'ACCEPTED'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."calendarEventParticipant_responseStatus_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: company_createdBySource_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."company_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."company_createdBySource_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: dashboard_createdBySource_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."dashboard_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."dashboard_createdBySource_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: messageChannelMessageAssociation_direction_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannelMessageAssociation_direction_enum" AS ENUM (
    'INCOMING',
    'OUTGOING'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannelMessageAssociation_direction_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: messageChannel_contactAutoCreationPolicy_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel_contactAutoCreationPolicy_enum" AS ENUM (
    'SENT_AND_RECEIVED',
    'SENT',
    'NONE'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel_contactAutoCreationPolicy_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: messageChannel_messageFolderImportPolicy_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel_messageFolderImportPolicy_enum" AS ENUM (
    'ALL_FOLDERS',
    'SELECTED_FOLDERS'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel_messageFolderImportPolicy_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: messageChannel_pendingGroupEmailsAction_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel_pendingGroupEmailsAction_enum" AS ENUM (
    'GROUP_EMAILS_DELETION',
    'GROUP_EMAILS_IMPORT',
    'NONE'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel_pendingGroupEmailsAction_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: messageChannel_syncStage_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel_syncStage_enum" AS ENUM (
    'MESSAGE_LIST_FETCH_PENDING',
    'MESSAGE_LIST_FETCH_SCHEDULED',
    'MESSAGE_LIST_FETCH_ONGOING',
    'MESSAGES_IMPORT_PENDING',
    'MESSAGES_IMPORT_SCHEDULED',
    'MESSAGES_IMPORT_ONGOING',
    'FAILED',
    'PENDING_CONFIGURATION'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel_syncStage_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: messageChannel_syncStatus_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel_syncStatus_enum" AS ENUM (
    'ONGOING',
    'NOT_SYNCED',
    'ACTIVE',
    'FAILED_INSUFFICIENT_PERMISSIONS',
    'FAILED_UNKNOWN'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel_syncStatus_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: messageChannel_type_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel_type_enum" AS ENUM (
    'EMAIL',
    'SMS'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel_type_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: messageChannel_visibility_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel_visibility_enum" AS ENUM (
    'METADATA',
    'SUBJECT',
    'SHARE_EVERYTHING'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel_visibility_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: messageFolder_pendingSyncAction_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."messageFolder_pendingSyncAction_enum" AS ENUM (
    'FOLDER_DELETION',
    'NONE'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."messageFolder_pendingSyncAction_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: messageParticipant_role_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."messageParticipant_role_enum" AS ENUM (
    'FROM',
    'TO',
    'CC',
    'BCC'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."messageParticipant_role_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: note_createdBySource_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."note_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."note_createdBySource_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: opportunity_createdBySource_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."opportunity_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."opportunity_createdBySource_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: opportunity_stage_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6.opportunity_stage_enum AS ENUM (
    'NEW',
    'SCREENING',
    'MEETING',
    'PROPOSAL',
    'CUSTOMER'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6.opportunity_stage_enum OWNER TO cloudsqlsuperuser;

--
-- Name: person_createdBySource_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."person_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."person_createdBySource_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: task_createdBySource_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."task_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."task_createdBySource_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: task_status_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6.task_status_enum AS ENUM (
    'TODO',
    'IN_PROGRESS',
    'DONE'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6.task_status_enum OWNER TO cloudsqlsuperuser;

--
-- Name: workflowAutomatedTrigger_type_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."workflowAutomatedTrigger_type_enum" AS ENUM (
    'DATABASE_EVENT',
    'CRON'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."workflowAutomatedTrigger_type_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: workflowRun_createdBySource_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."workflowRun_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."workflowRun_createdBySource_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: workflowRun_status_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."workflowRun_status_enum" AS ENUM (
    'NOT_STARTED',
    'RUNNING',
    'COMPLETED',
    'FAILED',
    'ENQUEUED',
    'STOPPING',
    'STOPPED'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."workflowRun_status_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: workflowVersion_status_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."workflowVersion_status_enum" AS ENUM (
    'DRAFT',
    'ACTIVE',
    'DEACTIVATED',
    'ARCHIVED'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."workflowVersion_status_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: workflow_createdBySource_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."workflow_createdBySource_enum" AS ENUM (
    'EMAIL',
    'CALENDAR',
    'WORKFLOW',
    'AGENT',
    'API',
    'IMPORT',
    'MANUAL',
    'SYSTEM',
    'WEBHOOK',
    'APPLICATION'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."workflow_createdBySource_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: workflow_statuses_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6.workflow_statuses_enum AS ENUM (
    'DRAFT',
    'ACTIVE',
    'DEACTIVATED'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6.workflow_statuses_enum OWNER TO cloudsqlsuperuser;

--
-- Name: workspaceMember_dateFormat_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."workspaceMember_dateFormat_enum" AS ENUM (
    'SYSTEM',
    'MONTH_FIRST',
    'DAY_FIRST',
    'YEAR_FIRST'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."workspaceMember_dateFormat_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: workspaceMember_numberFormat_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."workspaceMember_numberFormat_enum" AS ENUM (
    'SYSTEM',
    'COMMAS_AND_DOT',
    'SPACES_AND_COMMA',
    'DOTS_AND_COMMA',
    'APOSTROPHE_AND_DOT'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."workspaceMember_numberFormat_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: workspaceMember_timeFormat_enum; Type: TYPE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."workspaceMember_timeFormat_enum" AS ENUM (
    'SYSTEM',
    'HOUR_24',
    'HOUR_12'
);


ALTER TYPE workspace_cjj1w48f60br2q6wtz6trrdb6."workspaceMember_timeFormat_enum" OWNER TO cloudsqlsuperuser;

--
-- Name: unaccent_immutable(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.unaccent_immutable(input text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$
        SELECT public.unaccent('public.unaccent'::regdictionary, input)
        $$;


ALTER FUNCTION public.unaccent_immutable(input text) OWNER TO cloudsqlsuperuser;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: _typeorm_generated_columns_and_materialized_views; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core._typeorm_generated_columns_and_materialized_views (
    type character varying NOT NULL,
    database character varying,
    schema character varying,
    "table" character varying,
    name character varying,
    value text
);


ALTER TABLE core._typeorm_generated_columns_and_materialized_views OWNER TO cloudsqlsuperuser;

--
-- Name: _typeorm_migrations; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core._typeorm_migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE core._typeorm_migrations OWNER TO cloudsqlsuperuser;

--
-- Name: _typeorm_migrations_id_seq; Type: SEQUENCE; Schema: core; Owner: postgres
--

CREATE SEQUENCE core._typeorm_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE core._typeorm_migrations_id_seq OWNER TO cloudsqlsuperuser;

--
-- Name: _typeorm_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: core; Owner: postgres
--

ALTER SEQUENCE core._typeorm_migrations_id_seq OWNED BY core._typeorm_migrations.id;


--
-- Name: agent; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core.agent (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "standardId" uuid,
    name character varying NOT NULL,
    label character varying NOT NULL,
    icon character varying,
    description text,
    prompt text NOT NULL,
    "modelId" character varying DEFAULT 'default-smart-model'::character varying NOT NULL,
    "responseFormat" jsonb DEFAULT '{"type": "text"}'::jsonb,
    "workspaceId" uuid NOT NULL,
    "isCustom" boolean DEFAULT false NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "applicationId" uuid,
    "modelConfiguration" jsonb,
    "universalIdentifier" uuid,
    "evaluationInputs" text[] DEFAULT '{}'::text[] NOT NULL
);


ALTER TABLE core.agent OWNER TO cloudsqlsuperuser;

--
-- Name: agentChatThread; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."agentChatThread" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "userWorkspaceId" uuid NOT NULL,
    title character varying,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "totalInputTokens" integer DEFAULT 0 NOT NULL,
    "totalOutputTokens" integer DEFAULT 0 NOT NULL,
    "contextWindowTokens" integer,
    "totalInputCredits" bigint DEFAULT 0 NOT NULL,
    "totalOutputCredits" bigint DEFAULT 0 NOT NULL
);


ALTER TABLE core."agentChatThread" OWNER TO cloudsqlsuperuser;

--
-- Name: agentMessage; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."agentMessage" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "threadId" uuid NOT NULL,
    "turnId" uuid NOT NULL,
    "agentId" uuid,
    role core."agentMessage_role_enum" NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE core."agentMessage" OWNER TO cloudsqlsuperuser;

--
-- Name: agentMessagePart; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."agentMessagePart" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "messageId" uuid NOT NULL,
    "orderIndex" integer NOT NULL,
    type character varying NOT NULL,
    "textContent" text,
    "reasoningContent" text,
    "toolName" character varying,
    "toolCallId" character varying,
    "toolInput" jsonb,
    "toolOutput" jsonb,
    state character varying,
    "errorMessage" text,
    "errorDetails" jsonb,
    "sourceUrlSourceId" character varying,
    "sourceUrlUrl" character varying,
    "sourceUrlTitle" character varying,
    "sourceDocumentSourceId" character varying,
    "sourceDocumentMediaType" character varying,
    "sourceDocumentTitle" character varying,
    "sourceDocumentFilename" character varying,
    "fileMediaType" character varying,
    "fileFilename" character varying,
    "fileUrl" character varying,
    "providerMetadata" jsonb,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE core."agentMessagePart" OWNER TO cloudsqlsuperuser;

--
-- Name: agentTurn; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."agentTurn" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "threadId" uuid NOT NULL,
    "agentId" uuid,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE core."agentTurn" OWNER TO cloudsqlsuperuser;

--
-- Name: agentTurnEvaluation; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."agentTurnEvaluation" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "turnId" uuid NOT NULL,
    score integer NOT NULL,
    comment text,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE core."agentTurnEvaluation" OWNER TO cloudsqlsuperuser;

--
-- Name: apiKey; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."apiKey" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL,
    "expiresAt" timestamp with time zone NOT NULL,
    "revokedAt" timestamp with time zone,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE core."apiKey" OWNER TO cloudsqlsuperuser;

--
-- Name: appToken; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."appToken" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "userId" uuid,
    "workspaceId" uuid,
    type text DEFAULT 'REFRESH_TOKEN'::text NOT NULL,
    value text,
    "expiresAt" timestamp with time zone NOT NULL,
    "deletedAt" timestamp with time zone,
    "revokedAt" timestamp with time zone,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    context jsonb
);


ALTER TABLE core."appToken" OWNER TO cloudsqlsuperuser;

--
-- Name: application; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core.application (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "universalIdentifier" uuid NOT NULL,
    name text NOT NULL,
    description text,
    version text,
    "sourceType" text DEFAULT 'local'::text NOT NULL,
    "sourcePath" text NOT NULL,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "serverlessFunctionLayerId" uuid,
    "canBeUninstalled" boolean DEFAULT true NOT NULL,
    "defaultServerlessFunctionRoleId" uuid
);


ALTER TABLE core.application OWNER TO cloudsqlsuperuser;

--
-- Name: applicationVariable; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."applicationVariable" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    key text NOT NULL,
    value text DEFAULT ''::text NOT NULL,
    description text DEFAULT ''::text NOT NULL,
    "isSecret" boolean DEFAULT false NOT NULL,
    "applicationId" uuid,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE core."applicationVariable" OWNER TO cloudsqlsuperuser;

--
-- Name: approvedAccessDomain; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."approvedAccessDomain" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    domain character varying NOT NULL,
    "isValidated" boolean DEFAULT false NOT NULL,
    "workspaceId" uuid NOT NULL
);


ALTER TABLE core."approvedAccessDomain" OWNER TO cloudsqlsuperuser;

--
-- Name: cronTrigger; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."cronTrigger" (
    "universalIdentifier" uuid,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    settings jsonb NOT NULL,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "serverlessFunctionId" uuid NOT NULL,
    "applicationId" uuid
);


ALTER TABLE core."cronTrigger" OWNER TO cloudsqlsuperuser;

--
-- Name: dataSource; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."dataSource" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    label character varying,
    url character varying,
    schema character varying,
    type core."dataSource_type_enum" DEFAULT 'postgres'::core."dataSource_type_enum" NOT NULL,
    "isRemote" boolean DEFAULT false NOT NULL,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE core."dataSource" OWNER TO cloudsqlsuperuser;

--
-- Name: databaseEventTrigger; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."databaseEventTrigger" (
    "universalIdentifier" uuid,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    settings jsonb NOT NULL,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "serverlessFunctionId" uuid NOT NULL,
    "applicationId" uuid
);


ALTER TABLE core."databaseEventTrigger" OWNER TO cloudsqlsuperuser;

--
-- Name: emailingDomain; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."emailingDomain" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    domain character varying NOT NULL,
    driver core."emailingDomain_driver_enum" NOT NULL,
    status core."emailingDomain_status_enum" DEFAULT 'PENDING'::core."emailingDomain_status_enum" NOT NULL,
    "verificationRecords" jsonb,
    "verifiedAt" timestamp with time zone,
    "workspaceId" uuid NOT NULL
);


ALTER TABLE core."emailingDomain" OWNER TO cloudsqlsuperuser;

--
-- Name: featureFlag; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."featureFlag" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    key text NOT NULL,
    "workspaceId" uuid NOT NULL,
    value boolean NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE core."featureFlag" OWNER TO cloudsqlsuperuser;

--
-- Name: fieldMetadata; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."fieldMetadata" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "standardId" uuid,
    "objectMetadataId" uuid NOT NULL,
    type character varying NOT NULL,
    name character varying NOT NULL,
    label character varying NOT NULL,
    "defaultValue" jsonb,
    description text,
    icon character varying,
    "standardOverrides" jsonb,
    options jsonb,
    settings jsonb,
    "isCustom" boolean DEFAULT false NOT NULL,
    "isActive" boolean DEFAULT false NOT NULL,
    "isSystem" boolean DEFAULT false NOT NULL,
    "isUIReadOnly" boolean DEFAULT false NOT NULL,
    "isNullable" boolean DEFAULT true,
    "isUnique" boolean DEFAULT false,
    "workspaceId" uuid NOT NULL,
    "isLabelSyncedWithName" boolean DEFAULT false NOT NULL,
    "relationTargetFieldMetadataId" uuid,
    "relationTargetObjectMetadataId" uuid,
    "morphId" uuid,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "universalIdentifier" uuid,
    "applicationId" uuid,
    CONSTRAINT "CHK_FIELD_METADATA_MORPH_RELATION_REQUIRES_MORPH_ID" CHECK ((((type)::text <> 'MORPH_RELATION'::text) OR (((type)::text = 'MORPH_RELATION'::text) AND ("morphId" IS NOT NULL))))
);


ALTER TABLE core."fieldMetadata" OWNER TO cloudsqlsuperuser;

--
-- Name: fieldPermission; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."fieldPermission" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "roleId" uuid NOT NULL,
    "objectMetadataId" uuid NOT NULL,
    "fieldMetadataId" uuid NOT NULL,
    "canReadFieldValue" boolean,
    "canUpdateFieldValue" boolean,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE core."fieldPermission" OWNER TO cloudsqlsuperuser;

--
-- Name: file; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core.file (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL,
    "fullPath" character varying NOT NULL,
    size bigint NOT NULL,
    type character varying NOT NULL,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE core.file OWNER TO cloudsqlsuperuser;

--
-- Name: indexFieldMetadata; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."indexFieldMetadata" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "indexMetadataId" uuid NOT NULL,
    "fieldMetadataId" uuid NOT NULL,
    "order" integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE core."indexFieldMetadata" OWNER TO cloudsqlsuperuser;

--
-- Name: indexMetadata; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."indexMetadata" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    name character varying NOT NULL,
    "workspaceId" uuid NOT NULL,
    "objectMetadataId" uuid NOT NULL,
    "isCustom" boolean DEFAULT false NOT NULL,
    "isUnique" boolean DEFAULT false NOT NULL,
    "indexWhereClause" text,
    "indexType" core."indexMetadata_indextype_enum" DEFAULT 'BTREE'::core."indexMetadata_indextype_enum" NOT NULL,
    "universalIdentifier" uuid,
    "applicationId" uuid
);


ALTER TABLE core."indexMetadata" OWNER TO cloudsqlsuperuser;

--
-- Name: keyValuePair; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."keyValuePair" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "userId" uuid,
    "workspaceId" uuid,
    key text NOT NULL,
    value jsonb,
    "textValueDeprecated" text,
    type core."keyValuePair_type_enum" DEFAULT 'USER_VARIABLE'::core."keyValuePair_type_enum" NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone
);


ALTER TABLE core."keyValuePair" OWNER TO cloudsqlsuperuser;

--
-- Name: objectMetadata; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."objectMetadata" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "standardId" uuid,
    "dataSourceId" uuid NOT NULL,
    "nameSingular" character varying NOT NULL,
    "namePlural" character varying NOT NULL,
    "labelSingular" character varying NOT NULL,
    "labelPlural" character varying NOT NULL,
    description text,
    icon character varying,
    "standardOverrides" jsonb,
    "targetTableName" character varying NOT NULL,
    "isCustom" boolean DEFAULT false NOT NULL,
    "isRemote" boolean DEFAULT false NOT NULL,
    "isActive" boolean DEFAULT false NOT NULL,
    "isSystem" boolean DEFAULT false NOT NULL,
    "isUIReadOnly" boolean DEFAULT false NOT NULL,
    "isAuditLogged" boolean DEFAULT true NOT NULL,
    "isSearchable" boolean DEFAULT false NOT NULL,
    "duplicateCriteria" jsonb,
    shortcut character varying,
    "labelIdentifierFieldMetadataId" uuid,
    "imageIdentifierFieldMetadataId" uuid,
    "isLabelSyncedWithName" boolean DEFAULT false NOT NULL,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "applicationId" uuid,
    "universalIdentifier" uuid
);


ALTER TABLE core."objectMetadata" OWNER TO cloudsqlsuperuser;

--
-- Name: objectPermission; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."objectPermission" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "roleId" uuid NOT NULL,
    "objectMetadataId" uuid NOT NULL,
    "canReadObjectRecords" boolean,
    "canUpdateObjectRecords" boolean,
    "canSoftDeleteObjectRecords" boolean,
    "canDestroyObjectRecords" boolean,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE core."objectPermission" OWNER TO cloudsqlsuperuser;

--
-- Name: pageLayout; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."pageLayout" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL,
    "workspaceId" uuid NOT NULL,
    type core."pageLayout_type_enum" DEFAULT 'RECORD_PAGE'::core."pageLayout_type_enum" NOT NULL,
    "objectMetadataId" uuid,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "universalIdentifier" uuid,
    "applicationId" uuid
);


ALTER TABLE core."pageLayout" OWNER TO cloudsqlsuperuser;

--
-- Name: pageLayoutTab; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."pageLayoutTab" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    title character varying NOT NULL,
    "workspaceId" uuid NOT NULL,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "pageLayoutId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "universalIdentifier" uuid,
    "applicationId" uuid
);


ALTER TABLE core."pageLayoutTab" OWNER TO cloudsqlsuperuser;

--
-- Name: pageLayoutWidget; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."pageLayoutWidget" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "pageLayoutTabId" uuid NOT NULL,
    "workspaceId" uuid NOT NULL,
    title character varying NOT NULL,
    type core."pageLayoutWidget_type_enum" DEFAULT 'VIEW'::core."pageLayoutWidget_type_enum" NOT NULL,
    "objectMetadataId" uuid,
    "gridPosition" jsonb NOT NULL,
    configuration jsonb,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "universalIdentifier" uuid,
    "applicationId" uuid
);


ALTER TABLE core."pageLayoutWidget" OWNER TO cloudsqlsuperuser;

--
-- Name: permissionFlag; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."permissionFlag" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "roleId" uuid NOT NULL,
    flag character varying NOT NULL,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE core."permissionFlag" OWNER TO cloudsqlsuperuser;

--
-- Name: postgresCredentials; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."postgresCredentials" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "user" character varying NOT NULL,
    "passwordHash" character varying NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "workspaceId" uuid NOT NULL
);


ALTER TABLE core."postgresCredentials" OWNER TO cloudsqlsuperuser;

--
-- Name: publicDomain; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."publicDomain" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    domain character varying NOT NULL,
    "isValidated" boolean DEFAULT false NOT NULL,
    "workspaceId" uuid NOT NULL
);


ALTER TABLE core."publicDomain" OWNER TO cloudsqlsuperuser;

--
-- Name: remoteServer; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."remoteServer" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "foreignDataWrapperId" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "foreignDataWrapperType" text,
    label text,
    "foreignDataWrapperOptions" jsonb,
    "userMappingOptions" jsonb,
    schema text,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE core."remoteServer" OWNER TO cloudsqlsuperuser;

--
-- Name: remoteTable; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."remoteTable" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "distantTableName" character varying NOT NULL,
    "localTableName" character varying NOT NULL,
    "workspaceId" uuid NOT NULL,
    "remoteServerId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE core."remoteTable" OWNER TO cloudsqlsuperuser;

--
-- Name: role; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core.role (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "standardId" uuid,
    label character varying NOT NULL,
    "canUpdateAllSettings" boolean DEFAULT false NOT NULL,
    "canAccessAllTools" boolean DEFAULT false NOT NULL,
    "canReadAllObjectRecords" boolean DEFAULT false NOT NULL,
    "canUpdateAllObjectRecords" boolean DEFAULT false NOT NULL,
    "canSoftDeleteAllObjectRecords" boolean DEFAULT false NOT NULL,
    "canDestroyAllObjectRecords" boolean DEFAULT false NOT NULL,
    description text,
    icon character varying,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "isEditable" boolean DEFAULT true NOT NULL,
    "canBeAssignedToUsers" boolean DEFAULT true NOT NULL,
    "canBeAssignedToAgents" boolean DEFAULT true NOT NULL,
    "canBeAssignedToApiKeys" boolean DEFAULT true NOT NULL,
    "universalIdentifier" uuid,
    "applicationId" uuid
);


ALTER TABLE core.role OWNER TO cloudsqlsuperuser;

--
-- Name: roleTarget; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."roleTarget" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "workspaceId" uuid NOT NULL,
    "roleId" uuid NOT NULL,
    "userWorkspaceId" uuid,
    "agentId" uuid,
    "apiKeyId" uuid,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "universalIdentifier" uuid,
    "applicationId" uuid,
    CONSTRAINT "CHK_role_target_single_entity" CHECK (((("agentId" IS NOT NULL) AND ("userWorkspaceId" IS NULL) AND ("apiKeyId" IS NULL)) OR (("agentId" IS NULL) AND ("userWorkspaceId" IS NOT NULL) AND ("apiKeyId" IS NULL)) OR (("agentId" IS NULL) AND ("userWorkspaceId" IS NULL) AND ("apiKeyId" IS NOT NULL))))
);


ALTER TABLE core."roleTarget" OWNER TO cloudsqlsuperuser;

--
-- Name: routeTrigger; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."routeTrigger" (
    "universalIdentifier" uuid,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    path character varying NOT NULL,
    "isAuthRequired" boolean DEFAULT true NOT NULL,
    "httpMethod" core."routeTrigger_httpmethod_enum" DEFAULT 'GET'::core."routeTrigger_httpmethod_enum" NOT NULL,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "serverlessFunctionId" uuid NOT NULL,
    "applicationId" uuid
);


ALTER TABLE core."routeTrigger" OWNER TO cloudsqlsuperuser;

--
-- Name: searchFieldMetadata; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."searchFieldMetadata" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "objectMetadataId" uuid NOT NULL,
    "fieldMetadataId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "workspaceId" uuid NOT NULL
);


ALTER TABLE core."searchFieldMetadata" OWNER TO cloudsqlsuperuser;

--
-- Name: serverlessFunction; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."serverlessFunction" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL,
    description character varying,
    "latestVersion" character varying,
    "publishedVersions" jsonb DEFAULT '[]'::jsonb NOT NULL,
    runtime character varying DEFAULT 'nodejs22.x'::character varying NOT NULL,
    "timeoutSeconds" integer DEFAULT 300 NOT NULL,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "universalIdentifier" uuid,
    "applicationId" uuid,
    checksum text,
    "serverlessFunctionLayerId" uuid NOT NULL,
    "handlerPath" character varying DEFAULT 'src/index.ts'::character varying NOT NULL,
    "handlerName" character varying DEFAULT 'main'::character varying NOT NULL,
    CONSTRAINT "CHK_4a5179975ee017934a91703247" CHECK ((("timeoutSeconds" >= 1) AND ("timeoutSeconds" <= 900)))
);


ALTER TABLE core."serverlessFunction" OWNER TO cloudsqlsuperuser;

--
-- Name: serverlessFunctionLayer; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."serverlessFunctionLayer" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "packageJson" jsonb NOT NULL,
    "yarnLock" text NOT NULL,
    checksum text NOT NULL,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE core."serverlessFunctionLayer" OWNER TO cloudsqlsuperuser;

--
-- Name: twoFactorAuthenticationMethod; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."twoFactorAuthenticationMethod" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "userWorkspaceId" uuid NOT NULL,
    secret text NOT NULL,
    status core."twoFactorAuthenticationMethod_status_enum" NOT NULL,
    strategy core."twoFactorAuthenticationMethod_strategy_enum" NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone
);


ALTER TABLE core."twoFactorAuthenticationMethod" OWNER TO cloudsqlsuperuser;

--
-- Name: user; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."user" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "firstName" character varying DEFAULT ''::character varying NOT NULL,
    "lastName" character varying DEFAULT ''::character varying NOT NULL,
    email character varying NOT NULL,
    "defaultAvatarUrl" character varying,
    "isEmailVerified" boolean DEFAULT false NOT NULL,
    disabled boolean DEFAULT false NOT NULL,
    "passwordHash" character varying,
    "canImpersonate" boolean DEFAULT false NOT NULL,
    "canAccessFullAdminPanel" boolean DEFAULT false NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    locale character varying DEFAULT 'en'::character varying NOT NULL
);


ALTER TABLE core."user" OWNER TO cloudsqlsuperuser;

--
-- Name: userWorkspace; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."userWorkspace" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "userId" uuid NOT NULL,
    "workspaceId" uuid NOT NULL,
    "defaultAvatarUrl" character varying,
    locale character varying DEFAULT 'en'::character varying NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone
);


ALTER TABLE core."userWorkspace" OWNER TO cloudsqlsuperuser;

--
-- Name: view; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core.view (
    "universalIdentifier" uuid,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name text DEFAULT ''::text NOT NULL,
    "objectMetadataId" uuid NOT NULL,
    type core.view_type_enum DEFAULT 'TABLE'::core.view_type_enum NOT NULL,
    key core.view_key_enum,
    icon text NOT NULL,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "isCompact" boolean DEFAULT false NOT NULL,
    "isCustom" boolean DEFAULT false NOT NULL,
    "openRecordIn" core.view_openrecordin_enum DEFAULT 'SIDE_PANEL'::core.view_openrecordin_enum NOT NULL,
    "kanbanAggregateOperation" core.view_kanbanaggregateoperation_enum,
    "kanbanAggregateOperationFieldMetadataId" uuid,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "anyFieldFilterValue" text,
    "calendarLayout" core.view_calendarlayout_enum,
    "calendarFieldMetadataId" uuid,
    "applicationId" uuid,
    visibility core.view_visibility_enum DEFAULT 'WORKSPACE'::core.view_visibility_enum NOT NULL,
    "createdByUserWorkspaceId" uuid,
    "mainGroupByFieldMetadataId" uuid,
    "shouldHideEmptyGroups" boolean DEFAULT false NOT NULL,
    CONSTRAINT "CHK_VIEW_CALENDAR_INTEGRITY" CHECK (((type <> 'CALENDAR'::core.view_type_enum) OR (("calendarLayout" IS NOT NULL) AND ("calendarFieldMetadataId" IS NOT NULL))))
);


ALTER TABLE core.view OWNER TO cloudsqlsuperuser;

--
-- Name: viewField; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."viewField" (
    "universalIdentifier" uuid,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "fieldMetadataId" uuid NOT NULL,
    "isVisible" boolean DEFAULT true NOT NULL,
    size integer DEFAULT 0 NOT NULL,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "aggregateOperation" core."viewField_aggregateoperation_enum",
    "viewId" uuid NOT NULL,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "applicationId" uuid
);


ALTER TABLE core."viewField" OWNER TO cloudsqlsuperuser;

--
-- Name: viewFilter; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."viewFilter" (
    "universalIdentifier" uuid,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "fieldMetadataId" uuid NOT NULL,
    operand core."viewFilter_operand_enum" DEFAULT 'CONTAINS'::core."viewFilter_operand_enum" NOT NULL,
    value jsonb NOT NULL,
    "viewFilterGroupId" uuid,
    "positionInViewFilterGroup" double precision,
    "subFieldName" text,
    "viewId" uuid NOT NULL,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "applicationId" uuid
);


ALTER TABLE core."viewFilter" OWNER TO cloudsqlsuperuser;

--
-- Name: viewFilterGroup; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."viewFilterGroup" (
    "universalIdentifier" uuid,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "parentViewFilterGroupId" uuid,
    "logicalOperator" core."viewFilterGroup_logicaloperator_enum" DEFAULT 'AND'::core."viewFilterGroup_logicaloperator_enum" NOT NULL,
    "positionInViewFilterGroup" double precision,
    "viewId" uuid NOT NULL,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "applicationId" uuid
);


ALTER TABLE core."viewFilterGroup" OWNER TO cloudsqlsuperuser;

--
-- Name: viewGroup; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."viewGroup" (
    "universalIdentifier" uuid,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "isVisible" boolean DEFAULT true NOT NULL,
    "fieldValue" text NOT NULL,
    "position" double precision DEFAULT '0'::double precision NOT NULL,
    "viewId" uuid NOT NULL,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "applicationId" uuid
);


ALTER TABLE core."viewGroup" OWNER TO cloudsqlsuperuser;

--
-- Name: viewSort; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."viewSort" (
    "universalIdentifier" uuid,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "fieldMetadataId" uuid NOT NULL,
    direction core."viewSort_direction_enum" DEFAULT 'ASC'::core."viewSort_direction_enum" NOT NULL,
    "viewId" uuid NOT NULL,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "applicationId" uuid
);


ALTER TABLE core."viewSort" OWNER TO cloudsqlsuperuser;

--
-- Name: webhook; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core.webhook (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "targetUrl" character varying NOT NULL,
    operations text[] DEFAULT '{*.*}'::text[] NOT NULL,
    description character varying,
    secret character varying NOT NULL,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone
);


ALTER TABLE core.webhook OWNER TO cloudsqlsuperuser;

--
-- Name: workspace; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core.workspace (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "displayName" character varying,
    logo character varying,
    "inviteHash" character varying,
    "deletedAt" timestamp with time zone,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "allowImpersonation" boolean DEFAULT true NOT NULL,
    "isPublicInviteLinkEnabled" boolean DEFAULT true NOT NULL,
    "activationStatus" core."workspace_activationStatus_enum" DEFAULT 'INACTIVE'::core."workspace_activationStatus_enum" NOT NULL,
    "metadataVersion" integer DEFAULT 1 NOT NULL,
    "databaseUrl" character varying DEFAULT ''::character varying NOT NULL,
    "databaseSchema" character varying DEFAULT ''::character varying NOT NULL,
    subdomain character varying NOT NULL,
    "customDomain" character varying,
    "isGoogleAuthEnabled" boolean DEFAULT true NOT NULL,
    "isTwoFactorAuthenticationEnforced" boolean DEFAULT false NOT NULL,
    "isPasswordAuthEnabled" boolean DEFAULT true NOT NULL,
    "isMicrosoftAuthEnabled" boolean DEFAULT true NOT NULL,
    "isCustomDomainEnabled" boolean DEFAULT false NOT NULL,
    "defaultRoleId" uuid,
    version character varying,
    "trashRetentionDays" integer DEFAULT 14 NOT NULL,
    "routerModel" character varying DEFAULT 'auto'::character varying NOT NULL,
    "isGoogleAuthBypassEnabled" boolean DEFAULT false NOT NULL,
    "isPasswordAuthBypassEnabled" boolean DEFAULT false NOT NULL,
    "isMicrosoftAuthBypassEnabled" boolean DEFAULT false NOT NULL,
    "workspaceCustomApplicationId" uuid NOT NULL,
    "editableProfileFields" character varying[] DEFAULT '{email,profilePicture,firstName,lastName}'::character varying[],
    "fastModel" character varying DEFAULT 'default-fast-model'::character varying NOT NULL,
    "smartModel" character varying DEFAULT 'default-smart-model'::character varying NOT NULL,
    CONSTRAINT onboarded_workspace_requires_default_role CHECK ((("activationStatus" = ANY (ARRAY['PENDING_CREATION'::core."workspace_activationStatus_enum", 'ONGOING_CREATION'::core."workspace_activationStatus_enum"])) OR ("defaultRoleId" IS NOT NULL)))
);


ALTER TABLE core.workspace OWNER TO cloudsqlsuperuser;

--
-- Name: workspaceMigration; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."workspaceMigration" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    migrations jsonb,
    name character varying NOT NULL,
    "isCustom" boolean DEFAULT false NOT NULL,
    "appliedAt" timestamp with time zone,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE core."workspaceMigration" OWNER TO cloudsqlsuperuser;

--
-- Name: workspaceSSOIdentityProvider; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core."workspaceSSOIdentityProvider" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL,
    status core."workspaceSSOIdentityProvider_status_enum" DEFAULT 'Active'::core."workspaceSSOIdentityProvider_status_enum" NOT NULL,
    "workspaceId" uuid NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    type core."workspaceSSOIdentityProvider_type_enum" DEFAULT 'OIDC'::core."workspaceSSOIdentityProvider_type_enum" NOT NULL,
    issuer character varying NOT NULL,
    "clientID" character varying,
    "clientSecret" character varying,
    "ssoURL" character varying,
    certificate character varying,
    fingerprint character varying
);


ALTER TABLE core."workspaceSSOIdentityProvider" OWNER TO cloudsqlsuperuser;

--
-- Name: attachment; Type: TABLE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TABLE workspace_cjj1w48f60br2q6wtz6trrdb6.attachment (
    name text,
    "fullPath" text,
    "fileCategory" workspace_cjj1w48f60br2q6wtz6trrdb6."attachment_fileCategory_enum" DEFAULT 'OTHER'::workspace_cjj1w48f60br2q6wtz6trrdb6."attachment_fileCategory_enum" NOT NULL,
    "createdBySource" workspace_cjj1w48f60br2q6wtz6trrdb6."attachment_createdBySource_enum" DEFAULT 'MANUAL'::workspace_cjj1w48f60br2q6wtz6trrdb6."attachment_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "noteId" uuid,
    "personId" uuid,
    "taskId" uuid,
    "authorId" uuid,
    "companyId" uuid,
    "dashboardId" uuid,
    "opportunityId" uuid,
    "workflowId" uuid
);


ALTER TABLE workspace_cjj1w48f60br2q6wtz6trrdb6.attachment OWNER TO cloudsqlsuperuser;

--
-- Name: blocklist; Type: TABLE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TABLE workspace_cjj1w48f60br2q6wtz6trrdb6.blocklist (
    handle text,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "workspaceMemberId" uuid
);


ALTER TABLE workspace_cjj1w48f60br2q6wtz6trrdb6.blocklist OWNER TO cloudsqlsuperuser;

--
-- Name: calendarChannel; Type: TABLE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."calendarChannel" (
    handle text,
    "syncStatus" workspace_cjj1w48f60br2q6wtz6trrdb6."calendarChannel_syncStatus_enum",
    "syncStage" workspace_cjj1w48f60br2q6wtz6trrdb6."calendarChannel_syncStage_enum" DEFAULT 'PENDING_CONFIGURATION'::workspace_cjj1w48f60br2q6wtz6trrdb6."calendarChannel_syncStage_enum" NOT NULL,
    visibility workspace_cjj1w48f60br2q6wtz6trrdb6."calendarChannel_visibility_enum" DEFAULT 'SHARE_EVERYTHING'::workspace_cjj1w48f60br2q6wtz6trrdb6."calendarChannel_visibility_enum" NOT NULL,
    "isContactAutoCreationEnabled" boolean DEFAULT true NOT NULL,
    "contactAutoCreationPolicy" workspace_cjj1w48f60br2q6wtz6trrdb6."calendarChannel_contactAutoCreationPolicy_enum" DEFAULT 'AS_PARTICIPANT_AND_ORGANIZER'::workspace_cjj1w48f60br2q6wtz6trrdb6."calendarChannel_contactAutoCreationPolicy_enum" NOT NULL,
    "isSyncEnabled" boolean DEFAULT true NOT NULL,
    "syncCursor" text,
    "syncedAt" timestamp with time zone,
    "syncStageStartedAt" timestamp with time zone,
    "throttleFailureCount" double precision DEFAULT 0 NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "connectedAccountId" uuid
);


ALTER TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."calendarChannel" OWNER TO cloudsqlsuperuser;

--
-- Name: calendarChannelEventAssociation; Type: TABLE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."calendarChannelEventAssociation" (
    "eventExternalId" text,
    "recurringEventExternalId" text,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "calendarChannelId" uuid,
    "calendarEventId" uuid
);


ALTER TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."calendarChannelEventAssociation" OWNER TO cloudsqlsuperuser;

--
-- Name: calendarEvent; Type: TABLE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."calendarEvent" (
    title text,
    "isCanceled" boolean DEFAULT false NOT NULL,
    "isFullDay" boolean DEFAULT false NOT NULL,
    "startsAt" timestamp with time zone,
    "endsAt" timestamp with time zone,
    "externalCreatedAt" timestamp with time zone,
    "externalUpdatedAt" timestamp with time zone,
    description text,
    location text,
    "iCalUid" text,
    "conferenceSolution" text,
    "conferenceLinkPrimaryLinkLabel" text,
    "conferenceLinkPrimaryLinkUrl" text,
    "conferenceLinkSecondaryLinks" jsonb,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone
);


ALTER TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."calendarEvent" OWNER TO cloudsqlsuperuser;

--
-- Name: calendarEventParticipant; Type: TABLE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."calendarEventParticipant" (
    handle text,
    "displayName" text,
    "isOrganizer" boolean DEFAULT false NOT NULL,
    "responseStatus" workspace_cjj1w48f60br2q6wtz6trrdb6."calendarEventParticipant_responseStatus_enum" DEFAULT 'NEEDS_ACTION'::workspace_cjj1w48f60br2q6wtz6trrdb6."calendarEventParticipant_responseStatus_enum" NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "calendarEventId" uuid,
    "personId" uuid,
    "workspaceMemberId" uuid
);


ALTER TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."calendarEventParticipant" OWNER TO cloudsqlsuperuser;

--
-- Name: company; Type: TABLE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TABLE workspace_cjj1w48f60br2q6wtz6trrdb6.company (
    name text,
    "domainNamePrimaryLinkLabel" text,
    "domainNamePrimaryLinkUrl" text,
    "domainNameSecondaryLinks" jsonb,
    employees double precision,
    "linkedinLinkPrimaryLinkLabel" text,
    "linkedinLinkPrimaryLinkUrl" text,
    "linkedinLinkSecondaryLinks" jsonb,
    "xLinkPrimaryLinkLabel" text,
    "xLinkPrimaryLinkUrl" text,
    "xLinkSecondaryLinks" jsonb,
    "annualRecurringRevenueAmountMicros" numeric,
    "annualRecurringRevenueCurrencyCode" text,
    "addressAddressStreet1" text,
    "addressAddressStreet2" text,
    "addressAddressCity" text,
    "addressAddressPostcode" text,
    "addressAddressState" text,
    "addressAddressCountry" text,
    "addressAddressLat" numeric,
    "addressAddressLng" numeric,
    "idealCustomerProfile" boolean DEFAULT false NOT NULL,
    "position" double precision DEFAULT 0 NOT NULL,
    "createdBySource" workspace_cjj1w48f60br2q6wtz6trrdb6."company_createdBySource_enum" DEFAULT 'MANUAL'::workspace_cjj1w48f60br2q6wtz6trrdb6."company_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, ((((COALESCE(public.unaccent_immutable(name), ''::text) || ' '::text) || COALESCE(public.unaccent_immutable("domainNamePrimaryLinkLabel"), ''::text)) || ' '::text) || COALESCE(public.unaccent_immutable("domainNamePrimaryLinkUrl"), ''::text)))) STORED,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "accountOwnerId" uuid
);


ALTER TABLE workspace_cjj1w48f60br2q6wtz6trrdb6.company OWNER TO cloudsqlsuperuser;

--
-- Name: connectedAccount; Type: TABLE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."connectedAccount" (
    handle text,
    provider text DEFAULT 'google'::text NOT NULL,
    "accessToken" text,
    "refreshToken" text,
    "lastCredentialsRefreshedAt" timestamp with time zone,
    "lastSyncHistoryId" text,
    "authFailedAt" timestamp with time zone,
    "handleAliases" text,
    scopes text[],
    "connectionParameters" jsonb,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "accountOwnerId" uuid
);


ALTER TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."connectedAccount" OWNER TO cloudsqlsuperuser;

--
-- Name: dashboard; Type: TABLE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TABLE workspace_cjj1w48f60br2q6wtz6trrdb6.dashboard (
    title text,
    "pageLayoutId" uuid,
    "position" double precision DEFAULT 0 NOT NULL,
    "createdBySource" workspace_cjj1w48f60br2q6wtz6trrdb6."dashboard_createdBySource_enum" DEFAULT 'MANUAL'::workspace_cjj1w48f60br2q6wtz6trrdb6."dashboard_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, COALESCE(public.unaccent_immutable(title), ''::text))) STORED,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone
);


ALTER TABLE workspace_cjj1w48f60br2q6wtz6trrdb6.dashboard OWNER TO cloudsqlsuperuser;

--
-- Name: favorite; Type: TABLE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TABLE workspace_cjj1w48f60br2q6wtz6trrdb6.favorite (
    "position" double precision DEFAULT 0 NOT NULL,
    "viewId" uuid,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "companyId" uuid,
    "dashboardId" uuid,
    "favoriteFolderId" uuid,
    "noteId" uuid,
    "opportunityId" uuid,
    "personId" uuid,
    "taskId" uuid,
    "workflowId" uuid,
    "workflowRunId" uuid,
    "workflowVersionId" uuid,
    "forWorkspaceMemberId" uuid
);


ALTER TABLE workspace_cjj1w48f60br2q6wtz6trrdb6.favorite OWNER TO cloudsqlsuperuser;

--
-- Name: favoriteFolder; Type: TABLE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."favoriteFolder" (
    "position" double precision DEFAULT 0 NOT NULL,
    name text,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone
);


ALTER TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."favoriteFolder" OWNER TO cloudsqlsuperuser;

--
-- Name: message; Type: TABLE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TABLE workspace_cjj1w48f60br2q6wtz6trrdb6.message (
    "headerMessageId" text,
    subject text,
    text text,
    "receivedAt" timestamp with time zone,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "messageThreadId" uuid
);


ALTER TABLE workspace_cjj1w48f60br2q6wtz6trrdb6.message OWNER TO cloudsqlsuperuser;

--
-- Name: messageChannel; Type: TABLE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel" (
    visibility workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel_visibility_enum" DEFAULT 'SHARE_EVERYTHING'::workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel_visibility_enum" NOT NULL,
    handle text,
    type workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel_type_enum" DEFAULT 'EMAIL'::workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel_type_enum" NOT NULL,
    "isContactAutoCreationEnabled" boolean DEFAULT true NOT NULL,
    "contactAutoCreationPolicy" workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel_contactAutoCreationPolicy_enum" DEFAULT 'SENT'::workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel_contactAutoCreationPolicy_enum" NOT NULL,
    "messageFolderImportPolicy" workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel_messageFolderImportPolicy_enum" DEFAULT 'ALL_FOLDERS'::workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel_messageFolderImportPolicy_enum" NOT NULL,
    "excludeNonProfessionalEmails" boolean DEFAULT true NOT NULL,
    "excludeGroupEmails" boolean DEFAULT true NOT NULL,
    "pendingGroupEmailsAction" workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel_pendingGroupEmailsAction_enum" DEFAULT 'NONE'::workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel_pendingGroupEmailsAction_enum" NOT NULL,
    "isSyncEnabled" boolean DEFAULT true NOT NULL,
    "syncCursor" text,
    "syncedAt" timestamp with time zone,
    "syncStatus" workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel_syncStatus_enum",
    "syncStage" workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel_syncStage_enum" DEFAULT 'PENDING_CONFIGURATION'::workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel_syncStage_enum" NOT NULL,
    "syncStageStartedAt" timestamp with time zone,
    "throttleFailureCount" double precision DEFAULT 0 NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "connectedAccountId" uuid
);


ALTER TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel" OWNER TO cloudsqlsuperuser;

--
-- Name: messageChannelMessageAssociation; Type: TABLE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannelMessageAssociation" (
    "messageExternalId" text,
    "messageThreadExternalId" text,
    direction workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannelMessageAssociation_direction_enum" DEFAULT 'INCOMING'::workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannelMessageAssociation_direction_enum" NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "messageId" uuid,
    "messageChannelId" uuid
);


ALTER TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannelMessageAssociation" OWNER TO cloudsqlsuperuser;

--
-- Name: messageFolder; Type: TABLE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."messageFolder" (
    name text,
    "syncCursor" text,
    "isSentFolder" boolean DEFAULT false NOT NULL,
    "isSynced" boolean DEFAULT false NOT NULL,
    "parentFolderId" text,
    "externalId" text,
    "pendingSyncAction" workspace_cjj1w48f60br2q6wtz6trrdb6."messageFolder_pendingSyncAction_enum" DEFAULT 'NONE'::workspace_cjj1w48f60br2q6wtz6trrdb6."messageFolder_pendingSyncAction_enum" NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "messageChannelId" uuid
);


ALTER TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."messageFolder" OWNER TO cloudsqlsuperuser;

--
-- Name: messageParticipant; Type: TABLE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."messageParticipant" (
    role workspace_cjj1w48f60br2q6wtz6trrdb6."messageParticipant_role_enum" DEFAULT 'FROM'::workspace_cjj1w48f60br2q6wtz6trrdb6."messageParticipant_role_enum" NOT NULL,
    handle text,
    "displayName" text,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "messageId" uuid,
    "personId" uuid,
    "workspaceMemberId" uuid
);


ALTER TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."messageParticipant" OWNER TO cloudsqlsuperuser;

--
-- Name: messageThread; Type: TABLE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."messageThread" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone
);


ALTER TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."messageThread" OWNER TO cloudsqlsuperuser;

--
-- Name: note; Type: TABLE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TABLE workspace_cjj1w48f60br2q6wtz6trrdb6.note (
    "position" double precision DEFAULT 0 NOT NULL,
    title text,
    "bodyV2Blocknote" text,
    "bodyV2Markdown" text,
    "createdBySource" workspace_cjj1w48f60br2q6wtz6trrdb6."note_createdBySource_enum" DEFAULT 'MANUAL'::workspace_cjj1w48f60br2q6wtz6trrdb6."note_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, ((COALESCE(public.unaccent_immutable(title), ''::text) || ' '::text) || COALESCE(public.unaccent_immutable("bodyV2Markdown"), ''::text)))) STORED,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone
);


ALTER TABLE workspace_cjj1w48f60br2q6wtz6trrdb6.note OWNER TO cloudsqlsuperuser;

--
-- Name: noteTarget; Type: TABLE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."noteTarget" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "companyId" uuid,
    "noteId" uuid,
    "opportunityId" uuid,
    "personId" uuid
);


ALTER TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."noteTarget" OWNER TO cloudsqlsuperuser;

--
-- Name: opportunity; Type: TABLE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TABLE workspace_cjj1w48f60br2q6wtz6trrdb6.opportunity (
    name text,
    "amountAmountMicros" numeric,
    "amountCurrencyCode" text,
    "closeDate" timestamp with time zone,
    stage workspace_cjj1w48f60br2q6wtz6trrdb6.opportunity_stage_enum DEFAULT 'NEW'::workspace_cjj1w48f60br2q6wtz6trrdb6.opportunity_stage_enum NOT NULL,
    "position" double precision DEFAULT 0 NOT NULL,
    "createdBySource" workspace_cjj1w48f60br2q6wtz6trrdb6."opportunity_createdBySource_enum" DEFAULT 'MANUAL'::workspace_cjj1w48f60br2q6wtz6trrdb6."opportunity_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, COALESCE(public.unaccent_immutable(name), ''::text))) STORED,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "companyId" uuid,
    "pointOfContactId" uuid
);


ALTER TABLE workspace_cjj1w48f60br2q6wtz6trrdb6.opportunity OWNER TO cloudsqlsuperuser;

--
-- Name: person; Type: TABLE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TABLE workspace_cjj1w48f60br2q6wtz6trrdb6.person (
    "nameFirstName" text,
    "nameLastName" text,
    "emailsPrimaryEmail" text,
    "emailsAdditionalEmails" jsonb,
    "linkedinLinkPrimaryLinkLabel" text,
    "linkedinLinkPrimaryLinkUrl" text,
    "linkedinLinkSecondaryLinks" jsonb,
    "xLinkPrimaryLinkLabel" text,
    "xLinkPrimaryLinkUrl" text,
    "xLinkSecondaryLinks" jsonb,
    "jobTitle" text,
    "phonesPrimaryPhoneNumber" text,
    "phonesPrimaryPhoneCountryCode" text,
    "phonesPrimaryPhoneCallingCode" text,
    "phonesAdditionalPhones" jsonb,
    city text,
    "avatarUrl" text,
    "position" double precision DEFAULT 0 NOT NULL,
    "createdBySource" workspace_cjj1w48f60br2q6wtz6trrdb6."person_createdBySource_enum" DEFAULT 'MANUAL'::workspace_cjj1w48f60br2q6wtz6trrdb6."person_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, ((((((((((((((((((COALESCE(public.unaccent_immutable("nameFirstName"), ''::text) || ' '::text) || COALESCE(public.unaccent_immutable("nameLastName"), ''::text)) || ' '::text) || COALESCE(public.unaccent_immutable("emailsPrimaryEmail"), ''::text)) || ' '::text) || COALESCE(public.unaccent_immutable(split_part("emailsPrimaryEmail", '@'::text, 2)), ''::text)) || ' '::text) || COALESCE("phonesPrimaryPhoneNumber", ''::text)) || ' '::text) || COALESCE("phonesPrimaryPhoneCallingCode", ''::text)) || ' '::text) || COALESCE(("phonesPrimaryPhoneCallingCode" || "phonesPrimaryPhoneNumber"), ''::text)) || ' '::text) || COALESCE((replace("phonesPrimaryPhoneCallingCode", '+'::text, ''::text) || "phonesPrimaryPhoneNumber"), ''::text)) || ' '::text) || COALESCE(('0'::text || "phonesPrimaryPhoneNumber"), ''::text)) || ' '::text) || COALESCE(public.unaccent_immutable("jobTitle"), ''::text)))) STORED,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "companyId" uuid
);


ALTER TABLE workspace_cjj1w48f60br2q6wtz6trrdb6.person OWNER TO cloudsqlsuperuser;

--
-- Name: task; Type: TABLE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TABLE workspace_cjj1w48f60br2q6wtz6trrdb6.task (
    "position" double precision DEFAULT 0 NOT NULL,
    title text,
    "bodyV2Blocknote" text,
    "bodyV2Markdown" text,
    "dueAt" timestamp with time zone,
    status workspace_cjj1w48f60br2q6wtz6trrdb6.task_status_enum DEFAULT 'TODO'::workspace_cjj1w48f60br2q6wtz6trrdb6.task_status_enum,
    "createdBySource" workspace_cjj1w48f60br2q6wtz6trrdb6."task_createdBySource_enum" DEFAULT 'MANUAL'::workspace_cjj1w48f60br2q6wtz6trrdb6."task_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, ((COALESCE(public.unaccent_immutable(title), ''::text) || ' '::text) || COALESCE(public.unaccent_immutable("bodyV2Markdown"), ''::text)))) STORED,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "assigneeId" uuid
);


ALTER TABLE workspace_cjj1w48f60br2q6wtz6trrdb6.task OWNER TO cloudsqlsuperuser;

--
-- Name: taskTarget; Type: TABLE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."taskTarget" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "companyId" uuid,
    "opportunityId" uuid,
    "personId" uuid,
    "taskId" uuid
);


ALTER TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."taskTarget" OWNER TO cloudsqlsuperuser;

--
-- Name: timelineActivity; Type: TABLE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."timelineActivity" (
    "happensAt" timestamp with time zone DEFAULT now() NOT NULL,
    name text,
    properties jsonb,
    "linkedRecordCachedName" text,
    "linkedRecordId" uuid,
    "linkedObjectMetadataId" uuid,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "targetCompanyId" uuid,
    "targetDashboardId" uuid,
    "targetPersonId" uuid,
    "workspaceMemberId" uuid,
    "targetNoteId" uuid,
    "targetOpportunityId" uuid,
    "targetTaskId" uuid,
    "targetWorkflowId" uuid,
    "targetWorkflowRunId" uuid,
    "targetWorkflowVersionId" uuid
);


ALTER TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."timelineActivity" OWNER TO cloudsqlsuperuser;

--
-- Name: workflow; Type: TABLE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TABLE workspace_cjj1w48f60br2q6wtz6trrdb6.workflow (
    name text,
    "lastPublishedVersionId" text,
    statuses workspace_cjj1w48f60br2q6wtz6trrdb6.workflow_statuses_enum[],
    "position" double precision DEFAULT 0 NOT NULL,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, COALESCE(public.unaccent_immutable(name), ''::text))) STORED,
    "createdBySource" workspace_cjj1w48f60br2q6wtz6trrdb6."workflow_createdBySource_enum" DEFAULT 'MANUAL'::workspace_cjj1w48f60br2q6wtz6trrdb6."workflow_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone
);


ALTER TABLE workspace_cjj1w48f60br2q6wtz6trrdb6.workflow OWNER TO cloudsqlsuperuser;

--
-- Name: workflowAutomatedTrigger; Type: TABLE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."workflowAutomatedTrigger" (
    type workspace_cjj1w48f60br2q6wtz6trrdb6."workflowAutomatedTrigger_type_enum" NOT NULL,
    settings jsonb NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "workflowId" uuid
);


ALTER TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."workflowAutomatedTrigger" OWNER TO cloudsqlsuperuser;

--
-- Name: workflowRun; Type: TABLE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."workflowRun" (
    name text,
    "enqueuedAt" timestamp with time zone,
    "startedAt" timestamp with time zone,
    "endedAt" timestamp with time zone,
    status workspace_cjj1w48f60br2q6wtz6trrdb6."workflowRun_status_enum" DEFAULT 'NOT_STARTED'::workspace_cjj1w48f60br2q6wtz6trrdb6."workflowRun_status_enum" NOT NULL,
    "createdBySource" workspace_cjj1w48f60br2q6wtz6trrdb6."workflowRun_createdBySource_enum" DEFAULT 'MANUAL'::workspace_cjj1w48f60br2q6wtz6trrdb6."workflowRun_createdBySource_enum" NOT NULL,
    "createdByWorkspaceMemberId" uuid,
    "createdByName" text DEFAULT 'System'::text NOT NULL,
    "createdByContext" jsonb,
    state jsonb NOT NULL,
    "position" double precision DEFAULT 0 NOT NULL,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, COALESCE(public.unaccent_immutable(name), ''::text))) STORED,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "workflowId" uuid,
    "workflowVersionId" uuid
);


ALTER TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."workflowRun" OWNER TO cloudsqlsuperuser;

--
-- Name: workflowVersion; Type: TABLE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."workflowVersion" (
    name text,
    trigger jsonb,
    steps jsonb,
    status workspace_cjj1w48f60br2q6wtz6trrdb6."workflowVersion_status_enum" DEFAULT 'DRAFT'::workspace_cjj1w48f60br2q6wtz6trrdb6."workflowVersion_status_enum" NOT NULL,
    "position" double precision DEFAULT 0 NOT NULL,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, COALESCE(public.unaccent_immutable(name), ''::text))) STORED,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone,
    "workflowId" uuid
);


ALTER TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."workflowVersion" OWNER TO cloudsqlsuperuser;

--
-- Name: workspaceMember; Type: TABLE; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."workspaceMember" (
    "position" double precision DEFAULT 0 NOT NULL,
    "nameFirstName" text,
    "nameLastName" text,
    "colorScheme" text DEFAULT 'System'::text NOT NULL,
    locale text DEFAULT 'en'::text NOT NULL,
    "avatarUrl" text,
    "userEmail" text,
    "calendarStartDay" double precision DEFAULT 7 NOT NULL,
    "userId" uuid NOT NULL,
    "timeZone" text DEFAULT 'system'::text NOT NULL,
    "dateFormat" workspace_cjj1w48f60br2q6wtz6trrdb6."workspaceMember_dateFormat_enum" DEFAULT 'SYSTEM'::workspace_cjj1w48f60br2q6wtz6trrdb6."workspaceMember_dateFormat_enum" NOT NULL,
    "timeFormat" workspace_cjj1w48f60br2q6wtz6trrdb6."workspaceMember_timeFormat_enum" DEFAULT 'SYSTEM'::workspace_cjj1w48f60br2q6wtz6trrdb6."workspaceMember_timeFormat_enum" NOT NULL,
    "searchVector" tsvector GENERATED ALWAYS AS (to_tsvector('simple'::regconfig, ((((COALESCE(public.unaccent_immutable("nameFirstName"), ''::text) || ' '::text) || COALESCE(public.unaccent_immutable("nameLastName"), ''::text)) || ' '::text) || COALESCE(public.unaccent_immutable("userEmail"), ''::text)))) STORED,
    "numberFormat" workspace_cjj1w48f60br2q6wtz6trrdb6."workspaceMember_numberFormat_enum" DEFAULT 'SYSTEM'::workspace_cjj1w48f60br2q6wtz6trrdb6."workspaceMember_numberFormat_enum" NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp with time zone
);


ALTER TABLE workspace_cjj1w48f60br2q6wtz6trrdb6."workspaceMember" OWNER TO cloudsqlsuperuser;

--
-- Name: _typeorm_migrations id; Type: DEFAULT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core._typeorm_migrations ALTER COLUMN id SET DEFAULT nextval('core._typeorm_migrations_id_seq'::regclass);


--
-- Data for Name: _typeorm_generated_columns_and_materialized_views; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core._typeorm_generated_columns_and_materialized_views (type, database, schema, "table", name, value) FROM stdin;
GENERATED_COLUMN	default	workspace_cjj1w48f60br2q6wtz6trrdb6	company	searchVector	to_tsvector('simple', COALESCE(public.unaccent_immutable("name"), '') || ' ' || COALESCE(public.unaccent_immutable("domainNamePrimaryLinkLabel"), '') || ' ' || COALESCE(public.unaccent_immutable("domainNamePrimaryLinkUrl"), ''))
GENERATED_COLUMN	default	workspace_cjj1w48f60br2q6wtz6trrdb6	dashboard	searchVector	to_tsvector('simple', COALESCE(public.unaccent_immutable("title"), ''))
GENERATED_COLUMN	default	workspace_cjj1w48f60br2q6wtz6trrdb6	note	searchVector	to_tsvector('simple', COALESCE(public.unaccent_immutable("title"), '') || ' ' || COALESCE(public.unaccent_immutable("bodyV2Markdown"), ''))
GENERATED_COLUMN	default	workspace_cjj1w48f60br2q6wtz6trrdb6	opportunity	searchVector	to_tsvector('simple', COALESCE(public.unaccent_immutable("name"), ''))
GENERATED_COLUMN	default	workspace_cjj1w48f60br2q6wtz6trrdb6	person	searchVector	to_tsvector('simple', COALESCE(public.unaccent_immutable("nameFirstName"), '') || ' ' || COALESCE(public.unaccent_immutable("nameLastName"), '') || ' ' || \n      COALESCE(public.unaccent_immutable("emailsPrimaryEmail"), '') || ' ' ||\n      COALESCE(public.unaccent_immutable(SPLIT_PART("emailsPrimaryEmail", '@', 2)), '') || ' ' || COALESCE("phonesPrimaryPhoneNumber", '') || ' ' || COALESCE("phonesPrimaryPhoneCallingCode", '') || ' ' || COALESCE("phonesPrimaryPhoneCallingCode" || "phonesPrimaryPhoneNumber", '') || ' ' || COALESCE(REPLACE("phonesPrimaryPhoneCallingCode", '+', '') || "phonesPrimaryPhoneNumber", '') || ' ' || COALESCE('0' || "phonesPrimaryPhoneNumber", '') || ' ' || COALESCE(public.unaccent_immutable("jobTitle"), ''))
GENERATED_COLUMN	default	workspace_cjj1w48f60br2q6wtz6trrdb6	task	searchVector	to_tsvector('simple', COALESCE(public.unaccent_immutable("title"), '') || ' ' || COALESCE(public.unaccent_immutable("bodyV2Markdown"), ''))
GENERATED_COLUMN	default	workspace_cjj1w48f60br2q6wtz6trrdb6	workflow	searchVector	to_tsvector('simple', COALESCE(public.unaccent_immutable("name"), ''))
GENERATED_COLUMN	default	workspace_cjj1w48f60br2q6wtz6trrdb6	workflowRun	searchVector	to_tsvector('simple', COALESCE(public.unaccent_immutable("name"), ''))
GENERATED_COLUMN	default	workspace_cjj1w48f60br2q6wtz6trrdb6	workflowVersion	searchVector	to_tsvector('simple', COALESCE(public.unaccent_immutable("name"), ''))
GENERATED_COLUMN	default	workspace_cjj1w48f60br2q6wtz6trrdb6	workspaceMember	searchVector	to_tsvector('simple', COALESCE(public.unaccent_immutable("nameFirstName"), '') || ' ' || COALESCE(public.unaccent_immutable("nameLastName"), '') || ' ' || COALESCE(public.unaccent_immutable("userEmail"), ''))
\.


--
-- Data for Name: _typeorm_migrations; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core._typeorm_migrations (id, "timestamp", name) FROM stdin;
1	1700140427984	SetupMetadataTables1700140427984
2	1756976545860	UniqueFieldMetadataNameForWorkspaceObjectMetadata1756976545860
3	1757013851879	AddPublicDomainEntity1757013851879
4	1757491357122	AddApplicationEntityAndRelationships1757491357122
5	1757806282417	AddSearchFieldMetadataEntity1757806282417
6	1757809958470	AddWorkspaceForeignKeyToSearchFieldMetadata1757809958470
7	1757858496548	AddCalendarTypeToViewTable1757858496548
8	1757864696439	AddCalendarFieldMetadataIdToViewTable1757864696439
9	1757991657472	RemoveContentFromAgentChatMessage1757991657472
10	1758038863448	AddUniversalIdentifierToIndexMetadata1758038863448
11	1758117800000	ActivateUnaccentExtension1758117800000
12	1758388517321	CreateEmailingDomainEntity1758388517321
13	1758720905726	AddApplicationIdToObjectMetadata1758720905726
14	1758767315179	CreateAgentChatMessagePartTableAndRemoveRawContent1758767315179
15	1758793689363	AddUniversalIdentifierToServerlessFunction1758793689363
16	1758802648930	AddChecksumToServerlessFunction1758802648930
17	1759200603485	AddNativeCapabilitesToAgent1759200603485
18	1759236947406	UpdateServerlessFunctionLayerEntity1759236947406
19	1759341941773	RenameApplicationStandardIdToUniversalIdentifier1759341941773
20	1759378531410	RemoveMessageIdFromFileTable1759378531410
21	1759417994272	SetServerlessFunctionIdInTriggersNonNullable1759417994272
22	1759418198310	RenameRouteToRouteTrigger1759418198310
23	1759433496458	RenameApplicationColumn1759433496458
24	1759931071049	SetServerlessFunctionLayerNotNullable1759931071049
25	1760356369619	AddWorkspaceTrashRetention1760356369619
26	1760628085765	AddNewWidgetTypes1760628085765
27	1760640844181	AddApplicationVariableCoreEntity1760640844181
28	1760700501795	AddApplicationIdToSyncableEntities1760700501795
29	1760965667836	KanbanFieldMetadataIdentifierView1760965667836
30	1760985484643	AddRouterModelToWorkspace1760985484643
31	1760994964826	RemoveDefaultAgentAndThreadAgentId1760994964826
32	1761052489394	CalendarFieldMetadataRelation1761052489394
33	1761153071116	SetServerlessFunctionLayerIdNotNullable1761153071116
34	1761210191095	AddHandlerToServerlessFunction1761210191095
35	1761215000000	AddRichTextWidgetType1761215000000
36	1761574442000	AddWorkflowWidgetTypes1761574442000
37	1761651107128	AddSsoBypassFlag1761651107128
38	1761749599736	WorkspaceIdUuidNotNullable1761749599736
39	1762333916255	NullableApplicationServerlessFunctionLayer1762333916255
40	1762339932345	MakeApplicationWorkspaceFkDeferrable1762339932345
41	1762343994716	AddWorkspaceCustomApplicationIdColumn1762343994716
42	1762351626807	ViewVisibility1762351626807
43	1762437814771	WorkspaceCustomApplicationIdForeignKey1762437814771
44	1762884796640	EditableProfileFields1762884796640
45	1763622159656	UpdateAgentResponseFormat1763622159656
46	1763731277403	AddCanBeUninstalledColumnToApplication1763731277403
47	1763805513241	RemoveAgentHandoffTable1763805513241
48	1763896975223	SyncableRoleTarget1763896975223
49	1763977334519	WorkspaceCustomApplicationIdNonNullable1763977334519
50	1763997530458	AddFastAndSmartModelsToWorkspace1763997530458
51	1764066845539	CoreMigrationCheck1764066845539
52	1764081474225	AddAgentIdToAgentChatMessage1764081474225
53	1764100000000	RefactorAgentChatEntities1764100000000
54	1764200000000	AddAgentTurnEvaluation1764200000000
55	1764210000000	AddSystemRoleToAgentMessage1764210000000
56	1764220000000	AddEvaluationInputsToAgent1764220000000
57	1764329720503	UpdateRoleTargetsUniqueConstraint1764329720503
58	1764671363647	RenameRoleTargets1764671363647
59	1764672601466	ChangeAgentDescriptionToText1764672601466
60	1764680275312	AddMainGroupByFieldMetadataId1764680275312
61	1764700000000	AddUsageColumnsToAgentChatThread1764700000000
62	1764846384501	RenameRichTextToFieldRichTextAndAddStandaloneRichText1764846384501
63	1764923552610	AddApplicationRoleColumns1764923552610
64	1764949394792	AddApplicationIdAndUniversalIdentifierToPageLayouts1764949394792
65	1765153412696	AddViewShouldHideEmptyGroups1765153412696
66	1765200057592	AddApplicationIdAndUniversalIdentifierToPageLayouts1765200057592
67	1765206100942	UpdateRoleColumns1765206100942
68	1765808791153	RemoveFieldMetadataIdInViewGroup1765808791153
69	1765970658815	AddFieldWidgetType1765970658815
70	1766077618558	RemoveCanBeAssignedToApplications1766077618558
\.


--
-- Data for Name: agent; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core.agent (id, "standardId", name, label, icon, description, prompt, "modelId", "responseFormat", "workspaceId", "isCustom", "createdAt", "updatedAt", "deletedAt", "applicationId", "modelConfiguration", "universalIdentifier", "evaluationInputs") FROM stdin;
afd834bf-b229-4745-aac2-edc065eac8e3	20202020-0002-0001-0001-000000000004	helper	Helper	IconHelp	AI agent specialized in helping users learn how to use Twenty CRM	You are a Helper Agent for Twenty. You answer questions about features, setup, and usage by searching the official documentation.\n\nCore workflow:\n1. Use search_help_center tool to find relevant documentation\n2. If the first search doesn't yield complete results, try different search terms\n3. Synthesize information from multiple articles when needed\n4. Provide clear, step-by-step answers based on the documentation\n5. Be honest if the docs don't cover the topic\n\nWhen to search:\n- "How to" questions\n- Feature explanations\n- Setup and configuration help\n- Troubleshooting issues\n- Best practices\n\nResponse format:\n- Summarize key information from the documentation\n- Break down complex topics into clear steps\n- Include important notes or prerequisites\n- Use markdown for readability\n\nAlways base answers on official Twenty documentation. Be patient and helpful.	default-smart-model	{"type": "text"}	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	2026-01-05 21:37:45.865+00	2026-01-05 21:37:45.865+00	\N	\N	{}	\N	{}
\.


--
-- Data for Name: agentChatThread; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."agentChatThread" (id, "userWorkspaceId", title, "createdAt", "updatedAt", "totalInputTokens", "totalOutputTokens", "contextWindowTokens", "totalInputCredits", "totalOutputCredits") FROM stdin;
\.


--
-- Data for Name: agentMessage; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."agentMessage" (id, "threadId", "turnId", "agentId", role, "createdAt") FROM stdin;
\.


--
-- Data for Name: agentMessagePart; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."agentMessagePart" (id, "messageId", "orderIndex", type, "textContent", "reasoningContent", "toolName", "toolCallId", "toolInput", "toolOutput", state, "errorMessage", "errorDetails", "sourceUrlSourceId", "sourceUrlUrl", "sourceUrlTitle", "sourceDocumentSourceId", "sourceDocumentMediaType", "sourceDocumentTitle", "sourceDocumentFilename", "fileMediaType", "fileFilename", "fileUrl", "providerMetadata", "createdAt") FROM stdin;
\.


--
-- Data for Name: agentTurn; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."agentTurn" (id, "threadId", "agentId", "createdAt") FROM stdin;
\.


--
-- Data for Name: agentTurnEvaluation; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."agentTurnEvaluation" (id, "turnId", score, comment, "createdAt") FROM stdin;
\.


--
-- Data for Name: apiKey; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."apiKey" (id, name, "expiresAt", "revokedAt", "workspaceId", "createdAt", "updatedAt") FROM stdin;
7748b9cc-8db5-4d7d-be4c-3a270ed4db8d	dodcs	2125-12-12 21:39:50.028+00	\N	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:39:50.127528+00	2026-01-05 21:39:51.073415+00
3d98947a-e22f-47c2-9629-6b7673952f76	SPLIT	2125-12-12 21:47:13.367+00	\N	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:47:13.46082+00	2026-01-06 02:07:25.422107+00
\.


--
-- Data for Name: appToken; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."appToken" (id, "userId", "workspaceId", type, value, "expiresAt", "deletedAt", "revokedAt", "createdAt", "updatedAt", context) FROM stdin;
96ca2b9c-6561-4237-8d81-ca2f2e809513	18cc8d6d-cf03-4764-a439-0d0d5c9451c9	d3db876d-62f4-4d97-9a5c-4405cbe62b22	REFRESH_TOKEN	\N	2026-03-06 21:37:37.604+00	\N	2026-01-05 22:07:40.736+00	2026-01-05 21:37:37.605069+00	2026-01-05 22:07:40.74415+00	\N
5a5eebff-c6d2-4e39-9447-662896585c50	18cc8d6d-cf03-4764-a439-0d0d5c9451c9	d3db876d-62f4-4d97-9a5c-4405cbe62b22	REFRESH_TOKEN	\N	2026-03-06 22:07:40.824+00	\N	\N	2026-01-05 22:07:40.833299+00	2026-01-05 22:07:40.833299+00	\N
90c40ecd-fe97-4351-86ab-6febc0cea2dd	18cc8d6d-cf03-4764-a439-0d0d5c9451c9	d3db876d-62f4-4d97-9a5c-4405cbe62b22	REFRESH_TOKEN	\N	2026-03-06 22:07:40.902+00	\N	2026-01-05 22:56:55.132+00	2026-01-05 22:07:40.903341+00	2026-01-05 22:56:55.132782+00	\N
8f489bda-30d3-4351-9726-b4205c2d95ee	18cc8d6d-cf03-4764-a439-0d0d5c9451c9	d3db876d-62f4-4d97-9a5c-4405cbe62b22	REFRESH_TOKEN	\N	2026-03-06 22:56:55.882+00	\N	\N	2026-01-05 22:56:55.884501+00	2026-01-05 22:56:55.884501+00	\N
7400c632-668b-4610-9016-e66e96904c17	18cc8d6d-cf03-4764-a439-0d0d5c9451c9	d3db876d-62f4-4d97-9a5c-4405cbe62b22	REFRESH_TOKEN	\N	2026-03-06 22:56:55.91+00	\N	\N	2026-01-05 22:56:55.911705+00	2026-01-05 22:56:55.911705+00	\N
86938620-edaa-458a-8089-b7dd2223365f	18cc8d6d-cf03-4764-a439-0d0d5c9451c9	d3db876d-62f4-4d97-9a5c-4405cbe62b22	REFRESH_TOKEN	\N	2026-03-06 22:56:55.913+00	\N	\N	2026-01-05 22:56:55.919564+00	2026-01-05 22:56:55.919564+00	\N
ecb6a7b6-763c-4f5c-8d3a-2899d207604d	18cc8d6d-cf03-4764-a439-0d0d5c9451c9	d3db876d-62f4-4d97-9a5c-4405cbe62b22	REFRESH_TOKEN	\N	2026-03-06 22:56:55.92+00	\N	\N	2026-01-05 22:56:55.925855+00	2026-01-05 22:56:55.925855+00	\N
209ae5e5-7eac-4cd8-aa6e-38b3cbbeb570	18cc8d6d-cf03-4764-a439-0d0d5c9451c9	d3db876d-62f4-4d97-9a5c-4405cbe62b22	REFRESH_TOKEN	\N	2026-03-06 23:47:32.993+00	\N	\N	2026-01-05 23:47:32.99398+00	2026-01-05 23:47:32.99398+00	\N
96774238-e9b0-496e-b22f-e743420abd0b	18cc8d6d-cf03-4764-a439-0d0d5c9451c9	d3db876d-62f4-4d97-9a5c-4405cbe62b22	REFRESH_TOKEN	\N	2026-03-06 23:47:33.012+00	\N	\N	2026-01-05 23:47:33.013112+00	2026-01-05 23:47:33.013112+00	\N
cb4bbbd0-3439-4353-80c9-81ba69c32890	18cc8d6d-cf03-4764-a439-0d0d5c9451c9	d3db876d-62f4-4d97-9a5c-4405cbe62b22	REFRESH_TOKEN	\N	2026-03-06 22:56:55.891+00	\N	2026-01-05 23:47:33.389+00	2026-01-05 22:56:55.891507+00	2026-01-05 23:47:33.396543+00	\N
d6b2255d-b1a6-4c03-8446-ecefde7fc4a3	18cc8d6d-cf03-4764-a439-0d0d5c9451c9	d3db876d-62f4-4d97-9a5c-4405cbe62b22	REFRESH_TOKEN	\N	2026-03-06 23:47:33.361+00	\N	\N	2026-01-05 23:47:33.36171+00	2026-01-05 23:47:33.36171+00	\N
ec648933-c5d5-436f-b544-728868553812	18cc8d6d-cf03-4764-a439-0d0d5c9451c9	d3db876d-62f4-4d97-9a5c-4405cbe62b22	REFRESH_TOKEN	\N	2026-03-06 23:47:33.671+00	\N	\N	2026-01-05 23:47:33.67315+00	2026-01-05 23:47:33.67315+00	\N
b5055b01-ee17-4f9c-8015-665003c9b91a	18cc8d6d-cf03-4764-a439-0d0d5c9451c9	d3db876d-62f4-4d97-9a5c-4405cbe62b22	REFRESH_TOKEN	\N	2026-03-06 23:47:33.714+00	\N	\N	2026-01-05 23:47:33.716606+00	2026-01-05 23:47:33.716606+00	\N
8229f3c3-9853-415c-8195-f314ec7bbb51	18cc8d6d-cf03-4764-a439-0d0d5c9451c9	d3db876d-62f4-4d97-9a5c-4405cbe62b22	REFRESH_TOKEN	\N	2026-03-06 23:47:33.733+00	\N	\N	2026-01-05 23:47:33.733396+00	2026-01-05 23:47:33.733396+00	\N
07fd3552-8b74-432c-9fbe-5e6244f3a6ce	18cc8d6d-cf03-4764-a439-0d0d5c9451c9	d3db876d-62f4-4d97-9a5c-4405cbe62b22	REFRESH_TOKEN	\N	2026-03-06 23:47:34.351+00	\N	2026-01-06 00:59:28.651+00	2026-01-05 23:47:34.354455+00	2026-01-06 00:59:28.65264+00	\N
8329678c-bab6-4535-9b0c-b67cc93e876f	18cc8d6d-cf03-4764-a439-0d0d5c9451c9	d3db876d-62f4-4d97-9a5c-4405cbe62b22	REFRESH_TOKEN	\N	2026-03-07 00:59:28.895+00	\N	\N	2026-01-06 00:59:28.896242+00	2026-01-06 00:59:28.896242+00	\N
2600376e-05a1-4d34-a8f8-4949c6e94942	18cc8d6d-cf03-4764-a439-0d0d5c9451c9	d3db876d-62f4-4d97-9a5c-4405cbe62b22	REFRESH_TOKEN	\N	2026-03-07 00:59:28.88+00	\N	\N	2026-01-06 00:59:28.885822+00	2026-01-06 00:59:28.885822+00	\N
d02348bb-5751-4543-a40f-9d5c472fe691	18cc8d6d-cf03-4764-a439-0d0d5c9451c9	d3db876d-62f4-4d97-9a5c-4405cbe62b22	REFRESH_TOKEN	\N	2026-03-07 00:59:28.898+00	\N	2026-01-06 01:38:56.956+00	2026-01-06 00:59:28.899001+00	2026-01-06 01:38:56.95711+00	\N
04e41aa0-6719-44c8-8bda-32e4bf6650e3	18cc8d6d-cf03-4764-a439-0d0d5c9451c9	d3db876d-62f4-4d97-9a5c-4405cbe62b22	REFRESH_TOKEN	\N	2026-03-07 01:38:57.167+00	\N	\N	2026-01-06 01:38:57.168155+00	2026-01-06 01:38:57.168155+00	\N
efa492b3-18aa-46d9-9bce-8b23181457f9	18cc8d6d-cf03-4764-a439-0d0d5c9451c9	d3db876d-62f4-4d97-9a5c-4405cbe62b22	REFRESH_TOKEN	\N	2026-03-07 01:38:57.164+00	\N	\N	2026-01-06 01:38:57.165148+00	2026-01-06 01:38:57.165148+00	\N
32f481bd-3f01-4e33-8158-72d8d9fcd147	18cc8d6d-cf03-4764-a439-0d0d5c9451c9	d3db876d-62f4-4d97-9a5c-4405cbe62b22	REFRESH_TOKEN	\N	2026-03-07 01:38:57.158+00	\N	2026-01-06 02:17:41.801+00	2026-01-06 01:38:57.164241+00	2026-01-06 02:17:41.80178+00	\N
a783153d-34a0-466e-9230-30fa366bcaff	18cc8d6d-cf03-4764-a439-0d0d5c9451c9	d3db876d-62f4-4d97-9a5c-4405cbe62b22	REFRESH_TOKEN	\N	2026-03-07 02:17:41.937+00	\N	\N	2026-01-06 02:17:41.938184+00	2026-01-06 02:17:41.938184+00	\N
3c245fed-3faf-4e74-9f43-d7a62f0bcf10	18cc8d6d-cf03-4764-a439-0d0d5c9451c9	d3db876d-62f4-4d97-9a5c-4405cbe62b22	REFRESH_TOKEN	\N	2026-03-07 02:17:41.939+00	\N	\N	2026-01-06 02:17:41.940281+00	2026-01-06 02:17:41.940281+00	\N
dc5380a4-1181-49a3-b4ff-8d2e6f7c0ed0	18cc8d6d-cf03-4764-a439-0d0d5c9451c9	d3db876d-62f4-4d97-9a5c-4405cbe62b22	REFRESH_TOKEN	\N	2026-03-07 02:17:41.926+00	\N	\N	2026-01-06 02:17:41.935648+00	2026-01-06 02:17:41.935648+00	\N
b23f3b9e-420d-48cd-a3be-49deb76763a8	18cc8d6d-cf03-4764-a439-0d0d5c9451c9	d3db876d-62f4-4d97-9a5c-4405cbe62b22	REFRESH_TOKEN	\N	2026-03-07 02:30:03.34+00	\N	2026-01-06 03:01:30.939+00	2026-01-06 02:30:03.341548+00	2026-01-06 03:01:30.939385+00	\N
0e465b9d-e49c-45d8-bf68-6a8b0da7644c	18cc8d6d-cf03-4764-a439-0d0d5c9451c9	d3db876d-62f4-4d97-9a5c-4405cbe62b22	REFRESH_TOKEN	\N	2026-03-07 03:01:31.34+00	\N	\N	2026-01-06 03:01:31.343647+00	2026-01-06 03:01:31.343647+00	\N
7b9ddc37-71ac-4703-95fb-a4baee0c0607	18cc8d6d-cf03-4764-a439-0d0d5c9451c9	d3db876d-62f4-4d97-9a5c-4405cbe62b22	REFRESH_TOKEN	\N	2026-03-07 03:01:31.377+00	\N	\N	2026-01-06 03:01:31.377519+00	2026-01-06 03:01:31.377519+00	\N
5fb89fe5-c4e5-4a6b-826a-3d786e2602fb	18cc8d6d-cf03-4764-a439-0d0d5c9451c9	d3db876d-62f4-4d97-9a5c-4405cbe62b22	REFRESH_TOKEN	\N	2026-03-07 03:01:31.375+00	\N	\N	2026-01-06 03:01:31.376204+00	2026-01-06 03:01:31.376204+00	\N
\.


--
-- Data for Name: application; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core.application (id, "universalIdentifier", name, description, version, "sourceType", "sourcePath", "workspaceId", "createdAt", "updatedAt", "deletedAt", "serverlessFunctionLayerId", "canBeUninstalled", "defaultServerlessFunctionRoleId") FROM stdin;
bc39da16-2038-4501-822f-ba7ef921bc44	bc39da16-2038-4501-822f-ba7ef921bc44	Workspace's custom application	Workspace custom application	1.0.0	local	workspace-custom	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:37.469253+00	2026-01-05 21:37:37.469253+00	\N	\N	f	\N
f075fdc3-4e1e-4ff5-bb37-4097737ce232	20202020-64aa-4b6f-b003-9c74b97cee20	Twenty Standard	Twenty is an open-source CRM that allows you to manage your sales and customer relationships	1.0.0	local	cli-sync	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.221317+00	2026-01-05 21:37:45.221317+00	\N	\N	f	\N
\.


--
-- Data for Name: applicationVariable; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."applicationVariable" (id, key, value, description, "isSecret", "applicationId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: approvedAccessDomain; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."approvedAccessDomain" (id, "createdAt", "updatedAt", domain, "isValidated", "workspaceId") FROM stdin;
b8c3cf83-8eab-4ffc-874f-759b843fcc20	2026-01-05 21:51:42.630448+00	2026-01-05 21:51:42.630448+00	split-llc.com	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22
\.


--
-- Data for Name: cronTrigger; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."cronTrigger" ("universalIdentifier", id, settings, "workspaceId", "createdAt", "updatedAt", "serverlessFunctionId", "applicationId") FROM stdin;
\.


--
-- Data for Name: dataSource; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."dataSource" (id, label, url, schema, type, "isRemote", "workspaceId", "createdAt", "updatedAt") FROM stdin;
4410a824-7797-4f9e-a96f-2f3e43d221ec	\N	\N	workspace_cjj1w48f60br2q6wtz6trrdb6	postgres	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.216574+00	2026-01-05 21:37:45.216574+00
\.


--
-- Data for Name: databaseEventTrigger; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."databaseEventTrigger" ("universalIdentifier", id, settings, "workspaceId", "createdAt", "updatedAt", "serverlessFunctionId", "applicationId") FROM stdin;
\.


--
-- Data for Name: emailingDomain; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."emailingDomain" (id, "createdAt", "updatedAt", domain, driver, status, "verificationRecords", "verifiedAt", "workspaceId") FROM stdin;
\.


--
-- Data for Name: featureFlag; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."featureFlag" (id, key, "workspaceId", value, "createdAt", "updatedAt") FROM stdin;
1c60e1ec-8483-4ef7-aaef-4cffde29e57e	IS_TIMELINE_ACTIVITY_MIGRATED	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	2026-01-05 21:37:45.194318+00	2026-01-05 21:37:45.194318+00
b55ffa6d-f37d-4212-9268-3c48f783d484	IS_PAGE_LAYOUT_ENABLED	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	2026-01-05 21:39:27.162778+00	2026-01-05 21:39:27.162778+00
\.


--
-- Data for Name: fieldMetadata; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."fieldMetadata" (id, "standardId", "objectMetadataId", type, name, label, "defaultValue", description, icon, "standardOverrides", options, settings, "isCustom", "isActive", "isSystem", "isUIReadOnly", "isNullable", "isUnique", "workspaceId", "isLabelSyncedWithName", "relationTargetFieldMetadataId", "relationTargetObjectMetadataId", "morphId", "createdAt", "updatedAt", "universalIdentifier", "applicationId") FROM stdin;
ab67b6d3-472e-47bc-9d00-1beaad8ecfab	20202020-87a5-48f8-bbf7-ade388825a57	331329f4-7d5a-4a51-8188-8bd6383a68ef	TEXT	name	Name	\N	Attachment name	IconFileUpload	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
e4b8277e-92da-4d77-a3a5-4600aa899261	20202020-0d19-453d-8e8d-fbcda8ca3747	331329f4-7d5a-4a51-8188-8bd6383a68ef	TEXT	fullPath	Full path	\N	Attachment full path	IconLink	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
583869e9-5389-4938-a19b-667277643b0a	20202020-8c3f-4d9e-9a1b-2e5f7a8c9d0e	331329f4-7d5a-4a51-8188-8bd6383a68ef	SELECT	fileCategory	File category	"'OTHER'"	Attachment file category	IconList	\N	[{"id": "f68f55e8-297b-41d2-ad3b-fc574d0fa9ea", "color": "gray", "label": "Archive", "value": "ARCHIVE", "position": 0}, {"id": "a9920426-77b1-4eff-9d0b-5a6f063b8585", "color": "pink", "label": "Audio", "value": "AUDIO", "position": 1}, {"id": "b0a017e5-ed9a-487a-91e6-3da4170b123a", "color": "yellow", "label": "Image", "value": "IMAGE", "position": 2}, {"id": "f09fd912-eb44-4bf7-b7ad-49f9e8b4be91", "color": "orange", "label": "Presentation", "value": "PRESENTATION", "position": 3}, {"id": "9f5b81e4-92f4-46bd-a7af-7b03a5166fe0", "color": "turquoise", "label": "Spreadsheet", "value": "SPREADSHEET", "position": 4}, {"id": "025ccc00-8cdf-461f-9a7d-9fddb4bc2455", "color": "blue", "label": "Text Document", "value": "TEXT_DOCUMENT", "position": 5}, {"id": "d8f64b98-228c-4645-bebe-eda2210bee44", "color": "purple", "label": "Video", "value": "VIDEO", "position": 6}, {"id": "c04fbe4a-bda0-4dea-a637-5cc98900c65f", "color": "gray", "label": "Other", "value": "OTHER", "position": 7}]	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
0bd4affe-b181-4609-861b-10b48406c03a	395be3bd-a5c9-463d-aafe-9bc3bbec3f15	331329f4-7d5a-4a51-8188-8bd6383a68ef	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
8eba2748-3b03-4e48-8e58-12135ffb35e0	20202020-eda0-4cee-9577-3eb357e3c22b	331329f4-7d5a-4a51-8188-8bd6383a68ef	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
b5c4fdcb-a22d-45b0-9fb8-18fb51520a37	20202020-66ac-4502-9975-e4d959c50311	331329f4-7d5a-4a51-8188-8bd6383a68ef	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
3e8b4283-7990-4197-afb7-d6f8866bf5fe	20202020-d767-4622-bdcf-d8a084834d86	331329f4-7d5a-4a51-8188-8bd6383a68ef	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
f1a858bd-32a0-4bce-a6be-f995611f8dd8	20202020-b9a7-48d8-8387-b9a3090a50ec	331329f4-7d5a-4a51-8188-8bd6383a68ef	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
cab9117b-02b8-47b8-a7e3-64cfc2f283cf	20202020-eef3-44ed-aa32-4641d7fd4a3e	b224c093-0fe7-4c60-95bd-5da11d207937	TEXT	handle	Handle	\N	Handle	IconAt	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
9b344e1f-2084-4454-b06c-aa3a4dedaca1	20202020-eda0-4cee-9577-3eb357e3c22b	b224c093-0fe7-4c60-95bd-5da11d207937	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
3894437f-5c07-40d0-8e64-5ed55f5e206d	20202020-66ac-4502-9975-e4d959c50311	b224c093-0fe7-4c60-95bd-5da11d207937	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
18142e5f-fe58-4f84-b3f3-8490d2ce4b3d	20202020-d767-4622-bdcf-d8a084834d86	b224c093-0fe7-4c60-95bd-5da11d207937	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
c1c8f209-c505-4761-9d31-3ea61bfd3034	20202020-b9a7-48d8-8387-b9a3090a50ec	b224c093-0fe7-4c60-95bd-5da11d207937	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
1710cbd5-148a-4db8-92bb-2f0be86530c6	20202020-080e-49d1-b21d-9702a7e2525c	9ab0caad-fd52-46be-98b6-f1b607f1f8b6	TEXT	title	Title	\N	Title	IconH1	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
34e3c5cb-022a-4274-ae7c-cd8706d59c00	20202020-335b-4e04-b470-43b84b64863c	9ab0caad-fd52-46be-98b6-f1b607f1f8b6	BOOLEAN	isCanceled	Is canceled	false	Is canceled	IconCalendarCancel	\N	\N	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
b6efe25d-3720-4154-9a23-5eb3fafbd79a	20202020-551c-402c-bb6d-dfe9efe86bcb	9ab0caad-fd52-46be-98b6-f1b607f1f8b6	BOOLEAN	isFullDay	Is Full Day	false	Is Full Day	IconHours24	\N	\N	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
00755d5d-d67d-430e-8229-cd226b370ac2	20202020-2c57-4c75-93c5-2ac950a6ed67	9ab0caad-fd52-46be-98b6-f1b607f1f8b6	DATE_TIME	startsAt	Start Date	\N	Start Date	IconCalendarClock	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
c5253ff4-7e3e-4941-9984-92a63736dbe9	20202020-2554-4ee1-a617-17907f6bab21	9ab0caad-fd52-46be-98b6-f1b607f1f8b6	DATE_TIME	endsAt	End Date	\N	End Date	IconCalendarClock	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
c162a34a-13c9-432b-8d10-99ac71b1396d	20202020-9f03-4058-a898-346c62181599	9ab0caad-fd52-46be-98b6-f1b607f1f8b6	DATE_TIME	externalCreatedAt	Creation DateTime	\N	Creation DateTime	IconCalendarPlus	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
fc97d0a6-27eb-46fe-8b6f-0917be6e7abe	20202020-b355-4c18-8825-ef42c8a5a755	9ab0caad-fd52-46be-98b6-f1b607f1f8b6	DATE_TIME	externalUpdatedAt	Update DateTime	\N	Update DateTime	IconCalendarCog	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
220010ca-53eb-4a67-8445-214fd77f9ae9	20202020-52c4-4266-a98f-e90af0b4d271	9ab0caad-fd52-46be-98b6-f1b607f1f8b6	TEXT	description	Description	\N	Description	IconFileDescription	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
50a4cf5b-cd1f-4693-a9e1-9f3672272627	20202020-641a-4ffe-960d-c3c186d95b17	9ab0caad-fd52-46be-98b6-f1b607f1f8b6	TEXT	location	Location	\N	Location	IconMapPin	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
b323ef94-3683-4f3e-ad49-341f4b4756a8	20202020-f24b-45f4-b6a3-d2f9fcb98714	9ab0caad-fd52-46be-98b6-f1b607f1f8b6	TEXT	iCalUid	iCal UID	\N	iCal UID	IconKey	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
840bdfce-57a3-4024-bb26-eff59bcde397	20202020-1c3f-4b5a-b526-5411a82179eb	9ab0caad-fd52-46be-98b6-f1b607f1f8b6	TEXT	conferenceSolution	Conference Solution	\N	Conference Solution	IconScreenShare	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
d2a08f07-5ed9-421e-aad7-f073c6e5230f	20202020-35da-43ef-9ca0-e936e9dc237b	9ab0caad-fd52-46be-98b6-f1b607f1f8b6	LINKS	conferenceLink	Meet Link	\N	Meet Link	IconLink	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
cae131a0-1e8c-4120-8597-2ca6a5c6804f	20202020-eda0-4cee-9577-3eb357e3c22b	9ab0caad-fd52-46be-98b6-f1b607f1f8b6	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
1ee8d9a3-ff34-481c-9e0b-21f3b6232d1f	20202020-66ac-4502-9975-e4d959c50311	9ab0caad-fd52-46be-98b6-f1b607f1f8b6	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
3f6c8a08-c32c-4a4d-a0db-917e89907074	20202020-d767-4622-bdcf-d8a084834d86	9ab0caad-fd52-46be-98b6-f1b607f1f8b6	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
c7b13adf-177d-4c7e-b9c7-ea2305b11adc	20202020-b9a7-48d8-8387-b9a3090a50ec	9ab0caad-fd52-46be-98b6-f1b607f1f8b6	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
2e28329e-f4cc-499e-8c90-1a9c0552640a	20202020-1d08-420a-9aa7-22e0f298232d	cd953ca2-8c54-4fee-80ff-f638c3d2ac12	TEXT	handle	Handle	\N	Handle	IconAt	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
852b19b4-7026-4426-a3a1-c41452a2dd02	20202020-7116-41da-8b4b-035975c4eb6a	cd953ca2-8c54-4fee-80ff-f638c3d2ac12	SELECT	syncStatus	Sync status	\N	Sync status	IconStatusChange	\N	[{"id": "5922960b-fce1-45a6-8f09-839ff40cb0b3", "color": "yellow", "label": "Ongoing", "value": "ONGOING", "position": 1}, {"id": "ad8e5c53-5626-4290-bc12-381b1acd748f", "color": "blue", "label": "Not Synced", "value": "NOT_SYNCED", "position": 2}, {"id": "c522edf1-e78d-4d29-9240-ba629f84d442", "color": "green", "label": "Active", "value": "ACTIVE", "position": 3}, {"id": "fb47a770-142c-4c64-b49d-91bd83498225", "color": "red", "label": "Failed Insufficient Permissions", "value": "FAILED_INSUFFICIENT_PERMISSIONS", "position": 4}, {"id": "06e956a5-151d-419c-ac96-fa7bbe0bfbed", "color": "red", "label": "Failed Unknown", "value": "FAILED_UNKNOWN", "position": 5}]	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
b0ec5822-da6e-4735-a14a-85098c8e975a	20202020-6246-42e6-b5cd-003bd921782c	cd953ca2-8c54-4fee-80ff-f638c3d2ac12	SELECT	syncStage	Sync stage	"'PENDING_CONFIGURATION'"	Sync stage	IconStatusChange	\N	[{"id": "bd8ed3dc-3192-43a4-9a55-25c9e2c7c7b3", "color": "blue", "label": "Calendar event list fetch pending", "value": "CALENDAR_EVENT_LIST_FETCH_PENDING", "position": 0}, {"id": "e33b2cd2-a08b-4bb5-9cf4-4c3e1762c615", "color": "green", "label": "Calendar event list fetch scheduled", "value": "CALENDAR_EVENT_LIST_FETCH_SCHEDULED", "position": 1}, {"id": "7cc7a1c3-762b-44d9-9d1c-11bea83d2a48", "color": "orange", "label": "Calendar event list fetch ongoing", "value": "CALENDAR_EVENT_LIST_FETCH_ONGOING", "position": 2}, {"id": "6e81c354-b7f4-4b3b-9c59-f0db59c95bfe", "color": "blue", "label": "Calendar events import pending", "value": "CALENDAR_EVENTS_IMPORT_PENDING", "position": 3}, {"id": "19222ead-3efa-41c3-8069-0f172f2073fc", "color": "green", "label": "Calendar events import scheduled", "value": "CALENDAR_EVENTS_IMPORT_SCHEDULED", "position": 4}, {"id": "c4f1c69d-3c21-4232-9a2c-448bc56f802c", "color": "orange", "label": "Calendar events import ongoing", "value": "CALENDAR_EVENTS_IMPORT_ONGOING", "position": 5}, {"id": "1386c944-dcdc-4215-9525-64238cf843af", "color": "red", "label": "Failed", "value": "FAILED", "position": 6}, {"id": "51211847-5fba-4365-a19f-17b3a535c207", "color": "gray", "label": "Pending configuration", "value": "PENDING_CONFIGURATION", "position": 9}]	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
003fffb2-77e4-4b79-9499-b51af42a8b47	20202020-1b07-4796-9f01-d626bab7ca4d	cd953ca2-8c54-4fee-80ff-f638c3d2ac12	SELECT	visibility	Visibility	"'SHARE_EVERYTHING'"	Visibility	IconEyeglass	\N	[{"id": "366729ce-f35a-4e2a-8d70-45310a428dc8", "color": "green", "label": "Metadata", "value": "METADATA", "position": 0}, {"id": "ef549924-e0b2-467a-9c5e-36e672db645b", "color": "orange", "label": "Share Everything", "value": "SHARE_EVERYTHING", "position": 1}]	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
381053b8-c15e-45c1-80b1-64dfbc9080fc	20202020-50fb-404b-ba28-369911a3793a	cd953ca2-8c54-4fee-80ff-f638c3d2ac12	BOOLEAN	isContactAutoCreationEnabled	Is Contact Auto Creation Enabled	true	Is Contact Auto Creation Enabled	IconUserCircle	\N	\N	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
7973d3be-9b01-4894-8a22-33b3c1cf7e47	20202020-b55d-447d-b4df-226319058775	cd953ca2-8c54-4fee-80ff-f638c3d2ac12	SELECT	contactAutoCreationPolicy	Contact auto creation policy	"'AS_PARTICIPANT_AND_ORGANIZER'"	Automatically create records for people you participated with in an event.	IconUserCircle	\N	[{"id": "7caa6f41-a9bc-4d09-88f0-09aa1476b122", "color": "green", "label": "As Participant and Organizer", "value": "AS_PARTICIPANT_AND_ORGANIZER", "position": 0}, {"id": "555be945-a97d-4486-adec-291349a475d7", "color": "orange", "label": "As Participant", "value": "AS_PARTICIPANT", "position": 1}, {"id": "0f263382-cf8e-4dd6-8187-1ba6b56cf8df", "color": "blue", "label": "As Organizer", "value": "AS_ORGANIZER", "position": 2}, {"id": "0394fa4f-1681-426c-b337-236412705428", "color": "red", "label": "None", "value": "NONE", "position": 3}]	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
06292fc3-1d5a-48c0-860c-d4c0dcc3d6bb	20202020-fe19-4818-8854-21f7b1b43395	cd953ca2-8c54-4fee-80ff-f638c3d2ac12	BOOLEAN	isSyncEnabled	Is Sync Enabled	true	Is Sync Enabled	IconRefresh	\N	\N	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
bf6b2d0a-ca6f-4446-8294-2f4cc888919d	20202020-bac2-4852-a5cb-7a7898992b70	cd953ca2-8c54-4fee-80ff-f638c3d2ac12	TEXT	syncCursor	Sync Cursor	\N	Sync Cursor. Used for syncing events from the calendar provider	IconReload	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
af2e6212-3f5c-4131-914d-8a5aa1216726	20202020-2ff5-4f70-953a-3d0d36357576	cd953ca2-8c54-4fee-80ff-f638c3d2ac12	DATE_TIME	syncedAt	Last sync date	\N	Last sync date	IconHistory	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
df3d9855-0248-4030-a681-cce9ed758ff5	20202020-a934-46f1-a8e7-9568b1e3a53e	cd953ca2-8c54-4fee-80ff-f638c3d2ac12	DATE_TIME	syncStageStartedAt	Sync stage started at	\N	Sync stage started at	IconHistory	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
6c35de8a-86df-483d-8bdd-aba73d70c2f4	20202020-525c-4b76-b9bd-0dd57fd11d61	cd953ca2-8c54-4fee-80ff-f638c3d2ac12	NUMBER	throttleFailureCount	Throttle Failure Count	0	Throttle Failure Count	IconX	\N	\N	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
98a9aa8d-22cd-40de-a642-437ee6793f8c	20202020-eda0-4cee-9577-3eb357e3c22b	cd953ca2-8c54-4fee-80ff-f638c3d2ac12	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
d8b30881-029a-41a3-b002-970138ba78cb	20202020-66ac-4502-9975-e4d959c50311	cd953ca2-8c54-4fee-80ff-f638c3d2ac12	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
58ed573f-445e-45c9-895c-1c86f7fe361c	20202020-d767-4622-bdcf-d8a084834d86	cd953ca2-8c54-4fee-80ff-f638c3d2ac12	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
985b278e-8c0b-4a42-88a6-d60133f256f6	20202020-b9a7-48d8-8387-b9a3090a50ec	cd953ca2-8c54-4fee-80ff-f638c3d2ac12	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
4f1acb33-454f-434e-bd34-607ae2bf2d84	20202020-9ec8-48bb-b279-21d0734a75a1	132fb558-68fe-4619-a469-59ac07bf65cf	TEXT	eventExternalId	Event external ID	\N	Event external ID	IconCalendar	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
de960eb6-bbd0-4f33-a1cd-2a1ef53bc88e	20202020-c58f-4c69-9bf8-9518fa31aa50	132fb558-68fe-4619-a469-59ac07bf65cf	TEXT	recurringEventExternalId	Recurring Event ID	\N	Recurring Event ID	IconHistory	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
aa8e9428-54eb-47a1-8c20-3921539b89e6	20202020-eda0-4cee-9577-3eb357e3c22b	132fb558-68fe-4619-a469-59ac07bf65cf	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
9f59511a-3935-413e-8275-dd91b21b7052	20202020-66ac-4502-9975-e4d959c50311	132fb558-68fe-4619-a469-59ac07bf65cf	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
d17f7c96-7504-4935-8320-9ca7abb469f2	20202020-d767-4622-bdcf-d8a084834d86	132fb558-68fe-4619-a469-59ac07bf65cf	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
d860f072-2235-4acc-9212-ec8a25aa67a5	20202020-b9a7-48d8-8387-b9a3090a50ec	132fb558-68fe-4619-a469-59ac07bf65cf	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
fdf1608e-6352-43b0-a046-0fcce2476115	20202020-8692-4580-8210-9e09cbd031a7	9e60fa19-8c45-43e3-a07a-a47497dd6539	TEXT	handle	Handle	\N	Handle	IconMail	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
50d76d0e-1e8c-4a43-9b85-764091ab9e41	20202020-ee1e-4f9f-8ac1-5c0b2f69691e	9e60fa19-8c45-43e3-a07a-a47497dd6539	TEXT	displayName	Display Name	\N	Display Name	IconUser	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
9834b642-48bf-4dce-955f-08ef6876ea91	20202020-66e7-4e00-9e06-d06c92650580	9e60fa19-8c45-43e3-a07a-a47497dd6539	BOOLEAN	isOrganizer	Is Organizer	false	Is Organizer	IconUser	\N	\N	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
26050baf-8907-49aa-85e7-3b627b3a5e22	20202020-cec0-4be8-8fba-c366abc23147	9e60fa19-8c45-43e3-a07a-a47497dd6539	SELECT	responseStatus	Response Status	"'NEEDS_ACTION'"	Response Status	IconUser	\N	[{"id": "1e06002d-b778-49d8-81c4-07a83a3b7654", "color": "orange", "label": "Needs Action", "value": "NEEDS_ACTION", "position": 0}, {"id": "f6aa270c-574e-488f-b386-0f0913291f24", "color": "red", "label": "Declined", "value": "DECLINED", "position": 1}, {"id": "6c492017-e9c6-4590-a252-b4cfb6833f4e", "color": "yellow", "label": "Tentative", "value": "TENTATIVE", "position": 2}, {"id": "9063505f-80d5-48dc-8be8-d07c18bab4d1", "color": "green", "label": "Accepted", "value": "ACCEPTED", "position": 3}]	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
99712d02-89b2-45d5-bff8-6d4f76948cf4	20202020-eda0-4cee-9577-3eb357e3c22b	9e60fa19-8c45-43e3-a07a-a47497dd6539	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
cf9ac51b-e649-440e-a183-786b3bae72af	20202020-66ac-4502-9975-e4d959c50311	9e60fa19-8c45-43e3-a07a-a47497dd6539	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
5bffd90d-fc76-433a-a699-d57e5ee04aea	20202020-d767-4622-bdcf-d8a084834d86	9e60fa19-8c45-43e3-a07a-a47497dd6539	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
94506efa-e0a3-4413-880a-f3f85843f5ae	20202020-b9a7-48d8-8387-b9a3090a50ec	9e60fa19-8c45-43e3-a07a-a47497dd6539	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
34291d1e-bd23-472f-adde-c5e7ae219b43	20202020-4d99-4e2e-a84c-4a27837b1ece	adf06099-b76b-47c1-9519-bb10956030eb	TEXT	name	Name	\N	The company name	IconBuildingSkyscraper	\N	\N	\N	f	t	f	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
2d192d9d-d23b-42c3-80ea-4f6a9c5b6e60	20202020-0c28-43d8-8ba5-3659924d3489	adf06099-b76b-47c1-9519-bb10956030eb	LINKS	domainName	Domain Name	\N	The company website URL. We use this url to fetch the company icon	IconLink	\N	\N	{"maxNumberOfValues": 1}	f	t	f	f	t	t	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
558e59f0-bbc5-4a21-ba4f-7a97f8423f42	20202020-8965-464a-8a75-74bafc152a0b	adf06099-b76b-47c1-9519-bb10956030eb	NUMBER	employees	Employees	\N	Number of employees in the company	IconUsers	\N	\N	\N	f	t	f	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
408abd61-1370-41a6-b3ae-0a09ec2d247b	20202020-ebeb-4beb-b9ad-6848036fb451	adf06099-b76b-47c1-9519-bb10956030eb	LINKS	linkedinLink	Linkedin	\N	The company Linkedin account	IconBrandLinkedin	\N	\N	\N	f	t	f	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
3a607544-804f-4753-87c1-ab4f0166f389	20202020-6f64-4fd9-9580-9c1991c7d8c3	adf06099-b76b-47c1-9519-bb10956030eb	LINKS	xLink	X	\N	The company Twitter/X account	IconBrandX	\N	\N	\N	f	t	f	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
9f06b921-27e0-4e37-908d-a23c798eca29	20202020-602a-495c-9776-f5d5b11d227b	adf06099-b76b-47c1-9519-bb10956030eb	CURRENCY	annualRecurringRevenue	ARR	\N	Annual Recurring Revenue: The actual or estimated annual revenue of the company	IconMoneybag	\N	\N	\N	f	t	f	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
02e15066-2f33-469b-933c-0fb519f37f8b	20202020-c5ce-4adc-b7b6-9c0979fc55e7	adf06099-b76b-47c1-9519-bb10956030eb	ADDRESS	address	Address	\N	Address of the company	IconMap	\N	\N	\N	f	t	f	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
82d94d80-8c97-44bd-991f-2464f7895f5e	20202020-ba6b-438a-8213-2c5ba28d76a2	adf06099-b76b-47c1-9519-bb10956030eb	BOOLEAN	idealCustomerProfile	ICP	false	Ideal Customer Profile:  Indicates whether the company is the most suitable and valuable customer for you	IconTarget	\N	\N	\N	f	t	f	f	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
ed75354a-3814-4603-b0b5-e6f4372e759d	20202020-9b4e-462b-991d-a0ee33326454	adf06099-b76b-47c1-9519-bb10956030eb	POSITION	position	Position	0	Company record position	IconHierarchy2	\N	\N	\N	f	t	t	f	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
e658c61d-9b50-4ba2-a59b-d61b932f7b2a	20202020-fabc-451d-ab7d-412170916baa	adf06099-b76b-47c1-9519-bb10956030eb	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
9f0eea22-086d-41f1-8744-b270b0263f62	85c71601-72f9-4b7b-b343-d46100b2c74d	adf06099-b76b-47c1-9519-bb10956030eb	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	\N	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
5ec17413-5f28-44d9-8330-04665679ff14	20202020-eda0-4cee-9577-3eb357e3c22b	adf06099-b76b-47c1-9519-bb10956030eb	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
670802a4-1913-4b44-9a57-30f5e2a59021	20202020-66ac-4502-9975-e4d959c50311	adf06099-b76b-47c1-9519-bb10956030eb	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
682928e1-bfb6-4e29-b866-d698432825e4	20202020-d767-4622-bdcf-d8a084834d86	adf06099-b76b-47c1-9519-bb10956030eb	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
321d5427-3283-443b-b4c9-504bc2c30da7	20202020-b9a7-48d8-8387-b9a3090a50ec	adf06099-b76b-47c1-9519-bb10956030eb	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
0da564b9-da84-4ffa-ae36-7c905764da4a	20202020-c804-4a50-bb05-b3a9e24f1dec	f76201bb-e234-4a3f-af09-ee3fd2445e79	TEXT	handle	handle	\N	The account handle (email, username, phone number, etc.)	IconMail	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
b4222de0-c0ad-4065-8623-20c502b2288f	20202020-ebb0-4516-befc-a9e95935efd5	f76201bb-e234-4a3f-af09-ee3fd2445e79	TEXT	provider	provider	"'google'"	The account provider	IconSettings	\N	\N	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
65494bfb-769c-4540-97a4-8b06678c5fff	20202020-707b-4a0a-8753-2ad42efe1e29	f76201bb-e234-4a3f-af09-ee3fd2445e79	TEXT	accessToken	Access Token	\N	Messaging provider access token	IconKey	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
1a779bcb-e509-4d8e-aa7d-723bdca5c43f	20202020-532d-48bd-80a5-c4be6e7f6e49	f76201bb-e234-4a3f-af09-ee3fd2445e79	TEXT	refreshToken	Refresh Token	\N	Messaging provider refresh token	IconKey	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
c277b1d3-3252-4d12-b522-2a67e976ee32	20202020-aa5e-4e85-903b-fdf90a941941	f76201bb-e234-4a3f-af09-ee3fd2445e79	DATE_TIME	lastCredentialsRefreshedAt	Last credentials refreshed at	\N	Last credentials refreshed at	IconHistory	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
d16347bf-74c7-45db-916c-61258727e8e1	20202020-115c-4a87-b50f-ac4367a971b9	f76201bb-e234-4a3f-af09-ee3fd2445e79	TEXT	lastSyncHistoryId	Last sync history ID	\N	Last sync history ID	IconHistory	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
2463ad47-fb08-46c9-887f-56e906eec0c8	20202020-d268-4c6b-baff-400d402b430a	f76201bb-e234-4a3f-af09-ee3fd2445e79	DATE_TIME	authFailedAt	Auth failed at	\N	Auth failed at	IconX	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
733c4bf1-6bfc-49c2-a391-bc5e88ae71fc	20202020-8a3d-46be-814f-6228af16c47b	f76201bb-e234-4a3f-af09-ee3fd2445e79	TEXT	handleAliases	Handle Aliases	\N	Handle Aliases	IconMail	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
ae9edc04-90f9-46ab-829c-762a10414c78	20202020-8a3d-46be-814f-6228af16c47c	f76201bb-e234-4a3f-af09-ee3fd2445e79	ARRAY	scopes	Scopes	\N	Scopes	IconSettings	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
6296165a-368a-4aae-9d93-564cff9bc149	20202020-a1b2-46be-814f-6228af16c481	f76201bb-e234-4a3f-af09-ee3fd2445e79	RAW_JSON	connectionParameters	Custom Connection Parameters	\N	JSON object containing custom connection parameters	IconSettings	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
6ef9063f-36c9-41db-a847-0c365f0af11a	20202020-eda0-4cee-9577-3eb357e3c22b	f76201bb-e234-4a3f-af09-ee3fd2445e79	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
a403bd3e-730e-4566-8c53-ad0bd97810a4	20202020-66ac-4502-9975-e4d959c50311	f76201bb-e234-4a3f-af09-ee3fd2445e79	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
fc259c35-43f9-4afc-868b-68b072b4a605	20202020-d767-4622-bdcf-d8a084834d86	f76201bb-e234-4a3f-af09-ee3fd2445e79	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
66ab34a6-3282-434f-ad80-11e41958f224	20202020-b9a7-48d8-8387-b9a3090a50ec	f76201bb-e234-4a3f-af09-ee3fd2445e79	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
d4da218e-6286-4c54-921e-1f677897e0c8	20202020-20ee-4091-95dc-44b57eda3a89	7b93a0b2-03a9-457e-88ef-1cc653c60660	TEXT	title	Title	\N	Dashboard title	IconNotes	\N	\N	\N	f	t	f	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
974631dd-6bc6-4686-aff4-0a18d1450207	20202020-bb53-4648-aa36-1d9d54e6f7f2	7b93a0b2-03a9-457e-88ef-1cc653c60660	UUID	pageLayoutId	Page Layout ID	\N	Dashboard page layout	IconLayout	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
cc1318ae-42c9-4e88-975e-a5d72fc1f406	20202020-38af-409b-95f0-7f08aa5f420f	7b93a0b2-03a9-457e-88ef-1cc653c60660	POSITION	position	Position	0	Dashboard record Position	IconHierarchy2	\N	\N	\N	f	t	t	f	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
5d2ee768-bdbe-4bda-81c2-e96afd30dc67	20202020-ff32-4fa1-b7ad-407cc6aa0734	7b93a0b2-03a9-457e-88ef-1cc653c60660	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
782b757b-71ba-45c3-bfde-4e01d9f8924a	20202020-0bcc-47a4-8360-2e35a7133f7a	7b93a0b2-03a9-457e-88ef-1cc653c60660	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	\N	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
baeb7ed2-0523-427a-9487-81b4357f4eec	20202020-eda0-4cee-9577-3eb357e3c22b	7b93a0b2-03a9-457e-88ef-1cc653c60660	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
11c2e679-fafe-4293-82e6-c6d2eac931ad	20202020-66ac-4502-9975-e4d959c50311	7b93a0b2-03a9-457e-88ef-1cc653c60660	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
8dd4b4a6-a290-4181-bb18-525a04dc6eb3	20202020-d767-4622-bdcf-d8a084834d86	7b93a0b2-03a9-457e-88ef-1cc653c60660	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
23575ebd-818c-42ce-a4cc-ff30c46428ef	20202020-b9a7-48d8-8387-b9a3090a50ec	7b93a0b2-03a9-457e-88ef-1cc653c60660	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
0c49753e-f3b4-486d-9759-7af3a6846125	20202020-dd26-42c6-8c3c-2a7598c204f6	5aee0655-bf05-4ac3-afae-cb58be3235d6	NUMBER	position	Position	0	Favorite position	IconList	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
051c652a-77cf-46f2-a130-ad6560d78df7	20202020-5a93-4fa9-acce-e73481a0bbdf	5aee0655-bf05-4ac3-afae-cb58be3235d6	UUID	viewId	ViewId	\N	ViewId	IconView	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
4ae55a2b-57b3-4997-aa8a-f64e8ece309e	20202020-eda0-4cee-9577-3eb357e3c22b	5aee0655-bf05-4ac3-afae-cb58be3235d6	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
c791d28a-0132-42b6-a1a6-99dfffa646c2	20202020-66ac-4502-9975-e4d959c50311	5aee0655-bf05-4ac3-afae-cb58be3235d6	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
bd35710c-1d84-471c-8699-d2dd786dcb9c	20202020-d767-4622-bdcf-d8a084834d86	5aee0655-bf05-4ac3-afae-cb58be3235d6	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
0205c993-3c6a-4001-8e13-6e6adcb0d592	20202020-b9a7-48d8-8387-b9a3090a50ec	5aee0655-bf05-4ac3-afae-cb58be3235d6	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
5aba19e7-d623-414e-a295-823619c2155e	20202020-5278-4bde-8909-2cec74d43744	4076f800-4700-4ab2-ae93-d4e916bae87a	NUMBER	position	Position	0	Favorite folder position	IconList	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
1b6e2ca2-f325-45c3-96b1-300b7377958f	20202020-82a3-4537-8ff0-dbce7eec35d6	4076f800-4700-4ab2-ae93-d4e916bae87a	TEXT	name	Name	\N	Name of the favorite folder	IconText	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
5ca5a32f-60c4-4d50-9ca5-b56e8017f479	20202020-eda0-4cee-9577-3eb357e3c22b	4076f800-4700-4ab2-ae93-d4e916bae87a	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
0f4b508b-724c-45af-a052-60a598328903	20202020-66ac-4502-9975-e4d959c50311	4076f800-4700-4ab2-ae93-d4e916bae87a	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
ccdcf07b-31ff-49a3-a267-ffb4c15cf9e1	20202020-d767-4622-bdcf-d8a084834d86	4076f800-4700-4ab2-ae93-d4e916bae87a	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
61327e00-824f-4014-a121-38dd9fce31d7	20202020-b9a7-48d8-8387-b9a3090a50ec	4076f800-4700-4ab2-ae93-d4e916bae87a	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
2f83d12b-ad79-442b-8772-53d280783542	20202020-9526-4993-b339-c4318c4d39f0	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	DATE_TIME	happensAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
f99f5844-aa85-45bc-a31c-2c1a350194de	20202020-7207-46e8-9dab-849505ae8497	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	TEXT	name	Event name	\N	Event name	IconAbc	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
f01ab746-47c1-4bfb-94a9-aecba46c8938	20202020-f142-4b04-b91b-6a2b4af3bf11	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	RAW_JSON	properties	Event details	\N	Json value for event details	IconListDetails	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
35e15bad-4ecd-4c83-a09f-f2d89b0c1a22	20202020-cfdb-4bef-bbce-a29f41230934	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	TEXT	linkedRecordCachedName	Linked Record cached name	\N	Cached record name	IconAbc	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
c99a1969-ead3-46b6-9655-32bf37925765	20202020-2e0e-48c0-b445-ee6c1e61687d	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	UUID	linkedRecordId	Linked Record id	\N	Linked Record id	IconAbc	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
6c9e3108-42f9-4201-9db3-ee574874dcfa	20202020-c595-449d-9f89-562758c9ee69	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	UUID	linkedObjectMetadataId	Linked Object Metadata Id	\N	Linked Object Metadata Id	IconAbc	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
230e4732-7b4e-4f74-a4c0-1c4e99735a00	20202020-eda0-4cee-9577-3eb357e3c22b	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
068ab153-8209-42ec-9b77-5166d0ee6c0d	20202020-66ac-4502-9975-e4d959c50311	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
f94dfe43-d4bf-4796-b5bd-3b096caad3e7	20202020-d767-4622-bdcf-d8a084834d86	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
f3d406c2-c04f-4a9d-be38-71c29f8dfa3a	20202020-b9a7-48d8-8387-b9a3090a50ec	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
d214168c-902f-4fa1-995e-54bc0d51f173	20202020-b3d3-478f-acc0-5d901e725b20	e89d085a-8ec2-4b37-9560-3f1f708b57a6	TEXT	name	Name	\N	The workflow name	IconSettingsAutomation	\N	\N	\N	f	t	f	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
579e02a3-f50d-4264-acab-95829463c440	20202020-326a-4fba-8639-3456c0a169e8	e89d085a-8ec2-4b37-9560-3f1f708b57a6	TEXT	lastPublishedVersionId	Last published Version Id	\N	The workflow last published version id	IconVersions	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
244f1603-d76d-4865-9357-1af112db153f	20202020-357c-4432-8c50-8c31b4a552d9	e89d085a-8ec2-4b37-9560-3f1f708b57a6	MULTI_SELECT	statuses	Statuses	\N	The current statuses of the workflow versions	IconStatusChange	\N	[{"id": "4850caba-9fc4-4943-9db5-0f2d5bbefab5", "color": "yellow", "label": "Draft", "value": "DRAFT", "position": 0}, {"id": "73f55f3a-062b-4e56-9152-fe5baf32c1fc", "color": "green", "label": "Active", "value": "ACTIVE", "position": 1}, {"id": "ec67e2a2-b278-4dd3-8f67-d8bbcd1007b0", "color": "gray", "label": "Deactivated", "value": "DEACTIVATED", "position": 2}]	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
35bcf230-fbf6-4b03-905f-3dd264b9da3a	20202020-39b0-4d8c-8c5f-33c2326deb5f	e89d085a-8ec2-4b37-9560-3f1f708b57a6	POSITION	position	Position	0	Workflow record position	IconHierarchy2	\N	\N	\N	f	t	t	f	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
defe599b-7551-4426-ad16-0fae80b2700a	20202020-535d-4ffa-b7f3-4fa0d5da1b7a	e89d085a-8ec2-4b37-9560-3f1f708b57a6	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	\N	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
4049d80d-c196-4d1f-baaf-cac051a2733c	20202020-6007-401a-8aa5-e6f48581a6f3	e89d085a-8ec2-4b37-9560-3f1f708b57a6	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
6b6335de-6d5a-4746-955b-fe7924f18230	20202020-eda0-4cee-9577-3eb357e3c22b	e89d085a-8ec2-4b37-9560-3f1f708b57a6	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
314f134f-6036-48ba-92ab-0420e83cca31	20202020-66ac-4502-9975-e4d959c50311	e89d085a-8ec2-4b37-9560-3f1f708b57a6	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
582473de-3d97-4144-9d78-83fbda9107a8	20202020-d767-4622-bdcf-d8a084834d86	e89d085a-8ec2-4b37-9560-3f1f708b57a6	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
01b5ca3e-9e69-4183-8f9e-c19188616bf5	20202020-b9a7-48d8-8387-b9a3090a50ec	e89d085a-8ec2-4b37-9560-3f1f708b57a6	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
1aa79add-25cd-4cdb-b579-be766190061a	20202020-a12f-4cca-9937-a2e40cc65509	89bcd47d-b0a0-41ba-ba13-500cb520b5a9	TEXT	name	Name	\N	The workflow version name	IconSettingsAutomation	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
3e8f4aa1-91eb-4f9f-9b8c-fd1615315858	20202020-4eae-43e7-86e0-212b41a30b48	89bcd47d-b0a0-41ba-ba13-500cb520b5a9	RAW_JSON	trigger	Version trigger	\N	Json object to provide trigger	IconSettingsAutomation	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
6cc9e0cd-5966-4bca-b1fa-a4388bfb189e	20202020-5988-4a64-b94a-1f9b7b989039	89bcd47d-b0a0-41ba-ba13-500cb520b5a9	RAW_JSON	steps	Version steps	\N	Json object to provide steps	IconSettingsAutomation	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
445f7ad1-e9b6-439b-9ac2-8ef21a567b90	20202020-5a34-440e-8a25-39d8c3d1d4cf	89bcd47d-b0a0-41ba-ba13-500cb520b5a9	SELECT	status	Version status	"'DRAFT'"	The workflow version status	IconStatusChange	\N	[{"id": "dd0c2543-24e5-40aa-814a-c8581687a499", "color": "yellow", "label": "Draft", "value": "DRAFT", "position": 0}, {"id": "b8a809cb-e6ae-4a9f-9bca-da39843008f6", "color": "green", "label": "Active", "value": "ACTIVE", "position": 1}, {"id": "c386afae-46e7-4d3f-985e-c2dbbd80e078", "color": "orange", "label": "Deactivated", "value": "DEACTIVATED", "position": 2}, {"id": "666d2d9a-bc1c-47ec-a242-d22b885d9f49", "color": "gray", "label": "Archived", "value": "ARCHIVED", "position": 3}]	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
4eb4bd13-0fd9-43fc-8a80-fd470d8df762	20202020-791d-4950-ab28-0e704767ae1c	89bcd47d-b0a0-41ba-ba13-500cb520b5a9	POSITION	position	Position	0	Workflow version position	IconHierarchy2	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
07b8461c-d3fe-44bd-926a-b6f2b1d14d83	20202020-3f17-44ef-b8c1-b282ae8469b2	89bcd47d-b0a0-41ba-ba13-500cb520b5a9	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	\N	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
a3338784-d6bc-4c36-9db2-9311688a7c98	20202020-eda0-4cee-9577-3eb357e3c22b	89bcd47d-b0a0-41ba-ba13-500cb520b5a9	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
225f4fa6-01b0-4cbd-b309-07410e6719ae	20202020-66ac-4502-9975-e4d959c50311	89bcd47d-b0a0-41ba-ba13-500cb520b5a9	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
ccc993a3-b8ee-49fa-a7db-6aeea7c9fde0	20202020-d767-4622-bdcf-d8a084834d86	89bcd47d-b0a0-41ba-ba13-500cb520b5a9	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
b487d439-cf36-4b1b-abc9-2440377970f2	20202020-b9a7-48d8-8387-b9a3090a50ec	89bcd47d-b0a0-41ba-ba13-500cb520b5a9	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
86371281-8818-4e4b-863a-0a1b7de712a8	20202020-b840-4253-aef9-4e5013694587	37ea5922-a5c5-4fba-8148-5a5580c7ec37	TEXT	name	Name	\N	Name of the workflow run	IconSettingsAutomation	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
f5be4b24-a9fa-44c0-b0b4-72b92d753eb1	20202020-f1e3-4de1-a461-b5c4fdbc861d	37ea5922-a5c5-4fba-8148-5a5580c7ec37	DATE_TIME	enqueuedAt	Workflow run enqueued at	\N	Workflow run enqueued at	IconHistory	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
f965e069-eb09-4af1-b0a5-4fd410db61d0	20202020-a234-4e2d-bd15-85bcea6bb183	37ea5922-a5c5-4fba-8148-5a5580c7ec37	DATE_TIME	startedAt	Workflow run started at	\N	Workflow run started at	IconHistory	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
88d2335c-aa39-4b2a-95aa-db5d3da84a59	20202020-e1c1-4b6b-bbbd-b2beaf2e159e	37ea5922-a5c5-4fba-8148-5a5580c7ec37	DATE_TIME	endedAt	Workflow run ended at	\N	Workflow run ended at	IconHistory	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
876d5933-50db-473e-b193-b680360daebe	20202020-6b3e-4f9c-8c2b-2e5b8e6d6f3b	37ea5922-a5c5-4fba-8148-5a5580c7ec37	SELECT	status	Workflow run status	"'NOT_STARTED'"	Workflow run status	IconStatusChange	\N	[{"id": "630d63d3-def4-45d2-83c6-f8cca7628741", "color": "gray", "label": "Not started", "value": "NOT_STARTED", "position": 0}, {"id": "c486fc08-8907-4a17-b8c1-b67875a2303e", "color": "yellow", "label": "Running", "value": "RUNNING", "position": 1}, {"id": "ffdbd68b-bf0c-411d-b3fe-f8b4a42a5658", "color": "green", "label": "Completed", "value": "COMPLETED", "position": 2}, {"id": "ca9a6cc2-055a-4744-a279-58c9410fca72", "color": "red", "label": "Failed", "value": "FAILED", "position": 3}, {"id": "f16a3ae3-b728-4a7c-83e6-2cecb6f36e15", "color": "blue", "label": "Enqueued", "value": "ENQUEUED", "position": 4}, {"id": "674631eb-1596-4351-8936-a6b03df9bb20", "color": "orange", "label": "Stopping", "value": "STOPPING", "position": 5}, {"id": "0432adec-6f47-4710-8684-c91fb84d6529", "color": "gray", "label": "Stopped", "value": "STOPPED", "position": 6}]	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
838cea6f-dfb9-4994-9a34-2a0e2cbdf38b	20202020-6007-401a-8aa5-e6f38581a6f3	37ea5922-a5c5-4fba-8148-5a5580c7ec37	ACTOR	createdBy	Executed by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The executor of the workflow	IconCreativeCommonsSa	\N	\N	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
2d207983-d9b0-4719-b646-599aedc85c2d	20202020-611f-45f3-9cde-d64927e8ec57	37ea5922-a5c5-4fba-8148-5a5580c7ec37	RAW_JSON	state	State	\N	State of the workflow run	IconHierarchy2	\N	\N	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
e972b146-dafd-466a-843c-cc3497f47957	20202020-7802-4c40-ae89-1f506fe3365c	37ea5922-a5c5-4fba-8148-5a5580c7ec37	POSITION	position	Position	0	Workflow run position	IconHierarchy2	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
66a806aa-64b2-471d-80a4-4ab54841aa51	20202020-0b91-4ded-b1ac-cbd5efa58cb9	37ea5922-a5c5-4fba-8148-5a5580c7ec37	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	\N	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
0951a11d-b5d9-47a1-baae-71adf12ef1ca	20202020-eda0-4cee-9577-3eb357e3c22b	37ea5922-a5c5-4fba-8148-5a5580c7ec37	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
5c1e54b3-a004-42b2-8ad1-b31cd7348757	20202020-66ac-4502-9975-e4d959c50311	37ea5922-a5c5-4fba-8148-5a5580c7ec37	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
28a91802-4b79-4813-8ea4-d47224e1e60a	20202020-d767-4622-bdcf-d8a084834d86	37ea5922-a5c5-4fba-8148-5a5580c7ec37	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
66d44f98-1170-4581-bf10-f46129e935c1	20202020-b9a7-48d8-8387-b9a3090a50ec	37ea5922-a5c5-4fba-8148-5a5580c7ec37	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
740c6254-4c8f-4cbf-b3d7-015ff423ef83	20202020-3319-4234-a34c-3f92c1ab56e7	bebad403-65fc-49cc-8638-d290d969baec	SELECT	type	Automated Trigger Type	\N	The workflow automated trigger type	\N	\N	[{"id": "8d7f579d-7ed8-4fa1-a24f-4cd5f0640a5b", "color": "green", "label": "Database Event", "value": "DATABASE_EVENT", "position": 0}, {"id": "59d4a522-7301-4f6b-b673-b36dd1911c9b", "color": "blue", "label": "Cron", "value": "CRON", "position": 1}]	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
8b6220a7-1b32-4dc1-946c-b1b0f8438cf7	20202020-3319-4234-a34c-bac8f903de12	bebad403-65fc-49cc-8638-d290d969baec	RAW_JSON	settings	Settings	\N	The workflow automated trigger settings	\N	\N	\N	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
37121929-5f8f-4941-a980-49d8abe0916d	20202020-eda0-4cee-9577-3eb357e3c22b	bebad403-65fc-49cc-8638-d290d969baec	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
d9cb2723-4ec6-4459-91f3-24fb7df860e8	20202020-66ac-4502-9975-e4d959c50311	bebad403-65fc-49cc-8638-d290d969baec	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
eea7bf36-a3e6-4c4a-aacf-aef58767bc8f	20202020-d767-4622-bdcf-d8a084834d86	bebad403-65fc-49cc-8638-d290d969baec	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
da477291-fefa-4849-8c5c-4f16af569ed7	20202020-b9a7-48d8-8387-b9a3090a50ec	bebad403-65fc-49cc-8638-d290d969baec	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
7de2fe8b-964b-45d6-b97b-418d9b10a97d	20202020-1810-4591-a93c-d0df97dca843	c61c10a5-fad2-4072-9902-9cec39dbe21b	POSITION	position	Position	0	Workspace member position	IconHierarchy2	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
98f9efe6-da7d-4d13-94ec-8f057ce60e36	20202020-e914-43a6-9c26-3603c59065f4	c61c10a5-fad2-4072-9902-9cec39dbe21b	FULL_NAME	name	Name	\N	Workspace member name	IconCircleUser	\N	\N	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
b7a29690-7ac4-4fd5-9f0b-5cbf0a2b0900	20202020-66bc-47f2-adac-f2ef7c598b63	c61c10a5-fad2-4072-9902-9cec39dbe21b	TEXT	colorScheme	Color Scheme	"'System'"	Preferred color scheme	IconColorSwatch	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
6a72f2b8-3a13-46da-a5f5-756d141d2cd0	20202020-402e-4695-b169-794fa015afbe	c61c10a5-fad2-4072-9902-9cec39dbe21b	TEXT	locale	Language	"'en'"	Preferred language	IconLanguage	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
64370561-77cb-4153-b1a4-045f940d27d9	20202020-0ced-4c4f-a376-c98a966af3f6	c61c10a5-fad2-4072-9902-9cec39dbe21b	TEXT	avatarUrl	Avatar Url	\N	Workspace member avatar	IconFileUpload	\N	\N	\N	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
7da61240-debc-4efb-a0f7-3545e3d889cf	20202020-4c5f-4e09-bebc-9e624e21ecf4	c61c10a5-fad2-4072-9902-9cec39dbe21b	TEXT	userEmail	User Email	\N	Related user email address	IconMail	\N	\N	\N	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
e98dfd84-9e42-4f8b-b955-dba54c3153ad	20202020-92d0-1d7f-a126-25ededa6b142	c61c10a5-fad2-4072-9902-9cec39dbe21b	NUMBER	calendarStartDay	Start of the week	7	User's preferred start day of the week	\N	\N	\N	{"dataType": "int"}	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
9bc16ee1-3a60-4ecf-bd1a-44761f341589	20202020-75a9-4dfc-bf25-2e4b43e89820	c61c10a5-fad2-4072-9902-9cec39dbe21b	UUID	userId	User Id	\N	Associated User Id	IconCircleUsers	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
7df943b1-71e4-4ece-8453-e52de9f2fad2	20202020-2d33-4c21-a86e-5943b050dd54	c61c10a5-fad2-4072-9902-9cec39dbe21b	TEXT	timeZone	Time zone	"'system'"	User time zone	IconTimezone	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
40164299-36e0-40ca-89c2-157cc885e15c	20202020-af13-4e11-b1e7-b8cf5ea13dc0	c61c10a5-fad2-4072-9902-9cec39dbe21b	SELECT	dateFormat	Date format	"'SYSTEM'"	User's preferred date format	IconCalendarEvent	\N	[{"id": "dd740c9e-95ad-4aca-938d-a0550ac882ff", "color": "turquoise", "label": "System", "value": "SYSTEM", "position": 0}, {"id": "90031b87-e115-4a50-9151-44fe11ef1d89", "color": "red", "label": "Month First", "value": "MONTH_FIRST", "position": 1}, {"id": "965f8631-670a-4b98-b623-41d4d521fb5f", "color": "purple", "label": "Day First", "value": "DAY_FIRST", "position": 2}, {"id": "b27404e6-2bad-450a-bd41-6bfe0ade6ea4", "color": "sky", "label": "Year First", "value": "YEAR_FIRST", "position": 3}]	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
bc43f3e2-2fdd-4eb6-97de-1059d7a8ecf9	20202020-8acb-4cf8-a851-a6ed443c8d81	c61c10a5-fad2-4072-9902-9cec39dbe21b	SELECT	timeFormat	Time format	"'SYSTEM'"	User's preferred time format	IconClock2	\N	[{"id": "8a1b0342-7962-4026-9091-c2dde0d8e8a3", "color": "sky", "label": "System", "value": "SYSTEM", "position": 0}, {"id": "22b7408c-c198-4522-bff9-86709c7cec1e", "color": "red", "label": "24HRS", "value": "HOUR_24", "position": 1}, {"id": "0c3b024a-a585-4605-ba09-121e98c13bdc", "color": "purple", "label": "12HRS", "value": "HOUR_12", "position": 2}]	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
e18fcf95-3c47-4955-8886-9269a598f8fc	20202020-46d0-4e7f-bc26-74c0edaeb619	c61c10a5-fad2-4072-9902-9cec39dbe21b	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	\N	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
c4beecaf-06a3-47ec-91fe-84bced3eac2b	20202020-7f40-4e7f-b126-11c0eda6b141	c61c10a5-fad2-4072-9902-9cec39dbe21b	SELECT	numberFormat	Number format	"'SYSTEM'"	User's preferred number format	IconNumbers	\N	[{"id": "dd6af657-075a-43ff-af92-f295bfc34e8f", "color": "turquoise", "label": "System", "value": "SYSTEM", "position": 0}, {"id": "cf269f3b-0cb9-4439-8593-937e7159b396", "color": "blue", "label": "Commas and dot", "value": "COMMAS_AND_DOT", "position": 1}, {"id": "8c22aec2-80a5-4298-b349-e34f812ff3ff", "color": "green", "label": "Spaces and comma", "value": "SPACES_AND_COMMA", "position": 2}, {"id": "d440c28f-8792-4687-bf1b-257eaefd6317", "color": "orange", "label": "Dots and comma", "value": "DOTS_AND_COMMA", "position": 3}, {"id": "021fa509-1827-418d-94cd-8e278aedc470", "color": "purple", "label": "Apostrophe and dot", "value": "APOSTROPHE_AND_DOT", "position": 4}]	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
1308521b-0952-4392-980c-bb354a95d4af	20202020-eda0-4cee-9577-3eb357e3c22b	c61c10a5-fad2-4072-9902-9cec39dbe21b	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
5a9a796f-4e32-40fc-bdad-b6ce620b7797	20202020-66ac-4502-9975-e4d959c50311	c61c10a5-fad2-4072-9902-9cec39dbe21b	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
d180545b-7904-46cc-81ef-3a11646f7d7e	20202020-d767-4622-bdcf-d8a084834d86	c61c10a5-fad2-4072-9902-9cec39dbe21b	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
aef4a09a-0558-4867-baec-1dee1c85f9dc	20202020-b9a7-48d8-8387-b9a3090a50ec	c61c10a5-fad2-4072-9902-9cec39dbe21b	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
0bbd9bfc-6fb4-4e4a-8c1a-96c6d9cc8cb1	20202020-eda0-4cee-9577-3eb357e3c22b	d477715c-e571-4c79-9c3d-27cf2a3f4683	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
9fb6a87c-971d-4ee9-bb3e-d2417d4b917a	20202020-66ac-4502-9975-e4d959c50311	d477715c-e571-4c79-9c3d-27cf2a3f4683	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
6dbe2fa4-64ae-4b43-b515-af0de666d8f2	20202020-d767-4622-bdcf-d8a084834d86	d477715c-e571-4c79-9c3d-27cf2a3f4683	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
23bcf94a-d971-4d47-be8c-703e9f26b8f7	20202020-b9a7-48d8-8387-b9a3090a50ec	d477715c-e571-4c79-9c3d-27cf2a3f4683	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
77084878-6697-4e35-bb52-df213cd01371	20202020-72b5-416d-aed8-b55609067d01	6e84550e-a74e-4e82-8700-4a5ed617ba6b	TEXT	headerMessageId	Header message Id	\N	Message id from the message header	IconHash	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
3e6102c1-4df1-4254-be49-4347772672ea	20202020-52d1-4036-b9ae-84bd722bb37a	6e84550e-a74e-4e82-8700-4a5ed617ba6b	TEXT	subject	Subject	\N	Subject	IconMessage	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
690e9b12-a0b2-4e04-9598-bfca48150eda	20202020-d2ee-4e7e-89de-9a0a9044a143	6e84550e-a74e-4e82-8700-4a5ed617ba6b	TEXT	text	Text	\N	Text	IconMessage	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
14e86a0d-e0b5-49b9-92f8-23eb1582b1b2	20202020-140a-4a2a-9f86-f13b6a979afc	6e84550e-a74e-4e82-8700-4a5ed617ba6b	DATE_TIME	receivedAt	Received At	\N	The date the message was received	IconCalendar	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
a707b03d-2219-4698-81ad-cbe501b9707f	20202020-eda0-4cee-9577-3eb357e3c22b	6e84550e-a74e-4e82-8700-4a5ed617ba6b	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
4e149900-01a0-44f7-af5d-d450d474d5f6	20202020-66ac-4502-9975-e4d959c50311	6e84550e-a74e-4e82-8700-4a5ed617ba6b	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
65f1b5af-137c-413d-956f-f8b245deaa0b	20202020-d767-4622-bdcf-d8a084834d86	6e84550e-a74e-4e82-8700-4a5ed617ba6b	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
7d45e97a-e337-459d-b642-5806523b961f	20202020-b9a7-48d8-8387-b9a3090a50ec	6e84550e-a74e-4e82-8700-4a5ed617ba6b	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
9db8dcdb-4a41-4ce7-853c-7dc8a8311e7f	20202020-6a6b-4532-9767-cbc61b469453	840afb4a-10c1-4f5d-b62c-17b5a656afbf	SELECT	visibility	Visibility	"'SHARE_EVERYTHING'"	Visibility	IconEyeglass	\N	[{"id": "aa545f68-523b-4aa5-9d7f-1c72b87bfff8", "color": "green", "label": "Metadata", "value": "METADATA", "position": 0}, {"id": "1a4f18c2-fd1b-4da1-a7ef-ab82063df114", "color": "blue", "label": "Subject", "value": "SUBJECT", "position": 1}, {"id": "321ce22d-b80f-41c8-9edc-8857ee4b185f", "color": "orange", "label": "Share Everything", "value": "SHARE_EVERYTHING", "position": 2}]	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
f4c0dcfb-e3c6-4951-8492-c35344ccac41	20202020-2c96-43c3-93e3-ed6b1acb69bc	840afb4a-10c1-4f5d-b62c-17b5a656afbf	TEXT	handle	Handle	\N	Handle	IconAt	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
353cb7c0-b1d9-4b7c-8a94-970490eaad04	20202020-ae95-42d9-a3f1-797a2ea22122	840afb4a-10c1-4f5d-b62c-17b5a656afbf	SELECT	type	Type	"'EMAIL'"	Channel Type	IconMessage	\N	[{"id": "fc6db386-289d-4a04-8304-eba5a6b05fbc", "color": "green", "label": "Email", "value": "EMAIL", "position": 0}, {"id": "3de8d48c-8197-496b-a908-1b0e2fcae3ae", "color": "blue", "label": "SMS", "value": "SMS", "position": 1}]	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
afc70d2b-83ba-472b-87f9-71517d9d8ca9	20202020-fabd-4f14-b7c6-3310f6d132c6	840afb4a-10c1-4f5d-b62c-17b5a656afbf	BOOLEAN	isContactAutoCreationEnabled	Is Contact Auto Creation Enabled	true	Is Contact Auto Creation Enabled	IconUserCircle	\N	\N	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
96f7bc65-63a7-4b7d-9530-7493d0aebe9a	20202020-fc0e-4ba6-b259-a66ca89cfa38	840afb4a-10c1-4f5d-b62c-17b5a656afbf	SELECT	contactAutoCreationPolicy	Contact auto creation policy	"'SENT'"	Automatically create People records when receiving or sending emails	IconUserCircle	\N	[{"id": "292ad9b1-e442-4838-a355-c7d5358a53c0", "color": "green", "label": "Sent and Received", "value": "SENT_AND_RECEIVED", "position": 0}, {"id": "ef021c2e-552d-4558-b6fa-2521ea989df3", "color": "blue", "label": "Sent", "value": "SENT", "position": 1}, {"id": "d7032a2e-2a2f-4986-8dd7-16627a93af08", "color": "red", "label": "None", "value": "NONE", "position": 2}]	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
56a9aa41-7cca-4c00-9d0f-310c746e29d8	20202020-cc39-4432-9fe8-ec8ab8bbed95	840afb4a-10c1-4f5d-b62c-17b5a656afbf	SELECT	messageFolderImportPolicy	Message folder import policy	"'ALL_FOLDERS'"	Message folder import policy	IconFolder	\N	[{"id": "781539dd-fef8-4577-86ac-23fc5d61fd71", "color": "green", "label": "All folders", "value": "ALL_FOLDERS", "position": 0}, {"id": "e39c7f32-f817-41c4-9873-5006cc946235", "color": "blue", "label": "Selected folders", "value": "SELECTED_FOLDERS", "position": 1}]	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
b10d8154-6a0a-4f6e-8c2a-acefe1bd7cdd	20202020-1df5-445d-b4f3-2413ad178431	840afb4a-10c1-4f5d-b62c-17b5a656afbf	BOOLEAN	excludeNonProfessionalEmails	Exclude non professional emails	true	Exclude non professional emails	IconBriefcase	\N	\N	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
7e794714-11b8-450d-a5a5-12a0f8da85ef	20202020-45a0-4be4-9164-5820a6a109fb	840afb4a-10c1-4f5d-b62c-17b5a656afbf	BOOLEAN	excludeGroupEmails	Exclude group emails	true	Exclude group emails	IconUsersGroup	\N	\N	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
596f19f3-1bf6-44be-b865-64b9d1360fa2	20202020-17c5-4e9f-bc50-af46a89fdd42	840afb4a-10c1-4f5d-b62c-17b5a656afbf	SELECT	pendingGroupEmailsAction	Pending group emails action	"'NONE'"	Pending action for group emails	IconUsersGroup	\N	[{"id": "8cc7c6d1-611b-496b-91a7-ca39d0cd18d1", "color": "red", "label": "Group emails deletion", "value": "GROUP_EMAILS_DELETION", "position": 0}, {"id": "c28291fa-ba9b-43f4-8f7d-43f114cb912e", "color": "green", "label": "Group emails import", "value": "GROUP_EMAILS_IMPORT", "position": 1}, {"id": "df045947-d444-48e5-990f-79031fd37af9", "color": "blue", "label": "None", "value": "NONE", "position": 2}]	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
7ba7e46e-5d1c-48e5-8bf6-eb2843e3ac12	20202020-d9a6-48e9-990b-b97fdf22e8dd	840afb4a-10c1-4f5d-b62c-17b5a656afbf	BOOLEAN	isSyncEnabled	Is Sync Enabled	true	Is Sync Enabled	IconRefresh	\N	\N	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
020f1456-be39-48af-8680-14b49168fd12	20202020-79d1-41cf-b738-bcf5ed61e256	840afb4a-10c1-4f5d-b62c-17b5a656afbf	TEXT	syncCursor	Last sync cursor	\N	Last sync cursor	IconHistory	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
ca0ab773-25b2-4763-bd4a-32c7b88dca22	20202020-263d-4c6b-ad51-137ada56f7d4	840afb4a-10c1-4f5d-b62c-17b5a656afbf	DATE_TIME	syncedAt	Last sync date	\N	Last sync date	IconHistory	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
7e596058-b1c7-4a4b-8b83-bc1b8566d8e1	20202020-56a1-4f7e-9880-a8493bb899cc	840afb4a-10c1-4f5d-b62c-17b5a656afbf	SELECT	syncStatus	Sync status	\N	Sync status	IconStatusChange	\N	[{"id": "a8c1b3cd-522b-4e41-afec-c9fb455737e4", "color": "yellow", "label": "Ongoing", "value": "ONGOING", "position": 1}, {"id": "f63d31ba-ef42-45f2-bd17-98b330284596", "color": "blue", "label": "Not Synced", "value": "NOT_SYNCED", "position": 2}, {"id": "c6ede283-5627-4f1b-827b-8e978d806433", "color": "green", "label": "Active", "value": "ACTIVE", "position": 3}, {"id": "6fabf15b-7344-48d9-a062-2fb2221f1ec4", "color": "red", "label": "Failed Insufficient Permissions", "value": "FAILED_INSUFFICIENT_PERMISSIONS", "position": 4}, {"id": "c0087000-58c7-421a-aec9-394ded1d74a4", "color": "red", "label": "Failed Unknown", "value": "FAILED_UNKNOWN", "position": 5}]	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
af0863ad-5681-4de1-b812-bd8e4c83aa4f	20202020-7979-4b08-89fe-99cb5e698767	840afb4a-10c1-4f5d-b62c-17b5a656afbf	SELECT	syncStage	Sync stage	"'PENDING_CONFIGURATION'"	Sync stage	IconStatusChange	\N	[{"id": "5929f577-8d1e-4793-a00d-452712549559", "color": "blue", "label": "Messages list fetch pending", "value": "MESSAGE_LIST_FETCH_PENDING", "position": 0}, {"id": "2e5c0ab6-62f1-478c-aad9-bc0f42e40e28", "color": "green", "label": "Messages list fetch scheduled", "value": "MESSAGE_LIST_FETCH_SCHEDULED", "position": 1}, {"id": "fead37ed-7217-4983-b6a6-bcd070ecf9b7", "color": "orange", "label": "Messages list fetch ongoing", "value": "MESSAGE_LIST_FETCH_ONGOING", "position": 2}, {"id": "5af84380-2083-47cc-8374-d07b93df3974", "color": "blue", "label": "Messages import pending", "value": "MESSAGES_IMPORT_PENDING", "position": 3}, {"id": "a3364513-4302-41bc-9333-9d4226d89623", "color": "green", "label": "Messages import scheduled", "value": "MESSAGES_IMPORT_SCHEDULED", "position": 4}, {"id": "e6d33ac1-245a-4d43-90dc-1b48ff1831df", "color": "orange", "label": "Messages import ongoing", "value": "MESSAGES_IMPORT_ONGOING", "position": 5}, {"id": "ffdec000-abcd-4929-ae5e-7925a78395f9", "color": "red", "label": "Failed", "value": "FAILED", "position": 6}, {"id": "ffe430cc-d23d-469c-bcb3-c93e9dfb3ad9", "color": "gray", "label": "Pending configuration", "value": "PENDING_CONFIGURATION", "position": 7}]	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
6e6e6f97-a5f7-4647-b503-26db33593b1f	20202020-8c61-4a42-ae63-73c1c3c52e06	840afb4a-10c1-4f5d-b62c-17b5a656afbf	DATE_TIME	syncStageStartedAt	Sync stage started at	\N	Sync stage started at	IconHistory	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
eec28816-3682-4c7b-a95a-66d66dfab6ca	20202020-0291-42be-9ad0-d578a51684ab	840afb4a-10c1-4f5d-b62c-17b5a656afbf	NUMBER	throttleFailureCount	Throttle Failure Count	0	Throttle Failure Count	IconX	\N	\N	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
df8c5ec5-2062-4a2c-96f5-f2eaa62dbcf8	20202020-eda0-4cee-9577-3eb357e3c22b	840afb4a-10c1-4f5d-b62c-17b5a656afbf	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
24f56fa8-3ff1-4126-8b0f-5bcdf6e5e5b1	20202020-66ac-4502-9975-e4d959c50311	840afb4a-10c1-4f5d-b62c-17b5a656afbf	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
262202a2-5d0c-4a6f-849a-0cef8b86e8d7	20202020-d767-4622-bdcf-d8a084834d86	840afb4a-10c1-4f5d-b62c-17b5a656afbf	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
88343975-3920-46e1-8d59-9cd3369f1eab	20202020-b9a7-48d8-8387-b9a3090a50ec	840afb4a-10c1-4f5d-b62c-17b5a656afbf	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
0b237552-f078-482d-b0e8-a75313a068d8	20202020-65d1-42f4-8729-c9ec1f52aecd	a89fa0b4-2d20-4ff1-9706-ab5b63b6fb24	SELECT	role	Role	"'FROM'"	Role	IconAt	\N	[{"id": "3865ba43-6357-47bb-8969-5de8272282c5", "color": "green", "label": "From", "value": "FROM", "position": 0}, {"id": "582e04be-daa6-4bc2-bd69-cfafced610c5", "color": "blue", "label": "To", "value": "TO", "position": 1}, {"id": "60934afc-df97-4791-ba96-ed3af0d5d0ae", "color": "orange", "label": "Cc", "value": "CC", "position": 2}, {"id": "1653b38f-8912-40e8-a394-2874aee341f9", "color": "red", "label": "Bcc", "value": "BCC", "position": 3}]	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
f9a89866-29ee-45d4-b169-abc1b24f894a	20202020-2456-464e-b422-b965a4db4a0b	a89fa0b4-2d20-4ff1-9706-ab5b63b6fb24	TEXT	handle	Handle	\N	Handle	IconAt	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
227f5c56-ba00-486f-ad36-6ee81c47686b	20202020-36dd-4a4f-ac02-228425be9fac	a89fa0b4-2d20-4ff1-9706-ab5b63b6fb24	TEXT	displayName	Display Name	\N	Display Name	IconUser	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
1f0fb350-cf54-4dc5-8346-90f648d63a09	20202020-eda0-4cee-9577-3eb357e3c22b	a89fa0b4-2d20-4ff1-9706-ab5b63b6fb24	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
c352cbcf-fc38-4e9c-aaf0-2e3f80e803e8	20202020-66ac-4502-9975-e4d959c50311	a89fa0b4-2d20-4ff1-9706-ab5b63b6fb24	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
3e132423-f780-4bf8-b99e-795bd7e74595	20202020-d767-4622-bdcf-d8a084834d86	a89fa0b4-2d20-4ff1-9706-ab5b63b6fb24	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
63ce977e-7ba7-444f-ab10-1758214bf0f7	20202020-b9a7-48d8-8387-b9a3090a50ec	a89fa0b4-2d20-4ff1-9706-ab5b63b6fb24	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
7381a05e-83cb-449c-a978-df0e31c59ea2	20202020-7cf8-40bc-a681-b80b771449b7	a949876e-c029-4733-85ca-028ecde6d0c2	TEXT	name	Name	\N	Folder name	IconFolder	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
05ce95b3-12f7-4482-82d1-084c08988413	20202020-98cd-49ed-8dfc-cb5796400e64	a949876e-c029-4733-85ca-028ecde6d0c2	TEXT	syncCursor	Sync Cursor	\N	Sync Cursor	IconHash	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
565e6ca9-6114-4c1d-adb4-f2ea3a35e34b	20202020-2af5-4a25-b2de-3c9386da941b	a949876e-c029-4733-85ca-028ecde6d0c2	BOOLEAN	isSentFolder	Is Sent Folder	false	Is Sent Folder	IconCheck	\N	\N	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
ee910561-f5be-4b4c-a04a-5d208556ed9b	20202020-764f-4e09-8f95-cd46b6bfe3c4	a949876e-c029-4733-85ca-028ecde6d0c2	BOOLEAN	isSynced	Is Synced	false	Is Synced	IconCheck	\N	\N	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
70d0c2a7-cd8c-456a-8113-b898a726c53b	20202020-e45d-49de-a4aa-587bbf9601f3	a949876e-c029-4733-85ca-028ecde6d0c2	TEXT	parentFolderId	Parent Folder ID	\N	Parent Folder ID	IconFolder	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
066bc448-5c62-468b-8690-92f6e7471237	20202020-f3a8-4d2b-9c7e-1b5f9a8e4c6d	a949876e-c029-4733-85ca-028ecde6d0c2	TEXT	externalId	External ID	\N	External ID	IconHash	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
ec78ed19-04d0-4ce8-a78b-884a780d333f	20202020-4f97-4c79-9517-16387fe237f7	a949876e-c029-4733-85ca-028ecde6d0c2	SELECT	pendingSyncAction	Pending Sync Action	"'NONE'"	Pending action for folder sync	IconReload	\N	[{"id": "5abd3710-0909-44d3-b8f5-5382d70a8044", "color": "red", "label": "Folder deletion", "value": "FOLDER_DELETION", "position": 0}, {"id": "974b2106-e953-4dfa-8077-ebf674cac594", "color": "blue", "label": "None", "value": "NONE", "position": 1}]	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
76212740-ee26-4c6c-862e-743c8c7a27c6	20202020-eda0-4cee-9577-3eb357e3c22b	a949876e-c029-4733-85ca-028ecde6d0c2	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
0535fa2c-869e-4843-9e81-012811b705ac	20202020-66ac-4502-9975-e4d959c50311	a949876e-c029-4733-85ca-028ecde6d0c2	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
4d383a38-6f95-40a7-af52-731078ac72ae	20202020-d767-4622-bdcf-d8a084834d86	a949876e-c029-4733-85ca-028ecde6d0c2	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
0ee39eb7-1cd3-44c5-9277-12c8cb298836	20202020-b9a7-48d8-8387-b9a3090a50ec	a949876e-c029-4733-85ca-028ecde6d0c2	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
0e6be65b-e6f0-4c91-b19c-e3352027745e	20202020-37d6-438f-b6fd-6503596c8f34	bbcf3ea3-f4cc-4811-bc1b-5eb5fd3d0e56	TEXT	messageExternalId	Message External Id	\N	Message id from the messaging provider	IconHash	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
15fc4500-9a1a-4d3d-ba19-e842bbf0374d	20202020-35fb-421e-afa0-0b8e8f7f9018	bbcf3ea3-f4cc-4811-bc1b-5eb5fd3d0e56	TEXT	messageThreadExternalId	Thread External Id	\N	Thread id from the messaging provider	IconHash	\N	\N	\N	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
8ff3a3d3-e820-4468-9695-b80e5122c137	20202020-0203-4118-8e2a-05b9bdae6dab	bbcf3ea3-f4cc-4811-bc1b-5eb5fd3d0e56	SELECT	direction	Direction	"'INCOMING'"	Message Direction	IconDirection	\N	[{"id": "0a1b9572-7fd3-45ef-86df-b21556553e29", "color": "green", "label": "Incoming", "value": "INCOMING", "position": 0}, {"id": "f708cf34-a900-43e3-8ddd-e1c9f386c6a4", "color": "blue", "label": "Outgoing", "value": "OUTGOING", "position": 1}]	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
a42fc419-43ba-4a2a-ba54-d60d1d022e46	20202020-eda0-4cee-9577-3eb357e3c22b	bbcf3ea3-f4cc-4811-bc1b-5eb5fd3d0e56	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
7cf952aa-12ab-4d6e-8ee3-ecd27b2c8d69	20202020-66ac-4502-9975-e4d959c50311	bbcf3ea3-f4cc-4811-bc1b-5eb5fd3d0e56	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
807e4237-e79a-4216-9e80-3b9fb5b9f32a	20202020-d767-4622-bdcf-d8a084834d86	bbcf3ea3-f4cc-4811-bc1b-5eb5fd3d0e56	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
e6ae9e48-4a67-4143-b10d-f3c35777da0b	20202020-b9a7-48d8-8387-b9a3090a50ec	bbcf3ea3-f4cc-4811-bc1b-5eb5fd3d0e56	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
a0de4341-0753-4fc2-bd5c-a051893183fc	20202020-368d-4dc2-943f-ed8a49c7fdfb	7f0daf26-7887-47d7-b6d6-8d792b812e94	POSITION	position	Position	0	Note record position	IconHierarchy2	\N	\N	\N	f	t	t	f	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
fabb04e8-4fe5-4cb1-b807-2499c92517e5	20202020-faeb-4c76-8ba6-ccbb0b4a965f	7f0daf26-7887-47d7-b6d6-8d792b812e94	TEXT	title	Title	\N	Note title	IconNotes	\N	\N	\N	f	t	f	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
42496b73-d5cd-4268-8f0d-25bae0593390	20202020-a7bb-4d94-be51-8f25181502c8	7f0daf26-7887-47d7-b6d6-8d792b812e94	RICH_TEXT_V2	bodyV2	Body	\N	Note body	IconFilePencil	\N	\N	\N	f	t	f	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
0ceb9bb9-e059-428d-9c76-55195d773bd6	20202020-0d79-4e21-ab77-5a394eff97be	7f0daf26-7887-47d7-b6d6-8d792b812e94	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
fa43a101-24b7-4e98-a60f-5a488b875f11	20202020-7ea8-44d4-9d4c-51dd2a757950	7f0daf26-7887-47d7-b6d6-8d792b812e94	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	\N	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
46cbb651-445f-4577-a4ac-be24f051f7ec	20202020-eda0-4cee-9577-3eb357e3c22b	7f0daf26-7887-47d7-b6d6-8d792b812e94	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
1b9cdfcb-baa1-4548-8e18-9d07619a6346	20202020-66ac-4502-9975-e4d959c50311	7f0daf26-7887-47d7-b6d6-8d792b812e94	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
d0025d92-7ae4-405c-89f7-87dd5158b9b0	20202020-d767-4622-bdcf-d8a084834d86	7f0daf26-7887-47d7-b6d6-8d792b812e94	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
3f4bb402-6f76-4fc0-8871-5c5a5ac6d558	20202020-b9a7-48d8-8387-b9a3090a50ec	7f0daf26-7887-47d7-b6d6-8d792b812e94	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
92962862-0d6a-485b-8624-35b868a22aec	20202020-eda0-4cee-9577-3eb357e3c22b	9e6962d4-b31b-4f54-a20f-e4f118de550f	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
d64deece-610c-4dce-a076-d03fe7cd2d23	20202020-66ac-4502-9975-e4d959c50311	9e6962d4-b31b-4f54-a20f-e4f118de550f	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
0dfc11b7-da2e-4500-b24a-d1a3cc029928	20202020-d767-4622-bdcf-d8a084834d86	9e6962d4-b31b-4f54-a20f-e4f118de550f	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
362088be-ec91-47f1-8075-83e2b0e9fbc6	20202020-b9a7-48d8-8387-b9a3090a50ec	9e6962d4-b31b-4f54-a20f-e4f118de550f	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
bbeae473-1711-4438-bae1-0fb7d275e8c4	20202020-8609-4f65-a2d9-44009eb422b5	77082a20-4eaa-4b81-b4e8-564c03c1ad16	TEXT	name	Name	\N	The opportunity name	IconTargetArrow	\N	\N	\N	f	t	f	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
835bbd7c-ad4f-4443-bb9c-623ca1f77b2e	20202020-583e-4642-8533-db761d5fa82f	77082a20-4eaa-4b81-b4e8-564c03c1ad16	CURRENCY	amount	Amount	\N	Opportunity amount	IconCurrencyDollar	\N	\N	\N	f	t	f	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
43d82dd4-18ec-442b-8e79-bf6aded3a543	20202020-527e-44d6-b1ac-c4158d307b97	77082a20-4eaa-4b81-b4e8-564c03c1ad16	DATE_TIME	closeDate	Close date	\N	Opportunity close date	IconCalendarEvent	\N	\N	\N	f	t	f	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
a74ca777-7865-41a1-a200-2ae59ee9fa2f	20202020-6f76-477d-8551-28cd65b2b4b9	77082a20-4eaa-4b81-b4e8-564c03c1ad16	SELECT	stage	Stage	"'NEW'"	Opportunity stage	IconProgressCheck	\N	[{"id": "63d1c3ce-d0b7-4a4b-ae03-6687aad164da", "color": "red", "label": "New", "value": "NEW", "position": 0}, {"id": "892e4fbf-dc4a-421d-9296-7741db6fd60f", "color": "purple", "label": "Screening", "value": "SCREENING", "position": 1}, {"id": "faf5f427-2d94-4ba4-a7a6-4d60d1c6b1fc", "color": "sky", "label": "Meeting", "value": "MEETING", "position": 2}, {"id": "8ce220bf-69a6-444f-ae7a-62e0afa75a6a", "color": "turquoise", "label": "Proposal", "value": "PROPOSAL", "position": 3}, {"id": "110693cb-576e-4ce1-9b1c-9600e59ad6a4", "color": "yellow", "label": "Customer", "value": "CUSTOMER", "position": 4}]	\N	f	t	f	f	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
8831b7e2-c396-4d58-935b-0fe6666ead27	20202020-806d-493a-bbc6-6313e62958e2	77082a20-4eaa-4b81-b4e8-564c03c1ad16	POSITION	position	Position	0	Opportunity record position	IconHierarchy2	\N	\N	\N	f	t	t	f	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
0a129a69-65c7-4e96-9676-5ad0ab6a5c73	20202020-a63e-4a62-8e63-42a51828f831	77082a20-4eaa-4b81-b4e8-564c03c1ad16	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
eebf8df5-526f-418a-83fc-db0663927ee9	428a0da5-4b2e-4ce3-b695-89a8b384e6e3	77082a20-4eaa-4b81-b4e8-564c03c1ad16	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	\N	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
fb5d966f-6b80-4a06-ba90-dc43a2909f0b	20202020-eda0-4cee-9577-3eb357e3c22b	77082a20-4eaa-4b81-b4e8-564c03c1ad16	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
b9c5967d-60f5-49fd-ba07-03363409843f	20202020-66ac-4502-9975-e4d959c50311	77082a20-4eaa-4b81-b4e8-564c03c1ad16	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
d73ae725-285f-4b48-aba4-4d44e22d98d7	20202020-d767-4622-bdcf-d8a084834d86	77082a20-4eaa-4b81-b4e8-564c03c1ad16	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
812b7037-1070-46e4-97f8-fbfb800eab36	20202020-b9a7-48d8-8387-b9a3090a50ec	77082a20-4eaa-4b81-b4e8-564c03c1ad16	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
9981f7f7-9e56-45f5-9f32-4ccc5d962aca	20202020-eda0-4cee-9577-3eb357e3c22b	4d66f605-f9ca-43fc-9d35-db72ee5f04bc	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
f8224e96-02c4-4cb6-bfd5-55581237cbb3	20202020-3875-44d5-8c33-a6239011cab8	df5c5db0-be63-4f64-ae64-f3b354f80cb9	FULL_NAME	name	Name	\N	Contact’s name	IconUser	\N	\N	\N	f	t	f	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
a477a67b-cf0d-42fe-b95e-df0ed7f38d04	20202020-3c51-43fa-8b6e-af39e29368ab	df5c5db0-be63-4f64-ae64-f3b354f80cb9	EMAILS	emails	Emails	\N	Contact’s Emails	IconMail	\N	\N	{"maxNumberOfValues": 1}	f	t	f	f	t	t	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
73f9b7c7-c4c7-4a85-9890-6bc3256e9496	20202020-f1af-48f7-893b-2007a73dd508	df5c5db0-be63-4f64-ae64-f3b354f80cb9	LINKS	linkedinLink	Linkedin	\N	Contact’s Linkedin account	IconBrandLinkedin	\N	\N	\N	f	t	f	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
2e2f8cc4-bae2-45ca-b417-427794a25d11	20202020-8fc2-487c-b84a-55a99b145cfd	df5c5db0-be63-4f64-ae64-f3b354f80cb9	LINKS	xLink	X	\N	Contact’s X/Twitter account	IconBrandX	\N	\N	\N	f	t	f	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
51404b8b-cb11-427e-9b8b-5d27cd8377cc	20202020-b0d0-415a-bef9-640a26dacd9b	df5c5db0-be63-4f64-ae64-f3b354f80cb9	TEXT	jobTitle	Job Title	\N	Contact’s job title	IconBriefcase	\N	\N	\N	f	t	f	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
b4d586b8-837b-4e97-a448-de6bd310bf73	20202020-0638-448e-8825-439134618022	df5c5db0-be63-4f64-ae64-f3b354f80cb9	PHONES	phones	Phones	\N	Contact’s phone numbers	IconPhone	\N	\N	{"maxNumberOfValues": 1}	f	t	f	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
2eea4fb8-5104-475a-baf8-12e9c538382f	20202020-5243-4ffb-afc5-2c675da41346	df5c5db0-be63-4f64-ae64-f3b354f80cb9	TEXT	city	City	\N	Contact’s city	IconMap	\N	\N	\N	f	t	f	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
b680e99d-220f-4d6c-8781-bd2e6206f920	20202020-b8a6-40df-961c-373dc5d2ec21	df5c5db0-be63-4f64-ae64-f3b354f80cb9	TEXT	avatarUrl	Avatar	\N	Contact’s avatar	IconFileUpload	\N	\N	\N	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
399ece68-24b8-48e0-ae99-9ade48a2b517	20202020-fcd5-4231-aff5-fff583eaa0b1	df5c5db0-be63-4f64-ae64-f3b354f80cb9	POSITION	position	Position	0	Person record Position	IconHierarchy2	\N	\N	\N	f	t	t	f	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
aaaafa1f-a60a-46c6-8dab-97497a3190c8	20202020-f6ab-4d98-af24-a3d5b664148a	df5c5db0-be63-4f64-ae64-f3b354f80cb9	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
bcb16c1f-bfa7-40a4-a9fc-0a1af4b54095	57d1d7ad-fa10-44fc-82f3-ad0959ec2534	df5c5db0-be63-4f64-ae64-f3b354f80cb9	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	\N	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
2f66cb03-f858-492f-a10f-481dbaf6e30a	20202020-eda0-4cee-9577-3eb357e3c22b	df5c5db0-be63-4f64-ae64-f3b354f80cb9	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
d1adc0fb-9e01-4a34-ae16-116ffe050b39	20202020-66ac-4502-9975-e4d959c50311	df5c5db0-be63-4f64-ae64-f3b354f80cb9	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
e2decc1b-9d2d-4d0a-8b78-eea86fb10fae	20202020-d767-4622-bdcf-d8a084834d86	df5c5db0-be63-4f64-ae64-f3b354f80cb9	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
391e3a75-34f3-4c01-a1d1-aae7aab48daa	20202020-b9a7-48d8-8387-b9a3090a50ec	df5c5db0-be63-4f64-ae64-f3b354f80cb9	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
0668484d-6993-4d4a-a3f9-dffc85f269ae	20202020-7d47-4690-8a98-98b9a0c05dd8	4d66f605-f9ca-43fc-9d35-db72ee5f04bc	POSITION	position	Position	0	Task record position	IconHierarchy2	\N	\N	\N	f	t	t	f	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
061116b6-d7a8-42a7-989e-ed8b6f89cad5	20202020-b386-4cb7-aa5a-08d4a4d92680	4d66f605-f9ca-43fc-9d35-db72ee5f04bc	TEXT	title	Title	\N	Task title	IconNotes	\N	\N	\N	f	t	f	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
0f318c60-7038-4dce-97df-c10455eccb37	20202020-4aa0-4ae8-898d-7df0afd47ab1	4d66f605-f9ca-43fc-9d35-db72ee5f04bc	RICH_TEXT_V2	bodyV2	Body	\N	Task body	IconFilePencil	\N	\N	\N	f	t	f	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
404fe754-d86e-4733-be2a-f964c669bc1f	20202020-fd99-40da-951b-4cb9a352fce3	4d66f605-f9ca-43fc-9d35-db72ee5f04bc	DATE_TIME	dueAt	Due Date	\N	Task due date	IconCalendarEvent	\N	\N	\N	f	t	f	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
514d4604-217c-4924-922d-d298ad2c1e22	20202020-70bc-48f9-89c5-6aa730b151e0	4d66f605-f9ca-43fc-9d35-db72ee5f04bc	SELECT	status	Status	"'TODO'"	Task status	IconCheck	\N	[{"id": "bb18d639-1489-4d34-84d4-b91ad0eaceb2", "color": "sky", "label": "To do", "value": "TODO", "position": 0}, {"id": "d523df70-001c-4662-81c4-3e77eb3270fd", "color": "purple", "label": "In progress", "value": "IN_PROGRESS", "position": 1}, {"id": "07363c1c-5dbe-4e80-8c7b-7724badf9fdd", "color": "green", "label": "Done", "value": "DONE", "position": 2}]	\N	f	t	f	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
cae4dbaa-ed35-4ed3-af41-08bac41edd9c	20202020-1a04-48ab-a567-576965ae5387	4d66f605-f9ca-43fc-9d35-db72ee5f04bc	ACTOR	createdBy	Created by	{"name": "'System'", "source": "'MANUAL'", "workspaceMemberId": null}	The creator of the record	IconCreativeCommonsSa	\N	\N	\N	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
aeafa77e-1c4e-4365-8285-8e3b2c5b308e	20202020-4746-4e2f-870c-52b02c67c90d	4d66f605-f9ca-43fc-9d35-db72ee5f04bc	TS_VECTOR	searchVector	Search vector	\N	Field used for full-text search	IconUser	\N	\N	\N	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
c49d904b-5ed6-42fc-aeac-2a2cf07e2386	20202020-66ac-4502-9975-e4d959c50311	4d66f605-f9ca-43fc-9d35-db72ee5f04bc	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
2441ad21-7cd1-4aa4-96ea-a35e521f62c9	20202020-d767-4622-bdcf-d8a084834d86	4d66f605-f9ca-43fc-9d35-db72ee5f04bc	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
69e8e794-46b3-4f1a-a646-ef02f872724c	20202020-b9a7-48d8-8387-b9a3090a50ec	4d66f605-f9ca-43fc-9d35-db72ee5f04bc	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
5e10b729-d993-46f3-bbe0-e2b589c42806	20202020-eda0-4cee-9577-3eb357e3c22b	d3d793c8-5ed6-4bd0-85cf-ace8f0c132f3	UUID	id	Id	"uuid"	Id	Icon123	\N	\N	\N	f	t	t	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
d237503e-f5aa-4dee-9537-898ff7eaf6bc	20202020-66ac-4502-9975-e4d959c50311	d3d793c8-5ed6-4bd0-85cf-ace8f0c132f3	DATE_TIME	createdAt	Creation date	"now"	Creation date	IconCalendar	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
e634267a-82f7-4c32-b321-f38a86c79d08	20202020-d767-4622-bdcf-d8a084834d86	d3d793c8-5ed6-4bd0-85cf-ace8f0c132f3	DATE_TIME	updatedAt	Last update	"now"	Last time the record was changed	IconCalendarClock	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	f	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
29f0c291-df2b-41c5-9bce-50e7a689bf38	20202020-b9a7-48d8-8387-b9a3090a50ec	d3d793c8-5ed6-4bd0-85cf-ace8f0c132f3	DATE_TIME	deletedAt	Deleted at	\N	Date when the record was deleted	IconCalendarMinus	\N	\N	{"displayFormat": "RELATIVE"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	\N	\N	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
68efd5f9-6f0f-479d-9f9c-0e7137c2f047	20202020-6501-4ac5-a4ef-b2f8522ef6cd	331329f4-7d5a-4a51-8188-8bd6383a68ef	RELATION	author	Author	\N	Attachment author (deprecated - use createdBy)	IconCircleUser	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "authorId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	215cea07-20be-45c6-89e9-c1ab52cdc44f	c61c10a5-fad2-4072-9902-9cec39dbe21b	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
5218d113-a3a5-4ece-abab-145b29ef6025	20202020-51e5-4621-9cf8-215487951c4b	331329f4-7d5a-4a51-8188-8bd6383a68ef	RELATION	task	Task	\N	Attachment task	IconNotes	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "taskId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	7a75da49-505d-46b2-82dc-e62d3b3e2929	4d66f605-f9ca-43fc-9d35-db72ee5f04bc	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
470e5e00-e4d2-497d-94b1-ecd9e4dc02c5	20202020-4f4b-4503-a6fc-6b982f3dffb5	331329f4-7d5a-4a51-8188-8bd6383a68ef	RELATION	note	Note	\N	Attachment note	IconNotes	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "noteId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	bf04f8d5-20d6-4e91-83d6-8111680dde76	7f0daf26-7887-47d7-b6d6-8d792b812e94	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
750ed649-7b6e-45aa-b761-3cb0c8023977	20202020-0158-4aa2-965c-5cdafe21ffa2	331329f4-7d5a-4a51-8188-8bd6383a68ef	RELATION	person	Person	\N	Attachment person	IconUser	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "personId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	f6868fad-44c9-4287-a1b9-743b213db592	df5c5db0-be63-4f64-ae64-f3b354f80cb9	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
e948ed06-3166-486d-ace8-a5973f090fad	20202020-ceab-4a28-b546-73b06b4c08d5	331329f4-7d5a-4a51-8188-8bd6383a68ef	RELATION	company	Company	\N	Attachment company	IconBuildingSkyscraper	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "companyId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	d012b231-4808-4495-894a-3d28d2a2456b	adf06099-b76b-47c1-9519-bb10956030eb	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
b02d8a05-8af7-4ed5-9f5c-67d35f93acb9	20202020-7374-499d-bea3-9354890755b5	331329f4-7d5a-4a51-8188-8bd6383a68ef	RELATION	opportunity	Opportunity	\N	Attachment opportunity	IconBuildingSkyscraper	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "opportunityId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	d77d31a7-630d-4d9a-81c1-c8da3540d0d7	77082a20-4eaa-4b81-b4e8-564c03c1ad16	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
ed528675-738d-4df7-8907-ff43da4650f8	20202020-5324-43f3-9dbf-1a33e7de0ce6	331329f4-7d5a-4a51-8188-8bd6383a68ef	RELATION	dashboard	Dashboard	\N	Attachment dashboard	IconLayout	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "dashboardId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	7bc55b76-342a-4e3c-93b9-991628dd9981	7b93a0b2-03a9-457e-88ef-1cc653c60660	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
d16c3f55-c56a-434f-9b51-82e5416bf7f3	20202020-f1e8-4c9d-8a7b-3f5e1d2c9a8b	331329f4-7d5a-4a51-8188-8bd6383a68ef	RELATION	workflow	Workflow	\N	Attachment workflow	IconSettingsAutomation	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "workflowId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	87cfd7b6-7175-43aa-96f0-b116f4900502	e89d085a-8ec2-4b37-9560-3f1f708b57a6	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
e22f6c8c-1357-4ca4-bbc4-166ffbb03505	20202020-548d-4084-a947-fa20a39f7c06	b224c093-0fe7-4c60-95bd-5da11d207937	RELATION	workspaceMember	WorkspaceMember	\N	WorkspaceMember	IconCircleUser	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "workspaceMemberId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	e442e194-6085-44cc-a699-096ebe622318	c61c10a5-fad2-4072-9902-9cec39dbe21b	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
047d5682-e281-4aeb-9656-9901f8b59cf0	20202020-bdf8-4572-a2cc-ecbb6bcc3a02	9ab0caad-fd52-46be-98b6-f1b607f1f8b6	RELATION	calendarChannelEventAssociations	Calendar Channel Event Associations	\N	Calendar Channel Event Associations	IconCalendar	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	520dff71-5b4a-43f4-8aa9-4e196e7bfe46	132fb558-68fe-4619-a469-59ac07bf65cf	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
5b194bcf-bce7-45aa-baa8-e6a83dc46b7c	20202020-e07e-4ccb-88f5-6f3d00458eec	9ab0caad-fd52-46be-98b6-f1b607f1f8b6	RELATION	calendarEventParticipants	Event Participants	\N	Event Participants	IconUserCircle	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	179884de-4f7d-4402-8033-adccc1dbbbec	9e60fa19-8c45-43e3-a07a-a47497dd6539	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
dfa5b27b-fb8a-4e0c-bf8d-5b4e53865d76	20202020-95b1-4f44-82dc-61b042ae2414	cd953ca2-8c54-4fee-80ff-f638c3d2ac12	RELATION	connectedAccount	Connected Account	\N	Connected Account	IconUserCircle	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "connectedAccountId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	8c7db664-9a5d-4473-804c-0c3c4261dfae	f76201bb-e234-4a3f-af09-ee3fd2445e79	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
172a489a-89ab-4851-800e-e51617a15fe0	20202020-afb0-4a9f-979f-2d5087d71d09	cd953ca2-8c54-4fee-80ff-f638c3d2ac12	RELATION	calendarChannelEventAssociations	Calendar Channel Event Associations	\N	Calendar Channel Event Associations	IconCalendar	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	6d05c7ef-daa8-40e3-9597-ccca652a4a16	132fb558-68fe-4619-a469-59ac07bf65cf	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
6d05c7ef-daa8-40e3-9597-ccca652a4a16	20202020-93ee-4da4-8d58-0282c4a9cb7d	132fb558-68fe-4619-a469-59ac07bf65cf	RELATION	calendarChannel	Channel ID	\N	Channel ID	IconCalendar	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "calendarChannelId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	172a489a-89ab-4851-800e-e51617a15fe0	cd953ca2-8c54-4fee-80ff-f638c3d2ac12	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
520dff71-5b4a-43f4-8aa9-4e196e7bfe46	20202020-5aa5-437e-bb86-f42d457783e3	132fb558-68fe-4619-a469-59ac07bf65cf	RELATION	calendarEvent	Event ID	\N	Event ID	IconCalendar	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "calendarEventId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	047d5682-e281-4aeb-9656-9901f8b59cf0	9ab0caad-fd52-46be-98b6-f1b607f1f8b6	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
179884de-4f7d-4402-8033-adccc1dbbbec	20202020-fe3a-401c-b889-af4f4657a861	9e60fa19-8c45-43e3-a07a-a47497dd6539	RELATION	calendarEvent	Event ID	\N	Event ID	IconCalendar	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "calendarEventId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	5b194bcf-bce7-45aa-baa8-e6a83dc46b7c	9ab0caad-fd52-46be-98b6-f1b607f1f8b6	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
822fb2f5-3d18-4aa3-8a29-c41bd9011f4c	20202020-5761-4842-8186-e1898ef93966	9e60fa19-8c45-43e3-a07a-a47497dd6539	RELATION	person	Person	\N	Person	IconUser	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "personId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	dc0262d8-3f67-4ac1-8786-9f278c9ecabc	df5c5db0-be63-4f64-ae64-f3b354f80cb9	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
2965e798-6186-43ce-9bdb-448cca8a5611	20202020-20e4-4591-93ed-aeb17a4dcbd2	9e60fa19-8c45-43e3-a07a-a47497dd6539	RELATION	workspaceMember	Workspace Member	\N	Workspace Member	IconUser	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "workspaceMemberId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	5f366bc3-271b-4f76-8509-7e615d61980b	c61c10a5-fad2-4072-9902-9cec39dbe21b	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
508380b8-cc5f-4157-87c3-2959bab40760	20202020-3213-4ddf-9494-6422bcff8d7c	adf06099-b76b-47c1-9519-bb10956030eb	RELATION	people	People	\N	People linked to the company.	IconUsers	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	570d723b-1232-4c20-b317-1f77f319dd9f	df5c5db0-be63-4f64-ae64-f3b354f80cb9	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
a1af0d87-a071-4080-a260-3fec85c6359a	20202020-95b8-4e10-9881-edb5d4765f9d	adf06099-b76b-47c1-9519-bb10956030eb	RELATION	accountOwner	Account Owner	\N	Your team member responsible for managing the company account	IconUserCircle	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "accountOwnerId"}	f	t	f	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	b01ef6f1-3d05-47d6-9d98-53ce431d0e04	c61c10a5-fad2-4072-9902-9cec39dbe21b	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
2711a359-ab41-4191-a838-5f14cb96b002	20202020-cb17-4a61-8f8f-3be6730480de	adf06099-b76b-47c1-9519-bb10956030eb	RELATION	taskTargets	Tasks	\N	Tasks tied to the company	IconCheckbox	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	09509e8b-b808-45c5-8d4c-7c7cd181d26f	d3d793c8-5ed6-4bd0-85cf-ace8f0c132f3	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
bf7a09dd-6f4d-4679-b6af-e366faebd10b	20202020-bae0-4556-a74a-a9c686f77a88	adf06099-b76b-47c1-9519-bb10956030eb	RELATION	noteTargets	Notes	\N	Notes tied to the company	IconNotes	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	257e1039-af4d-4be1-ba4c-a692c38050d4	9e6962d4-b31b-4f54-a20f-e4f118de550f	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
640d5ce5-49b6-424f-984a-bdcf51758f91	20202020-add3-4658-8e23-d70dccb6d0ec	adf06099-b76b-47c1-9519-bb10956030eb	RELATION	opportunities	Opportunities	\N	Opportunities linked to the company.	IconTargetArrow	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	0a731520-02df-4414-b033-987b2de7121d	77082a20-4eaa-4b81-b4e8-564c03c1ad16	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
ca2b6743-13ec-4b4b-ad4b-e1e034e4d372	20202020-4d1d-41ac-b13b-621631298d55	adf06099-b76b-47c1-9519-bb10956030eb	RELATION	favorites	Favorites	\N	Favorites linked to the company	IconHeart	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	719b3085-efdb-4350-8ff1-2c4cf6e1180a	5aee0655-bf05-4ac3-afae-cb58be3235d6	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
d012b231-4808-4495-894a-3d28d2a2456b	20202020-c1b5-4120-b0f0-987ca401ed53	adf06099-b76b-47c1-9519-bb10956030eb	RELATION	attachments	Attachments	\N	Attachments linked to the company	IconFileImport	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	e948ed06-3166-486d-ace8-a5973f090fad	331329f4-7d5a-4a51-8188-8bd6383a68ef	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
e7c5dac8-96bd-4bbf-a8b5-b37bf6640df9	20202020-0414-4daf-9c0d-64fe7b27f89f	adf06099-b76b-47c1-9519-bb10956030eb	RELATION	timelineActivities	Timeline Activities	\N	Timeline Activities linked to the company	IconIconTimelineEvent	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	3b7b6533-ef4a-4a0b-ad46-ebb40722f627	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
279c41fe-7165-439f-a417-8ad167c5833c	20202020-3517-4896-afac-b1d0aa362af6	f76201bb-e234-4a3f-af09-ee3fd2445e79	RELATION	accountOwner	Account Owner	\N	Account Owner	IconUserCircle	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "accountOwnerId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	48c1f65b-a517-4a48-8a6a-69e24e54c4de	c61c10a5-fad2-4072-9902-9cec39dbe21b	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
069c2cd0-c1df-4490-a93d-2e0ea6b29ce5	20202020-24f7-4362-8468-042204d1e445	f76201bb-e234-4a3f-af09-ee3fd2445e79	RELATION	messageChannels	Message Channels	\N	Message Channels	IconMessage	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	34de0749-7f0a-4089-b684-95290e7210ab	840afb4a-10c1-4f5d-b62c-17b5a656afbf	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
8c7db664-9a5d-4473-804c-0c3c4261dfae	20202020-af4a-47bb-99ec-51911c1d3977	f76201bb-e234-4a3f-af09-ee3fd2445e79	RELATION	calendarChannels	Calendar Channels	\N	Calendar Channels	IconCalendar	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	dfa5b27b-fb8a-4e0c-bf8d-5b4e53865d76	cd953ca2-8c54-4fee-80ff-f638c3d2ac12	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
83d55c85-ffce-419f-98a9-1c803c2724d3	20202020-9b0c-5d6e-7f8a-9b0c1d2e3f4a	7b93a0b2-03a9-457e-88ef-1cc653c60660	RELATION	timelineActivities	Timeline Activities	\N	Timeline activities linked to the dashboard	\N	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	64f26d1c-312d-40aa-b40a-c02a16658aab	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
8c20704f-17e1-4898-975f-e0bcffed322a	20202020-f032-478f-88fa-6426ff6f1e4c	7b93a0b2-03a9-457e-88ef-1cc653c60660	RELATION	favorites	Favorites	\N	Favorites linked to the dashboard	\N	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	c5cb856a-e0b0-4e33-9f7d-6ed6d0825ce1	5aee0655-bf05-4ac3-afae-cb58be3235d6	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
7bc55b76-342a-4e3c-93b9-991628dd9981	20202020-bf6f-4220-8c55-2764f1175870	7b93a0b2-03a9-457e-88ef-1cc653c60660	RELATION	attachments	Attachments	\N	Attachments linked to the dashboard	\N	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	ed528675-738d-4df7-8907-ff43da4650f8	331329f4-7d5a-4a51-8188-8bd6383a68ef	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
c1b63bbf-9d75-4584-b93c-08965c42e608	20202020-ce63-49cb-9676-fdc0c45892cd	5aee0655-bf05-4ac3-afae-cb58be3235d6	RELATION	forWorkspaceMember	Workspace Member	\N	Favorite workspace member	IconCircleUser	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "forWorkspaceMemberId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	d88cbb80-90f4-4916-9c67-1b915fc6b8d5	c61c10a5-fad2-4072-9902-9cec39dbe21b	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
47786124-9ed5-4e62-9e6d-b3c3de712bb6	20202020-c428-4f40-b6f3-86091511c41c	5aee0655-bf05-4ac3-afae-cb58be3235d6	RELATION	person	Person	\N	Favorite person	IconUser	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "personId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	65e46602-5863-4e7b-ae61-de69b092c721	df5c5db0-be63-4f64-ae64-f3b354f80cb9	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
719b3085-efdb-4350-8ff1-2c4cf6e1180a	20202020-cff5-4682-8bf9-069169e08279	5aee0655-bf05-4ac3-afae-cb58be3235d6	RELATION	company	Company	\N	Favorite company	IconBuildingSkyscraper	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "companyId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	ca2b6743-13ec-4b4b-ad4b-e1e034e4d372	adf06099-b76b-47c1-9519-bb10956030eb	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
27801ca7-af17-407a-883c-97e96f1c0409	20202020-f658-4d12-8b4d-248356aa4bd9	5aee0655-bf05-4ac3-afae-cb58be3235d6	RELATION	favoriteFolder	Favorite Folder	\N	The folder this favorite belongs to	IconFolder	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "favoriteFolderId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	fa488608-0f20-4a59-81c3-239a39061617	4076f800-4700-4ab2-ae93-d4e916bae87a	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
b01d6621-c577-4570-ba15-f50ec9391a67	20202020-dabc-48e1-8318-2781a2b32aa2	5aee0655-bf05-4ac3-afae-cb58be3235d6	RELATION	opportunity	Opportunity	\N	Favorite opportunity	IconTargetArrow	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "opportunityId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	8cb61d0b-9e5c-4b35-b927-4a7262bb7742	77082a20-4eaa-4b81-b4e8-564c03c1ad16	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
63525418-906b-4ee1-8def-bc6da1ac4a1e	20202020-b11b-4dc8-999a-6bd0a947b463	5aee0655-bf05-4ac3-afae-cb58be3235d6	RELATION	workflow	Workflow	\N	Favorite workflow	IconSettingsAutomation	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "workflowId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	6fc15767-f62a-4fab-86d5-b7d4c16cbb9c	e89d085a-8ec2-4b37-9560-3f1f708b57a6	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
aed38c0d-bcd6-45dc-97ba-8e4f1fdc8d77	20202020-e1b8-4caf-b55a-3ab4d4cbcd21	5aee0655-bf05-4ac3-afae-cb58be3235d6	RELATION	workflowVersion	Workflow	\N	Favorite workflow version	IconSettingsAutomation	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "workflowVersionId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	a1a82825-afb9-4491-9bf8-4a9f68751584	89bcd47d-b0a0-41ba-ba13-500cb520b5a9	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
e9b8f434-cee2-4714-8ece-1bcb44829221	20202020-db5a-4fe4-9a13-9afa22b1e762	5aee0655-bf05-4ac3-afae-cb58be3235d6	RELATION	workflowRun	Workflow	\N	Favorite workflow run	IconSettingsAutomation	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "workflowRunId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	330c0c2a-a4f2-4ec0-915b-5d8532e6ca2f	37ea5922-a5c5-4fba-8148-5a5580c7ec37	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
90b0406c-a46f-46a0-8401-c2879ca3b2ff	20202020-1b1b-4b3b-8b1b-7f8d6a1d7d5c	5aee0655-bf05-4ac3-afae-cb58be3235d6	RELATION	task	Task	\N	Favorite task	IconCheckbox	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "taskId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	50051429-7553-4d91-bf74-7225fcf75a73	4d66f605-f9ca-43fc-9d35-db72ee5f04bc	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
54ee46f2-35db-402f-aa2b-8eacb66d8223	20202020-1f25-43fe-8b00-af212fdde824	5aee0655-bf05-4ac3-afae-cb58be3235d6	RELATION	note	Note	\N	Favorite note	IconNotes	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "noteId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	2890fb19-3e01-4656-bb5b-fd7796bf9cee	7f0daf26-7887-47d7-b6d6-8d792b812e94	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
c5cb856a-e0b0-4e33-9f7d-6ed6d0825ce1	20202020-6ef9-45e4-b440-cc986f687c91	5aee0655-bf05-4ac3-afae-cb58be3235d6	RELATION	dashboard	Dashboard	\N	Favorite dashboard	IconLayoutDashboard	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "dashboardId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	8c20704f-17e1-4898-975f-e0bcffed322a	7b93a0b2-03a9-457e-88ef-1cc653c60660	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
fa488608-0f20-4a59-81c3-239a39061617	20202020-b5e3-4b42-8af2-03cd4fd2e4d2	4076f800-4700-4ab2-ae93-d4e916bae87a	RELATION	favorites	Favorites	\N	Favorites in this folder	IconHeart	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	27801ca7-af17-407a-883c-97e96f1c0409	5aee0655-bf05-4ac3-afae-cb58be3235d6	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
64f26d1c-312d-40aa-b40a-c02a16658aab	20202020-7864-48f5-af7c-9e4b60140948	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	MORPH_RELATION	targetDashboard	Dashboard	\N	Event dashboard	IconTargetArrow	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "targetDashboardId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	83d55c85-ffce-419f-98a9-1c803c2724d3	7b93a0b2-03a9-457e-88ef-1cc653c60660	20202020-9a2b-4c3d-a4e5-f6a7b8c9d0e1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
3f387080-ee3a-4192-b190-de3f63be1b23	20202020-af23-4479-9a30-868edc474b36	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	RELATION	workspaceMember	Workspace Member	\N	Event workspace member	IconCircleUser	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "workspaceMemberId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	dce2bc62-0107-4c2d-aaf3-63344668d3a9	c61c10a5-fad2-4072-9902-9cec39dbe21b	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
20691490-25cc-4c5a-94ad-a01038763d2e	20202020-c414-45b9-a60a-ac27aa96229f	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	MORPH_RELATION	targetPerson	Person	\N	Event person	IconUser	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "targetPersonId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	7f58a315-c219-4214-860d-231f4ffcb4ac	df5c5db0-be63-4f64-ae64-f3b354f80cb9	20202020-9a2b-4c3d-a4e5-f6a7b8c9d0e1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
3b7b6533-ef4a-4a0b-ad46-ebb40722f627	20202020-04ad-4221-a744-7a8278a5ce21	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	MORPH_RELATION	targetCompany	Company	\N	Event company	IconBuildingSkyscraper	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "targetCompanyId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	e7c5dac8-96bd-4bbf-a8b5-b37bf6640df9	adf06099-b76b-47c1-9519-bb10956030eb	20202020-9a2b-4c3d-a4e5-f6a7b8c9d0e1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
4536a359-5e7a-4d81-a5c7-5a8ada64cccd	20202020-7664-4a35-a3df-580d389fd527	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	MORPH_RELATION	targetOpportunity	Opportunity	\N	Event opportunity	IconTargetArrow	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "targetOpportunityId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	3c235269-6f33-49ee-a90c-1d866524d37a	77082a20-4eaa-4b81-b4e8-564c03c1ad16	20202020-9a2b-4c3d-a4e5-f6a7b8c9d0e1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
28891ec0-2540-4446-8d8e-3d03de15a224	20202020-ec55-4135-8da5-3a20badc0156	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	MORPH_RELATION	targetNote	Note	\N	Event note	IconTargetArrow	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "targetNoteId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	b5a0e5a4-64b9-47b3-ba4a-872db31a2599	7f0daf26-7887-47d7-b6d6-8d792b812e94	20202020-9a2b-4c3d-a4e5-f6a7b8c9d0e1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
6e4c2136-7d81-4ac8-86ff-f0d996c06f31	20202020-b2f5-415c-9135-a31dfe49501b	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	MORPH_RELATION	targetTask	Task	\N	Event task	IconTargetArrow	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "targetTaskId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	3b7e19de-2ff1-4b60-9962-6bc2bb8f609f	4d66f605-f9ca-43fc-9d35-db72ee5f04bc	20202020-9a2b-4c3d-a4e5-f6a7b8c9d0e1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
1397074b-c0e3-45b0-8f8c-090d962c5156	20202020-616c-4ad3-a2e9-c477c341e295	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	MORPH_RELATION	targetWorkflow	Workflow	\N	Event workflow	IconTargetArrow	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "targetWorkflowId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	dbb97ae7-52d5-40ce-a6f7-ae42aaa33571	e89d085a-8ec2-4b37-9560-3f1f708b57a6	20202020-9a2b-4c3d-a4e5-f6a7b8c9d0e1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
5fa2ac7a-9ada-4582-b247-c78e55652fb4	20202020-74f1-4711-a129-e14ca0ecd744	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	MORPH_RELATION	targetWorkflowVersion	WorkflowVersion	\N	Event workflow version	IconTargetArrow	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "targetWorkflowVersionId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	136df0d9-d377-4998-afdc-d432946f270c	89bcd47d-b0a0-41ba-ba13-500cb520b5a9	20202020-9a2b-4c3d-a4e5-f6a7b8c9d0e1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
aeca9355-bfa6-4fea-a8e4-dd872fbe36fb	20202020-96f0-401b-9186-a3a0759225ac	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	MORPH_RELATION	targetWorkflowRun	Workflow Run	\N	Event workflow run	IconTargetArrow	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "targetWorkflowRunId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	3ed65c30-a61a-4fc0-b0fa-1b2edb0ddc9d	37ea5922-a5c5-4fba-8148-5a5580c7ec37	20202020-9a2b-4c3d-a4e5-f6a7b8c9d0e1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
0104ee5c-2860-4ed5-8c8d-9dd58270a29f	20202020-9432-416e-8f3c-27ee3153d099	e89d085a-8ec2-4b37-9560-3f1f708b57a6	RELATION	versions	Versions	\N	Workflow versions linked to the workflow.	IconVersions	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	c9e30ede-8a80-4887-a8a2-278030d7b001	89bcd47d-b0a0-41ba-ba13-500cb520b5a9	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
6c697986-9d14-4102-ac34-42d58a2a21c7	20202020-759b-4340-b58b-e73595c4df4f	e89d085a-8ec2-4b37-9560-3f1f708b57a6	RELATION	runs	Runs	\N	Workflow runs linked to the workflow.	IconRun	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	787dd727-3b88-4dc1-a1bf-9b8ec7e0f6ea	37ea5922-a5c5-4fba-8148-5a5580c7ec37	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
932b1df1-611c-45f0-8217-4bd9a0eec5b9	20202020-3319-4234-a34c-117ecad2b8a9	e89d085a-8ec2-4b37-9560-3f1f708b57a6	RELATION	automatedTriggers	Automated Triggers	\N	Workflow automated triggers linked to the workflow.	\N	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	e26be40a-814b-469b-bca6-ef2d63de5381	bebad403-65fc-49cc-8638-d290d969baec	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
6fc15767-f62a-4fab-86d5-b7d4c16cbb9c	20202020-c554-4c41-be7a-cf9cd4b0d512	e89d085a-8ec2-4b37-9560-3f1f708b57a6	RELATION	favorites	Favorites	\N	Favorites linked to the workflow	IconHeart	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	63525418-906b-4ee1-8def-bc6da1ac4a1e	5aee0655-bf05-4ac3-afae-cb58be3235d6	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
dbb97ae7-52d5-40ce-a6f7-ae42aaa33571	20202020-906e-486a-a798-131a5f081faf	e89d085a-8ec2-4b37-9560-3f1f708b57a6	RELATION	timelineActivities	Timeline Activities	\N	Timeline activities linked to the workflow	\N	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	1397074b-c0e3-45b0-8f8c-090d962c5156	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
87cfd7b6-7175-43aa-96f0-b116f4900502	20202020-4a8c-4e2d-9b1c-7e5f3a2b4c6d	e89d085a-8ec2-4b37-9560-3f1f708b57a6	RELATION	attachments	Attachments	\N	Attachments linked to the workflow	IconFileUpload	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	d16c3f55-c56a-434f-9b51-82e5416bf7f3	331329f4-7d5a-4a51-8188-8bd6383a68ef	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
c9e30ede-8a80-4887-a8a2-278030d7b001	20202020-afa3-46c3-91b0-0631ca6aa1c8	89bcd47d-b0a0-41ba-ba13-500cb520b5a9	RELATION	workflow	Workflow	\N	WorkflowVersion workflow	IconSettingsAutomation	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "workflowId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	0104ee5c-2860-4ed5-8c8d-9dd58270a29f	e89d085a-8ec2-4b37-9560-3f1f708b57a6	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
808d5dfc-6ff3-417f-bd0d-9cb9c0975d54	20202020-1d08-46df-901a-85045f18099a	89bcd47d-b0a0-41ba-ba13-500cb520b5a9	RELATION	runs	Runs	\N	Workflow runs linked to the version.	IconRun	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	6c5aaa63-7f20-4a7e-ad4f-21eebb59877f	37ea5922-a5c5-4fba-8148-5a5580c7ec37	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
a1a82825-afb9-4491-9bf8-4a9f68751584	20202020-b8e0-4e57-928d-b51671cc71f2	89bcd47d-b0a0-41ba-ba13-500cb520b5a9	RELATION	favorites	Favorites	\N	Favorites linked to the workflow version	IconHeart	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	aed38c0d-bcd6-45dc-97ba-8e4f1fdc8d77	5aee0655-bf05-4ac3-afae-cb58be3235d6	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
136df0d9-d377-4998-afdc-d432946f270c	20202020-fcb0-4695-b17e-3b43a421c633	89bcd47d-b0a0-41ba-ba13-500cb520b5a9	RELATION	timelineActivities	Timeline Activities	\N	Timeline activities linked to the version	\N	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	5fa2ac7a-9ada-4582-b247-c78e55652fb4	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
6c5aaa63-7f20-4a7e-ad4f-21eebb59877f	20202020-2f52-4ba8-8dc4-d0d6adb9578d	37ea5922-a5c5-4fba-8148-5a5580c7ec37	RELATION	workflowVersion	Workflow version	\N	Workflow version linked to the run.	IconVersions	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "workflowVersionId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	808d5dfc-6ff3-417f-bd0d-9cb9c0975d54	89bcd47d-b0a0-41ba-ba13-500cb520b5a9	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
787dd727-3b88-4dc1-a1bf-9b8ec7e0f6ea	20202020-8c57-4e7f-84f5-f373f68e1b82	37ea5922-a5c5-4fba-8148-5a5580c7ec37	RELATION	workflow	Workflow	\N	Workflow linked to the run.	IconSettingsAutomation	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "workflowId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	6c697986-9d14-4102-ac34-42d58a2a21c7	e89d085a-8ec2-4b37-9560-3f1f708b57a6	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
330c0c2a-a4f2-4ec0-915b-5d8532e6ca2f	20202020-4baf-4604-b899-2f7fcfbbf90d	37ea5922-a5c5-4fba-8148-5a5580c7ec37	RELATION	favorites	Favorites	\N	Favorites linked to the workflow run	IconHeart	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	e9b8f434-cee2-4714-8ece-1bcb44829221	5aee0655-bf05-4ac3-afae-cb58be3235d6	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
3ed65c30-a61a-4fc0-b0fa-1b2edb0ddc9d	20202020-af4d-4eb0-babc-eb960a45b356	37ea5922-a5c5-4fba-8148-5a5580c7ec37	RELATION	timelineActivities	Timeline Activities	\N	Timeline activities linked to the run	\N	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	aeca9355-bfa6-4fea-a8e4-dd872fbe36fb	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
e26be40a-814b-469b-bca6-ef2d63de5381	20202020-3319-4234-a34c-8e1a4d2f7c03	bebad403-65fc-49cc-8638-d290d969baec	RELATION	workflow	Workflow	\N	WorkflowAutomatedTrigger workflow	IconSettingsAutomation	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "workflowId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	932b1df1-611c-45f0-8217-4bd9a0eec5b9	e89d085a-8ec2-4b37-9560-3f1f708b57a6	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
f982aa27-bbcd-48ef-aa3d-13c068142f5c	20202020-61dc-4a1c-99e8-38ebf8d2bbeb	c61c10a5-fad2-4072-9902-9cec39dbe21b	RELATION	assignedTasks	Assigned tasks	\N	Tasks assigned to the workspace member	IconCheckbox	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	f8154574-5989-4cbb-9e59-61f04faaf89a	4d66f605-f9ca-43fc-9d35-db72ee5f04bc	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
d88cbb80-90f4-4916-9c67-1b915fc6b8d5	20202020-f3c1-4faf-b343-cf7681038757	c61c10a5-fad2-4072-9902-9cec39dbe21b	RELATION	favorites	Favorites	\N	Favorites linked to the workspace member	IconHeart	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	c1b63bbf-9d75-4584-b93c-08965c42e608	5aee0655-bf05-4ac3-afae-cb58be3235d6	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
b01ef6f1-3d05-47d6-9d98-53ce431d0e04	20202020-dc29-4bd4-a3c1-29eafa324bee	c61c10a5-fad2-4072-9902-9cec39dbe21b	RELATION	accountOwnerForCompanies	Account Owner For Companies	\N	Account owner for companies	IconBriefcase	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	a1af0d87-a071-4080-a260-3fec85c6359a	adf06099-b76b-47c1-9519-bb10956030eb	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
215cea07-20be-45c6-89e9-c1ab52cdc44f	20202020-000f-4947-917f-1b09851024fe	c61c10a5-fad2-4072-9902-9cec39dbe21b	RELATION	authoredAttachments	Authored attachments	\N	Attachments created by the workspace member	IconFileImport	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	68efd5f9-6f0f-479d-9f9c-0e7137c2f047	331329f4-7d5a-4a51-8188-8bd6383a68ef	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
48c1f65b-a517-4a48-8a6a-69e24e54c4de	20202020-e322-4bde-a525-727079b4a100	c61c10a5-fad2-4072-9902-9cec39dbe21b	RELATION	connectedAccounts	Connected accounts	\N	Connected accounts	IconAt	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	279c41fe-7165-439f-a417-8ad167c5833c	f76201bb-e234-4a3f-af09-ee3fd2445e79	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
7e1f0247-cb30-4f6c-8c16-2e64f42be88a	20202020-8f99-48bc-a5eb-edd33dd54188	c61c10a5-fad2-4072-9902-9cec39dbe21b	RELATION	messageParticipants	Message Participants	\N	Message Participants	IconUserCircle	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	c510162b-b456-4ac0-88b2-96a54405fac5	a89fa0b4-2d20-4ff1-9706-ab5b63b6fb24	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
e442e194-6085-44cc-a699-096ebe622318	20202020-6cb2-4161-9f29-a4b7f1283859	c61c10a5-fad2-4072-9902-9cec39dbe21b	RELATION	blocklist	Blocklist	\N	Blocklisted handles	IconForbid2	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	e22f6c8c-1357-4ca4-bbc4-166ffbb03505	b224c093-0fe7-4c60-95bd-5da11d207937	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
5f366bc3-271b-4f76-8509-7e615d61980b	20202020-0dbc-4841-9ce1-3e793b5b3512	c61c10a5-fad2-4072-9902-9cec39dbe21b	RELATION	calendarEventParticipants	Calendar Event Participants	\N	Calendar Event Participants	IconCalendar	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	2965e798-6186-43ce-9bdb-448cca8a5611	9e60fa19-8c45-43e3-a07a-a47497dd6539	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
dce2bc62-0107-4c2d-aaf3-63344668d3a9	20202020-e15b-47b8-94fe-8200e3c66615	c61c10a5-fad2-4072-9902-9cec39dbe21b	RELATION	timelineActivities	Events	\N	Events linked to the workspace member	IconTimelineEvent	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	3f387080-ee3a-4192-b190-de3f63be1b23	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
27df5dd5-54df-43c0-868c-aba48b7b92fc	20202020-3115-404f-aade-e1154b28e35a	d477715c-e571-4c79-9c3d-27cf2a3f4683	RELATION	messages	Messages	\N	Messages from the thread.	IconMessage	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	811dcd39-1513-4b0c-abc2-f39b8eb8a937	6e84550e-a74e-4e82-8700-4a5ed617ba6b	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
811dcd39-1513-4b0c-abc2-f39b8eb8a937	20202020-30f2-4ccd-9f5c-e41bb9d26214	6e84550e-a74e-4e82-8700-4a5ed617ba6b	RELATION	messageThread	Message Thread Id	\N	Message Thread Id	IconHash	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "messageThreadId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	27df5dd5-54df-43c0-868c-aba48b7b92fc	d477715c-e571-4c79-9c3d-27cf2a3f4683	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
0733327b-6c3b-4f39-9387-c3df5d2f12fa	20202020-7cff-4a74-b63c-73228448cbd9	6e84550e-a74e-4e82-8700-4a5ed617ba6b	RELATION	messageParticipants	Message Participants	\N	Message Participants	IconUserCircle	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	7810d72b-30c1-46de-8de9-1206b0d6793a	a89fa0b4-2d20-4ff1-9706-ab5b63b6fb24	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
c947413f-52a7-4eec-933a-62f4f4920174	20202020-3cef-43a3-82c6-50e7cfbc9ae4	6e84550e-a74e-4e82-8700-4a5ed617ba6b	RELATION	messageChannelMessageAssociations	Message Channel Association	\N	Messages from the channel.	IconMessage	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	bbaacf10-a4ec-4c00-abe6-1af703e4936a	bbcf3ea3-f4cc-4811-bc1b-5eb5fd3d0e56	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
34de0749-7f0a-4089-b684-95290e7210ab	20202020-49a2-44a4-b470-282c0440d15d	840afb4a-10c1-4f5d-b62c-17b5a656afbf	RELATION	connectedAccount	Connected Account	\N	Connected Account	IconUserCircle	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "connectedAccountId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	069c2cd0-c1df-4490-a93d-2e0ea6b29ce5	f76201bb-e234-4a3f-af09-ee3fd2445e79	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
38133d42-9416-4da7-8c04-89ed899c5610	20202020-49b8-4766-88fd-75f1e21b3d5f	840afb4a-10c1-4f5d-b62c-17b5a656afbf	RELATION	messageChannelMessageAssociations	Message Channel Association	\N	Messages from the channel.	IconMessage	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	a681f870-f814-4b9d-a9ea-7e9642955d34	bbcf3ea3-f4cc-4811-bc1b-5eb5fd3d0e56	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
f0e7ed70-77c5-4f20-a168-4ea835d978cb	20202020-cc39-4432-9fe8-ec8ab8bbed94	840afb4a-10c1-4f5d-b62c-17b5a656afbf	RELATION	messageFolders	Message Folders	\N	Message Folders	IconFolder	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	07a34d61-084c-417a-8f6d-7382ee999010	a949876e-c029-4733-85ca-028ecde6d0c2	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
7810d72b-30c1-46de-8de9-1206b0d6793a	20202020-985b-429a-9db9-9e55f4898a2a	a89fa0b4-2d20-4ff1-9706-ab5b63b6fb24	RELATION	message	Message	\N	Message	IconMessage	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "messageId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	0733327b-6c3b-4f39-9387-c3df5d2f12fa	6e84550e-a74e-4e82-8700-4a5ed617ba6b	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
22366e30-6f3b-4e26-bbf7-469261c11375	20202020-249d-4e0f-82cd-1b9df5cd3da2	a89fa0b4-2d20-4ff1-9706-ab5b63b6fb24	RELATION	person	Person	\N	Person	IconUser	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "personId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	7f89476d-e1fa-4421-956c-1d6a95fd5ddb	df5c5db0-be63-4f64-ae64-f3b354f80cb9	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
c510162b-b456-4ac0-88b2-96a54405fac5	20202020-77a7-4845-99ed-1bcbb478be6f	a89fa0b4-2d20-4ff1-9706-ab5b63b6fb24	RELATION	workspaceMember	Workspace Member	\N	Workspace member	IconCircleUser	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "workspaceMemberId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	7e1f0247-cb30-4f6c-8c16-2e64f42be88a	c61c10a5-fad2-4072-9902-9cec39dbe21b	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
07a34d61-084c-417a-8f6d-7382ee999010	20202020-b658-408f-bd46-3bd2d15d7e52	a949876e-c029-4733-85ca-028ecde6d0c2	RELATION	messageChannel	Message Channel	\N	Message Channel	IconMessage	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "messageChannelId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	f0e7ed70-77c5-4f20-a168-4ea835d978cb	840afb4a-10c1-4f5d-b62c-17b5a656afbf	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
a681f870-f814-4b9d-a9ea-7e9642955d34	20202020-b658-408f-bd46-3bd2d15d7e52	bbcf3ea3-f4cc-4811-bc1b-5eb5fd3d0e56	RELATION	messageChannel	Message Channel Id	\N	Message Channel Id	IconHash	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "messageChannelId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	38133d42-9416-4da7-8c04-89ed899c5610	840afb4a-10c1-4f5d-b62c-17b5a656afbf	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
bbaacf10-a4ec-4c00-abe6-1af703e4936a	20202020-da5d-4ac5-8743-342ab0a0336b	bbcf3ea3-f4cc-4811-bc1b-5eb5fd3d0e56	RELATION	message	Message Id	\N	Message Id	IconHash	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "messageId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	c947413f-52a7-4eec-933a-62f4f4920174	6e84550e-a74e-4e82-8700-4a5ed617ba6b	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
1133e798-06b7-44ec-a956-ad8fae111097	20202020-1f25-43fe-8b00-af212fdde823	7f0daf26-7887-47d7-b6d6-8d792b812e94	RELATION	noteTargets	Relations	\N	Note targets	IconArrowUpRight	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	245940ff-2336-42ca-87f5-a03d220d8a90	9e6962d4-b31b-4f54-a20f-e4f118de550f	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
bf04f8d5-20d6-4e91-83d6-8111680dde76	20202020-4986-4c92-bf19-39934b149b16	7f0daf26-7887-47d7-b6d6-8d792b812e94	RELATION	attachments	Attachments	\N	Note attachments	IconFileImport	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	470e5e00-e4d2-497d-94b1-ecd9e4dc02c5	331329f4-7d5a-4a51-8188-8bd6383a68ef	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
b5a0e5a4-64b9-47b3-ba4a-872db31a2599	20202020-7030-42f8-929c-1a57b25d6bce	7f0daf26-7887-47d7-b6d6-8d792b812e94	RELATION	timelineActivities	Timeline Activities	\N	Timeline Activities linked to the note.	IconTimelineEvent	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	28891ec0-2540-4446-8d8e-3d03de15a224	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
2890fb19-3e01-4656-bb5b-fd7796bf9cee	20202020-4d1d-41ac-b13b-621631298d67	7f0daf26-7887-47d7-b6d6-8d792b812e94	RELATION	favorites	Favorites	\N	Favorites linked to the note	IconHeart	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	54ee46f2-35db-402f-aa2b-8eacb66d8223	5aee0655-bf05-4ac3-afae-cb58be3235d6	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
245940ff-2336-42ca-87f5-a03d220d8a90	20202020-57f3-4f50-9599-fc0f671df003	9e6962d4-b31b-4f54-a20f-e4f118de550f	RELATION	note	Note	\N	NoteTarget note	IconNotes	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "noteId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	1133e798-06b7-44ec-a956-ad8fae111097	7f0daf26-7887-47d7-b6d6-8d792b812e94	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
8123805a-2034-45b2-8cc1-b6cd1d729577	20202020-38ca-4aab-92f5-8a605ca2e4c5	9e6962d4-b31b-4f54-a20f-e4f118de550f	RELATION	person	Person	\N	NoteTarget person	IconUser	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "personId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	6a8267cc-96fc-4ba5-b13b-dbb1230066c4	df5c5db0-be63-4f64-ae64-f3b354f80cb9	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
257e1039-af4d-4be1-ba4c-a692c38050d4	c500fbc0-d6f2-4982-a959-5a755431696c	9e6962d4-b31b-4f54-a20f-e4f118de550f	RELATION	company	Company	\N	NoteTarget company	IconBuildingSkyscraper	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "companyId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	bf7a09dd-6f4d-4679-b6af-e366faebd10b	adf06099-b76b-47c1-9519-bb10956030eb	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
51329be2-343c-44e4-974e-de6cf433ada0	20202020-4e42-417a-a705-76581c9ade79	9e6962d4-b31b-4f54-a20f-e4f118de550f	RELATION	opportunity	Opportunity	\N	NoteTarget opportunity	IconTargetArrow	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "opportunityId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	df80a14c-6828-4293-b58b-081924ac89da	77082a20-4eaa-4b81-b4e8-564c03c1ad16	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
f9d85e77-e4a6-40ff-b0c4-63a0fae9e339	20202020-8dfb-42fc-92b6-01afb759ed16	77082a20-4eaa-4b81-b4e8-564c03c1ad16	RELATION	pointOfContact	Point of Contact	\N	Opportunity point of contact	IconUser	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "pointOfContactId"}	f	t	f	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	14c347e2-60d6-4ac0-b226-6ab66a841fd4	df5c5db0-be63-4f64-ae64-f3b354f80cb9	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
0a731520-02df-4414-b033-987b2de7121d	20202020-cbac-457e-b565-adece5fc815f	77082a20-4eaa-4b81-b4e8-564c03c1ad16	RELATION	company	Company	\N	Opportunity company	IconBuildingSkyscraper	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "companyId"}	f	t	f	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	640d5ce5-49b6-424f-984a-bdcf51758f91	adf06099-b76b-47c1-9519-bb10956030eb	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
8cb61d0b-9e5c-4b35-b927-4a7262bb7742	20202020-a1c2-4500-aaae-83ba8a0e827a	77082a20-4eaa-4b81-b4e8-564c03c1ad16	RELATION	favorites	Favorites	\N	Favorites linked to the opportunity	IconHeart	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	b01d6621-c577-4570-ba15-f50ec9391a67	5aee0655-bf05-4ac3-afae-cb58be3235d6	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
4379a13e-992a-4a99-87ba-e2a7c5c1e7c2	20202020-59c0-4179-a208-4a255f04a5be	77082a20-4eaa-4b81-b4e8-564c03c1ad16	RELATION	taskTargets	Tasks	\N	Tasks tied to the opportunity	IconCheckbox	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	ccf6bf9d-1602-4c6a-86cd-43d97f67e9b6	d3d793c8-5ed6-4bd0-85cf-ace8f0c132f3	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
df80a14c-6828-4293-b58b-081924ac89da	20202020-dd3f-42d5-a382-db58aabf43d3	77082a20-4eaa-4b81-b4e8-564c03c1ad16	RELATION	noteTargets	Notes	\N	Notes tied to the opportunity	IconNotes	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	51329be2-343c-44e4-974e-de6cf433ada0	9e6962d4-b31b-4f54-a20f-e4f118de550f	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
d77d31a7-630d-4d9a-81c1-c8da3540d0d7	20202020-87c7-4118-83d6-2f4031005209	77082a20-4eaa-4b81-b4e8-564c03c1ad16	RELATION	attachments	Attachments	\N	Attachments linked to the opportunity	IconFileImport	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	b02d8a05-8af7-4ed5-9f5c-67d35f93acb9	331329f4-7d5a-4a51-8188-8bd6383a68ef	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
3c235269-6f33-49ee-a90c-1d866524d37a	20202020-30e2-421f-96c7-19c69d1cf631	77082a20-4eaa-4b81-b4e8-564c03c1ad16	RELATION	timelineActivities	Timeline Activities	\N	Timeline Activities linked to the opportunity.	IconTimelineEvent	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	4536a359-5e7a-4d81-a5c7-5a8ada64cccd	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
570d723b-1232-4c20-b317-1f77f319dd9f	20202020-e2f3-448e-b34c-2d625f0025fd	df5c5db0-be63-4f64-ae64-f3b354f80cb9	RELATION	company	Company	\N	Contact’s company	IconBuildingSkyscraper	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "companyId"}	f	t	f	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	508380b8-cc5f-4157-87c3-2959bab40760	adf06099-b76b-47c1-9519-bb10956030eb	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
14c347e2-60d6-4ac0-b226-6ab66a841fd4	20202020-911b-4a7d-b67b-918aa9a5b33a	df5c5db0-be63-4f64-ae64-f3b354f80cb9	RELATION	pointOfContactForOpportunities	Opportunities	\N	List of opportunities for which that person is the point of contact	IconTargetArrow	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	f9d85e77-e4a6-40ff-b0c4-63a0fae9e339	77082a20-4eaa-4b81-b4e8-564c03c1ad16	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
3d35f443-9be7-42d6-80a4-e83dbe102fe4	20202020-584b-4d3e-88b6-53ab1fa03c3a	df5c5db0-be63-4f64-ae64-f3b354f80cb9	RELATION	taskTargets	Tasks	\N	Tasks tied to the contact	IconCheckbox	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	a0d554e2-f703-4730-bd9e-92bbf71816a3	d3d793c8-5ed6-4bd0-85cf-ace8f0c132f3	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
6a8267cc-96fc-4ba5-b13b-dbb1230066c4	20202020-c8fc-4258-8250-15905d3fcfec	df5c5db0-be63-4f64-ae64-f3b354f80cb9	RELATION	noteTargets	Notes	\N	Notes tied to the contact	IconNotes	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	f	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	8123805a-2034-45b2-8cc1-b6cd1d729577	9e6962d4-b31b-4f54-a20f-e4f118de550f	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
65e46602-5863-4e7b-ae61-de69b092c721	20202020-4073-4117-9cf1-203bcdc91cbd	df5c5db0-be63-4f64-ae64-f3b354f80cb9	RELATION	favorites	Favorites	\N	Favorites linked to the contact	IconHeart	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	47786124-9ed5-4e62-9e6d-b3c3de712bb6	5aee0655-bf05-4ac3-afae-cb58be3235d6	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
f6868fad-44c9-4287-a1b9-743b213db592	20202020-cd97-451f-87fa-bcb789bdbf3a	df5c5db0-be63-4f64-ae64-f3b354f80cb9	RELATION	attachments	Attachments	\N	Attachments linked to the contact.	IconFileImport	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	750ed649-7b6e-45aa-b761-3cb0c8023977	331329f4-7d5a-4a51-8188-8bd6383a68ef	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
7f89476d-e1fa-4421-956c-1d6a95fd5ddb	20202020-498e-4c61-8158-fa04f0638334	df5c5db0-be63-4f64-ae64-f3b354f80cb9	RELATION	messageParticipants	Message Participants	\N	Message Participants	IconUserCircle	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	22366e30-6f3b-4e26-bbf7-469261c11375	a89fa0b4-2d20-4ff1-9706-ab5b63b6fb24	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
dc0262d8-3f67-4ac1-8786-9f278c9ecabc	20202020-52ee-45e9-a702-b64b3753e3a9	df5c5db0-be63-4f64-ae64-f3b354f80cb9	RELATION	calendarEventParticipants	Calendar Event Participants	\N	Calendar Event Participants	IconCalendar	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	822fb2f5-3d18-4aa3-8a29-c41bd9011f4c	9e60fa19-8c45-43e3-a07a-a47497dd6539	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
7f58a315-c219-4214-860d-231f4ffcb4ac	20202020-a43e-4873-9c23-e522de906ce5	df5c5db0-be63-4f64-ae64-f3b354f80cb9	RELATION	timelineActivities	Events	\N	Events linked to the person	IconTimelineEvent	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	20691490-25cc-4c5a-94ad-a01038763d2e	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
a3319c39-a0b9-460b-b693-048c6dd0bdee	20202020-de9c-4d0e-a452-713d4a3e5fc7	4d66f605-f9ca-43fc-9d35-db72ee5f04bc	RELATION	taskTargets	Relations	\N	Task targets	IconArrowUpRight	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f	b4817dff-06a7-4e58-8cfb-5a5e631290ef	d3d793c8-5ed6-4bd0-85cf-ace8f0c132f3	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
7a75da49-505d-46b2-82dc-e62d3b3e2929	20202020-794d-4783-a8ff-cecdb15be139	4d66f605-f9ca-43fc-9d35-db72ee5f04bc	RELATION	attachments	Attachments	\N	Task attachments	IconFileImport	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	5218d113-a3a5-4ece-abab-145b29ef6025	331329f4-7d5a-4a51-8188-8bd6383a68ef	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
f8154574-5989-4cbb-9e59-61f04faaf89a	20202020-065a-4f42-a906-e20422c1753f	4d66f605-f9ca-43fc-9d35-db72ee5f04bc	RELATION	assignee	Assignee	\N	Task assignee	IconUserCircle	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "assigneeId"}	f	t	f	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	f982aa27-bbcd-48ef-aa3d-13c068142f5c	c61c10a5-fad2-4072-9902-9cec39dbe21b	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
3b7e19de-2ff1-4b60-9962-6bc2bb8f609f	20202020-c778-4278-99ee-23a2837aee64	4d66f605-f9ca-43fc-9d35-db72ee5f04bc	RELATION	timelineActivities	Timeline Activities	\N	Timeline Activities linked to the task.	IconTimelineEvent	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	6e4c2136-7d81-4ac8-86ff-f0d996c06f31	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
50051429-7553-4d91-bf74-7225fcf75a73	20202020-4d1d-41ac-b13b-621631298d65	4d66f605-f9ca-43fc-9d35-db72ee5f04bc	RELATION	favorites	Favorites	\N	Favorites linked to the task	IconHeart	\N	\N	{"relationType": "ONE_TO_MANY"}	f	t	t	f	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	90b0406c-a46f-46a0-8401-c2879ca3b2ff	5aee0655-bf05-4ac3-afae-cb58be3235d6	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
b4817dff-06a7-4e58-8cfb-5a5e631290ef	20202020-e881-457a-8758-74aaef4ae78a	d3d793c8-5ed6-4bd0-85cf-ace8f0c132f3	RELATION	task	Task	\N	TaskTarget task	IconCheckbox	\N	\N	{"onDelete": "SET_NULL", "relationType": "MANY_TO_ONE", "joinColumnName": "taskId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	a3319c39-a0b9-460b-b693-048c6dd0bdee	4d66f605-f9ca-43fc-9d35-db72ee5f04bc	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
a0d554e2-f703-4730-bd9e-92bbf71816a3	20202020-c8a0-4e85-a016-87e2349cfbec	d3d793c8-5ed6-4bd0-85cf-ace8f0c132f3	RELATION	person	Person	\N	TaskTarget person	IconUser	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "personId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	3d35f443-9be7-42d6-80a4-e83dbe102fe4	df5c5db0-be63-4f64-ae64-f3b354f80cb9	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
09509e8b-b808-45c5-8d4c-7c7cd181d26f	20202020-4703-4a4e-948c-487b0c60a92c	d3d793c8-5ed6-4bd0-85cf-ace8f0c132f3	RELATION	company	Company	\N	TaskTarget company	IconBuildingSkyscraper	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "companyId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	2711a359-ab41-4191-a838-5f14cb96b002	adf06099-b76b-47c1-9519-bb10956030eb	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
ccf6bf9d-1602-4c6a-86cd-43d97f67e9b6	20202020-6cb2-4c01-a9a5-aca3dbc11d41	d3d793c8-5ed6-4bd0-85cf-ace8f0c132f3	RELATION	opportunity	Opportunity	\N	TaskTarget opportunity	IconTargetArrow	\N	\N	{"onDelete": "CASCADE", "relationType": "MANY_TO_ONE", "joinColumnName": "opportunityId"}	f	t	t	t	t	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	t	4379a13e-992a-4a99-87ba-e2a7c5c1e7c2	77082a20-4eaa-4b81-b4e8-564c03c1ad16	\N	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
\.


--
-- Data for Name: fieldPermission; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."fieldPermission" (id, "roleId", "objectMetadataId", "fieldMetadataId", "canReadFieldValue", "canUpdateFieldValue", "workspaceId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: file; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core.file (id, name, "fullPath", size, type, "workspaceId", "createdAt") FROM stdin;
\.


--
-- Data for Name: indexFieldMetadata; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."indexFieldMetadata" (id, "indexMetadataId", "fieldMetadataId", "order", "createdAt", "updatedAt") FROM stdin;
afe8b413-ba3d-4599-a5e7-7e3aea389f4f	56006519-7ca9-4bfc-b50e-a6a804818f71	68efd5f9-6f0f-479d-9f9c-0e7137c2f047	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
46a384ea-352e-49a9-9d96-41639eaae488	56006519-7ca9-4bfc-b50e-a6a804818f71	f1a858bd-32a0-4bce-a6be-f995611f8dd8	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
ba361c27-bd45-4f68-9e3d-aab2be0720b2	4fd7ac67-589b-439b-9faa-cc36c5a27029	5218d113-a3a5-4ece-abab-145b29ef6025	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
ff489db2-5c96-4430-9466-920660740792	4fd7ac67-589b-439b-9faa-cc36c5a27029	f1a858bd-32a0-4bce-a6be-f995611f8dd8	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
ce23149f-9464-4d8a-8594-78130d3f0839	0c9e158f-f4c6-4fa8-b691-d38d21ea8424	470e5e00-e4d2-497d-94b1-ecd9e4dc02c5	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
58640ea9-2e4a-4164-bc99-93f1bb1d2ab2	0c9e158f-f4c6-4fa8-b691-d38d21ea8424	f1a858bd-32a0-4bce-a6be-f995611f8dd8	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
747d8b6f-af80-4253-ad22-e90eec5df387	065b2c07-bc0f-4c96-accc-87db68fc84a0	750ed649-7b6e-45aa-b761-3cb0c8023977	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
ef6f26da-bbdf-435b-acd3-48dd4fcf04f4	065b2c07-bc0f-4c96-accc-87db68fc84a0	f1a858bd-32a0-4bce-a6be-f995611f8dd8	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
d3ee7832-da97-4c7d-ba5e-a298b359ba9b	7c2ef431-fb5f-4707-8677-d247feafbe18	e948ed06-3166-486d-ace8-a5973f090fad	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
8f043503-9a0f-4e29-a906-c7450d2d4c7b	7c2ef431-fb5f-4707-8677-d247feafbe18	f1a858bd-32a0-4bce-a6be-f995611f8dd8	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
0dbf3910-f79c-4085-9000-085f2e1faf05	34cba3dc-5b13-43f1-9714-e807ed2708d7	b02d8a05-8af7-4ed5-9f5c-67d35f93acb9	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
af02704e-64e9-451d-b9ac-44b40cbbd79b	34cba3dc-5b13-43f1-9714-e807ed2708d7	f1a858bd-32a0-4bce-a6be-f995611f8dd8	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
fad43e09-ff4e-401e-9318-727a63ff2886	ab822cab-8240-4df5-bb79-66e434290398	ed528675-738d-4df7-8907-ff43da4650f8	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
9a829de9-f7e7-4cfc-a6ed-5e508ca19f64	ab822cab-8240-4df5-bb79-66e434290398	f1a858bd-32a0-4bce-a6be-f995611f8dd8	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
3fa90490-bde1-438e-8b45-591e86db6efc	71cd8d8f-a5d8-4972-a17a-967b8c7f0bf0	d16c3f55-c56a-434f-9b51-82e5416bf7f3	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
951bba97-d074-4bc7-bd65-1903cc032903	71cd8d8f-a5d8-4972-a17a-967b8c7f0bf0	f1a858bd-32a0-4bce-a6be-f995611f8dd8	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
951ee333-4d7a-4f65-89fe-d6c7e4dc3feb	dbc0b95d-b1be-4e42-a411-c0a5abca041b	e22f6c8c-1357-4ca4-bbc4-166ffbb03505	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
cd928698-1bd5-4598-b992-b54a59574836	dbc0b95d-b1be-4e42-a411-c0a5abca041b	c1c8f209-c505-4761-9d31-3ea61bfd3034	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
06de759d-3bee-4b5f-873c-637492281633	b591301e-5af6-4fe0-a2d2-df7f8075b515	dfa5b27b-fb8a-4e0c-bf8d-5b4e53865d76	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
d3ceda28-751b-4178-8eca-13ca55c87be6	b591301e-5af6-4fe0-a2d2-df7f8075b515	985b278e-8c0b-4a42-88a6-d60133f256f6	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
0a7bd15f-bbcc-42e6-99c0-646834a3718f	ead4ec2b-2628-43f3-bd97-7beda7caa279	6d05c7ef-daa8-40e3-9597-ccca652a4a16	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
00859ef7-44be-400f-be0d-71a7192a355c	ead4ec2b-2628-43f3-bd97-7beda7caa279	d860f072-2235-4acc-9212-ec8a25aa67a5	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
9dfbbe9f-3bf8-4dd7-851e-69147c4836d8	999ad474-0dcb-4cd0-aaa1-99e65bf2ea02	520dff71-5b4a-43f4-8aa9-4e196e7bfe46	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
ede326e5-567c-4f58-a61c-27d9f1174260	999ad474-0dcb-4cd0-aaa1-99e65bf2ea02	d860f072-2235-4acc-9212-ec8a25aa67a5	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
918fb979-cb6b-40fe-b09d-75231b47c4db	efd282ca-48be-4aa0-97f1-abab1f2b0a98	179884de-4f7d-4402-8033-adccc1dbbbec	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
1cf1028a-421a-4af3-87a8-c84dfcd52df3	efd282ca-48be-4aa0-97f1-abab1f2b0a98	94506efa-e0a3-4413-880a-f3f85843f5ae	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
5ac537af-2916-4ce0-a9ef-14e93d901031	be2db304-6a1d-40cf-a41f-74994136fbb5	822fb2f5-3d18-4aa3-8a29-c41bd9011f4c	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
b65cb8e5-c7c0-41ed-8800-0e4a93b8b6fb	be2db304-6a1d-40cf-a41f-74994136fbb5	94506efa-e0a3-4413-880a-f3f85843f5ae	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
4a706eab-9dca-485c-90c6-74ec78a6e86e	401c7abe-9fda-4900-85a1-77d60350737e	2965e798-6186-43ce-9bdb-448cca8a5611	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
cc92d436-dd0b-4ce3-8ac2-ba4d9fe0c6d1	401c7abe-9fda-4900-85a1-77d60350737e	94506efa-e0a3-4413-880a-f3f85843f5ae	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
25549ad7-6c6a-4f61-a193-a5106391ba95	8225b457-6d70-4ef9-9c1b-469dbf76e9b3	2d192d9d-d23b-42c3-80ea-4f6a9c5b6e60	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
a77e66ce-8bea-4cd7-9216-73ae9ce1c64f	b8a96035-35e7-4314-a081-52eb9dfabfa4	a1af0d87-a071-4080-a260-3fec85c6359a	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
1d7b87f9-121c-4af8-a07b-ee55aec06bef	b8a96035-35e7-4314-a081-52eb9dfabfa4	321d5427-3283-443b-b4c9-504bc2c30da7	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
8436d71b-85ba-48f3-bc1c-82da58fcbeea	35d6bfb8-83b5-4c27-97b3-2a16d15e4908	9f0eea22-086d-41f1-8744-b270b0263f62	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
07121b4d-9e55-4a1e-b205-dfab802ca459	8692d8cf-cd83-49f7-a31d-4c6335137602	279c41fe-7165-439f-a417-8ad167c5833c	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
f6e0013a-a67c-42c2-b689-6d1abf898b28	8692d8cf-cd83-49f7-a31d-4c6335137602	66ab34a6-3282-434f-ad80-11e41958f224	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
466d912c-6bf3-4280-9f29-8bfb0f41195f	ce26645e-4a49-459e-b7e4-dfcdab287b6f	782b757b-71ba-45c3-bfde-4e01d9f8924a	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
556f39ab-eb9b-4138-a2c6-152a26d2010a	0a8c789f-390b-42cf-84f8-0528daae95b1	c1b63bbf-9d75-4584-b93c-08965c42e608	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
1d79d176-e4c4-4d5b-84d2-4aa718b579b1	0a8c789f-390b-42cf-84f8-0528daae95b1	0205c993-3c6a-4001-8e13-6e6adcb0d592	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
fe6158f5-b73a-4e68-940b-c907e36ae348	1b25aecf-3963-4c79-aca2-6d621f564ceb	47786124-9ed5-4e62-9e6d-b3c3de712bb6	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
078dd8fa-0a69-413b-a33d-c8bc05b438c1	1b25aecf-3963-4c79-aca2-6d621f564ceb	0205c993-3c6a-4001-8e13-6e6adcb0d592	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
b37d8a55-7bb9-4539-83db-5dd32c86f7d2	cd35a220-5ceb-4c38-8fe1-05ab254d4238	719b3085-efdb-4350-8ff1-2c4cf6e1180a	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
4e44e287-b7e1-4084-9334-624d708c651f	cd35a220-5ceb-4c38-8fe1-05ab254d4238	0205c993-3c6a-4001-8e13-6e6adcb0d592	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
0ff04660-658d-4e7e-a379-343ca14d03ef	3e7391da-509b-4160-bf2d-e5e694b7d666	27801ca7-af17-407a-883c-97e96f1c0409	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
ade120d1-18e7-4806-9ef4-d6974dfa0d5e	3e7391da-509b-4160-bf2d-e5e694b7d666	0205c993-3c6a-4001-8e13-6e6adcb0d592	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
54035ece-21fb-4b94-8914-6a0995bff788	5a710518-78c0-41bf-b003-7877a22c7e3e	b01d6621-c577-4570-ba15-f50ec9391a67	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
c43a7a6b-100d-42a7-9efb-25820fe5a061	5a710518-78c0-41bf-b003-7877a22c7e3e	0205c993-3c6a-4001-8e13-6e6adcb0d592	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
116095cd-7784-4413-bb73-0c115dfa8dff	5c6ea19e-f474-4070-a03c-a75a04c9370c	63525418-906b-4ee1-8def-bc6da1ac4a1e	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
76d2fecb-582f-49f4-a04a-4d58d499c161	5c6ea19e-f474-4070-a03c-a75a04c9370c	0205c993-3c6a-4001-8e13-6e6adcb0d592	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
1a620e13-1512-4ee9-aed1-d6c5ec647d0f	da894b90-1bff-476f-8115-226cc49184b6	aed38c0d-bcd6-45dc-97ba-8e4f1fdc8d77	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
45a0849f-b1ff-4b4e-b4fd-43665caa097e	da894b90-1bff-476f-8115-226cc49184b6	0205c993-3c6a-4001-8e13-6e6adcb0d592	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
8da799c0-ad7e-4e7f-b5c1-e4f202b1b720	1252c927-c491-44f3-930f-d981afa995fc	e9b8f434-cee2-4714-8ece-1bcb44829221	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
61dd13c2-0a67-409c-8283-79d1d62ad08e	1252c927-c491-44f3-930f-d981afa995fc	0205c993-3c6a-4001-8e13-6e6adcb0d592	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
432adf46-6a9a-4133-9cae-afaaf3ddb248	5f6b405c-a919-4f21-861c-069df58788dd	90b0406c-a46f-46a0-8401-c2879ca3b2ff	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
c44b1f79-15b4-47f9-90cc-0fbaf509d414	5f6b405c-a919-4f21-861c-069df58788dd	0205c993-3c6a-4001-8e13-6e6adcb0d592	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
2148cd4f-5381-49ad-aff1-8d64b1c35a62	0a4279b3-684b-4cbd-bca0-c28594202642	54ee46f2-35db-402f-aa2b-8eacb66d8223	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
3a2611a2-bea5-4b5a-84d0-258bd7d2b246	0a4279b3-684b-4cbd-bca0-c28594202642	0205c993-3c6a-4001-8e13-6e6adcb0d592	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
b5522300-31e6-4203-aa4e-f80a65115a7c	30a860c0-68c1-449c-9c7c-51430cf47fe7	c5cb856a-e0b0-4e33-9f7d-6ed6d0825ce1	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
2f797e64-2607-4e87-9d22-59b03ec4ce62	30a860c0-68c1-449c-9c7c-51430cf47fe7	0205c993-3c6a-4001-8e13-6e6adcb0d592	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
9f918d09-178d-4937-bbc7-c6907ccab288	b27c5da3-2735-4c6d-8bfc-8ffe160d5737	3f387080-ee3a-4192-b190-de3f63be1b23	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
40eb005f-fe6f-4d64-b3a6-8676df415810	b27c5da3-2735-4c6d-8bfc-8ffe160d5737	f3d406c2-c04f-4a9d-be38-71c29f8dfa3a	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
ffc518ab-ac9d-4abe-9b9e-d355545236fb	96dc6ba8-bd1b-409f-9114-ca8c451ac778	20691490-25cc-4c5a-94ad-a01038763d2e	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
95c96233-06fc-44a7-b771-653212cc4a22	96dc6ba8-bd1b-409f-9114-ca8c451ac778	f3d406c2-c04f-4a9d-be38-71c29f8dfa3a	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
290dacf9-bf5e-410f-9f6e-d56fd46fc367	c1b53079-46b2-473f-8919-39d28710d3e9	3b7b6533-ef4a-4a0b-ad46-ebb40722f627	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
0489e5bb-284f-4aa5-9967-bdf65ddb0cd4	c1b53079-46b2-473f-8919-39d28710d3e9	f3d406c2-c04f-4a9d-be38-71c29f8dfa3a	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
047ec335-956d-4d72-bf3f-b2b4fab8f88d	3b9ae508-dd8e-49fc-bc22-10fa6711f1e8	4536a359-5e7a-4d81-a5c7-5a8ada64cccd	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
dd6174fc-dd68-4759-bd96-06b6324cecef	3b9ae508-dd8e-49fc-bc22-10fa6711f1e8	f3d406c2-c04f-4a9d-be38-71c29f8dfa3a	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
a20878dc-64e3-49ca-8c08-41942aed3e64	3a055ba7-9437-4a84-94ba-64449d9032fa	28891ec0-2540-4446-8d8e-3d03de15a224	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
d2d9395d-d244-4df5-86a7-1093e512a6eb	3a055ba7-9437-4a84-94ba-64449d9032fa	f3d406c2-c04f-4a9d-be38-71c29f8dfa3a	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
3877e3ba-f2eb-4556-b0ef-1083662cc73c	e0daf718-a05f-4e80-86b4-32cf6e00b63a	6e4c2136-7d81-4ac8-86ff-f0d996c06f31	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
96f89ef4-dad5-491f-ae53-24f75c50553b	e0daf718-a05f-4e80-86b4-32cf6e00b63a	f3d406c2-c04f-4a9d-be38-71c29f8dfa3a	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
891990da-ecb1-40dc-84c6-b39d664ea127	76ce258b-bd80-4ede-bb1b-408a43aaf784	1397074b-c0e3-45b0-8f8c-090d962c5156	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
06bc2d97-1c63-4b8e-9993-8f3a21b3c999	76ce258b-bd80-4ede-bb1b-408a43aaf784	f3d406c2-c04f-4a9d-be38-71c29f8dfa3a	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
4ccf228b-3777-4219-8fab-d85de9df09ea	fb448b86-7597-4085-a39d-d1d88cd4939a	5fa2ac7a-9ada-4582-b247-c78e55652fb4	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
120148c4-d25d-4c3d-9501-c5c2d1ae9394	fb448b86-7597-4085-a39d-d1d88cd4939a	f3d406c2-c04f-4a9d-be38-71c29f8dfa3a	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
c332cf93-5f30-4cec-a4b1-58770e164168	66fa52c7-63a7-4232-8710-83e6c72804f8	aeca9355-bfa6-4fea-a8e4-dd872fbe36fb	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
cd4bec33-4ee6-4f9f-80da-34cbef7218a3	66fa52c7-63a7-4232-8710-83e6c72804f8	f3d406c2-c04f-4a9d-be38-71c29f8dfa3a	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
abeac6a9-b17a-46a9-9ea0-3c2ee5da0861	fe17c9d6-63a9-45d5-b049-e8b7fc1981e8	64f26d1c-312d-40aa-b40a-c02a16658aab	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
87738d9a-66dc-452c-8eec-4466fcd5768d	fe17c9d6-63a9-45d5-b049-e8b7fc1981e8	f3d406c2-c04f-4a9d-be38-71c29f8dfa3a	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
c865ce14-abe1-452f-8ce2-3948e2a4742a	458cd6f0-7c9f-4891-9bbd-b71becb2e623	defe599b-7551-4426-ad16-0fae80b2700a	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
fd97d6d0-c23c-453c-9760-62f0877bd21d	8bb0525d-bebf-4ad8-bab5-72d113e49fae	07b8461c-d3fe-44bd-926a-b6f2b1d14d83	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
bcf2d588-900d-4e35-9c13-99e5b49a4171	1c0812e0-38c9-4678-97c9-57b01856374b	c9e30ede-8a80-4887-a8a2-278030d7b001	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
15df415b-02f5-43b6-a5b5-1c7fa0abe404	1c0812e0-38c9-4678-97c9-57b01856374b	b487d439-cf36-4b1b-abc9-2440377970f2	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
6ee1b216-5ad2-4c35-b98a-b99e98ef4d9c	17fdf8db-319f-4e9d-ac5f-89e1352c598e	66a806aa-64b2-471d-80a4-4ab54841aa51	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
080dbe15-433f-401c-a0f7-0bfeff1ab59e	51f7df47-0143-4396-b9c9-19533e894ec3	6c5aaa63-7f20-4a7e-ad4f-21eebb59877f	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
9b48682b-da88-462d-ac43-a2290b86465e	51f7df47-0143-4396-b9c9-19533e894ec3	66d44f98-1170-4581-bf10-f46129e935c1	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
5c15331f-b30f-4ae5-9c0e-9748208d372e	081455d1-0e98-4a43-b445-9c3ce805469b	787dd727-3b88-4dc1-a1bf-9b8ec7e0f6ea	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
ee885b9b-a05b-4f5b-b0ee-9531d956ff48	081455d1-0e98-4a43-b445-9c3ce805469b	66d44f98-1170-4581-bf10-f46129e935c1	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
bdc37c8d-83df-4308-a2c3-c093b9e9b6ee	069847b8-9bb1-41f9-8460-f19ebce212df	e26be40a-814b-469b-bca6-ef2d63de5381	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
b8f1ce90-fd61-49bc-be95-aafc4b03f30f	069847b8-9bb1-41f9-8460-f19ebce212df	da477291-fefa-4849-8c5c-4f16af569ed7	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
61dd0f64-442a-43c4-ba48-353464bb3566	57697e8a-b1cf-409d-9dce-84511e06fb57	7da61240-debc-4efb-a0f7-3545e3d889cf	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
f466b5bb-d89b-4718-8f5c-c164632bd862	e5c744d3-522d-463b-8dd5-1869ff6aa07c	e18fcf95-3c47-4955-8886-9269a598f8fc	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
ecb31662-4020-4631-87ef-989816d16501	92f38509-d405-4b58-9f34-5faa2f43879b	811dcd39-1513-4b0c-abc2-f39b8eb8a937	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
fba49ea1-eef4-4ea2-8b9e-75ba1bfc7621	92f38509-d405-4b58-9f34-5faa2f43879b	7d45e97a-e337-459d-b642-5806523b961f	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
e3edb647-2f2f-4afd-97ff-af73a7223ada	c8436650-2db6-45b9-8f78-a7818605b300	34de0749-7f0a-4089-b684-95290e7210ab	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
517f481c-6483-425d-be3b-f917a950df00	c8436650-2db6-45b9-8f78-a7818605b300	88343975-3920-46e1-8d59-9cd3369f1eab	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
d567a385-5423-4c37-9bc7-b25a982afb04	84a9c166-4c37-4333-8af4-c186353c4f11	7810d72b-30c1-46de-8de9-1206b0d6793a	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
3b8c6ee5-1024-4324-b55b-e0121cea641e	84a9c166-4c37-4333-8af4-c186353c4f11	63ce977e-7ba7-444f-ab10-1758214bf0f7	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
b552f5c8-692b-4153-b2c9-61c0938577f2	30cd7615-a46a-4507-9e56-09ad9b7f219e	22366e30-6f3b-4e26-bbf7-469261c11375	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
334c6de6-b9ef-4656-9d53-f0e2ac3783f6	30cd7615-a46a-4507-9e56-09ad9b7f219e	63ce977e-7ba7-444f-ab10-1758214bf0f7	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
bbb9d42c-439e-4dd4-9a22-e0d86415a093	362ea85b-e4aa-4181-8263-7f7a2544a963	c510162b-b456-4ac0-88b2-96a54405fac5	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
d185de83-e2f2-4ba6-876f-59219304132e	362ea85b-e4aa-4181-8263-7f7a2544a963	63ce977e-7ba7-444f-ab10-1758214bf0f7	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
e1c0fd15-c258-4f79-8ad2-f7554ceecd44	b74c4f1f-abc8-4cbe-89c6-0e5a9b79eea1	07a34d61-084c-417a-8f6d-7382ee999010	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
7bf2b52c-14d1-4064-a445-17e829d5847f	b74c4f1f-abc8-4cbe-89c6-0e5a9b79eea1	0ee39eb7-1cd3-44c5-9277-12c8cb298836	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
18b4ecaf-2ebe-4ccb-99bf-f38e4aac1aae	81d6d5dd-a954-4ee9-b484-5c2958549c71	07a34d61-084c-417a-8f6d-7382ee999010	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
385b3e2f-6f3b-4752-a9ca-fe279a2eb88b	81d6d5dd-a954-4ee9-b484-5c2958549c71	066bc448-5c62-468b-8690-92f6e7471237	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
6a7a4c0b-1c99-4af5-bbf8-911338792458	2d74b162-f77d-4012-84a8-506957356520	a681f870-f814-4b9d-a9ea-7e9642955d34	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
d5d1e7b5-ac0d-40e5-be32-53806dc4a5dc	2d74b162-f77d-4012-84a8-506957356520	e6ae9e48-4a67-4143-b10d-f3c35777da0b	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
6d54f6a1-71f3-4044-81f5-c499f529f18e	27592c5e-2415-4e78-a5b4-c068029a41d3	bbaacf10-a4ec-4c00-abe6-1af703e4936a	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
402acd98-09b2-441a-9926-e032907f57dc	27592c5e-2415-4e78-a5b4-c068029a41d3	e6ae9e48-4a67-4143-b10d-f3c35777da0b	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
136682a4-6b26-4634-93d1-c6cfd71c60f4	b6161219-9bf6-4ba1-90fe-bec3a9e40b31	a681f870-f814-4b9d-a9ea-7e9642955d34	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
5f747e7f-d61e-45c7-88ba-b1f2d317f032	b6161219-9bf6-4ba1-90fe-bec3a9e40b31	bbaacf10-a4ec-4c00-abe6-1af703e4936a	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
5191c1f6-eac8-46e7-8f22-997a08c346c4	a3f51ce5-87bb-46b4-8f8e-fd5a3b826585	fa43a101-24b7-4e98-a60f-5a488b875f11	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
5fd9f01f-24f0-440e-b746-742e0153eb92	f01515d1-b3f8-4569-b4f5-467f31ac0c1a	245940ff-2336-42ca-87f5-a03d220d8a90	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
4e0f1bff-6091-44cf-9c60-924fb8d63669	f01515d1-b3f8-4569-b4f5-467f31ac0c1a	362088be-ec91-47f1-8075-83e2b0e9fbc6	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
f38da870-f1b1-449a-8315-fa7c14ecf93a	41b7b4f5-735f-4266-bc42-9f07af47b77f	8123805a-2034-45b2-8cc1-b6cd1d729577	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
17897ae5-038c-43ee-a56e-9202d394cd2c	41b7b4f5-735f-4266-bc42-9f07af47b77f	362088be-ec91-47f1-8075-83e2b0e9fbc6	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
6a3ca5d3-c9cd-4f9b-842d-2eb968966633	01c1f220-5b03-4e03-8946-b6e37e0996de	257e1039-af4d-4be1-ba4c-a692c38050d4	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
f284aa16-8f68-4380-8c66-fb1e8f492803	01c1f220-5b03-4e03-8946-b6e37e0996de	362088be-ec91-47f1-8075-83e2b0e9fbc6	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
0af2e4ea-9c85-4ea2-b730-2760dd1694f5	e4638978-bd48-452f-a8f3-1b28237db7a8	51329be2-343c-44e4-974e-de6cf433ada0	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
66aa0e37-5139-464e-aed1-206956c3a600	e4638978-bd48-452f-a8f3-1b28237db7a8	362088be-ec91-47f1-8075-83e2b0e9fbc6	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
b9a08101-e9bf-4c2d-8ed0-6989b05ecd74	8c8947e9-f0a0-4abf-be1e-8df4f1bf1751	a74ca777-7865-41a1-a200-2ae59ee9fa2f	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
75460a75-7ad7-4215-bf6d-c91500e32196	8c8947e9-f0a0-4abf-be1e-8df4f1bf1751	812b7037-1070-46e4-97f8-fbfb800eab36	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
12382f9d-f438-41c1-af7d-3ecef21c7c12	0d057565-826b-4200-92de-611dc04f3235	f9d85e77-e4a6-40ff-b0c4-63a0fae9e339	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
c6356613-0061-4f4f-92cf-dcd066102a30	0d057565-826b-4200-92de-611dc04f3235	812b7037-1070-46e4-97f8-fbfb800eab36	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
ef57ad1b-78a7-4af1-bd8a-6d964467c688	aee3c706-5d02-4f10-afb5-01c9c79b77c4	0a731520-02df-4414-b033-987b2de7121d	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
b8b7f412-63c1-4e06-bcf8-d2d77a34440a	aee3c706-5d02-4f10-afb5-01c9c79b77c4	812b7037-1070-46e4-97f8-fbfb800eab36	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
9851b45b-58ca-4527-9f98-bfc1a220ee88	30297360-121e-4880-a237-c853eae2751b	eebf8df5-526f-418a-83fc-db0663927ee9	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
ddb6be37-9112-4bc7-8c4f-0cdfac78cf5e	b4693055-e230-40c1-acfc-0632ba5a5e18	a477a67b-cf0d-42fe-b95e-df0ed7f38d04	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
1735cbb1-3e35-45d2-88cb-bfb87ab3d56a	a5d8d0e3-149c-4d2d-910a-a5fadf29256a	570d723b-1232-4c20-b317-1f77f319dd9f	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
06233274-d75c-467a-9226-1146acb2eb65	a5d8d0e3-149c-4d2d-910a-a5fadf29256a	391e3a75-34f3-4c01-a1d1-aae7aab48daa	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
5d5f07a8-2638-468d-a67a-12d07d821f4c	f52faf3a-e11a-464e-9c5b-f59bd7d70917	bcb16c1f-bfa7-40a4-a9fc-0a1af4b54095	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
56ebdefd-4a0a-4bf2-90aa-042a53594410	49005bae-f4e4-4ace-8124-f139c77e4835	f8154574-5989-4cbb-9e59-61f04faaf89a	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
66b3460f-0219-4b3b-9ff3-fa33b4e04934	49005bae-f4e4-4ace-8124-f139c77e4835	69e8e794-46b3-4f1a-a646-ef02f872724c	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
cf0ee118-a1a3-43c5-98f6-453cd90b3cf8	d400ee63-f705-4f37-b0a9-2f0fbc1cfb09	aeafa77e-1c4e-4365-8285-8e3b2c5b308e	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
8a38f75b-fca2-40f2-be98-615ce3b2cc32	ec64956a-d074-46d7-97bb-79b0386f153d	b4817dff-06a7-4e58-8cfb-5a5e631290ef	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
6f5ac74b-ba33-4421-94ea-0395141fc158	ec64956a-d074-46d7-97bb-79b0386f153d	29f0c291-df2b-41c5-9bce-50e7a689bf38	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
329a5ec9-66ca-427d-ba38-5e95d41a6be1	b4be0bee-937f-4f93-a2a6-b056879791d2	a0d554e2-f703-4730-bd9e-92bbf71816a3	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
238684de-413f-4c87-b249-2ac8cdac4df4	b4be0bee-937f-4f93-a2a6-b056879791d2	29f0c291-df2b-41c5-9bce-50e7a689bf38	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
622174c0-ccc0-4592-8c16-d085f1db3cc8	25a5cfcb-2cdd-4fb5-8ae5-436b505d7378	09509e8b-b808-45c5-8d4c-7c7cd181d26f	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
a9fbd595-0092-4fde-9dcf-12da7748c4e1	25a5cfcb-2cdd-4fb5-8ae5-436b505d7378	29f0c291-df2b-41c5-9bce-50e7a689bf38	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
07feec73-e48a-422a-845a-3e9419aa2ed1	d26e9b7d-0fb3-468f-897d-e12706d6a3bd	ccf6bf9d-1602-4c6a-86cd-43d97f67e9b6	0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
3bfd64b8-45ad-496b-a822-a277879b060c	d26e9b7d-0fb3-468f-897d-e12706d6a3bd	29f0c291-df2b-41c5-9bce-50e7a689bf38	1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00
\.


--
-- Data for Name: indexMetadata; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."indexMetadata" (id, "createdAt", "updatedAt", name, "workspaceId", "objectMetadataId", "isCustom", "isUnique", "indexWhereClause", "indexType", "universalIdentifier", "applicationId") FROM stdin;
56006519-7ca9-4bfc-b50e-a6a804818f71	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_30f969e0ec549acca94396d3efe	d3db876d-62f4-4d97-9a5c-4405cbe62b22	331329f4-7d5a-4a51-8188-8bd6383a68ef	f	f	\N	BTREE	\N	\N
4fd7ac67-589b-439b-9faa-cc36c5a27029	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_2055e4e583e9a2e5b4c239fd992	d3db876d-62f4-4d97-9a5c-4405cbe62b22	331329f4-7d5a-4a51-8188-8bd6383a68ef	f	f	\N	BTREE	\N	\N
0c9e158f-f4c6-4fa8-b691-d38d21ea8424	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_0698fed0e67005b7051b5d353b6	d3db876d-62f4-4d97-9a5c-4405cbe62b22	331329f4-7d5a-4a51-8188-8bd6383a68ef	f	f	\N	BTREE	\N	\N
065b2c07-bc0f-4c96-accc-87db68fc84a0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_3ca1d5243ff67f58c7c65c9a8a2	d3db876d-62f4-4d97-9a5c-4405cbe62b22	331329f4-7d5a-4a51-8188-8bd6383a68ef	f	f	\N	BTREE	\N	\N
7c2ef431-fb5f-4707-8677-d247feafbe18	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_91e687ea21123af4e02c9a07a43	d3db876d-62f4-4d97-9a5c-4405cbe62b22	331329f4-7d5a-4a51-8188-8bd6383a68ef	f	f	\N	BTREE	\N	\N
34cba3dc-5b13-43f1-9714-e807ed2708d7	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_73615a6bdc972b013956b19c59e	d3db876d-62f4-4d97-9a5c-4405cbe62b22	331329f4-7d5a-4a51-8188-8bd6383a68ef	f	f	\N	BTREE	\N	\N
ab822cab-8240-4df5-bb79-66e434290398	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_b4787dfe0ab22620ab04dcdffba	d3db876d-62f4-4d97-9a5c-4405cbe62b22	331329f4-7d5a-4a51-8188-8bd6383a68ef	f	f	\N	BTREE	\N	\N
71cd8d8f-a5d8-4972-a17a-967b8c7f0bf0	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_1c0459cd093778c23aef5b1e0d2	d3db876d-62f4-4d97-9a5c-4405cbe62b22	331329f4-7d5a-4a51-8188-8bd6383a68ef	f	f	\N	BTREE	\N	\N
dbc0b95d-b1be-4e42-a411-c0a5abca041b	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_76a190ab8a6f439791358d63d60	d3db876d-62f4-4d97-9a5c-4405cbe62b22	b224c093-0fe7-4c60-95bd-5da11d207937	f	f	\N	BTREE	\N	\N
b591301e-5af6-4fe0-a2d2-df7f8075b515	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_3465c79448bacd2f1268e5f6310	d3db876d-62f4-4d97-9a5c-4405cbe62b22	cd953ca2-8c54-4fee-80ff-f638c3d2ac12	f	f	\N	BTREE	\N	\N
ead4ec2b-2628-43f3-bd97-7beda7caa279	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_a88c3ab301c25202d4b52fb4b1b	d3db876d-62f4-4d97-9a5c-4405cbe62b22	132fb558-68fe-4619-a469-59ac07bf65cf	f	f	\N	BTREE	\N	\N
999ad474-0dcb-4cd0-aaa1-99e65bf2ea02	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_92a888b681107c4f78926820db7	d3db876d-62f4-4d97-9a5c-4405cbe62b22	132fb558-68fe-4619-a469-59ac07bf65cf	f	f	\N	BTREE	\N	\N
efd282ca-48be-4aa0-97f1-abab1f2b0a98	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_dd22aee9059fd7002165df6d8cc	d3db876d-62f4-4d97-9a5c-4405cbe62b22	9e60fa19-8c45-43e3-a07a-a47497dd6539	f	f	\N	BTREE	\N	\N
be2db304-6a1d-40cf-a41f-74994136fbb5	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_0da422bbe7adbabb8144c696ebd	d3db876d-62f4-4d97-9a5c-4405cbe62b22	9e60fa19-8c45-43e3-a07a-a47497dd6539	f	f	\N	BTREE	\N	\N
401c7abe-9fda-4900-85a1-77d60350737e	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_2bf094726f6d91639302c1c143d	d3db876d-62f4-4d97-9a5c-4405cbe62b22	9e60fa19-8c45-43e3-a07a-a47497dd6539	f	f	\N	BTREE	\N	\N
8225b457-6d70-4ef9-9c1b-469dbf76e9b3	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_2a32339058d0b6910b0834ddf81	d3db876d-62f4-4d97-9a5c-4405cbe62b22	adf06099-b76b-47c1-9519-bb10956030eb	f	t	\N	BTREE	\N	\N
b8a96035-35e7-4314-a081-52eb9dfabfa4	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_123501237187c835ede626367b7	d3db876d-62f4-4d97-9a5c-4405cbe62b22	adf06099-b76b-47c1-9519-bb10956030eb	f	f	\N	BTREE	\N	\N
35d6bfb8-83b5-4c27-97b3-2a16d15e4908	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_fb1f4905546cfc6d70a971c76f7	d3db876d-62f4-4d97-9a5c-4405cbe62b22	adf06099-b76b-47c1-9519-bb10956030eb	f	f	\N	GIN	\N	\N
8692d8cf-cd83-49f7-a31d-4c6335137602	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_7d1b454b2a538273bdb947e848f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	f76201bb-e234-4a3f-af09-ee3fd2445e79	f	f	\N	BTREE	\N	\N
ce26645e-4a49-459e-b7e4-dfcdab287b6f	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_f3b76c5322b31cba175b2eccec8	d3db876d-62f4-4d97-9a5c-4405cbe62b22	7b93a0b2-03a9-457e-88ef-1cc653c60660	f	f	\N	GIN	\N	\N
0a8c789f-390b-42cf-84f8-0528daae95b1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_180e5f1d82cbdbae0dc8c4b5c40	d3db876d-62f4-4d97-9a5c-4405cbe62b22	5aee0655-bf05-4ac3-afae-cb58be3235d6	f	f	\N	BTREE	\N	\N
1b25aecf-3963-4c79-aca2-6d621f564ceb	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_1f7e4cb168e77496349c8cefed6	d3db876d-62f4-4d97-9a5c-4405cbe62b22	5aee0655-bf05-4ac3-afae-cb58be3235d6	f	f	\N	BTREE	\N	\N
cd35a220-5ceb-4c38-8fe1-05ab254d4238	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_a900d9f809273abe54dc5e166fa	d3db876d-62f4-4d97-9a5c-4405cbe62b22	5aee0655-bf05-4ac3-afae-cb58be3235d6	f	f	\N	BTREE	\N	\N
3e7391da-509b-4160-bf2d-e5e694b7d666	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_b810a8e37adf5cafd342170ccf8	d3db876d-62f4-4d97-9a5c-4405cbe62b22	5aee0655-bf05-4ac3-afae-cb58be3235d6	f	f	\N	BTREE	\N	\N
5a710518-78c0-41bf-b003-7877a22c7e3e	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_85f024f9ec673d530d14cf75fe5	d3db876d-62f4-4d97-9a5c-4405cbe62b22	5aee0655-bf05-4ac3-afae-cb58be3235d6	f	f	\N	BTREE	\N	\N
5c6ea19e-f474-4070-a03c-a75a04c9370c	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_eecddc968e93b9b8ebbfd85dad3	d3db876d-62f4-4d97-9a5c-4405cbe62b22	5aee0655-bf05-4ac3-afae-cb58be3235d6	f	f	\N	BTREE	\N	\N
da894b90-1bff-476f-8115-226cc49184b6	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_110d1dc7f0ecd231a18f6784cf3	d3db876d-62f4-4d97-9a5c-4405cbe62b22	5aee0655-bf05-4ac3-afae-cb58be3235d6	f	f	\N	BTREE	\N	\N
1252c927-c491-44f3-930f-d981afa995fc	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_7c59b29a053016fc596ddad8a0e	d3db876d-62f4-4d97-9a5c-4405cbe62b22	5aee0655-bf05-4ac3-afae-cb58be3235d6	f	f	\N	BTREE	\N	\N
5f6b405c-a919-4f21-861c-069df58788dd	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_e14b3424016bea8b7fe220f7761	d3db876d-62f4-4d97-9a5c-4405cbe62b22	5aee0655-bf05-4ac3-afae-cb58be3235d6	f	f	\N	BTREE	\N	\N
0a4279b3-684b-4cbd-bca0-c28594202642	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_21d905e0adf19e835f6059a9f3d	d3db876d-62f4-4d97-9a5c-4405cbe62b22	5aee0655-bf05-4ac3-afae-cb58be3235d6	f	f	\N	BTREE	\N	\N
30a860c0-68c1-449c-9c7c-51430cf47fe7	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_8ea5d02aec60a7ceabc36fb2b41	d3db876d-62f4-4d97-9a5c-4405cbe62b22	5aee0655-bf05-4ac3-afae-cb58be3235d6	f	f	\N	BTREE	\N	\N
b27c5da3-2735-4c6d-8bfc-8ffe160d5737	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_a930d316a6b4f3b81d3f026dd16	d3db876d-62f4-4d97-9a5c-4405cbe62b22	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	f	f	\N	BTREE	\N	\N
96dc6ba8-bd1b-409f-9114-ca8c451ac778	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_b0f33146379167855851cceef65	d3db876d-62f4-4d97-9a5c-4405cbe62b22	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	f	f	\N	BTREE	\N	\N
c1b53079-46b2-473f-8919-39d28710d3e9	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_17a660a8931bb14627a59b23b25	d3db876d-62f4-4d97-9a5c-4405cbe62b22	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	f	f	\N	BTREE	\N	\N
3b9ae508-dd8e-49fc-bc22-10fa6711f1e8	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_3e44fabc86a1b3bb9ab56c7d23c	d3db876d-62f4-4d97-9a5c-4405cbe62b22	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	f	f	\N	BTREE	\N	\N
3a055ba7-9437-4a84-94ba-64449d9032fa	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_7cf577fad5154f025f50f63d0c6	d3db876d-62f4-4d97-9a5c-4405cbe62b22	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	f	f	\N	BTREE	\N	\N
e0daf718-a05f-4e80-86b4-32cf6e00b63a	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_98455b50fdd00d9b234e26b64e9	d3db876d-62f4-4d97-9a5c-4405cbe62b22	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	f	f	\N	BTREE	\N	\N
76ce258b-bd80-4ede-bb1b-408a43aaf784	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_e655425fbac9c7bbb09ae8c0e81	d3db876d-62f4-4d97-9a5c-4405cbe62b22	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	f	f	\N	BTREE	\N	\N
fb448b86-7597-4085-a39d-d1d88cd4939a	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_0b3dec6c7b728aa5d5686e041b2	d3db876d-62f4-4d97-9a5c-4405cbe62b22	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	f	f	\N	BTREE	\N	\N
66fa52c7-63a7-4232-8710-83e6c72804f8	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_2ac2dcf03c86f5654df25cb6587	d3db876d-62f4-4d97-9a5c-4405cbe62b22	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	f	f	\N	BTREE	\N	\N
fe17c9d6-63a9-45d5-b049-e8b7fc1981e8	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_b55a639f9e6efaca7ad5ee77119	d3db876d-62f4-4d97-9a5c-4405cbe62b22	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	f	f	\N	BTREE	\N	\N
458cd6f0-7c9f-4891-9bbd-b71becb2e623	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_d09fc4b1711543f42c127270f1e	d3db876d-62f4-4d97-9a5c-4405cbe62b22	e89d085a-8ec2-4b37-9560-3f1f708b57a6	f	f	\N	GIN	\N	\N
8bb0525d-bebf-4ad8-bab5-72d113e49fae	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_51329bbcdab6618a75361670c26	d3db876d-62f4-4d97-9a5c-4405cbe62b22	89bcd47d-b0a0-41ba-ba13-500cb520b5a9	f	f	\N	GIN	\N	\N
1c0812e0-38c9-4678-97c9-57b01856374b	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_a362c5eff4a28fcdffdd3bdff16	d3db876d-62f4-4d97-9a5c-4405cbe62b22	89bcd47d-b0a0-41ba-ba13-500cb520b5a9	f	f	\N	BTREE	\N	\N
17fdf8db-319f-4e9d-ac5f-89e1352c598e	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_261d8661b94dbb98cc85cffab46	d3db876d-62f4-4d97-9a5c-4405cbe62b22	37ea5922-a5c5-4fba-8148-5a5580c7ec37	f	f	\N	GIN	\N	\N
51f7df47-0143-4396-b9c9-19533e894ec3	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_faa5772594c4ce15b9305919f2f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	37ea5922-a5c5-4fba-8148-5a5580c7ec37	f	f	\N	BTREE	\N	\N
081455d1-0e98-4a43-b445-9c3ce805469b	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_eee970874f46ff99eefc0015001	d3db876d-62f4-4d97-9a5c-4405cbe62b22	37ea5922-a5c5-4fba-8148-5a5580c7ec37	f	f	\N	BTREE	\N	\N
069847b8-9bb1-41f9-8460-f19ebce212df	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_5960ffd71d6ecb88ad89cc023f0	d3db876d-62f4-4d97-9a5c-4405cbe62b22	bebad403-65fc-49cc-8638-d290d969baec	f	f	\N	BTREE	\N	\N
57697e8a-b1cf-409d-9dce-84511e06fb57	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_39954942ffa78c957b5dee47739	d3db876d-62f4-4d97-9a5c-4405cbe62b22	c61c10a5-fad2-4072-9902-9cec39dbe21b	f	t	\N	BTREE	\N	\N
e5c744d3-522d-463b-8dd5-1869ff6aa07c	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_e47451872f70c8f187a6b460ac7	d3db876d-62f4-4d97-9a5c-4405cbe62b22	c61c10a5-fad2-4072-9902-9cec39dbe21b	f	f	\N	GIN	\N	\N
92f38509-d405-4b58-9f34-5faa2f43879b	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_78fa73d661d632619e17de211e6	d3db876d-62f4-4d97-9a5c-4405cbe62b22	6e84550e-a74e-4e82-8700-4a5ed617ba6b	f	f	\N	BTREE	\N	\N
c8436650-2db6-45b9-8f78-a7818605b300	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_c3af632ce35236d21f8ae1f4cfd	d3db876d-62f4-4d97-9a5c-4405cbe62b22	840afb4a-10c1-4f5d-b62c-17b5a656afbf	f	f	\N	BTREE	\N	\N
84a9c166-4c37-4333-8af4-c186353c4f11	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_8d0144e4074d86d0cb7094f40c2	d3db876d-62f4-4d97-9a5c-4405cbe62b22	a89fa0b4-2d20-4ff1-9706-ab5b63b6fb24	f	f	\N	BTREE	\N	\N
30cd7615-a46a-4507-9e56-09ad9b7f219e	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_6d9700e5ae2ab8c294d614e72f6	d3db876d-62f4-4d97-9a5c-4405cbe62b22	a89fa0b4-2d20-4ff1-9706-ab5b63b6fb24	f	f	\N	BTREE	\N	\N
362ea85b-e4aa-4181-8263-7f7a2544a963	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_8c4f617db0813d41aef587e49ea	d3db876d-62f4-4d97-9a5c-4405cbe62b22	a89fa0b4-2d20-4ff1-9706-ab5b63b6fb24	f	f	\N	BTREE	\N	\N
b74c4f1f-abc8-4cbe-89c6-0e5a9b79eea1	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_8606361c00c3d44e1a23024e1f8	d3db876d-62f4-4d97-9a5c-4405cbe62b22	a949876e-c029-4733-85ca-028ecde6d0c2	f	f	\N	BTREE	\N	\N
81d6d5dd-a954-4ee9-b484-5c2958549c71	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_UNIQUE_da740cfc9b8edd57936cc18f66f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	a949876e-c029-4733-85ca-028ecde6d0c2	f	t	"deletedAt" IS NULL	BTREE	\N	\N
2d74b162-f77d-4012-84a8-506957356520	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_63953e5f88351922043480b8801	d3db876d-62f4-4d97-9a5c-4405cbe62b22	bbcf3ea3-f4cc-4811-bc1b-5eb5fd3d0e56	f	f	\N	BTREE	\N	\N
27592c5e-2415-4e78-a5b4-c068029a41d3	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_671dd9e01a80d1e4c89fc166c3b	d3db876d-62f4-4d97-9a5c-4405cbe62b22	bbcf3ea3-f4cc-4811-bc1b-5eb5fd3d0e56	f	f	\N	BTREE	\N	\N
b6161219-9bf6-4ba1-90fe-bec3a9e40b31	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_UNIQUE_da56d8b595a778d404eae01f29b	d3db876d-62f4-4d97-9a5c-4405cbe62b22	bbcf3ea3-f4cc-4811-bc1b-5eb5fd3d0e56	f	t	"deletedAt" IS NULL	BTREE	\N	\N
a3f51ce5-87bb-46b4-8f8e-fd5a3b826585	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_f20de8d7fc74a405e4083051275	d3db876d-62f4-4d97-9a5c-4405cbe62b22	7f0daf26-7887-47d7-b6d6-8d792b812e94	f	f	\N	GIN	\N	\N
f01515d1-b3f8-4569-b4f5-467f31ac0c1a	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_241f0cca089399c8c5954086b8d	d3db876d-62f4-4d97-9a5c-4405cbe62b22	9e6962d4-b31b-4f54-a20f-e4f118de550f	f	f	\N	BTREE	\N	\N
41b7b4f5-735f-4266-bc42-9f07af47b77f	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_56454973bce16e65ee1ae3d2e40	d3db876d-62f4-4d97-9a5c-4405cbe62b22	9e6962d4-b31b-4f54-a20f-e4f118de550f	f	f	\N	BTREE	\N	\N
01c1f220-5b03-4e03-8946-b6e37e0996de	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_68bce49f4de05facd5365a3a797	d3db876d-62f4-4d97-9a5c-4405cbe62b22	9e6962d4-b31b-4f54-a20f-e4f118de550f	f	f	\N	BTREE	\N	\N
e4638978-bd48-452f-a8f3-1b28237db7a8	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_19ea95ddb39f610f7dcad4c4336	d3db876d-62f4-4d97-9a5c-4405cbe62b22	9e6962d4-b31b-4f54-a20f-e4f118de550f	f	f	\N	BTREE	\N	\N
8c8947e9-f0a0-4abf-be1e-8df4f1bf1751	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_4f469d3a7ee08aefdc099836364	d3db876d-62f4-4d97-9a5c-4405cbe62b22	77082a20-4eaa-4b81-b4e8-564c03c1ad16	f	f	\N	BTREE	\N	\N
0d057565-826b-4200-92de-611dc04f3235	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_82cdf247553f960093baa7c6635	d3db876d-62f4-4d97-9a5c-4405cbe62b22	77082a20-4eaa-4b81-b4e8-564c03c1ad16	f	f	\N	BTREE	\N	\N
aee3c706-5d02-4f10-afb5-01c9c79b77c4	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_425ac6c73ecb993cf9cbc2c2b00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	77082a20-4eaa-4b81-b4e8-564c03c1ad16	f	f	\N	BTREE	\N	\N
30297360-121e-4880-a237-c853eae2751b	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_9f96d65260c4676faac27cb6bf3	d3db876d-62f4-4d97-9a5c-4405cbe62b22	77082a20-4eaa-4b81-b4e8-564c03c1ad16	f	f	\N	GIN	\N	\N
b4693055-e230-40c1-acfc-0632ba5a5e18	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_87914cd3ce963115f8cb943e2ac	d3db876d-62f4-4d97-9a5c-4405cbe62b22	df5c5db0-be63-4f64-ae64-f3b354f80cb9	f	t	\N	BTREE	\N	\N
a5d8d0e3-149c-4d2d-910a-a5fadf29256a	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_6a862a788ac6ce967afa06df812	d3db876d-62f4-4d97-9a5c-4405cbe62b22	df5c5db0-be63-4f64-ae64-f3b354f80cb9	f	f	\N	BTREE	\N	\N
f52faf3a-e11a-464e-9c5b-f59bd7d70917	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_bbd7aec1976fc684a0a5e4816c9	d3db876d-62f4-4d97-9a5c-4405cbe62b22	df5c5db0-be63-4f64-ae64-f3b354f80cb9	f	f	\N	GIN	\N	\N
49005bae-f4e4-4ace-8124-f139c77e4835	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_ee5298b25512b38b29390e084f7	d3db876d-62f4-4d97-9a5c-4405cbe62b22	4d66f605-f9ca-43fc-9d35-db72ee5f04bc	f	f	\N	BTREE	\N	\N
d400ee63-f705-4f37-b0a9-2f0fbc1cfb09	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_d01a000cf26e1225d894dc3d364	d3db876d-62f4-4d97-9a5c-4405cbe62b22	4d66f605-f9ca-43fc-9d35-db72ee5f04bc	f	f	\N	GIN	\N	\N
ec64956a-d074-46d7-97bb-79b0386f153d	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_627d4437c96f22d5d46cc9a85bb	d3db876d-62f4-4d97-9a5c-4405cbe62b22	d3d793c8-5ed6-4bd0-85cf-ace8f0c132f3	f	f	\N	BTREE	\N	\N
b4be0bee-937f-4f93-a2a6-b056879791d2	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_cf12e6c92058f11b59852ffdfe3	d3db876d-62f4-4d97-9a5c-4405cbe62b22	d3d793c8-5ed6-4bd0-85cf-ace8f0c132f3	f	f	\N	BTREE	\N	\N
25a5cfcb-2cdd-4fb5-8ae5-436b505d7378	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_4e929e3af362914c41035c4d438	d3db876d-62f4-4d97-9a5c-4405cbe62b22	d3d793c8-5ed6-4bd0-85cf-ace8f0c132f3	f	f	\N	BTREE	\N	\N
d26e9b7d-0fb3-468f-897d-e12706d6a3bd	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	IDX_b0ba7efcd8c529922bf6e858bc1	d3db876d-62f4-4d97-9a5c-4405cbe62b22	d3d793c8-5ed6-4bd0-85cf-ace8f0c132f3	f	f	\N	BTREE	\N	\N
\.


--
-- Data for Name: keyValuePair; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."keyValuePair" (id, "userId", "workspaceId", key, value, "textValueDeprecated", type, "createdAt", "updatedAt", "deletedAt") FROM stdin;
\.


--
-- Data for Name: objectMetadata; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."objectMetadata" (id, "standardId", "dataSourceId", "nameSingular", "namePlural", "labelSingular", "labelPlural", description, icon, "standardOverrides", "targetTableName", "isCustom", "isRemote", "isActive", "isSystem", "isUIReadOnly", "isAuditLogged", "isSearchable", "duplicateCriteria", shortcut, "labelIdentifierFieldMetadataId", "imageIdentifierFieldMetadataId", "isLabelSyncedWithName", "workspaceId", "createdAt", "updatedAt", "applicationId", "universalIdentifier") FROM stdin;
331329f4-7d5a-4a51-8188-8bd6383a68ef	20202020-bd3d-4c60-8dca-571c71d4447a	4410a824-7797-4f9e-a96f-2f3e43d221ec	attachment	attachments	Attachment	Attachments	An attachment	IconFileImport	\N	DEPRECATED	f	f	t	t	f	t	f	\N	\N	ab67b6d3-472e-47bc-9d00-1beaad8ecfab	\N	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
b224c093-0fe7-4c60-95bd-5da11d207937	20202020-0408-4f38-b8a8-4d5e3e26e24d	4410a824-7797-4f9e-a96f-2f3e43d221ec	blocklist	blocklists	Blocklist	Blocklists	Blocklist	IconForbid2	\N	DEPRECATED	f	f	t	t	f	t	f	\N	\N	cab9117b-02b8-47b8-a7e3-64cfc2f283cf	\N	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
9ab0caad-fd52-46be-98b6-f1b607f1f8b6	20202020-8f1d-4eef-9f85-0d1965e27221	4410a824-7797-4f9e-a96f-2f3e43d221ec	calendarEvent	calendarEvents	Calendar event	Calendar events	Calendar events	IconCalendar	\N	DEPRECATED	f	f	t	t	f	f	f	\N	\N	1710cbd5-148a-4db8-92bb-2f0be86530c6	\N	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
cd953ca2-8c54-4fee-80ff-f638c3d2ac12	20202020-e8f2-40e1-a39c-c0e0039c5034	4410a824-7797-4f9e-a96f-2f3e43d221ec	calendarChannel	calendarChannels	Calendar Channel	Calendar Channels	Calendar Channels	IconCalendar	\N	DEPRECATED	f	f	t	t	f	f	f	\N	\N	2e28329e-f4cc-499e-8c90-1a9c0552640a	\N	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
132fb558-68fe-4619-a469-59ac07bf65cf	20202020-491b-4aaa-9825-afd1bae6ae00	4410a824-7797-4f9e-a96f-2f3e43d221ec	calendarChannelEventAssociation	calendarChannelEventAssociations	Calendar Channel Event Association	Calendar Channel Event Associations	Calendar Channel Event Associations	IconCalendar	\N	DEPRECATED	f	f	t	t	f	f	f	\N	\N	aa8e9428-54eb-47a1-8c20-3921539b89e6	\N	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
9e60fa19-8c45-43e3-a07a-a47497dd6539	20202020-a1c3-47a6-9732-27e5b1e8436d	4410a824-7797-4f9e-a96f-2f3e43d221ec	calendarEventParticipant	calendarEventParticipants	Calendar event participant	Calendar event participants	Calendar event participants	IconCalendar	\N	DEPRECATED	f	f	t	t	f	f	f	\N	\N	fdf1608e-6352-43b0-a046-0fcce2476115	\N	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
adf06099-b76b-47c1-9519-bb10956030eb	20202020-b374-4779-a561-80086cb2e17f	4410a824-7797-4f9e-a96f-2f3e43d221ec	company	companies	Company	Companies	A company	IconBuildingSkyscraper	\N	DEPRECATED	f	f	t	f	f	t	t	[["name"], ["domainNamePrimaryLinkUrl"]]	C	34291d1e-bd23-472f-adde-c5e7ae219b43	\N	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
f76201bb-e234-4a3f-af09-ee3fd2445e79	20202020-977e-46b2-890b-c3002ddfd5c5	4410a824-7797-4f9e-a96f-2f3e43d221ec	connectedAccount	connectedAccounts	Connected Account	Connected Accounts	A connected account	IconAt	\N	DEPRECATED	f	f	t	t	f	t	f	\N	\N	0da564b9-da84-4ffa-ae36-7c905764da4a	\N	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
7b93a0b2-03a9-457e-88ef-1cc653c60660	20202020-3840-4b6d-9425-0c5188b05ca8	4410a824-7797-4f9e-a96f-2f3e43d221ec	dashboard	dashboards	Dashboard	Dashboards	A dashboard	IconLayoutDashboard	\N	DEPRECATED	f	f	t	f	f	t	t	\N	D	d4da218e-6286-4c54-921e-1f677897e0c8	\N	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
5aee0655-bf05-4ac3-afae-cb58be3235d6	20202020-ab56-4e05-92a3-e2414a499860	4410a824-7797-4f9e-a96f-2f3e43d221ec	favorite	favorites	Favorite	Favorites	A favorite that can be accessed from the left menu	IconHeart	\N	DEPRECATED	f	f	t	t	f	t	f	\N	\N	4ae55a2b-57b3-4997-aa8a-f64e8ece309e	\N	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
4076f800-4700-4ab2-ae93-d4e916bae87a	20202020-7cf8-401f-8211-a9587d27fd2d	4410a824-7797-4f9e-a96f-2f3e43d221ec	favoriteFolder	favoriteFolders	Favorite Folder	Favorite Folders	A Folder of favorites	IconFolder	\N	DEPRECATED	f	f	t	t	f	t	f	\N	\N	5ca5a32f-60c4-4d50-9ca5-b56e8017f479	\N	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	20202020-6736-4337-b5c4-8b39fae325a5	4410a824-7797-4f9e-a96f-2f3e43d221ec	timelineActivity	timelineActivities	Timeline Activity	Timeline Activities	Aggregated / filtered event to be displayed on the timeline	IconTimelineEvent	\N	DEPRECATED	f	f	t	t	f	f	f	\N	\N	f99f5844-aa85-45bc-a31c-2c1a350194de	\N	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
e89d085a-8ec2-4b37-9560-3f1f708b57a6	20202020-62be-406c-b9ca-8caa50d51392	4410a824-7797-4f9e-a96f-2f3e43d221ec	workflow	workflows	Workflow	Workflows	A workflow	IconSettingsAutomation	\N	DEPRECATED	f	f	t	f	f	t	f	\N	W	d214168c-902f-4fa1-995e-54bc0d51f173	\N	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
89bcd47d-b0a0-41ba-ba13-500cb520b5a9	20202020-d65d-4ab9-9344-d77bfb376a3d	4410a824-7797-4f9e-a96f-2f3e43d221ec	workflowVersion	workflowVersions	Workflow Version	Workflow Versions	A workflow version	IconVersions	\N	DEPRECATED	f	f	t	t	f	t	f	\N	\N	1aa79add-25cd-4cdb-b579-be766190061a	\N	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
37ea5922-a5c5-4fba-8148-5a5580c7ec37	20202020-4e28-4e95-a9d7-6c00874f843c	4410a824-7797-4f9e-a96f-2f3e43d221ec	workflowRun	workflowRuns	Workflow Run	Workflow Runs	A workflow run	IconHistoryToggle	\N	DEPRECATED	f	f	t	t	f	f	f	\N	\N	86371281-8818-4e4b-863a-0a1b7de712a8	\N	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
bebad403-65fc-49cc-8638-d290d969baec	20202020-3319-4234-a34c-7f3b9d2e4d1f	4410a824-7797-4f9e-a96f-2f3e43d221ec	workflowAutomatedTrigger	workflowAutomatedTriggers	WorkflowAutomatedTrigger	WorkflowAutomatedTriggers	A workflow automated trigger	IconSettingsAutomation	\N	DEPRECATED	f	f	t	t	f	t	f	\N	\N	37121929-5f8f-4941-a980-49d8abe0916d	\N	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
c61c10a5-fad2-4072-9902-9cec39dbe21b	20202020-3319-4234-a34c-82d5c0e881a6	4410a824-7797-4f9e-a96f-2f3e43d221ec	workspaceMember	workspaceMembers	Workspace Member	Workspace Members	A workspace member	IconUserCircle	\N	DEPRECATED	f	f	t	t	f	t	t	\N	\N	98f9efe6-da7d-4d13-94ec-8f057ce60e36	64370561-77cb-4153-b1a4-045f940d27d9	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
d477715c-e571-4c79-9c3d-27cf2a3f4683	20202020-849a-4c3e-84f5-a25a7d802271	4410a824-7797-4f9e-a96f-2f3e43d221ec	messageThread	messageThreads	Message Thread	Message Threads	A group of related messages (e.g. email thread, chat thread)	IconMessage	\N	DEPRECATED	f	f	t	t	f	f	f	\N	\N	0bbd9bfc-6fb4-4e4a-8c1a-96c6d9cc8cb1	\N	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
6e84550e-a74e-4e82-8700-4a5ed617ba6b	20202020-3f6b-4425-80ab-e468899ab4b2	4410a824-7797-4f9e-a96f-2f3e43d221ec	message	messages	Message	Messages	A message sent or received through a messaging channel (email, chat, etc.)	IconMessage	\N	DEPRECATED	f	f	t	t	f	f	f	\N	\N	3e6102c1-4df1-4254-be49-4347772672ea	\N	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
840afb4a-10c1-4f5d-b62c-17b5a656afbf	20202020-fe8c-40bc-a681-b80b771449b7	4410a824-7797-4f9e-a96f-2f3e43d221ec	messageChannel	messageChannels	Message Channel	Message Channels	Message Channels	IconMessage	\N	DEPRECATED	f	f	t	t	f	f	f	\N	\N	f4c0dcfb-e3c6-4951-8492-c35344ccac41	\N	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
a89fa0b4-2d20-4ff1-9706-ab5b63b6fb24	20202020-a433-4456-aa2d-fd9cb26b774a	4410a824-7797-4f9e-a96f-2f3e43d221ec	messageParticipant	messageParticipants	Message Participant	Message Participants	Message Participants	IconUserCircle	\N	DEPRECATED	f	f	t	t	f	f	f	\N	\N	f9a89866-29ee-45d4-b169-abc1b24f894a	\N	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
a949876e-c029-4733-85ca-028ecde6d0c2	20202020-4955-4fd9-8e59-2dbd373f2a46	4410a824-7797-4f9e-a96f-2f3e43d221ec	messageFolder	messageFolders	Message Folder	Message Folders	Folder for Message Channel	IconFolder	\N	DEPRECATED	f	f	t	t	f	f	f	\N	\N	76212740-ee26-4c6c-862e-743c8c7a27c6	\N	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
bbcf3ea3-f4cc-4811-bc1b-5eb5fd3d0e56	20202020-ad1e-4127-bccb-d83ae04d2ccb	4410a824-7797-4f9e-a96f-2f3e43d221ec	messageChannelMessageAssociation	messageChannelMessageAssociations	Message Channel Message Association	Message Channel Message Associations	Message Synced with a Message Channel	IconMessage	\N	DEPRECATED	f	f	t	t	f	f	f	\N	\N	a42fc419-43ba-4a2a-ba54-d60d1d022e46	\N	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
7f0daf26-7887-47d7-b6d6-8d792b812e94	20202020-0b00-45cd-b6f6-6cd806fc6804	4410a824-7797-4f9e-a96f-2f3e43d221ec	note	notes	Note	Notes	A note	IconNotes	\N	DEPRECATED	f	f	t	f	f	t	t	\N	N	fabb04e8-4fe5-4cb1-b807-2499c92517e5	\N	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
9e6962d4-b31b-4f54-a20f-e4f118de550f	20202020-fff0-4b44-be82-bda313884400	4410a824-7797-4f9e-a96f-2f3e43d221ec	noteTarget	noteTargets	Note Target	Note Targets	A note target	IconCheckbox	\N	DEPRECATED	f	f	t	t	f	t	f	\N	\N	92962862-0d6a-485b-8624-35b868a22aec	\N	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
77082a20-4eaa-4b81-b4e8-564c03c1ad16	20202020-9549-49dd-b2b2-883999db8938	4410a824-7797-4f9e-a96f-2f3e43d221ec	opportunity	opportunities	Opportunity	Opportunities	An opportunity	IconTargetArrow	\N	DEPRECATED	f	f	t	f	f	t	t	\N	O	bbeae473-1711-4438-bae1-0fb7d275e8c4	\N	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
df5c5db0-be63-4f64-ae64-f3b354f80cb9	20202020-e674-48e5-a542-72570eee7213	4410a824-7797-4f9e-a96f-2f3e43d221ec	person	people	Person	People	A person	IconUser	\N	DEPRECATED	f	f	t	f	f	t	t	[["nameFirstName", "nameLastName"], ["linkedinLinkPrimaryLinkUrl"], ["emailsPrimaryEmail"]]	P	f8224e96-02c4-4cb6-bfd5-55581237cbb3	b680e99d-220f-4d6c-8781-bd2e6206f920	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
4d66f605-f9ca-43fc-9d35-db72ee5f04bc	20202020-1ba1-48ba-bc83-ef7e5990ed10	4410a824-7797-4f9e-a96f-2f3e43d221ec	task	tasks	Task	Tasks	A task	IconCheckbox	\N	DEPRECATED	f	f	t	f	f	t	t	\N	T	061116b6-d7a8-42a7-989e-ed8b6f89cad5	\N	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
d3d793c8-5ed6-4bd0-85cf-ace8f0c132f3	20202020-5a9a-44e8-95df-771cd06d0fb1	4410a824-7797-4f9e-a96f-2f3e43d221ec	taskTarget	taskTargets	Task Target	Task Targets	A task target	IconCheckbox	\N	DEPRECATED	f	f	t	t	f	t	f	\N	\N	5e10b729-d993-46f3-bbe0-e2b589c42806	\N	f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00	2026-01-05 21:37:45.239371+00	\N	\N
\.


--
-- Data for Name: objectPermission; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."objectPermission" (id, "roleId", "objectMetadataId", "canReadObjectRecords", "canUpdateObjectRecords", "canSoftDeleteObjectRecords", "canDestroyObjectRecords", "workspaceId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: pageLayout; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."pageLayout" (id, name, "workspaceId", type, "objectMetadataId", "createdAt", "updatedAt", "deletedAt", "universalIdentifier", "applicationId") FROM stdin;
3aeecc67-9a78-4160-878a-24ce2c0612cb	Dashboard Layout	d3db876d-62f4-4d97-9a5c-4405cbe62b22	DASHBOARD	\N	2026-01-06 01:41:03.684+00	2026-01-06 01:41:03.684+00	\N	3aeecc67-9a78-4160-878a-24ce2c0612cb	bc39da16-2038-4501-822f-ba7ef921bc44
\.


--
-- Data for Name: pageLayoutTab; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."pageLayoutTab" (id, title, "workspaceId", "position", "pageLayoutId", "createdAt", "updatedAt", "deletedAt", "universalIdentifier", "applicationId") FROM stdin;
2e1bfec2-56b2-47fe-bda6-660cbfc32381	Tab 1	d3db876d-62f4-4d97-9a5c-4405cbe62b22	0	3aeecc67-9a78-4160-878a-24ce2c0612cb	2026-01-06 01:41:03.737+00	2026-01-06 01:41:03.737+00	\N	2e1bfec2-56b2-47fe-bda6-660cbfc32381	bc39da16-2038-4501-822f-ba7ef921bc44
\.


--
-- Data for Name: pageLayoutWidget; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."pageLayoutWidget" (id, "pageLayoutTabId", "workspaceId", title, type, "objectMetadataId", "gridPosition", configuration, "createdAt", "updatedAt", "deletedAt", "universalIdentifier", "applicationId") FROM stdin;
\.


--
-- Data for Name: permissionFlag; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."permissionFlag" (id, "roleId", flag, "workspaceId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: postgresCredentials; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."postgresCredentials" (id, "user", "passwordHash", "createdAt", "updatedAt", "deletedAt", "workspaceId") FROM stdin;
\.


--
-- Data for Name: publicDomain; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."publicDomain" (id, "createdAt", "updatedAt", domain, "isValidated", "workspaceId") FROM stdin;
\.


--
-- Data for Name: remoteServer; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."remoteServer" (id, "foreignDataWrapperId", "foreignDataWrapperType", label, "foreignDataWrapperOptions", "userMappingOptions", schema, "workspaceId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: remoteTable; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."remoteTable" (id, "distantTableName", "localTableName", "workspaceId", "remoteServerId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core.role (id, "standardId", label, "canUpdateAllSettings", "canAccessAllTools", "canReadAllObjectRecords", "canUpdateAllObjectRecords", "canSoftDeleteAllObjectRecords", "canDestroyAllObjectRecords", description, icon, "workspaceId", "createdAt", "updatedAt", "isEditable", "canBeAssignedToUsers", "canBeAssignedToAgents", "canBeAssignedToApiKeys", "universalIdentifier", "applicationId") FROM stdin;
686940f2-a228-4e78-92b4-78c22d0ba18d	20202020-0001-0001-0001-000000000001	Admin	t	t	t	t	t	t	Admin role	IconUserCog	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.86+00	2026-01-05 21:37:45.86+00	f	t	f	t	\N	\N
f48b9ae8-d04d-4506-aa0f-492ee5c61708	\N	Member	f	t	t	t	t	t	Member role	IconUser	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.582+00	2026-01-05 21:37:46.582+00	t	t	f	f	f48b9ae8-d04d-4506-aa0f-492ee5c61708	bc39da16-2038-4501-822f-ba7ef921bc44
\.


--
-- Data for Name: roleTarget; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."roleTarget" (id, "workspaceId", "roleId", "userWorkspaceId", "agentId", "apiKeyId", "createdAt", "updatedAt", "universalIdentifier", "applicationId") FROM stdin;
2d2d3461-b956-429f-874b-939196f1ca05	d3db876d-62f4-4d97-9a5c-4405cbe62b22	686940f2-a228-4e78-92b4-78c22d0ba18d	57472eba-90b8-4391-938e-387743ae9e0f	\N	\N	2026-01-05 21:37:46.462+00	2026-01-05 21:37:46.462+00	a35dc029-9441-4e6d-9c81-9b657251338c	bc39da16-2038-4501-822f-ba7ef921bc44
5a513e16-302a-4cf7-9a8e-fa659ace3eb2	d3db876d-62f4-4d97-9a5c-4405cbe62b22	686940f2-a228-4e78-92b4-78c22d0ba18d	\N	\N	7748b9cc-8db5-4d7d-be4c-3a270ed4db8d	2026-01-05 21:39:50.147+00	2026-01-05 21:39:50.147+00	a95ef164-f9c0-4751-bb9b-c0ba444bdb3b	bc39da16-2038-4501-822f-ba7ef921bc44
d6c15d95-4637-4f77-aad2-146d4576464a	d3db876d-62f4-4d97-9a5c-4405cbe62b22	686940f2-a228-4e78-92b4-78c22d0ba18d	\N	\N	3d98947a-e22f-47c2-9629-6b7673952f76	2026-01-05 21:47:13.49+00	2026-01-05 21:47:13.49+00	472d2474-d527-42af-b725-059755059cd2	bc39da16-2038-4501-822f-ba7ef921bc44
\.


--
-- Data for Name: routeTrigger; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."routeTrigger" ("universalIdentifier", id, path, "isAuthRequired", "httpMethod", "workspaceId", "createdAt", "updatedAt", "serverlessFunctionId", "applicationId") FROM stdin;
\.


--
-- Data for Name: searchFieldMetadata; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."searchFieldMetadata" (id, "objectMetadataId", "fieldMetadataId", "createdAt", "updatedAt", "workspaceId") FROM stdin;
\.


--
-- Data for Name: serverlessFunction; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."serverlessFunction" (id, name, description, "latestVersion", "publishedVersions", runtime, "timeoutSeconds", "workspaceId", "createdAt", "updatedAt", "deletedAt", "universalIdentifier", "applicationId", checksum, "serverlessFunctionLayerId", "handlerPath", "handlerName") FROM stdin;
28e75c24-ddcd-477d-bf7e-1d237aa9b598	stripe-synchronizer-main	Main function for stripe-synchronizer app	1	["1"]	nodejs22.x	30	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-06 02:45:51.492653+00	2026-01-06 02:45:51.54294+00	\N	\N	\N	\N	269823ae-882b-430b-84b2-db07f2dee6d0	src/index.ts	main
3b2faa31-1e5f-4f56-a48b-cf657f1dea54	fireflies-main	Main function for fireflies app	1	["1"]	nodejs22.x	30	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-06 02:45:51.565142+00	2026-01-06 02:45:51.61826+00	\N	\N	\N	\N	269823ae-882b-430b-84b2-db07f2dee6d0	src/index.ts	main
df0929e0-0b40-49df-a58a-fc1060b9469d	rollup-engine-main	Main function for rollup-engine app	1	["1"]	nodejs22.x	30	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-06 02:45:51.63412+00	2026-01-06 02:45:51.670095+00	\N	\N	\N	\N	269823ae-882b-430b-84b2-db07f2dee6d0	src/index.ts	main
326c0865-ab5b-4238-af00-98779ca15d6a	last-email-interaction-main	Main function for last-email-interaction app	1	["1"]	nodejs22.x	30	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-06 02:45:51.685219+00	2026-01-06 02:45:51.718783+00	\N	\N	\N	\N	269823ae-882b-430b-84b2-db07f2dee6d0	src/index.ts	main
bd5bb18b-1de0-4ec1-9da1-635bed83477d	meeting-transcript-main	Main function for meeting-transcript app	1	["1"]	nodejs22.x	30	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-06 02:45:51.73381+00	2026-01-06 02:45:51.763296+00	\N	\N	\N	\N	269823ae-882b-430b-84b2-db07f2dee6d0	src/index.ts	main
5b60c86d-f6dc-4d92-a3b7-f03a9dccfc87	ai-meeting-transcript-main	Main function for ai-meeting-transcript app	1	["1"]	nodejs22.x	30	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-06 02:45:51.779067+00	2026-01-06 02:45:51.809971+00	\N	\N	\N	\N	269823ae-882b-430b-84b2-db07f2dee6d0	src/index.ts	main
624cce94-4102-421c-aa37-81aaaba7c5bf	mailchimp-synchronizer-main	Main function for mailchimp-synchronizer app	1	["1"]	nodejs22.x	30	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-06 02:45:51.823205+00	2026-01-06 02:45:51.849361+00	\N	\N	\N	\N	269823ae-882b-430b-84b2-db07f2dee6d0	src/index.ts	main
dc3112f1-4f59-4b3e-b38b-a6d31a12b26b	webmetic-main	Main function for webmetic app	1	["1"]	nodejs22.x	30	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-06 02:45:51.865473+00	2026-01-06 02:45:51.904597+00	\N	\N	\N	\N	269823ae-882b-430b-84b2-db07f2dee6d0	src/index.ts	main
651d0746-0b71-440f-98a1-54da629804f3	activity-summary-main	Main function for activity-summary app	1	["1"]	nodejs22.x	30	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-06 02:45:51.921508+00	2026-01-06 02:45:51.955931+00	\N	\N	\N	\N	269823ae-882b-430b-84b2-db07f2dee6d0	src/index.ts	main
\.


--
-- Data for Name: serverlessFunctionLayer; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."serverlessFunctionLayer" (id, "packageJson", "yarnLock", checksum, "workspaceId", "createdAt", "updatedAt") FROM stdin;
269823ae-882b-430b-84b2-db07f2dee6d0	{"dependencies": {"uuid": "^10.0.0", "axios": "^1.12.0", "sharp": "^0.33.5", "bcrypt": "^5.1.1", "winston": "^3.14.2", "archiver": "^7.0.1", "deep-equal": "^2.2.3", "nodemailer": "^7.0.11", "@types/uuid": "^10.0.0", "body-parser": "^1.20.3", "lodash.omit": "^4.5.0", "jsonwebtoken": "^9.0.2", "lodash.chunk": "^4.2.0", "lodash.merge": "^4.6.2", "@types/bcrypt": "^5.0.2", "lodash.pickby": "^4.6.0", "lodash.compact": "^3.0.1", "lodash.groupby": "^4.6.0", "lodash.isempty": "^4.4.0", "lodash.isequal": "^4.5.0", "lodash.identity": "^3.0.0", "lodash.isobject": "^3.0.2", "lodash.camelcase": "^4.3.0", "lodash.kebabcase": "^4.1.1", "lodash.mapvalues": "^4.6.0", "lodash.snakecase": "^4.1.1", "@types/deep-equal": "^1.0.4", "lodash.upperfirst": "^4.3.1", "@types/lodash.omit": "^4.5.9", "@types/lodash.pickby": "^4.6.9", "@types/lodash.compact": "^3.0.9", "@types/lodash.groupby": "^4.6.9", "@types/lodash.isempty": "^4.4.9", "@types/lodash.isequal": "^4.5.8", "@types/lodash.identity": "^3.0.9", "@types/lodash.isobject": "^3.0.9", "@types/lodash.camelcase": "^4.3.9", "@types/lodash.kebabcase": "^4.1.9", "@types/lodash.mapvalues": "^4.6.9", "@types/lodash.snakecase": "^4.1.9", "@types/lodash.upperfirst": "^4.3.9"}}	# This file is generated by running "yarn install" inside your project.\n# Manual changes might be lost - proceed with caution!\n\n__metadata:\n  version: 8\n  cacheKey: 10c0\n\n"@colors/colors@npm:1.6.0, @colors/colors@npm:^1.6.0":\n  version: 1.6.0\n  resolution: "@colors/colors@npm:1.6.0"\n  checksum: 10c0/9328a0778a5b0db243af54455b79a69e3fb21122d6c15ef9e9fcc94881d8d17352d8b2b2590f9bdd46fac5c2d6c1636dcfc14358a20c70e22daf89e1a759b629\n  languageName: node\n  linkType: hard\n\n"@dabh/diagnostics@npm:^2.0.2":\n  version: 2.0.3\n  resolution: "@dabh/diagnostics@npm:2.0.3"\n  dependencies:\n    colorspace: "npm:1.1.x"\n    enabled: "npm:2.0.x"\n    kuler: "npm:^2.0.0"\n  checksum: 10c0/a5133df8492802465ed01f2f0a5784585241a1030c362d54a602ed1839816d6c93d71dde05cf2ddb4fd0796238c19774406bd62fa2564b637907b495f52425fe\n  languageName: node\n  linkType: hard\n\n"@emnapi/runtime@npm:^1.2.0":\n  version: 1.2.0\n  resolution: "@emnapi/runtime@npm:1.2.0"\n  dependencies:\n    tslib: "npm:^2.4.0"\n  checksum: 10c0/7005ff8b67724c9e61b6cd79a3decbdb2ce25d24abd4d3d187472f200ee6e573329c30264335125fb136bd813aa9cf9f4f7c9391d04b07dd1e63ce0a3427be57\n  languageName: node\n  linkType: hard\n\n"@img/sharp-darwin-arm64@npm:0.33.5":\n  version: 0.33.5\n  resolution: "@img/sharp-darwin-arm64@npm:0.33.5"\n  dependencies:\n    "@img/sharp-libvips-darwin-arm64": "npm:1.0.4"\n  dependenciesMeta:\n    "@img/sharp-libvips-darwin-arm64":\n      optional: true\n  conditions: os=darwin & cpu=arm64\n  languageName: node\n  linkType: hard\n\n"@img/sharp-darwin-x64@npm:0.33.5":\n  version: 0.33.5\n  resolution: "@img/sharp-darwin-x64@npm:0.33.5"\n  dependencies:\n    "@img/sharp-libvips-darwin-x64": "npm:1.0.4"\n  dependenciesMeta:\n    "@img/sharp-libvips-darwin-x64":\n      optional: true\n  conditions: os=darwin & cpu=x64\n  languageName: node\n  linkType: hard\n\n"@img/sharp-libvips-darwin-arm64@npm:1.0.4":\n  version: 1.0.4\n  resolution: "@img/sharp-libvips-darwin-arm64@npm:1.0.4"\n  conditions: os=darwin & cpu=arm64\n  languageName: node\n  linkType: hard\n\n"@img/sharp-libvips-darwin-x64@npm:1.0.4":\n  version: 1.0.4\n  resolution: "@img/sharp-libvips-darwin-x64@npm:1.0.4"\n  conditions: os=darwin & cpu=x64\n  languageName: node\n  linkType: hard\n\n"@img/sharp-libvips-linux-arm64@npm:1.0.4":\n  version: 1.0.4\n  resolution: "@img/sharp-libvips-linux-arm64@npm:1.0.4"\n  conditions: os=linux & cpu=arm64 & libc=glibc\n  languageName: node\n  linkType: hard\n\n"@img/sharp-libvips-linux-arm@npm:1.0.5":\n  version: 1.0.5\n  resolution: "@img/sharp-libvips-linux-arm@npm:1.0.5"\n  conditions: os=linux & cpu=arm & libc=glibc\n  languageName: node\n  linkType: hard\n\n"@img/sharp-libvips-linux-s390x@npm:1.0.4":\n  version: 1.0.4\n  resolution: "@img/sharp-libvips-linux-s390x@npm:1.0.4"\n  conditions: os=linux & cpu=s390x & libc=glibc\n  languageName: node\n  linkType: hard\n\n"@img/sharp-libvips-linux-x64@npm:1.0.4":\n  version: 1.0.4\n  resolution: "@img/sharp-libvips-linux-x64@npm:1.0.4"\n  conditions: os=linux & cpu=x64 & libc=glibc\n  languageName: node\n  linkType: hard\n\n"@img/sharp-libvips-linuxmusl-arm64@npm:1.0.4":\n  version: 1.0.4\n  resolution: "@img/sharp-libvips-linuxmusl-arm64@npm:1.0.4"\n  conditions: os=linux & cpu=arm64 & libc=musl\n  languageName: node\n  linkType: hard\n\n"@img/sharp-libvips-linuxmusl-x64@npm:1.0.4":\n  version: 1.0.4\n  resolution: "@img/sharp-libvips-linuxmusl-x64@npm:1.0.4"\n  conditions: os=linux & cpu=x64 & libc=musl\n  languageName: node\n  linkType: hard\n\n"@img/sharp-linux-arm64@npm:0.33.5":\n  version: 0.33.5\n  resolution: "@img/sharp-linux-arm64@npm:0.33.5"\n  dependencies:\n    "@img/sharp-libvips-linux-arm64": "npm:1.0.4"\n  dependenciesMeta:\n    "@img/sharp-libvips-linux-arm64":\n      optional: true\n  conditions: os=linux & cpu=arm64 & libc=glibc\n  languageName: node\n  linkType: hard\n\n"@img/sharp-linux-arm@npm:0.33.5":\n  version: 0.33.5\n  resolution: "@img/sharp-linux-arm@npm:0.33.5"\n  dependencies:\n    "@img/sharp-libvips-linux-arm": "npm:1.0.5"\n  dependenciesMeta:\n    "@img/sharp-libvips-linux-arm":\n      optional: true\n  conditions: os=linux & cpu=arm & libc=glibc\n  languageName: node\n  linkType: hard\n\n"@img/sharp-linux-s390x@npm:0.33.5":\n  version: 0.33.5\n  resolution: "@img/sharp-linux-s390x@npm:0.33.5"\n  dependencies:\n    "@img/sharp-libvips-linux-s390x": "npm:1.0.4"\n  dependenciesMeta:\n    "@img/sharp-libvips-linux-s390x":\n      optional: true\n  conditions: os=linux & cpu=s390x & libc=glibc\n  languageName: node\n  linkType: hard\n\n"@img/sharp-linux-x64@npm:0.33.5":\n  version: 0.33.5\n  resolution: "@img/sharp-linux-x64@npm:0.33.5"\n  dependencies:\n    "@img/sharp-libvips-linux-x64": "npm:1.0.4"\n  dependenciesMeta:\n    "@img/sharp-libvips-linux-x64":\n      optional: true\n  conditions: os=linux & cpu=x64 & libc=glibc\n  languageName: node\n  linkType: hard\n\n"@img/sharp-linuxmusl-arm64@npm:0.33.5":\n  version: 0.33.5\n  resolution: "@img/sharp-linuxmusl-arm64@npm:0.33.5"\n  dependencies:\n    "@img/sharp-libvips-linuxmusl-arm64": "npm:1.0.4"\n  dependenciesMeta:\n    "@img/sharp-libvips-linuxmusl-arm64":\n      optional: true\n  conditions: os=linux & cpu=arm64 & libc=musl\n  languageName: node\n  linkType: hard\n\n"@img/sharp-linuxmusl-x64@npm:0.33.5":\n  version: 0.33.5\n  resolution: "@img/sharp-linuxmusl-x64@npm:0.33.5"\n  dependencies:\n    "@img/sharp-libvips-linuxmusl-x64": "npm:1.0.4"\n  dependenciesMeta:\n    "@img/sharp-libvips-linuxmusl-x64":\n      optional: true\n  conditions: os=linux & cpu=x64 & libc=musl\n  languageName: node\n  linkType: hard\n\n"@img/sharp-wasm32@npm:0.33.5":\n  version: 0.33.5\n  resolution: "@img/sharp-wasm32@npm:0.33.5"\n  dependencies:\n    "@emnapi/runtime": "npm:^1.2.0"\n  conditions: cpu=wasm32\n  languageName: node\n  linkType: hard\n\n"@img/sharp-win32-ia32@npm:0.33.5":\n  version: 0.33.5\n  resolution: "@img/sharp-win32-ia32@npm:0.33.5"\n  conditions: os=win32 & cpu=ia32\n  languageName: node\n  linkType: hard\n\n"@img/sharp-win32-x64@npm:0.33.5":\n  version: 0.33.5\n  resolution: "@img/sharp-win32-x64@npm:0.33.5"\n  conditions: os=win32 & cpu=x64\n  languageName: node\n  linkType: hard\n\n"@isaacs/cliui@npm:^8.0.2":\n  version: 8.0.2\n  resolution: "@isaacs/cliui@npm:8.0.2"\n  dependencies:\n    string-width: "npm:^5.1.2"\n    string-width-cjs: "npm:string-width@^4.2.0"\n    strip-ansi: "npm:^7.0.1"\n    strip-ansi-cjs: "npm:strip-ansi@^6.0.1"\n    wrap-ansi: "npm:^8.1.0"\n    wrap-ansi-cjs: "npm:wrap-ansi@^7.0.0"\n  checksum: 10c0/b1bf42535d49f11dc137f18d5e4e63a28c5569de438a221c369483731e9dac9fb797af554e8bf02b6192d1e5eba6e6402cf93900c3d0ac86391d00d04876789e\n  languageName: node\n  linkType: hard\n\n"@mapbox/node-pre-gyp@npm:^1.0.11":\n  version: 1.0.11\n  resolution: "@mapbox/node-pre-gyp@npm:1.0.11"\n  dependencies:\n    detect-libc: "npm:^2.0.0"\n    https-proxy-agent: "npm:^5.0.0"\n    make-dir: "npm:^3.1.0"\n    node-fetch: "npm:^2.6.7"\n    nopt: "npm:^5.0.0"\n    npmlog: "npm:^5.0.1"\n    rimraf: "npm:^3.0.2"\n    semver: "npm:^7.3.5"\n    tar: "npm:^6.1.11"\n  bin:\n    node-pre-gyp: bin/node-pre-gyp\n  checksum: 10c0/2b24b93c31beca1c91336fa3b3769fda98e202fb7f9771f0f4062588d36dcc30fcf8118c36aa747fa7f7610d8cf601872bdaaf62ce7822bb08b545d1bbe086cc\n  languageName: node\n  linkType: hard\n\n"@npmcli/agent@npm:^2.0.0":\n  version: 2.2.2\n  resolution: "@npmcli/agent@npm:2.2.2"\n  dependencies:\n    agent-base: "npm:^7.1.0"\n    http-proxy-agent: "npm:^7.0.0"\n    https-proxy-agent: "npm:^7.0.1"\n    lru-cache: "npm:^10.0.1"\n    socks-proxy-agent: "npm:^8.0.3"\n  checksum: 10c0/325e0db7b287d4154ecd164c0815c08007abfb07653cc57bceded17bb7fd240998a3cbdbe87d700e30bef494885eccc725ab73b668020811d56623d145b524ae\n  languageName: node\n  linkType: hard\n\n"@npmcli/fs@npm:^3.1.0":\n  version: 3.1.1\n  resolution: "@npmcli/fs@npm:3.1.1"\n  dependencies:\n    semver: "npm:^7.3.5"\n  checksum: 10c0/c37a5b4842bfdece3d14dfdb054f73fe15ed2d3da61b34ff76629fb5b1731647c49166fd2a8bf8b56fcfa51200382385ea8909a3cbecdad612310c114d3f6c99\n  languageName: node\n  linkType: hard\n\n"@pkgjs/parseargs@npm:^0.11.0":\n  version: 0.11.0\n  resolution: "@pkgjs/parseargs@npm:0.11.0"\n  checksum: 10c0/5bd7576bb1b38a47a7fc7b51ac9f38748e772beebc56200450c4a817d712232b8f1d3ef70532c80840243c657d491cf6a6be1e3a214cff907645819fdc34aadd\n  languageName: node\n  linkType: hard\n\n"@types/bcrypt@npm:^5.0.2":\n  version: 5.0.2\n  resolution: "@types/bcrypt@npm:5.0.2"\n  dependencies:\n    "@types/node": "npm:*"\n  checksum: 10c0/dd7f05e183b9b1fc08ec499069febf197ab8e9c720766b5bbb5628395082e248f9a444c60882fe7788361fcadc302e21e055ab9c26a300f100e08791c353e6aa\n  languageName: node\n  linkType: hard\n\n"@types/deep-equal@npm:^1.0.4":\n  version: 1.0.4\n  resolution: "@types/deep-equal@npm:1.0.4"\n  checksum: 10c0/583d41df5d7655b0bd5fdd4b173b045396108fad2191e1bd3b1bfc188f98d24fafff34a8a09c04f9c650c87d82e9f25a8119d269044522da0770a05075fbf74d\n  languageName: node\n  linkType: hard\n\n"@types/lodash.camelcase@npm:^4.3.9":\n  version: 4.3.9\n  resolution: "@types/lodash.camelcase@npm:4.3.9"\n  dependencies:\n    "@types/lodash": "npm:*"\n  checksum: 10c0/d6c42c800624b75b079ff7862d258d7c8236837f8485a4fe9f92e5e7d3e9ccaef2eb202e24e8f04d209ad5573c85edc7871d0cecc831454a501d594b11f1311b\n  languageName: node\n  linkType: hard\n\n"@types/lodash.compact@npm:^3.0.9":\n  version: 3.0.9\n  resolution: "@types/lodash.compact@npm:3.0.9"\n  dependencies:\n    "@types/lodash": "npm:*"\n  checksum: 10c0/9eff2fecd6773352f5b762a2c58f261e3c83f61d7297efe94b08f9a4b524b24ccc2de5e8d728e2ffd42472fa06973df0856e474eb74b5e614813d26d7436efc6\n  languageName: node\n  linkType: hard\n\n"@types/lodash.groupby@npm:^4.6.9":\n  version: 4.6.9\n  resolution: "@types/lodash.groupby@npm:4.6.9"\n  dependencies:\n    "@types/lodash": "npm:*"\n  checksum: 10c0/1302531f76da99cc8f1bbd486a8c7048a833352b12c39eb5b2ded01173dd5fff76f2c7ace04f08b51c55840271170f1cfbffe4e454dde8597c3ee996e70d4e11\n  languageName: node\n  linkType: hard\n\n"@types/lodash.identity@npm:^3.0.9":\n  version: 3.0.9\n  resolution: "@types/lodash.identity@npm:3.0.9"\n  dependencies:\n    "@types/lodash": "npm:*"\n  checksum: 10c0/fac961d04fe704b04bef608e9bffd8c7ea44d1d6f014c01ff520cd63e22fa58aa843d2017c18e31bcf21b35124b9c5c7dbf12b33362020d15f5c0591ff4cbc19\n  languageName: node\n  linkType: hard\n\n"@types/lodash.isempty@npm:^4.4.9":\n  version: 4.4.9\n  resolution: "@types/lodash.isempty@npm:4.4.9"\n  dependencies:\n    "@types/lodash": "npm:*"\n  checksum: 10c0/581b3b1e896524b00cb32dc08f1aea328cec0ab95720f24e0f6d9e8a2c9be5b65e4ad030ec45f58f656ab8dcf555f039863862e04c91051a24ee27cac8a994ab\n  languageName: node\n  linkType: hard\n\n"@types/lodash.isequal@npm:^4.5.8":\n  version: 4.5.8\n  resolution: "@types/lodash.isequal@npm:4.5.8"\n  dependencies:\n    "@types/lodash": "npm:*"\n  checksum: 10c0/6db28cacf165d55421fbf2970ccfb1682a7b82b743bb7aba4398fa8ab98f1711fca2fe4afa1aa2b7b4afb3eff76c8aca13b22206f5efeb038d99e41300589bca\n  languageName: node\n  linkType: hard\n\n"@types/lodash.isobject@npm:^3.0.9":\n  version: 3.0.9\n  resolution: "@types/lodash.isobject@npm:3.0.9"\n  dependencies:\n    "@types/lodash": "npm:*"\n  checksum: 10c0/ab35ebaf0e53bce9f419194e8857da01a0f4ed668b2a61860f724e6ecedaad72bfe636bd6d98f9969cadf654595e317d19f7ba05cc3dfbea49966feb71ab687a\n  languageName: node\n  linkType: hard\n\n"@types/lodash.kebabcase@npm:^4.1.9":\n  version: 4.1.9\n  resolution: "@types/lodash.kebabcase@npm:4.1.9"\n  dependencies:\n    "@types/lodash": "npm:*"\n  checksum: 10c0/f00fbfb891fd1883e3fab2286fa2b23a013550b3498013c8c8c5e3ed437f52543afe8e8dc899b4f3317bab8db403bb281de863274a6fa12f088667378fd7b475\n  languageName: node\n  linkType: hard\n\n"@types/lodash.mapvalues@npm:^4.6.9":\n  version: 4.6.9\n  resolution: "@types/lodash.mapvalues@npm:4.6.9"\n  dependencies:\n    "@types/lodash": "npm:*"\n  checksum: 10c0/09216965c2c64854c8c765f38f436333e931b98638a0b9d996bda7b6d538593a4cfe53cad7415d50593be48d76798763b97dc2d7925ab200dce1fa5b630ed3b4\n  languageName: node\n  linkType: hard\n\n"@types/lodash.omit@npm:^4.5.9":\n  version: 4.5.9\n  resolution: "@types/lodash.omit@npm:4.5.9"\n  dependencies:\n    "@types/lodash": "npm:*"\n  checksum: 10c0/3b60c8ee8e9a691392d9a3ceabb32c85f888784bd3307eac3de01aeb7ff37383dc8899f027fe852641f5e0f56158fb19785cc3d20a4922e85b5810f14cba23f6\n  languageName: node\n  linkType: hard\n\n"@types/lodash.pickby@npm:^4.6.9":\n  version: 4.6.9\n  resolution: "@types/lodash.pickby@npm:4.6.9"\n  dependencies:\n    "@types/lodash": "npm:*"\n  checksum: 10c0/a572e22a24f73e9041e1beca8bb8125875734471c440f7fe9ff48ced10e6ffe45a2392098940f4c1327252e3455afd0e2ea0cc3908a2e3bd0bafe60335e27e6c\n  languageName: node\n  linkType: hard\n\n"@types/lodash.snakecase@npm:^4.1.9":\n  version: 4.1.9\n  resolution: "@types/lodash.snakecase@npm:4.1.9"\n  dependencies:\n    "@types/lodash": "npm:*"\n  checksum: 10c0/69c565f5d914628314de307ac30bcaf6060d2a1e782e87bc25a9c0d287ad06a29cc9308af285ea49e485dba3d909d4fc3b0a0b279cf7545492b37926f1fb2f8f\n  languageName: node\n  linkType: hard\n\n"@types/lodash.upperfirst@npm:^4.3.9":\n  version: 4.3.9\n  resolution: "@types/lodash.upperfirst@npm:4.3.9"\n  dependencies:\n    "@types/lodash": "npm:*"\n  checksum: 10c0/4f6be2e9d4b03a0739972fce3044c28bdf7fd96d5a3c773464f7b8e035d687e46878ad9b958a2fac448807636c0675962e3fbedf20af4fc74bc91bbaf471114f\n  languageName: node\n  linkType: hard\n\n"@types/lodash@npm:*":\n  version: 4.17.7\n  resolution: "@types/lodash@npm:4.17.7"\n  checksum: 10c0/40c965b5ffdcf7ff5c9105307ee08b782da228c01b5c0529122c554c64f6b7168fc8f11dc79aa7bae4e67e17efafaba685dc3a47e294dbf52a65ed2b67100561\n  languageName: node\n  linkType: hard\n\n"@types/node@npm:*":\n  version: 22.5.1\n  resolution: "@types/node@npm:22.5.1"\n  dependencies:\n    undici-types: "npm:~6.19.2"\n  checksum: 10c0/35373176d8a1d4e16004a1ed303e68d39e4c6341024dc056f2577982df98c1a045a6b677f12ed557796f09bbf7d621f428f6874cc37ed28f7b336fa604b5f6a6\n  languageName: node\n  linkType: hard\n\n"@types/triple-beam@npm:^1.3.2":\n  version: 1.3.5\n  resolution: "@types/triple-beam@npm:1.3.5"\n  checksum: 10c0/d5d7f25da612f6d79266f4f1bb9c1ef8f1684e9f60abab251e1261170631062b656ba26ff22631f2760caeafd372abc41e64867cde27fba54fafb73a35b9056a\n  languageName: node\n  linkType: hard\n\n"@types/uuid@npm:^10.0.0":\n  version: 10.0.0\n  resolution: "@types/uuid@npm:10.0.0"\n  checksum: 10c0/9a1404bf287164481cb9b97f6bb638f78f955be57c40c6513b7655160beb29df6f84c915aaf4089a1559c216557dc4d2f79b48d978742d3ae10b937420ddac60\n  languageName: node\n  linkType: hard\n\n"abbrev@npm:1":\n  version: 1.1.1\n  resolution: "abbrev@npm:1.1.1"\n  checksum: 10c0/3f762677702acb24f65e813070e306c61fafe25d4b2583f9dfc935131f774863f3addd5741572ed576bd69cabe473c5af18e1e108b829cb7b6b4747884f726e6\n  languageName: node\n  linkType: hard\n\n"abbrev@npm:^2.0.0":\n  version: 2.0.0\n  resolution: "abbrev@npm:2.0.0"\n  checksum: 10c0/f742a5a107473946f426c691c08daba61a1d15942616f300b5d32fd735be88fef5cba24201757b6c407fd564555fb48c751cfa33519b2605c8a7aadd22baf372\n  languageName: node\n  linkType: hard\n\n"abort-controller@npm:^3.0.0":\n  version: 3.0.0\n  resolution: "abort-controller@npm:3.0.0"\n  dependencies:\n    event-target-shim: "npm:^5.0.0"\n  checksum: 10c0/90ccc50f010250152509a344eb2e71977fbf8db0ab8f1061197e3275ddf6c61a41a6edfd7b9409c664513131dd96e962065415325ef23efa5db931b382d24ca5\n  languageName: node\n  linkType: hard\n\n"agent-base@npm:6":\n  version: 6.0.2\n  resolution: "agent-base@npm:6.0.2"\n  dependencies:\n    debug: "npm:4"\n  checksum: 10c0/dc4f757e40b5f3e3d674bc9beb4f1048f4ee83af189bae39be99f57bf1f48dde166a8b0a5342a84b5944ee8e6ed1e5a9d801858f4ad44764e84957122fe46261\n  languageName: node\n  linkType: hard\n\n"agent-base@npm:^7.0.2, agent-base@npm:^7.1.0, agent-base@npm:^7.1.1":\n  version: 7.1.1\n  resolution: "agent-base@npm:7.1.1"\n  dependencies:\n    debug: "npm:^4.3.4"\n  checksum: 10c0/e59ce7bed9c63bf071a30cc471f2933862044c97fd9958967bfe22521d7a0f601ce4ed5a8c011799d0c726ca70312142ae193bbebb60f576b52be19d4a363b50\n  languageName: node\n  linkType: hard\n\n"aggregate-error@npm:^3.0.0":\n  version: 3.1.0\n  resolution: "aggregate-error@npm:3.1.0"\n  dependencies:\n    clean-stack: "npm:^2.0.0"\n    indent-string: "npm:^4.0.0"\n  checksum: 10c0/a42f67faa79e3e6687a4923050e7c9807db3848a037076f791d10e092677d65c1d2d863b7848560699f40fc0502c19f40963fb1cd1fb3d338a7423df8e45e039\n  languageName: node\n  linkType: hard\n\n"ansi-regex@npm:^5.0.1":\n  version: 5.0.1\n  resolution: "ansi-regex@npm:5.0.1"\n  checksum: 10c0/9a64bb8627b434ba9327b60c027742e5d17ac69277960d041898596271d992d4d52ba7267a63ca10232e29f6107fc8a835f6ce8d719b88c5f8493f8254813737\n  languageName: node\n  linkType: hard\n\n"ansi-regex@npm:^6.0.1":\n  version: 6.0.1\n  resolution: "ansi-regex@npm:6.0.1"\n  checksum: 10c0/cbe16dbd2c6b2735d1df7976a7070dd277326434f0212f43abf6d87674095d247968209babdaad31bb00882fa68807256ba9be340eec2f1004de14ca75f52a08\n  languageName: node\n  linkType: hard\n\n"ansi-styles@npm:^4.0.0":\n  version: 4.3.0\n  resolution: "ansi-styles@npm:4.3.0"\n  dependencies:\n    color-convert: "npm:^2.0.1"\n  checksum: 10c0/895a23929da416f2bd3de7e9cb4eabd340949328ab85ddd6e484a637d8f6820d485f53933446f5291c3b760cbc488beb8e88573dd0f9c7daf83dccc8fe81b041\n  languageName: node\n  linkType: hard\n\n"ansi-styles@npm:^6.1.0":\n  version: 6.2.1\n  resolution: "ansi-styles@npm:6.2.1"\n  checksum: 10c0/5d1ec38c123984bcedd996eac680d548f31828bd679a66db2bdf11844634dde55fec3efa9c6bb1d89056a5e79c1ac540c4c784d592ea1d25028a92227d2f2d5c\n  languageName: node\n  linkType: hard\n\n"aproba@npm:^1.0.3 || ^2.0.0":\n  version: 2.0.0\n  resolution: "aproba@npm:2.0.0"\n  checksum: 10c0/d06e26384a8f6245d8c8896e138c0388824e259a329e0c9f196b4fa533c82502a6fd449586e3604950a0c42921832a458bb3aa0aa9f0ba449cfd4f50fd0d09b5\n  languageName: node\n  linkType: hard\n\n"archiver-utils@npm:^5.0.0, archiver-utils@npm:^5.0.2":\n  version: 5.0.2\n  resolution: "archiver-utils@npm:5.0.2"\n  dependencies:\n    glob: "npm:^10.0.0"\n    graceful-fs: "npm:^4.2.0"\n    is-stream: "npm:^2.0.1"\n    lazystream: "npm:^1.0.0"\n    lodash: "npm:^4.17.15"\n    normalize-path: "npm:^3.0.0"\n    readable-stream: "npm:^4.0.0"\n  checksum: 10c0/3782c5fa9922186aa1a8e41ed0c2867569faa5f15c8e5e6418ea4c1b730b476e21bd68270b3ea457daf459ae23aaea070b2b9f90cf90a59def8dc79b9e4ef538\n  languageName: node\n  linkType: hard\n\n"archiver@npm:^7.0.1":\n  version: 7.0.1\n  resolution: "archiver@npm:7.0.1"\n  dependencies:\n    archiver-utils: "npm:^5.0.2"\n    async: "npm:^3.2.4"\n    buffer-crc32: "npm:^1.0.0"\n    readable-stream: "npm:^4.0.0"\n    readdir-glob: "npm:^1.1.2"\n    tar-stream: "npm:^3.0.0"\n    zip-stream: "npm:^6.0.1"\n  checksum: 10c0/02afd87ca16f6184f752db8e26884e6eff911c476812a0e7f7b26c4beb09f06119807f388a8e26ed2558aa8ba9db28646ebd147a4f99e46813b8b43158e1438e\n  languageName: node\n  linkType: hard\n\n"are-we-there-yet@npm:^2.0.0":\n  version: 2.0.0\n  resolution: "are-we-there-yet@npm:2.0.0"\n  dependencies:\n    delegates: "npm:^1.0.0"\n    readable-stream: "npm:^3.6.0"\n  checksum: 10c0/375f753c10329153c8d66dc95e8f8b6c7cc2aa66e05cb0960bd69092b10dae22900cacc7d653ad11d26b3ecbdbfe1e8bfb6ccf0265ba8077a7d979970f16b99c\n  languageName: node\n  linkType: hard\n\n"array-buffer-byte-length@npm:^1.0.0":\n  version: 1.0.1\n  resolution: "array-buffer-byte-length@npm:1.0.1"\n  dependencies:\n    call-bind: "npm:^1.0.5"\n    is-array-buffer: "npm:^3.0.4"\n  checksum: 10c0/f5cdf54527cd18a3d2852ddf73df79efec03829e7373a8322ef5df2b4ef546fb365c19c71d6b42d641cb6bfe0f1a2f19bc0ece5b533295f86d7c3d522f228917\n  languageName: node\n  linkType: hard\n\n"async-function@npm:^1.0.0":\n  version: 1.0.0\n  resolution: "async-function@npm:1.0.0"\n  checksum: 10c0/669a32c2cb7e45091330c680e92eaeb791bc1d4132d827591e499cd1f776ff5a873e77e5f92d0ce795a8d60f10761dec9ddfe7225a5de680f5d357f67b1aac73\n  languageName: node\n  linkType: hard\n\n"async-generator-function@npm:^1.0.0":\n  version: 1.0.0\n  resolution: "async-generator-function@npm:1.0.0"\n  checksum: 10c0/2c50ef856c543ad500d8d8777d347e3c1ba623b93e99c9263ecc5f965c1b12d2a140e2ab6e43c3d0b85366110696f28114649411cbcd10b452a92a2318394186\n  languageName: node\n  linkType: hard\n\n"async@npm:^3.2.3, async@npm:^3.2.4":\n  version: 3.2.6\n  resolution: "async@npm:3.2.6"\n  checksum: 10c0/36484bb15ceddf07078688d95e27076379cc2f87b10c03b6dd8a83e89475a3c8df5848859dd06a4c95af1e4c16fc973de0171a77f18ea00be899aca2a4f85e70\n  languageName: node\n  linkType: hard\n\n"asynckit@npm:^0.4.0":\n  version: 0.4.0\n  resolution: "asynckit@npm:0.4.0"\n  checksum: 10c0/d73e2ddf20c4eb9337e1b3df1a0f6159481050a5de457c55b14ea2e5cb6d90bb69e004c9af54737a5ee0917fcf2c9e25de67777bbe58261847846066ba75bc9d\n  languageName: node\n  linkType: hard\n\n"available-typed-arrays@npm:^1.0.7":\n  version: 1.0.7\n  resolution: "available-typed-arrays@npm:1.0.7"\n  dependencies:\n    possible-typed-array-names: "npm:^1.0.0"\n  checksum: 10c0/d07226ef4f87daa01bd0fe80f8f310982e345f372926da2e5296aecc25c41cab440916bbaa4c5e1034b453af3392f67df5961124e4b586df1e99793a1374bdb2\n  languageName: node\n  linkType: hard\n\n"axios@npm:^1.12.0":\n  version: 1.12.2\n  resolution: "axios@npm:1.12.2"\n  dependencies:\n    follow-redirects: "npm:^1.15.6"\n    form-data: "npm:^4.0.4"\n    proxy-from-env: "npm:^1.1.0"\n  checksum: 10c0/80b063e318cf05cd33a4d991cea0162f3573481946f9129efb7766f38fde4c061c34f41a93a9f9521f02b7c9565ccbc197c099b0186543ac84a24580017adfed\n  languageName: node\n  linkType: hard\n\n"b4a@npm:^1.6.4":\n  version: 1.6.6\n  resolution: "b4a@npm:1.6.6"\n  checksum: 10c0/56f30277666cb511a15829e38d369b114df7dc8cec4cedc09cc5d685bc0f27cb63c7bcfb58e09a19a1b3c4f2541069ab078b5328542e85d74a39620327709a38\n  languageName: node\n  linkType: hard\n\n"balanced-match@npm:^1.0.0":\n  version: 1.0.2\n  resolution: "balanced-match@npm:1.0.2"\n  checksum: 10c0/9308baf0a7e4838a82bbfd11e01b1cb0f0cf2893bc1676c27c2a8c0e70cbae1c59120c3268517a8ae7fb6376b4639ef81ca22582611dbee4ed28df945134aaee\n  languageName: node\n  linkType: hard\n\n"bare-events@npm:^2.2.0":\n  version: 2.4.2\n  resolution: "bare-events@npm:2.4.2"\n  checksum: 10c0/09fa923061f31f815e83504e2ed4a8ba87732a01db40a7fae703dbb7eef7f05d99264b5e186074cbe9698213990d1af564c62cca07a5ff88baea8099ad9a6303\n  languageName: node\n  linkType: hard\n\n"base64-js@npm:^1.3.1":\n  version: 1.5.1\n  resolution: "base64-js@npm:1.5.1"\n  checksum: 10c0/f23823513b63173a001030fae4f2dabe283b99a9d324ade3ad3d148e218134676f1ee8568c877cd79ec1c53158dcf2d2ba527a97c606618928ba99dd930102bf\n  languageName: node\n  linkType: hard\n\n"bcrypt@npm:^5.1.1":\n  version: 5.1.1\n  resolution: "bcrypt@npm:5.1.1"\n  dependencies:\n    "@mapbox/node-pre-gyp": "npm:^1.0.11"\n    node-addon-api: "npm:^5.0.0"\n  checksum: 10c0/743231158c866bddc46f25eb8e9617fe38bc1a6f5f3052aba35e361d349b7f8fb80e96b45c48a4c23c45c29967ccd11c81cf31166454fc0ab019801c336cab40\n  languageName: node\n  linkType: hard\n\n"body-parser@npm:^1.20.3":\n  version: 1.20.3\n  resolution: "body-parser@npm:1.20.3"\n  dependencies:\n    bytes: "npm:3.1.2"\n    content-type: "npm:~1.0.5"\n    debug: "npm:2.6.9"\n    depd: "npm:2.0.0"\n    destroy: "npm:1.2.0"\n    http-errors: "npm:2.0.0"\n    iconv-lite: "npm:0.4.24"\n    on-finished: "npm:2.4.1"\n    qs: "npm:6.13.0"\n    raw-body: "npm:2.5.2"\n    type-is: "npm:~1.6.18"\n    unpipe: "npm:1.0.0"\n  checksum: 10c0/0a9a93b7518f222885498dcecaad528cf010dd109b071bf471c93def4bfe30958b83e03496eb9c1ad4896db543d999bb62be1a3087294162a88cfa1b42c16310\n  languageName: node\n  linkType: hard\n\n"brace-expansion@npm:^1.1.7":\n  version: 1.1.12\n  resolution: "brace-expansion@npm:1.1.12"\n  dependencies:\n    balanced-match: "npm:^1.0.0"\n    concat-map: "npm:0.0.1"\n  checksum: 10c0/975fecac2bb7758c062c20d0b3b6288c7cc895219ee25f0a64a9de662dbac981ff0b6e89909c3897c1f84fa353113a721923afdec5f8b2350255b097f12b1f73\n  languageName: node\n  linkType: hard\n\n"brace-expansion@npm:^2.0.1":\n  version: 2.0.2\n  resolution: "brace-expansion@npm:2.0.2"\n  dependencies:\n    balanced-match: "npm:^1.0.0"\n  checksum: 10c0/6d117a4c793488af86b83172deb6af143e94c17bc53b0b3cec259733923b4ca84679d506ac261f4ba3c7ed37c46018e2ff442f9ce453af8643ecd64f4a54e6cf\n  languageName: node\n  linkType: hard\n\n"buffer-crc32@npm:^1.0.0":\n  version: 1.0.0\n  resolution: "buffer-crc32@npm:1.0.0"\n  checksum: 10c0/8b86e161cee4bb48d5fa622cbae4c18f25e4857e5203b89e23de59e627ab26beb82d9d7999f2b8de02580165f61f83f997beaf02980cdf06affd175b651921ab\n  languageName: node\n  linkType: hard\n\n"buffer-equal-constant-time@npm:^1.0.1":\n  version: 1.0.1\n  resolution: "buffer-equal-constant-time@npm:1.0.1"\n  checksum: 10c0/fb2294e64d23c573d0dd1f1e7a466c3e978fe94a4e0f8183937912ca374619773bef8e2aceb854129d2efecbbc515bbd0cc78d2734a3e3031edb0888531bbc8e\n  languageName: node\n  linkType: hard\n\n"buffer@npm:^6.0.3":\n  version: 6.0.3\n  resolution: "buffer@npm:6.0.3"\n  dependencies:\n    base64-js: "npm:^1.3.1"\n    ieee754: "npm:^1.2.1"\n  checksum: 10c0/2a905fbbcde73cc5d8bd18d1caa23715d5f83a5935867c2329f0ac06104204ba7947be098fe1317fbd8830e26090ff8e764f08cd14fefc977bb248c3487bcbd0\n  languageName: node\n  linkType: hard\n\n"bytes@npm:3.1.2":\n  version: 3.1.2\n  resolution: "bytes@npm:3.1.2"\n  checksum: 10c0/76d1c43cbd602794ad8ad2ae94095cddeb1de78c5dddaa7005c51af10b0176c69971a6d88e805a90c2b6550d76636e43c40d8427a808b8645ede885de4a0358e\n  languageName: node\n  linkType: hard\n\n"cacache@npm:^18.0.0":\n  version: 18.0.4\n  resolution: "cacache@npm:18.0.4"\n  dependencies:\n    "@npmcli/fs": "npm:^3.1.0"\n    fs-minipass: "npm:^3.0.0"\n    glob: "npm:^10.2.2"\n    lru-cache: "npm:^10.0.1"\n    minipass: "npm:^7.0.3"\n    minipass-collect: "npm:^2.0.1"\n    minipass-flush: "npm:^1.0.5"\n    minipass-pipeline: "npm:^1.2.4"\n    p-map: "npm:^4.0.0"\n    ssri: "npm:^10.0.0"\n    tar: "npm:^6.1.11"\n    unique-filename: "npm:^3.0.0"\n  checksum: 10c0/6c055bafed9de4f3dcc64ac3dc7dd24e863210902b7c470eb9ce55a806309b3efff78033e3d8b4f7dcc5d467f2db43c6a2857aaaf26f0094b8a351d44c42179f\n  languageName: node\n  linkType: hard\n\n"call-bind-apply-helpers@npm:^1.0.1, call-bind-apply-helpers@npm:^1.0.2":\n  version: 1.0.2\n  resolution: "call-bind-apply-helpers@npm:1.0.2"\n  dependencies:\n    es-errors: "npm:^1.3.0"\n    function-bind: "npm:^1.1.2"\n  checksum: 10c0/47bd9901d57b857590431243fea704ff18078b16890a6b3e021e12d279bbf211d039155e27d7566b374d49ee1f8189344bac9833dec7a20cdec370506361c938\n  languageName: node\n  linkType: hard\n\n"call-bind@npm:^1.0.2, call-bind@npm:^1.0.5, call-bind@npm:^1.0.6, call-bind@npm:^1.0.7":\n  version: 1.0.7\n  resolution: "call-bind@npm:1.0.7"\n  dependencies:\n    es-define-property: "npm:^1.0.0"\n    es-errors: "npm:^1.3.0"\n    function-bind: "npm:^1.1.2"\n    get-intrinsic: "npm:^1.2.4"\n    set-function-length: "npm:^1.2.1"\n  checksum: 10c0/a3ded2e423b8e2a265983dba81c27e125b48eefb2655e7dfab6be597088da3d47c47976c24bc51b8fd9af1061f8f87b4ab78a314f3c77784b2ae2ba535ad8b8d\n  languageName: node\n  linkType: hard\n\n"call-bound@npm:^1.0.2":\n  version: 1.0.4\n  resolution: "call-bound@npm:1.0.4"\n  dependencies:\n    call-bind-apply-helpers: "npm:^1.0.2"\n    get-intrinsic: "npm:^1.3.0"\n  checksum: 10c0/f4796a6a0941e71c766aea672f63b72bc61234c4f4964dc6d7606e3664c307e7d77845328a8f3359ce39ddb377fed67318f9ee203dea1d47e46165dcf2917644\n  languageName: node\n  linkType: hard\n\n"chownr@npm:^2.0.0":\n  version: 2.0.0\n  resolution: "chownr@npm:2.0.0"\n  checksum: 10c0/594754e1303672171cc04e50f6c398ae16128eb134a88f801bf5354fd96f205320f23536a045d9abd8b51024a149696e51231565891d4efdab8846021ecf88e6\n  languageName: node\n  linkType: hard\n\n"clean-stack@npm:^2.0.0":\n  version: 2.2.0\n  resolution: "clean-stack@npm:2.2.0"\n  checksum: 10c0/1f90262d5f6230a17e27d0c190b09d47ebe7efdd76a03b5a1127863f7b3c9aec4c3e6c8bb3a7bbf81d553d56a1fd35728f5a8ef4c63f867ac8d690109742a8c1\n  languageName: node\n  linkType: hard\n\n"color-convert@npm:^1.9.3":\n  version: 1.9.3\n  resolution: "color-convert@npm:1.9.3"\n  dependencies:\n    color-name: "npm:1.1.3"\n  checksum: 10c0/5ad3c534949a8c68fca8fbc6f09068f435f0ad290ab8b2f76841b9e6af7e0bb57b98cb05b0e19fe33f5d91e5a8611ad457e5f69e0a484caad1f7487fd0e8253c\n  languageName: node\n  linkType: hard\n\n"color-convert@npm:^2.0.1":\n  version: 2.0.1\n  resolution: "color-convert@npm:2.0.1"\n  dependencies:\n    color-name: "npm:~1.1.4"\n  checksum: 10c0/37e1150172f2e311fe1b2df62c6293a342ee7380da7b9cfdba67ea539909afbd74da27033208d01d6d5cfc65ee7868a22e18d7e7648e004425441c0f8a15a7d7\n  languageName: node\n  linkType: hard\n\n"color-name@npm:1.1.3":\n  version: 1.1.3\n  resolution: "color-name@npm:1.1.3"\n  checksum: 10c0/566a3d42cca25b9b3cd5528cd7754b8e89c0eb646b7f214e8e2eaddb69994ac5f0557d9c175eb5d8f0ad73531140d9c47525085ee752a91a2ab15ab459caf6d6\n  languageName: node\n  linkType: hard\n\n"color-name@npm:^1.0.0, color-name@npm:~1.1.4":\n  version: 1.1.4\n  resolution: "color-name@npm:1.1.4"\n  checksum: 10c0/a1a3f914156960902f46f7f56bc62effc6c94e84b2cae157a526b1c1f74b677a47ec602bf68a61abfa2b42d15b7c5651c6dbe72a43af720bc588dff885b10f95\n  languageName: node\n  linkType: hard\n\n"color-string@npm:^1.6.0, color-string@npm:^1.9.0":\n  version: 1.9.1\n  resolution: "color-string@npm:1.9.1"\n  dependencies:\n    color-name: "npm:^1.0.0"\n    simple-swizzle: "npm:^0.2.2"\n  checksum: 10c0/b0bfd74c03b1f837f543898b512f5ea353f71630ccdd0d66f83028d1f0924a7d4272deb278b9aef376cacf1289b522ac3fb175e99895283645a2dc3a33af2404\n  languageName: node\n  linkType: hard\n\n"color-support@npm:^1.1.2":\n  version: 1.1.3\n  resolution: "color-support@npm:1.1.3"\n  bin:\n    color-support: bin.js\n  checksum: 10c0/8ffeaa270a784dc382f62d9be0a98581db43e11eee301af14734a6d089bd456478b1a8b3e7db7ca7dc5b18a75f828f775c44074020b51c05fc00e6d0992b1cc6\n  languageName: node\n  linkType: hard\n\n"color@npm:^3.1.3":\n  version: 3.2.1\n  resolution: "color@npm:3.2.1"\n  dependencies:\n    color-convert: "npm:^1.9.3"\n    color-string: "npm:^1.6.0"\n  checksum: 10c0/39345d55825884c32a88b95127d417a2c24681d8b57069413596d9fcbb721459ef9d9ec24ce3e65527b5373ce171b73e38dbcd9c830a52a6487e7f37bf00e83c\n  languageName: node\n  linkType: hard\n\n"color@npm:^4.2.3":\n  version: 4.2.3\n  resolution: "color@npm:4.2.3"\n  dependencies:\n    color-convert: "npm:^2.0.1"\n    color-string: "npm:^1.9.0"\n  checksum: 10c0/7fbe7cfb811054c808349de19fb380252e5e34e61d7d168ec3353e9e9aacb1802674bddc657682e4e9730c2786592a4de6f8283e7e0d3870b829bb0b7b2f6118\n  languageName: node\n  linkType: hard\n\n"colorspace@npm:1.1.x":\n  version: 1.1.4\n  resolution: "colorspace@npm:1.1.4"\n  dependencies:\n    color: "npm:^3.1.3"\n    text-hex: "npm:1.0.x"\n  checksum: 10c0/af5f91ff7f8e146b96e439ac20ed79b197210193bde721b47380a75b21751d90fa56390c773bb67c0aedd34ff85091883a437ab56861c779bd507d639ba7e123\n  languageName: node\n  linkType: hard\n\n"combined-stream@npm:^1.0.8":\n  version: 1.0.8\n  resolution: "combined-stream@npm:1.0.8"\n  dependencies:\n    delayed-stream: "npm:~1.0.0"\n  checksum: 10c0/0dbb829577e1b1e839fa82b40c07ffaf7de8a09b935cadd355a73652ae70a88b4320db322f6634a4ad93424292fa80973ac6480986247f1734a1137debf271d5\n  languageName: node\n  linkType: hard\n\n"compress-commons@npm:^6.0.2":\n  version: 6.0.2\n  resolution: "compress-commons@npm:6.0.2"\n  dependencies:\n    crc-32: "npm:^1.2.0"\n    crc32-stream: "npm:^6.0.0"\n    is-stream: "npm:^2.0.1"\n    normalize-path: "npm:^3.0.0"\n    readable-stream: "npm:^4.0.0"\n  checksum: 10c0/2347031b7c92c8ed5011b07b93ec53b298fa2cd1800897532ac4d4d1aeae06567883f481b6e35f13b65fc31b190c751df6635434d525562f0203fde76f1f0814\n  languageName: node\n  linkType: hard\n\n"concat-map@npm:0.0.1":\n  version: 0.0.1\n  resolution: "concat-map@npm:0.0.1"\n  checksum: 10c0/c996b1cfdf95b6c90fee4dae37e332c8b6eb7d106430c17d538034c0ad9a1630cb194d2ab37293b1bdd4d779494beee7786d586a50bd9376fd6f7bcc2bd4c98f\n  languageName: node\n  linkType: hard\n\n"console-control-strings@npm:^1.0.0, console-control-strings@npm:^1.1.0":\n  version: 1.1.0\n  resolution: "console-control-strings@npm:1.1.0"\n  checksum: 10c0/7ab51d30b52d461412cd467721bb82afe695da78fff8f29fe6f6b9cbaac9a2328e27a22a966014df9532100f6dd85370460be8130b9c677891ba36d96a343f50\n  languageName: node\n  linkType: hard\n\n"content-type@npm:~1.0.5":\n  version: 1.0.5\n  resolution: "content-type@npm:1.0.5"\n  checksum: 10c0/b76ebed15c000aee4678c3707e0860cb6abd4e680a598c0a26e17f0bfae723ec9cc2802f0ff1bc6e4d80603719010431d2231018373d4dde10f9ccff9dadf5af\n  languageName: node\n  linkType: hard\n\n"core-util-is@npm:~1.0.0":\n  version: 1.0.3\n  resolution: "core-util-is@npm:1.0.3"\n  checksum: 10c0/90a0e40abbddfd7618f8ccd63a74d88deea94e77d0e8dbbea059fa7ebebb8fbb4e2909667fe26f3a467073de1a542ebe6ae4c73a73745ac5833786759cd906c9\n  languageName: node\n  linkType: hard\n\n"crc-32@npm:^1.2.0":\n  version: 1.2.2\n  resolution: "crc-32@npm:1.2.2"\n  bin:\n    crc32: bin/crc32.njs\n  checksum: 10c0/11dcf4a2e77ee793835d49f2c028838eae58b44f50d1ff08394a610bfd817523f105d6ae4d9b5bef0aad45510f633eb23c903e9902e4409bed1ce70cb82b9bf0\n  languageName: node\n  linkType: hard\n\n"crc32-stream@npm:^6.0.0":\n  version: 6.0.0\n  resolution: "crc32-stream@npm:6.0.0"\n  dependencies:\n    crc-32: "npm:^1.2.0"\n    readable-stream: "npm:^4.0.0"\n  checksum: 10c0/bf9c84571ede2d119c2b4f3a9ef5eeb9ff94b588493c0d3862259af86d3679dcce1c8569dd2b0a6eff2f35f5e2081cc1263b846d2538d4054da78cf34f262a3d\n  languageName: node\n  linkType: hard\n\n"cross-spawn@npm:^7.0.0":\n  version: 7.0.6\n  resolution: "cross-spawn@npm:7.0.6"\n  dependencies:\n    path-key: "npm:^3.1.0"\n    shebang-command: "npm:^2.0.0"\n    which: "npm:^2.0.1"\n  checksum: 10c0/053ea8b2135caff68a9e81470e845613e374e7309a47731e81639de3eaeb90c3d01af0e0b44d2ab9d50b43467223b88567dfeb3262db942dc063b9976718ffc1\n  languageName: node\n  linkType: hard\n\n"debug@npm:2.6.9":\n  version: 2.6.9\n  resolution: "debug@npm:2.6.9"\n  dependencies:\n    ms: "npm:2.0.0"\n  checksum: 10c0/121908fb839f7801180b69a7e218a40b5a0b718813b886b7d6bdb82001b931c938e2941d1e4450f33a1b1df1da653f5f7a0440c197f29fbf8a6e9d45ff6ef589\n  languageName: node\n  linkType: hard\n\n"debug@npm:4, debug@npm:^4.3.4":\n  version: 4.3.6\n  resolution: "debug@npm:4.3.6"\n  dependencies:\n    ms: "npm:2.1.2"\n  peerDependenciesMeta:\n    supports-color:\n      optional: true\n  checksum: 10c0/3293416bff072389c101697d4611c402a6bacd1900ac20c0492f61a9cdd6b3b29750fc7f5e299f8058469ef60ff8fb79b86395a30374fbd2490113c1c7112285\n  languageName: node\n  linkType: hard\n\n"deep-equal@npm:^2.2.3":\n  version: 2.2.3\n  resolution: "deep-equal@npm:2.2.3"\n  dependencies:\n    array-buffer-byte-length: "npm:^1.0.0"\n    call-bind: "npm:^1.0.5"\n    es-get-iterator: "npm:^1.1.3"\n    get-intrinsic: "npm:^1.2.2"\n    is-arguments: "npm:^1.1.1"\n    is-array-buffer: "npm:^3.0.2"\n    is-date-object: "npm:^1.0.5"\n    is-regex: "npm:^1.1.4"\n    is-shared-array-buffer: "npm:^1.0.2"\n    isarray: "npm:^2.0.5"\n    object-is: "npm:^1.1.5"\n    object-keys: "npm:^1.1.1"\n    object.assign: "npm:^4.1.4"\n    regexp.prototype.flags: "npm:^1.5.1"\n    side-channel: "npm:^1.0.4"\n    which-boxed-primitive: "npm:^1.0.2"\n    which-collection: "npm:^1.0.1"\n    which-typed-array: "npm:^1.1.13"\n  checksum: 10c0/a48244f90fa989f63ff5ef0cc6de1e4916b48ea0220a9c89a378561960814794a5800c600254482a2c8fd2e49d6c2e196131dc983976adb024c94a42dfe4949f\n  languageName: node\n  linkType: hard\n\n"define-data-property@npm:^1.0.1, define-data-property@npm:^1.1.4":\n  version: 1.1.4\n  resolution: "define-data-property@npm:1.1.4"\n  dependencies:\n    es-define-property: "npm:^1.0.0"\n    es-errors: "npm:^1.3.0"\n    gopd: "npm:^1.0.1"\n  checksum: 10c0/dea0606d1483eb9db8d930d4eac62ca0fa16738b0b3e07046cddfacf7d8c868bbe13fa0cb263eb91c7d0d527960dc3f2f2471a69ed7816210307f6744fe62e37\n  languageName: node\n  linkType: hard\n\n"define-properties@npm:^1.2.1":\n  version: 1.2.1\n  resolution: "define-properties@npm:1.2.1"\n  dependencies:\n    define-data-property: "npm:^1.0.1"\n    has-property-descriptors: "npm:^1.0.0"\n    object-keys: "npm:^1.1.1"\n  checksum: 10c0/88a152319ffe1396ccc6ded510a3896e77efac7a1bfbaa174a7b00414a1747377e0bb525d303794a47cf30e805c2ec84e575758512c6e44a993076d29fd4e6c3\n  languageName: node\n  linkType: hard\n\n"delayed-stream@npm:~1.0.0":\n  version: 1.0.0\n  resolution: "delayed-stream@npm:1.0.0"\n  checksum: 10c0/d758899da03392e6712f042bec80aa293bbe9e9ff1b2634baae6a360113e708b91326594c8a486d475c69d6259afb7efacdc3537bfcda1c6c648e390ce601b19\n  languageName: node\n  linkType: hard\n\n"delegates@npm:^1.0.0":\n  version: 1.0.0\n  resolution: "delegates@npm:1.0.0"\n  checksum: 10c0/ba05874b91148e1db4bf254750c042bf2215febd23a6d3cda2e64896aef79745fbd4b9996488bd3cafb39ce19dbce0fd6e3b6665275638befffe1c9b312b91b5\n  languageName: node\n  linkType: hard\n\n"depd@npm:2.0.0":\n  version: 2.0.0\n  resolution: "depd@npm:2.0.0"\n  checksum: 10c0/58bd06ec20e19529b06f7ad07ddab60e504d9e0faca4bd23079fac2d279c3594334d736508dc350e06e510aba5e22e4594483b3a6562ce7c17dd797f4cc4ad2c\n  languageName: node\n  linkType: hard\n\n"destroy@npm:1.2.0":\n  version: 1.2.0\n  resolution: "destroy@npm:1.2.0"\n  checksum: 10c0/bd7633942f57418f5a3b80d5cb53898127bcf53e24cdf5d5f4396be471417671f0fee48a4ebe9a1e9defbde2a31280011af58a57e090ff822f589b443ed4e643\n  languageName: node\n  linkType: hard\n\n"detect-libc@npm:^2.0.0, detect-libc@npm:^2.0.3":\n  version: 2.0.3\n  resolution: "detect-libc@npm:2.0.3"\n  checksum: 10c0/88095bda8f90220c95f162bf92cad70bd0e424913e655c20578600e35b91edc261af27531cf160a331e185c0ced93944bc7e09939143225f56312d7fd800fdb7\n  languageName: node\n  linkType: hard\n\n"dunder-proto@npm:^1.0.1":\n  version: 1.0.1\n  resolution: "dunder-proto@npm:1.0.1"\n  dependencies:\n    call-bind-apply-helpers: "npm:^1.0.1"\n    es-errors: "npm:^1.3.0"\n    gopd: "npm:^1.2.0"\n  checksum: 10c0/199f2a0c1c16593ca0a145dbf76a962f8033ce3129f01284d48c45ed4e14fea9bbacd7b3610b6cdc33486cef20385ac054948fefc6272fcce645c09468f93031\n  languageName: node\n  linkType: hard\n\n"eastasianwidth@npm:^0.2.0":\n  version: 0.2.0\n  resolution: "eastasianwidth@npm:0.2.0"\n  checksum: 10c0/26f364ebcdb6395f95124fda411f63137a4bfb5d3a06453f7f23dfe52502905bd84e0488172e0f9ec295fdc45f05c23d5d91baf16bd26f0fe9acd777a188dc39\n  languageName: node\n  linkType: hard\n\n"ecdsa-sig-formatter@npm:1.0.11":\n  version: 1.0.11\n  resolution: "ecdsa-sig-formatter@npm:1.0.11"\n  dependencies:\n    safe-buffer: "npm:^5.0.1"\n  checksum: 10c0/ebfbf19d4b8be938f4dd4a83b8788385da353d63307ede301a9252f9f7f88672e76f2191618fd8edfc2f24679236064176fab0b78131b161ee73daa37125408c\n  languageName: node\n  linkType: hard\n\n"ee-first@npm:1.1.1":\n  version: 1.1.1\n  resolution: "ee-first@npm:1.1.1"\n  checksum: 10c0/b5bb125ee93161bc16bfe6e56c6b04de5ad2aa44234d8f644813cc95d861a6910903132b05093706de2b706599367c4130eb6d170f6b46895686b95f87d017b7\n  languageName: node\n  linkType: hard\n\n"emoji-regex@npm:^8.0.0":\n  version: 8.0.0\n  resolution: "emoji-regex@npm:8.0.0"\n  checksum: 10c0/b6053ad39951c4cf338f9092d7bfba448cdfd46fe6a2a034700b149ac9ffbc137e361cbd3c442297f86bed2e5f7576c1b54cc0a6bf8ef5106cc62f496af35010\n  languageName: node\n  linkType: hard\n\n"emoji-regex@npm:^9.2.2":\n  version: 9.2.2\n  resolution: "emoji-regex@npm:9.2.2"\n  checksum: 10c0/af014e759a72064cf66e6e694a7fc6b0ed3d8db680427b021a89727689671cefe9d04151b2cad51dbaf85d5ba790d061cd167f1cf32eb7b281f6368b3c181639\n  languageName: node\n  linkType: hard\n\n"enabled@npm:2.0.x":\n  version: 2.0.0\n  resolution: "enabled@npm:2.0.0"\n  checksum: 10c0/3b2c2af9bc7f8b9e291610f2dde4a75cf6ee52a68f4dd585482fbdf9a55d65388940e024e56d40bb03e05ef6671f5f53021fa8b72a20e954d7066ec28166713f\n  languageName: node\n  linkType: hard\n\n"encoding@npm:^0.1.13":\n  version: 0.1.13\n  resolution: "encoding@npm:0.1.13"\n  dependencies:\n    iconv-lite: "npm:^0.6.2"\n  checksum: 10c0/36d938712ff00fe1f4bac88b43bcffb5930c1efa57bbcdca9d67e1d9d6c57cfb1200fb01efe0f3109b2ce99b231f90779532814a81370a1bd3274a0f58585039\n  languageName: node\n  linkType: hard\n\n"env-paths@npm:^2.2.0":\n  version: 2.2.1\n  resolution: "env-paths@npm:2.2.1"\n  checksum: 10c0/285325677bf00e30845e330eec32894f5105529db97496ee3f598478e50f008c5352a41a30e5e72ec9de8a542b5a570b85699cd63bd2bc646dbcb9f311d83bc4\n  languageName: node\n  linkType: hard\n\n"err-code@npm:^2.0.2":\n  version: 2.0.3\n  resolution: "err-code@npm:2.0.3"\n  checksum: 10c0/b642f7b4dd4a376e954947550a3065a9ece6733ab8e51ad80db727aaae0817c2e99b02a97a3d6cecc648a97848305e728289cf312d09af395403a90c9d4d8a66\n  languageName: node\n  linkType: hard\n\n"es-define-property@npm:^1.0.0":\n  version: 1.0.0\n  resolution: "es-define-property@npm:1.0.0"\n  dependencies:\n    get-intrinsic: "npm:^1.2.4"\n  checksum: 10c0/6bf3191feb7ea2ebda48b577f69bdfac7a2b3c9bcf97307f55fd6ef1bbca0b49f0c219a935aca506c993d8c5d8bddd937766cb760cd5e5a1071351f2df9f9aa4\n  languageName: node\n  linkType: hard\n\n"es-define-property@npm:^1.0.1":\n  version: 1.0.1\n  resolution: "es-define-property@npm:1.0.1"\n  checksum: 10c0/3f54eb49c16c18707949ff25a1456728c883e81259f045003499efba399c08bad00deebf65cccde8c0e07908c1a225c9d472b7107e558f2a48e28d530e34527c\n  languageName: node\n  linkType: hard\n\n"es-errors@npm:^1.3.0":\n  version: 1.3.0\n  resolution: "es-errors@npm:1.3.0"\n  checksum: 10c0/0a61325670072f98d8ae3b914edab3559b6caa980f08054a3b872052640d91da01d38df55df797fcc916389d77fc92b8d5906cf028f4db46d7e3003abecbca85\n  languageName: node\n  linkType: hard\n\n"es-get-iterator@npm:^1.1.3":\n  version: 1.1.3\n  resolution: "es-get-iterator@npm:1.1.3"\n  dependencies:\n    call-bind: "npm:^1.0.2"\n    get-intrinsic: "npm:^1.1.3"\n    has-symbols: "npm:^1.0.3"\n    is-arguments: "npm:^1.1.1"\n    is-map: "npm:^2.0.2"\n    is-set: "npm:^2.0.2"\n    is-string: "npm:^1.0.7"\n    isarray: "npm:^2.0.5"\n    stop-iteration-iterator: "npm:^1.0.0"\n  checksum: 10c0/ebd11effa79851ea75d7f079405f9d0dc185559fd65d986c6afea59a0ff2d46c2ed8675f19f03dce7429d7f6c14ff9aede8d121fbab78d75cfda6a263030bac0\n  languageName: node\n  linkType: hard\n\n"es-object-atoms@npm:^1.0.0, es-object-atoms@npm:^1.1.1":\n  version: 1.1.1\n  resolution: "es-object-atoms@npm:1.1.1"\n  dependencies:\n    es-errors: "npm:^1.3.0"\n  checksum: 10c0/65364812ca4daf48eb76e2a3b7a89b3f6a2e62a1c420766ce9f692665a29d94fe41fe88b65f24106f449859549711e4b40d9fb8002d862dfd7eb1c512d10be0c\n  languageName: node\n  linkType: hard\n\n"es-set-tostringtag@npm:^2.1.0":\n  version: 2.1.0\n  resolution: "es-set-tostringtag@npm:2.1.0"\n  dependencies:\n    es-errors: "npm:^1.3.0"\n    get-intrinsic: "npm:^1.2.6"\n    has-tostringtag: "npm:^1.0.2"\n    hasown: "npm:^2.0.2"\n  checksum: 10c0/ef2ca9ce49afe3931cb32e35da4dcb6d86ab02592cfc2ce3e49ced199d9d0bb5085fc7e73e06312213765f5efa47cc1df553a6a5154584b21448e9fb8355b1af\n  languageName: node\n  linkType: hard\n\n"event-target-shim@npm:^5.0.0":\n  version: 5.0.1\n  resolution: "event-target-shim@npm:5.0.1"\n  checksum: 10c0/0255d9f936215fd206156fd4caa9e8d35e62075d720dc7d847e89b417e5e62cf1ce6c9b4e0a1633a9256de0efefaf9f8d26924b1f3c8620cffb9db78e7d3076b\n  languageName: node\n  linkType: hard\n\n"events@npm:^3.3.0":\n  version: 3.3.0\n  resolution: "events@npm:3.3.0"\n  checksum: 10c0/d6b6f2adbccbcda74ddbab52ed07db727ef52e31a61ed26db9feb7dc62af7fc8e060defa65e5f8af9449b86b52cc1a1f6a79f2eafcf4e62add2b7a1fa4a432f6\n  languageName: node\n  linkType: hard\n\n"exponential-backoff@npm:^3.1.1":\n  version: 3.1.1\n  resolution: "exponential-backoff@npm:3.1.1"\n  checksum: 10c0/160456d2d647e6019640bd07111634d8c353038d9fa40176afb7cd49b0548bdae83b56d05e907c2cce2300b81cae35d800ef92fefb9d0208e190fa3b7d6bb579\n  languageName: node\n  linkType: hard\n\n"fast-fifo@npm:^1.2.0, fast-fifo@npm:^1.3.2":\n  version: 1.3.2\n  resolution: "fast-fifo@npm:1.3.2"\n  checksum: 10c0/d53f6f786875e8b0529f784b59b4b05d4b5c31c651710496440006a398389a579c8dbcd2081311478b5bf77f4b0b21de69109c5a4eabea9d8e8783d1eb864e4c\n  languageName: node\n  linkType: hard\n\n"fecha@npm:^4.2.0":\n  version: 4.2.3\n  resolution: "fecha@npm:4.2.3"\n  checksum: 10c0/0e895965959cf6a22bb7b00f0bf546f2783836310f510ddf63f463e1518d4c96dec61ab33fdfd8e79a71b4856a7c865478ce2ee8498d560fe125947703c9b1cf\n  languageName: node\n  linkType: hard\n\n"fn.name@npm:1.x.x":\n  version: 1.1.0\n  resolution: "fn.name@npm:1.1.0"\n  checksum: 10c0/8ad62aa2d4f0b2a76d09dba36cfec61c540c13a0fd72e5d94164e430f987a7ce6a743112bbeb14877c810ef500d1f73d7f56e76d029d2e3413f20d79e3460a9a\n  languageName: node\n  linkType: hard\n\n"follow-redirects@npm:^1.15.6":\n  version: 1.15.6\n  resolution: "follow-redirects@npm:1.15.6"\n  peerDependenciesMeta:\n    debug:\n      optional: true\n  checksum: 10c0/9ff767f0d7be6aa6870c82ac79cf0368cd73e01bbc00e9eb1c2a16fbb198ec105e3c9b6628bb98e9f3ac66fe29a957b9645bcb9a490bb7aa0d35f908b6b85071\n  languageName: node\n  linkType: hard\n\n"for-each@npm:^0.3.3":\n  version: 0.3.3\n  resolution: "for-each@npm:0.3.3"\n  dependencies:\n    is-callable: "npm:^1.1.3"\n  checksum: 10c0/22330d8a2db728dbf003ec9182c2d421fbcd2969b02b4f97ec288721cda63eb28f2c08585ddccd0f77cb2930af8d958005c9e72f47141dc51816127a118f39aa\n  languageName: node\n  linkType: hard\n\n"foreground-child@npm:^3.1.0":\n  version: 3.3.0\n  resolution: "foreground-child@npm:3.3.0"\n  dependencies:\n    cross-spawn: "npm:^7.0.0"\n    signal-exit: "npm:^4.0.1"\n  checksum: 10c0/028f1d41000553fcfa6c4bb5c372963bf3d9bf0b1f25a87d1a6253014343fb69dfb1b42d9625d7cf44c8ba429940f3d0ff718b62105d4d4a4f6ef8ca0a53faa2\n  languageName: node\n  linkType: hard\n\n"form-data@npm:^4.0.4":\n  version: 4.0.4\n  resolution: "form-data@npm:4.0.4"\n  dependencies:\n    asynckit: "npm:^0.4.0"\n    combined-stream: "npm:^1.0.8"\n    es-set-tostringtag: "npm:^2.1.0"\n    hasown: "npm:^2.0.2"\n    mime-types: "npm:^2.1.12"\n  checksum: 10c0/373525a9a034b9d57073e55eab79e501a714ffac02e7a9b01be1c820780652b16e4101819785e1e18f8d98f0aee866cc654d660a435c378e16a72f2e7cac9695\n  languageName: node\n  linkType: hard\n\n"fs-minipass@npm:^2.0.0":\n  version: 2.1.0\n  resolution: "fs-minipass@npm:2.1.0"\n  dependencies:\n    minipass: "npm:^3.0.0"\n  checksum: 10c0/703d16522b8282d7299337539c3ed6edddd1afe82435e4f5b76e34a79cd74e488a8a0e26a636afc2440e1a23b03878e2122e3a2cfe375a5cf63c37d92b86a004\n  languageName: node\n  linkType: hard\n\n"fs-minipass@npm:^3.0.0":\n  version: 3.0.3\n  resolution: "fs-minipass@npm:3.0.3"\n  dependencies:\n    minipass: "npm:^7.0.3"\n  checksum: 10c0/63e80da2ff9b621e2cb1596abcb9207f1cf82b968b116ccd7b959e3323144cce7fb141462200971c38bbf2ecca51695069db45265705bed09a7cd93ae5b89f94\n  languageName: node\n  linkType: hard\n\n"fs.realpath@npm:^1.0.0":\n  version: 1.0.0\n  resolution: "fs.realpath@npm:1.0.0"\n  checksum: 10c0/444cf1291d997165dfd4c0d58b69f0e4782bfd9149fd72faa4fe299e68e0e93d6db941660b37dd29153bf7186672ececa3b50b7e7249477b03fdf850f287c948\n  languageName: node\n  linkType: hard\n\n"function-bind@npm:^1.1.2":\n  version: 1.1.2\n  resolution: "function-bind@npm:1.1.2"\n  checksum: 10c0/d8680ee1e5fcd4c197e4ac33b2b4dce03c71f4d91717292785703db200f5c21f977c568d28061226f9b5900cbcd2c84463646134fd5337e7925e0942bc3f46d5\n  languageName: node\n  linkType: hard\n\n"functions-have-names@npm:^1.2.3":\n  version: 1.2.3\n  resolution: "functions-have-names@npm:1.2.3"\n  checksum: 10c0/33e77fd29bddc2d9bb78ab3eb854c165909201f88c75faa8272e35899e2d35a8a642a15e7420ef945e1f64a9670d6aa3ec744106b2aa42be68ca5114025954ca\n  languageName: node\n  linkType: hard\n\n"gauge@npm:^3.0.0":\n  version: 3.0.2\n  resolution: "gauge@npm:3.0.2"\n  dependencies:\n    aproba: "npm:^1.0.3 || ^2.0.0"\n    color-support: "npm:^1.1.2"\n    console-control-strings: "npm:^1.0.0"\n    has-unicode: "npm:^2.0.1"\n    object-assign: "npm:^4.1.1"\n    signal-exit: "npm:^3.0.0"\n    string-width: "npm:^4.2.3"\n    strip-ansi: "npm:^6.0.1"\n    wide-align: "npm:^1.1.2"\n  checksum: 10c0/75230ccaf216471e31025c7d5fcea1629596ca20792de50c596eb18ffb14d8404f927cd55535aab2eeecd18d1e11bd6f23ec3c2e9878d2dda1dc74bccc34b913\n  languageName: node\n  linkType: hard\n\n"generator-function@npm:^2.0.0":\n  version: 2.0.1\n  resolution: "generator-function@npm:2.0.1"\n  checksum: 10c0/8a9f59df0f01cfefafdb3b451b80555e5cf6d76487095db91ac461a0e682e4ff7a9dbce15f4ecec191e53586d59eece01949e05a4b4492879600bbbe8e28d6b8\n  languageName: node\n  linkType: hard\n\n"get-intrinsic@npm:^1.1.3, get-intrinsic@npm:^1.2.1, get-intrinsic@npm:^1.2.2, get-intrinsic@npm:^1.2.4":\n  version: 1.2.4\n  resolution: "get-intrinsic@npm:1.2.4"\n  dependencies:\n    es-errors: "npm:^1.3.0"\n    function-bind: "npm:^1.1.2"\n    has-proto: "npm:^1.0.1"\n    has-symbols: "npm:^1.0.3"\n    hasown: "npm:^2.0.0"\n  checksum: 10c0/0a9b82c16696ed6da5e39b1267104475c47e3a9bdbe8b509dfe1710946e38a87be70d759f4bb3cda042d76a41ef47fe769660f3b7c0d1f68750299344ffb15b7\n  languageName: node\n  linkType: hard\n\n"get-intrinsic@npm:^1.2.5, get-intrinsic@npm:^1.2.6, get-intrinsic@npm:^1.3.0":\n  version: 1.3.1\n  resolution: "get-intrinsic@npm:1.3.1"\n  dependencies:\n    async-function: "npm:^1.0.0"\n    async-generator-function: "npm:^1.0.0"\n    call-bind-apply-helpers: "npm:^1.0.2"\n    es-define-property: "npm:^1.0.1"\n    es-errors: "npm:^1.3.0"\n    es-object-atoms: "npm:^1.1.1"\n    function-bind: "npm:^1.1.2"\n    generator-function: "npm:^2.0.0"\n    get-proto: "npm:^1.0.1"\n    gopd: "npm:^1.2.0"\n    has-symbols: "npm:^1.1.0"\n    hasown: "npm:^2.0.2"\n    math-intrinsics: "npm:^1.1.0"\n  checksum: 10c0/9f4ab0cf7efe0fd2c8185f52e6f637e708f3a112610c88869f8f041bb9ecc2ce44bf285dfdbdc6f4f7c277a5b88d8e94a432374d97cca22f3de7fc63795deb5d\n  languageName: node\n  linkType: hard\n\n"get-proto@npm:^1.0.1":\n  version: 1.0.1\n  resolution: "get-proto@npm:1.0.1"\n  dependencies:\n    dunder-proto: "npm:^1.0.1"\n    es-object-atoms: "npm:^1.0.0"\n  checksum: 10c0/9224acb44603c5526955e83510b9da41baf6ae73f7398875fba50edc5e944223a89c4a72b070fcd78beb5f7bdda58ecb6294adc28f7acfc0da05f76a2399643c\n  languageName: node\n  linkType: hard\n\n"glob@npm:^10.0.0, glob@npm:^10.2.2, glob@npm:^10.3.10":\n  version: 10.5.0\n  resolution: "glob@npm:10.5.0"\n  dependencies:\n    foreground-child: "npm:^3.1.0"\n    jackspeak: "npm:^3.1.2"\n    minimatch: "npm:^9.0.4"\n    minipass: "npm:^7.1.2"\n    package-json-from-dist: "npm:^1.0.0"\n    path-scurry: "npm:^1.11.1"\n  bin:\n    glob: dist/esm/bin.mjs\n  checksum: 10c0/100705eddbde6323e7b35e1d1ac28bcb58322095bd8e63a7d0bef1a2cdafe0d0f7922a981b2b48369a4f8c1b077be5c171804534c3509dfe950dde15fbe6d828\n  languageName: node\n  linkType: hard\n\n"glob@npm:^7.1.3":\n  version: 7.2.3\n  resolution: "glob@npm:7.2.3"\n  dependencies:\n    fs.realpath: "npm:^1.0.0"\n    inflight: "npm:^1.0.4"\n    inherits: "npm:2"\n    minimatch: "npm:^3.1.1"\n    once: "npm:^1.3.0"\n    path-is-absolute: "npm:^1.0.0"\n  checksum: 10c0/65676153e2b0c9095100fe7f25a778bf45608eeb32c6048cf307f579649bcc30353277b3b898a3792602c65764e5baa4f643714dfbdfd64ea271d210c7a425fe\n  languageName: node\n  linkType: hard\n\n"gopd@npm:^1.0.1":\n  version: 1.0.1\n  resolution: "gopd@npm:1.0.1"\n  dependencies:\n    get-intrinsic: "npm:^1.1.3"\n  checksum: 10c0/505c05487f7944c552cee72087bf1567debb470d4355b1335f2c262d218ebbff805cd3715448fe29b4b380bae6912561d0467233e4165830efd28da241418c63\n  languageName: node\n  linkType: hard\n\n"gopd@npm:^1.2.0":\n  version: 1.2.0\n  resolution: "gopd@npm:1.2.0"\n  checksum: 10c0/50fff1e04ba2b7737c097358534eacadad1e68d24cccee3272e04e007bed008e68d2614f3987788428fd192a5ae3889d08fb2331417e4fc4a9ab366b2043cead\n  languageName: node\n  linkType: hard\n\n"graceful-fs@npm:^4.2.0, graceful-fs@npm:^4.2.6":\n  version: 4.2.11\n  resolution: "graceful-fs@npm:4.2.11"\n  checksum: 10c0/386d011a553e02bc594ac2ca0bd6d9e4c22d7fa8cfbfc448a6d148c59ea881b092db9dbe3547ae4b88e55f1b01f7c4a2ecc53b310c042793e63aa44cf6c257f2\n  languageName: node\n  linkType: hard\n\n"has-bigints@npm:^1.0.1":\n  version: 1.0.2\n  resolution: "has-bigints@npm:1.0.2"\n  checksum: 10c0/724eb1485bfa3cdff6f18d95130aa190561f00b3fcf9f19dc640baf8176b5917c143b81ec2123f8cddb6c05164a198c94b13e1377c497705ccc8e1a80306e83b\n  languageName: node\n  linkType: hard\n\n"has-property-descriptors@npm:^1.0.0, has-property-descriptors@npm:^1.0.2":\n  version: 1.0.2\n  resolution: "has-property-descriptors@npm:1.0.2"\n  dependencies:\n    es-define-property: "npm:^1.0.0"\n  checksum: 10c0/253c1f59e80bb476cf0dde8ff5284505d90c3bdb762983c3514d36414290475fe3fd6f574929d84de2a8eec00d35cf07cb6776205ff32efd7c50719125f00236\n  languageName: node\n  linkType: hard\n\n"has-proto@npm:^1.0.1":\n  version: 1.0.3\n  resolution: "has-proto@npm:1.0.3"\n  checksum: 10c0/35a6989f81e9f8022c2f4027f8b48a552de714938765d019dbea6bb547bd49ce5010a3c7c32ec6ddac6e48fc546166a3583b128f5a7add8b058a6d8b4afec205\n  languageName: node\n  linkType: hard\n\n"has-symbols@npm:^1.0.2, has-symbols@npm:^1.0.3":\n  version: 1.0.3\n  resolution: "has-symbols@npm:1.0.3"\n  checksum: 10c0/e6922b4345a3f37069cdfe8600febbca791c94988c01af3394d86ca3360b4b93928bbf395859158f88099cb10b19d98e3bbab7c9ff2c1bd09cf665ee90afa2c3\n  languageName: node\n  linkType: hard\n\n"has-symbols@npm:^1.1.0":\n  version: 1.1.0\n  resolution: "has-symbols@npm:1.1.0"\n  checksum: 10c0/dde0a734b17ae51e84b10986e651c664379018d10b91b6b0e9b293eddb32f0f069688c841fb40f19e9611546130153e0a2a48fd7f512891fb000ddfa36f5a20e\n  languageName: node\n  linkType: hard\n\n"has-tostringtag@npm:^1.0.0, has-tostringtag@npm:^1.0.2":\n  version: 1.0.2\n  resolution: "has-tostringtag@npm:1.0.2"\n  dependencies:\n    has-symbols: "npm:^1.0.3"\n  checksum: 10c0/a8b166462192bafe3d9b6e420a1d581d93dd867adb61be223a17a8d6dad147aa77a8be32c961bb2f27b3ef893cae8d36f564ab651f5e9b7938ae86f74027c48c\n  languageName: node\n  linkType: hard\n\n"has-unicode@npm:^2.0.1":\n  version: 2.0.1\n  resolution: "has-unicode@npm:2.0.1"\n  checksum: 10c0/ebdb2f4895c26bb08a8a100b62d362e49b2190bcfd84b76bc4be1a3bd4d254ec52d0dd9f2fbcc093fc5eb878b20c52146f9dfd33e2686ed28982187be593b47c\n  languageName: node\n  linkType: hard\n\n"hasown@npm:^2.0.0, hasown@npm:^2.0.2":\n  version: 2.0.2\n  resolution: "hasown@npm:2.0.2"\n  dependencies:\n    function-bind: "npm:^1.1.2"\n  checksum: 10c0/3769d434703b8ac66b209a4cca0737519925bbdb61dd887f93a16372b14694c63ff4e797686d87c90f08168e81082248b9b028bad60d4da9e0d1148766f56eb9\n  languageName: node\n  linkType: hard\n\n"http-cache-semantics@npm:^4.1.1":\n  version: 4.1.1\n  resolution: "http-cache-semantics@npm:4.1.1"\n  checksum: 10c0/ce1319b8a382eb3cbb4a37c19f6bfe14e5bb5be3d09079e885e8c513ab2d3cd9214902f8a31c9dc4e37022633ceabfc2d697405deeaf1b8f3552bb4ed996fdfc\n  languageName: node\n  linkType: hard\n\n"http-errors@npm:2.0.0":\n  version: 2.0.0\n  resolution: "http-errors@npm:2.0.0"\n  dependencies:\n    depd: "npm:2.0.0"\n    inherits: "npm:2.0.4"\n    setprototypeof: "npm:1.2.0"\n    statuses: "npm:2.0.1"\n    toidentifier: "npm:1.0.1"\n  checksum: 10c0/fc6f2715fe188d091274b5ffc8b3657bd85c63e969daa68ccb77afb05b071a4b62841acb7a21e417b5539014dff2ebf9550f0b14a9ff126f2734a7c1387f8e19\n  languageName: node\n  linkType: hard\n\n"http-proxy-agent@npm:^7.0.0":\n  version: 7.0.2\n  resolution: "http-proxy-agent@npm:7.0.2"\n  dependencies:\n    agent-base: "npm:^7.1.0"\n    debug: "npm:^4.3.4"\n  checksum: 10c0/4207b06a4580fb85dd6dff521f0abf6db517489e70863dca1a0291daa7f2d3d2d6015a57bd702af068ea5cf9f1f6ff72314f5f5b4228d299c0904135d2aef921\n  languageName: node\n  linkType: hard\n\n"https-proxy-agent@npm:^5.0.0":\n  version: 5.0.1\n  resolution: "https-proxy-agent@npm:5.0.1"\n  dependencies:\n    agent-base: "npm:6"\n    debug: "npm:4"\n  checksum: 10c0/6dd639f03434003577c62b27cafdb864784ef19b2de430d8ae2a1d45e31c4fd60719e5637b44db1a88a046934307da7089e03d6089ec3ddacc1189d8de8897d1\n  languageName: node\n  linkType: hard\n\n"https-proxy-agent@npm:^7.0.1":\n  version: 7.0.5\n  resolution: "https-proxy-agent@npm:7.0.5"\n  dependencies:\n    agent-base: "npm:^7.0.2"\n    debug: "npm:4"\n  checksum: 10c0/2490e3acec397abeb88807db52cac59102d5ed758feee6df6112ab3ccd8325e8a1ce8bce6f4b66e5470eca102d31e425ace904242e4fa28dbe0c59c4bafa7b2c\n  languageName: node\n  linkType: hard\n\n"iconv-lite@npm:0.4.24":\n  version: 0.4.24\n  resolution: "iconv-lite@npm:0.4.24"\n  dependencies:\n    safer-buffer: "npm:>= 2.1.2 < 3"\n  checksum: 10c0/c6886a24cc00f2a059767440ec1bc00d334a89f250db8e0f7feb4961c8727118457e27c495ba94d082e51d3baca378726cd110aaf7ded8b9bbfd6a44760cf1d4\n  languageName: node\n  linkType: hard\n\n"iconv-lite@npm:^0.6.2":\n  version: 0.6.3\n  resolution: "iconv-lite@npm:0.6.3"\n  dependencies:\n    safer-buffer: "npm:>= 2.1.2 < 3.0.0"\n  checksum: 10c0/98102bc66b33fcf5ac044099d1257ba0b7ad5e3ccd3221f34dd508ab4070edff183276221684e1e0555b145fce0850c9f7d2b60a9fcac50fbb4ea0d6e845a3b1\n  languageName: node\n  linkType: hard\n\n"ieee754@npm:^1.2.1":\n  version: 1.2.1\n  resolution: "ieee754@npm:1.2.1"\n  checksum: 10c0/b0782ef5e0935b9f12883a2e2aa37baa75da6e66ce6515c168697b42160807d9330de9a32ec1ed73149aea02e0d822e572bca6f1e22bdcbd2149e13b050b17bb\n  languageName: node\n  linkType: hard\n\n"imurmurhash@npm:^0.1.4":\n  version: 0.1.4\n  resolution: "imurmurhash@npm:0.1.4"\n  checksum: 10c0/8b51313850dd33605c6c9d3fd9638b714f4c4c40250cff658209f30d40da60f78992fb2df5dabee4acf589a6a82bbc79ad5486550754bd9ec4e3fc0d4a57d6a6\n  languageName: node\n  linkType: hard\n\n"indent-string@npm:^4.0.0":\n  version: 4.0.0\n  resolution: "indent-string@npm:4.0.0"\n  checksum: 10c0/1e1904ddb0cb3d6cce7cd09e27a90184908b7a5d5c21b92e232c93579d314f0b83c246ffb035493d0504b1e9147ba2c9b21df0030f48673fba0496ecd698161f\n  languageName: node\n  linkType: hard\n\n"inflight@npm:^1.0.4":\n  version: 1.0.6\n  resolution: "inflight@npm:1.0.6"\n  dependencies:\n    once: "npm:^1.3.0"\n    wrappy: "npm:1"\n  checksum: 10c0/7faca22584600a9dc5b9fca2cd5feb7135ac8c935449837b315676b4c90aa4f391ec4f42240178244b5a34e8bede1948627fda392ca3191522fc46b34e985ab2\n  languageName: node\n  linkType: hard\n\n"inherits@npm:2, inherits@npm:2.0.4, inherits@npm:^2.0.3, inherits@npm:~2.0.3":\n  version: 2.0.4\n  resolution: "inherits@npm:2.0.4"\n  checksum: 10c0/4e531f648b29039fb7426fb94075e6545faa1eb9fe83c29f0b6d9e7263aceb4289d2d4557db0d428188eeb449cc7c5e77b0a0b2c4e248ff2a65933a0dee49ef2\n  languageName: node\n  linkType: hard\n\n"internal-slot@npm:^1.0.4":\n  version: 1.0.7\n  resolution: "internal-slot@npm:1.0.7"\n  dependencies:\n    es-errors: "npm:^1.3.0"\n    hasown: "npm:^2.0.0"\n    side-channel: "npm:^1.0.4"\n  checksum: 10c0/f8b294a4e6ea3855fc59551bbf35f2b832cf01fd5e6e2a97f5c201a071cc09b49048f856e484b67a6c721da5e55736c5b6ddafaf19e2dbeb4a3ff1821680de6c\n  languageName: node\n  linkType: hard\n\n"ip-address@npm:^9.0.5":\n  version: 9.0.5\n  resolution: "ip-address@npm:9.0.5"\n  dependencies:\n    jsbn: "npm:1.1.0"\n    sprintf-js: "npm:^1.1.3"\n  checksum: 10c0/331cd07fafcb3b24100613e4b53e1a2b4feab11e671e655d46dc09ee233da5011284d09ca40c4ecbdfe1d0004f462958675c224a804259f2f78d2465a87824bc\n  languageName: node\n  linkType: hard\n\n"is-arguments@npm:^1.1.1":\n  version: 1.1.1\n  resolution: "is-arguments@npm:1.1.1"\n  dependencies:\n    call-bind: "npm:^1.0.2"\n    has-tostringtag: "npm:^1.0.0"\n  checksum: 10c0/5ff1f341ee4475350adfc14b2328b38962564b7c2076be2f5bac7bd9b61779efba99b9f844a7b82ba7654adccf8e8eb19d1bb0cc6d1c1a085e498f6793d4328f\n  languageName: node\n  linkType: hard\n\n"is-array-buffer@npm:^3.0.2, is-array-buffer@npm:^3.0.4":\n  version: 3.0.4\n  resolution: "is-array-buffer@npm:3.0.4"\n  dependencies:\n    call-bind: "npm:^1.0.2"\n    get-intrinsic: "npm:^1.2.1"\n  checksum: 10c0/42a49d006cc6130bc5424eae113e948c146f31f9d24460fc0958f855d9d810e6fd2e4519bf19aab75179af9c298ea6092459d8cafdec523cd19e529b26eab860\n  languageName: node\n  linkType: hard\n\n"is-arrayish@npm:^0.3.1":\n  version: 0.3.2\n  resolution: "is-arrayish@npm:0.3.2"\n  checksum: 10c0/f59b43dc1d129edb6f0e282595e56477f98c40278a2acdc8b0a5c57097c9eff8fe55470493df5775478cf32a4dc8eaf6d3a749f07ceee5bc263a78b2434f6a54\n  languageName: node\n  linkType: hard\n\n"is-bigint@npm:^1.0.1":\n  version: 1.0.4\n  resolution: "is-bigint@npm:1.0.4"\n  dependencies:\n    has-bigints: "npm:^1.0.1"\n  checksum: 10c0/eb9c88e418a0d195ca545aff2b715c9903d9b0a5033bc5922fec600eb0c3d7b1ee7f882dbf2e0d5a6e694e42391be3683e4368737bd3c4a77f8ac293e7773696\n  languageName: node\n  linkType: hard\n\n"is-boolean-object@npm:^1.1.0":\n  version: 1.1.2\n  resolution: "is-boolean-object@npm:1.1.2"\n  dependencies:\n    call-bind: "npm:^1.0.2"\n    has-tostringtag: "npm:^1.0.0"\n  checksum: 10c0/6090587f8a8a8534c0f816da868bc94f32810f08807aa72fa7e79f7e11c466d281486ffe7a788178809c2aa71fe3e700b167fe80dd96dad68026bfff8ebf39f7\n  languageName: node\n  linkType: hard\n\n"is-callable@npm:^1.1.3":\n  version: 1.2.7\n  resolution: "is-callable@npm:1.2.7"\n  checksum: 10c0/ceebaeb9d92e8adee604076971dd6000d38d6afc40bb843ea8e45c5579b57671c3f3b50d7f04869618242c6cee08d1b67806a8cb8edaaaf7c0748b3720d6066f\n  languageName: node\n  linkType: hard\n\n"is-date-object@npm:^1.0.5":\n  version: 1.0.5\n  resolution: "is-date-object@npm:1.0.5"\n  dependencies:\n    has-tostringtag: "npm:^1.0.0"\n  checksum: 10c0/eed21e5dcc619c48ccef804dfc83a739dbb2abee6ca202838ee1bd5f760fe8d8a93444f0d49012ad19bb7c006186e2884a1b92f6e1c056da7fd23d0a9ad5992e\n  languageName: node\n  linkType: hard\n\n"is-fullwidth-code-point@npm:^3.0.0":\n  version: 3.0.0\n  resolution: "is-fullwidth-code-point@npm:3.0.0"\n  checksum: 10c0/bb11d825e049f38e04c06373a8d72782eee0205bda9d908cc550ccb3c59b99d750ff9537982e01733c1c94a58e35400661f57042158ff5e8f3e90cf936daf0fc\n  languageName: node\n  linkType: hard\n\n"is-lambda@npm:^1.0.1":\n  version: 1.0.1\n  resolution: "is-lambda@npm:1.0.1"\n  checksum: 10c0/85fee098ae62ba6f1e24cf22678805473c7afd0fb3978a3aa260e354cb7bcb3a5806cf0a98403188465efedec41ab4348e8e4e79305d409601323855b3839d4d\n  languageName: node\n  linkType: hard\n\n"is-map@npm:^2.0.2, is-map@npm:^2.0.3":\n  version: 2.0.3\n  resolution: "is-map@npm:2.0.3"\n  checksum: 10c0/2c4d431b74e00fdda7162cd8e4b763d6f6f217edf97d4f8538b94b8702b150610e2c64961340015fe8df5b1fcee33ccd2e9b62619c4a8a3a155f8de6d6d355fc\n  languageName: node\n  linkType: hard\n\n"is-number-object@npm:^1.0.4":\n  version: 1.0.7\n  resolution: "is-number-object@npm:1.0.7"\n  dependencies:\n    has-tostringtag: "npm:^1.0.0"\n  checksum: 10c0/aad266da1e530f1804a2b7bd2e874b4869f71c98590b3964f9d06cc9869b18f8d1f4778f838ecd2a11011bce20aeecb53cb269ba916209b79c24580416b74b1b\n  languageName: node\n  linkType: hard\n\n"is-regex@npm:^1.1.4":\n  version: 1.1.4\n  resolution: "is-regex@npm:1.1.4"\n  dependencies:\n    call-bind: "npm:^1.0.2"\n    has-tostringtag: "npm:^1.0.0"\n  checksum: 10c0/bb72aae604a69eafd4a82a93002058c416ace8cde95873589a97fc5dac96a6c6c78a9977d487b7b95426a8f5073969124dd228f043f9f604f041f32fcc465fc1\n  languageName: node\n  linkType: hard\n\n"is-set@npm:^2.0.2, is-set@npm:^2.0.3":\n  version: 2.0.3\n  resolution: "is-set@npm:2.0.3"\n  checksum: 10c0/f73732e13f099b2dc879c2a12341cfc22ccaca8dd504e6edae26484bd5707a35d503fba5b4daad530a9b088ced1ae6c9d8200fd92e09b428fe14ea79ce8080b7\n  languageName: node\n  linkType: hard\n\n"is-shared-array-buffer@npm:^1.0.2":\n  version: 1.0.3\n  resolution: "is-shared-array-buffer@npm:1.0.3"\n  dependencies:\n    call-bind: "npm:^1.0.7"\n  checksum: 10c0/adc11ab0acbc934a7b9e5e9d6c588d4ec6682f6fea8cda5180721704fa32927582ede5b123349e32517fdadd07958973d24716c80e7ab198970c47acc09e59c7\n  languageName: node\n  linkType: hard\n\n"is-stream@npm:^2.0.0, is-stream@npm:^2.0.1":\n  version: 2.0.1\n  resolution: "is-stream@npm:2.0.1"\n  checksum: 10c0/7c284241313fc6efc329b8d7f08e16c0efeb6baab1b4cd0ba579eb78e5af1aa5da11e68559896a2067cd6c526bd29241dda4eb1225e627d5aa1a89a76d4635a5\n  languageName: node\n  linkType: hard\n\n"is-string@npm:^1.0.5, is-string@npm:^1.0.7":\n  version: 1.0.7\n  resolution: "is-string@npm:1.0.7"\n  dependencies:\n    has-tostringtag: "npm:^1.0.0"\n  checksum: 10c0/905f805cbc6eedfa678aaa103ab7f626aac9ebbdc8737abb5243acaa61d9820f8edc5819106b8fcd1839e33db21de9f0116ae20de380c8382d16dc2a601921f6\n  languageName: node\n  linkType: hard\n\n"is-symbol@npm:^1.0.3":\n  version: 1.0.4\n  resolution: "is-symbol@npm:1.0.4"\n  dependencies:\n    has-symbols: "npm:^1.0.2"\n  checksum: 10c0/9381dd015f7c8906154dbcbf93fad769de16b4b961edc94f88d26eb8c555935caa23af88bda0c93a18e65560f6d7cca0fd5a3f8a8e1df6f1abbb9bead4502ef7\n  languageName: node\n  linkType: hard\n\n"is-weakmap@npm:^2.0.2":\n  version: 2.0.2\n  resolution: "is-weakmap@npm:2.0.2"\n  checksum: 10c0/443c35bb86d5e6cc5929cd9c75a4024bb0fff9586ed50b092f94e700b89c43a33b186b76dbc6d54f3d3d09ece689ab38dcdc1af6a482cbe79c0f2da0a17f1299\n  languageName: node\n  linkType: hard\n\n"is-weakset@npm:^2.0.3":\n  version: 2.0.3\n  resolution: "is-weakset@npm:2.0.3"\n  dependencies:\n    call-bind: "npm:^1.0.7"\n    get-intrinsic: "npm:^1.2.4"\n  checksum: 10c0/8ad6141b6a400e7ce7c7442a13928c676d07b1f315ab77d9912920bf5f4170622f43126f111615788f26c3b1871158a6797c862233124507db0bcc33a9537d1a\n  languageName: node\n  linkType: hard\n\n"isarray@npm:^2.0.5":\n  version: 2.0.5\n  resolution: "isarray@npm:2.0.5"\n  checksum: 10c0/4199f14a7a13da2177c66c31080008b7124331956f47bca57dd0b6ea9f11687aa25e565a2c7a2b519bc86988d10398e3049a1f5df13c9f6b7664154690ae79fd\n  languageName: node\n  linkType: hard\n\n"isarray@npm:~1.0.0":\n  version: 1.0.0\n  resolution: "isarray@npm:1.0.0"\n  checksum: 10c0/18b5be6669be53425f0b84098732670ed4e727e3af33bc7f948aac01782110eb9a18b3b329c5323bcdd3acdaae547ee077d3951317e7f133bff7105264b3003d\n  languageName: node\n  linkType: hard\n\n"isexe@npm:^2.0.0":\n  version: 2.0.0\n  resolution: "isexe@npm:2.0.0"\n  checksum: 10c0/228cfa503fadc2c31596ab06ed6aa82c9976eec2bfd83397e7eaf06d0ccf42cd1dfd6743bf9aeb01aebd4156d009994c5f76ea898d2832c1fe342da923ca457d\n  languageName: node\n  linkType: hard\n\n"isexe@npm:^3.1.1":\n  version: 3.1.1\n  resolution: "isexe@npm:3.1.1"\n  checksum: 10c0/9ec257654093443eb0a528a9c8cbba9c0ca7616ccb40abd6dde7202734d96bb86e4ac0d764f0f8cd965856aacbff2f4ce23e730dc19dfb41e3b0d865ca6fdcc7\n  languageName: node\n  linkType: hard\n\n"jackspeak@npm:^3.1.2":\n  version: 3.4.3\n  resolution: "jackspeak@npm:3.4.3"\n  dependencies:\n    "@isaacs/cliui": "npm:^8.0.2"\n    "@pkgjs/parseargs": "npm:^0.11.0"\n  dependenciesMeta:\n    "@pkgjs/parseargs":\n      optional: true\n  checksum: 10c0/6acc10d139eaefdbe04d2f679e6191b3abf073f111edf10b1de5302c97ec93fffeb2fdd8681ed17f16268aa9dd4f8c588ed9d1d3bffbbfa6e8bf897cbb3149b9\n  languageName: node\n  linkType: hard\n\n"jsbn@npm:1.1.0":\n  version: 1.1.0\n  resolution: "jsbn@npm:1.1.0"\n  checksum: 10c0/4f907fb78d7b712e11dea8c165fe0921f81a657d3443dde75359ed52eb2b5d33ce6773d97985a089f09a65edd80b11cb75c767b57ba47391fee4c969f7215c96\n  languageName: node\n  linkType: hard\n\n"jsonwebtoken@npm:^9.0.2":\n  version: 9.0.2\n  resolution: "jsonwebtoken@npm:9.0.2"\n  dependencies:\n    jws: "npm:^3.2.2"\n    lodash.includes: "npm:^4.3.0"\n    lodash.isboolean: "npm:^3.0.3"\n    lodash.isinteger: "npm:^4.0.4"\n    lodash.isnumber: "npm:^3.0.3"\n    lodash.isplainobject: "npm:^4.0.6"\n    lodash.isstring: "npm:^4.0.1"\n    lodash.once: "npm:^4.0.0"\n    ms: "npm:^2.1.1"\n    semver: "npm:^7.5.4"\n  checksum: 10c0/d287a29814895e866db2e5a0209ce730cbc158441a0e5a70d5e940eb0d28ab7498c6bf45029cc8b479639bca94056e9a7f254e2cdb92a2f5750c7f358657a131\n  languageName: node\n  linkType: hard\n\n"jwa@npm:^1.4.2":\n  version: 1.4.2\n  resolution: "jwa@npm:1.4.2"\n  dependencies:\n    buffer-equal-constant-time: "npm:^1.0.1"\n    ecdsa-sig-formatter: "npm:1.0.11"\n    safe-buffer: "npm:^5.0.1"\n  checksum: 10c0/210a544a42ca22203e8fc538835205155ba3af6a027753109f9258bdead33086bac3c25295af48ac1981f87f9c5f941bc8f70303670f54ea7dcaafb53993d92c\n  languageName: node\n  linkType: hard\n\n"jws@npm:^3.2.2":\n  version: 3.2.3\n  resolution: "jws@npm:3.2.3"\n  dependencies:\n    jwa: "npm:^1.4.2"\n    safe-buffer: "npm:^5.0.1"\n  checksum: 10c0/9fdf9d6783b1892ef413ef373cd351eacc847ba01deec6fbfea96830e93241863ccbee66f3b749fc2310c59b6db2209d3f4b52931c0c259b52b17de20715917f\n  languageName: node\n  linkType: hard\n\n"kuler@npm:^2.0.0":\n  version: 2.0.0\n  resolution: "kuler@npm:2.0.0"\n  checksum: 10c0/0a4e99d92ca373f8f74d1dc37931909c4d0d82aebc94cf2ba265771160fc12c8df34eaaac80805efbda367e2795cb1f1dd4c3d404b6b1cf38aec94035b503d2d\n  languageName: node\n  linkType: hard\n\n"lazystream@npm:^1.0.0":\n  version: 1.0.1\n  resolution: "lazystream@npm:1.0.1"\n  dependencies:\n    readable-stream: "npm:^2.0.5"\n  checksum: 10c0/ea4e509a5226ecfcc303ba6782cc269be8867d372b9bcbd625c88955df1987ea1a20da4643bf9270336415a398d33531ebf0d5f0d393b9283dc7c98bfcbd7b69\n  languageName: node\n  linkType: hard\n\n"lodash.camelcase@npm:^4.3.0":\n  version: 4.3.0\n  resolution: "lodash.camelcase@npm:4.3.0"\n  checksum: 10c0/fcba15d21a458076dd309fce6b1b4bf611d84a0ec252cb92447c948c533ac250b95d2e00955801ebc367e5af5ed288b996d75d37d2035260a937008e14eaf432\n  languageName: node\n  linkType: hard\n\n"lodash.chunk@npm:^4.2.0":\n  version: 4.2.0\n  resolution: "lodash.chunk@npm:4.2.0"\n  checksum: 10c0/f9f99969561ad2f62af1f9a96c5bd0af776f000292b0d8db3126c28eb3b32e210d7c31b49c18d0d7901869bd769057046dc134b60cfa0c2c4ce017823a26bb23\n  languageName: node\n  linkType: hard\n\n"lodash.compact@npm:^3.0.1":\n  version: 3.0.1\n  resolution: "lodash.compact@npm:3.0.1"\n  checksum: 10c0/9cc32065f1a9aa90bf3caa987fb7e00f8b90a49209e7f9f37c601e595f396a83ebe8f3328b2ef7f365cf822c9f21697527620c9c9c9734f107453b4c6c4dd810\n  languageName: node\n  linkType: hard\n\n"lodash.groupby@npm:^4.6.0":\n  version: 4.6.0\n  resolution: "lodash.groupby@npm:4.6.0"\n  checksum: 10c0/3d136cad438ad6c3a078984ef60e057a3498b1312aa3621b00246ecb99e8f2c4d447e2815460db7a0b661a4fe4e2eeee96c84cb661a824bad04b6cf1f7bc6e9b\n  languageName: node\n  linkType: hard\n\n"lodash.identity@npm:^3.0.0":\n  version: 3.0.0\n  resolution: "lodash.identity@npm:3.0.0"\n  checksum: 10c0/a09ca0f99ae495c353e4ac6888684397f3b5b0c5f7d13a866a3956b7b2aa779462c78c219a31d4aab255d027ac5e11e8c3d943e70956e2a3d42feea56a8e9c1c\n  languageName: node\n  linkType: hard\n\n"lodash.includes@npm:^4.3.0":\n  version: 4.3.0\n  resolution: "lodash.includes@npm:4.3.0"\n  checksum: 10c0/7ca498b9b75bf602d04e48c0adb842dfc7d90f77bcb2a91a2b2be34a723ad24bc1c8b3683ec6b2552a90f216c723cdea530ddb11a3320e08fa38265703978f4b\n  languageName: node\n  linkType: hard\n\n"lodash.isboolean@npm:^3.0.3":\n  version: 3.0.3\n  resolution: "lodash.isboolean@npm:3.0.3"\n  checksum: 10c0/0aac604c1ef7e72f9a6b798e5b676606042401dd58e49f051df3cc1e3adb497b3d7695635a5cbec4ae5f66456b951fdabe7d6b387055f13267cde521f10ec7f7\n  languageName: node\n  linkType: hard\n\n"lodash.isempty@npm:^4.4.0":\n  version: 4.4.0\n  resolution: "lodash.isempty@npm:4.4.0"\n  checksum: 10c0/6c7eaa0802398736809b9e8aed8b8ac1abca9be71788fd719ba9d7f5b4c23e8dc63b7f049df4131713dda30a2fdedc2f655268e9deb8cd5a985dfc934afca194\n  languageName: node\n  linkType: hard\n\n"lodash.isequal@npm:^4.5.0":\n  version: 4.5.0\n  resolution: "lodash.isequal@npm:4.5.0"\n  checksum: 10c0/dfdb2356db19631a4b445d5f37868a095e2402292d59539a987f134a8778c62a2810c2452d11ae9e6dcac71fc9de40a6fedcb20e2952a15b431ad8b29e50e28f\n  languageName: node\n  linkType: hard\n\n"lodash.isinteger@npm:^4.0.4":\n  version: 4.0.4\n  resolution: "lodash.isinteger@npm:4.0.4"\n  checksum: 10c0/4c3e023a2373bf65bf366d3b8605b97ec830bca702a926939bcaa53f8e02789b6a176e7f166b082f9365bfec4121bfeb52e86e9040cb8d450e64c858583f61b7\n  languageName: node\n  linkType: hard\n\n"lodash.isnumber@npm:^3.0.3":\n  version: 3.0.3\n  resolution: "lodash.isnumber@npm:3.0.3"\n  checksum: 10c0/2d01530513a1ee4f72dd79528444db4e6360588adcb0e2ff663db2b3f642d4bb3d687051ae1115751ca9082db4fdef675160071226ca6bbf5f0c123dbf0aa12d\n  languageName: node\n  linkType: hard\n\n"lodash.isobject@npm:^3.0.2":\n  version: 3.0.2\n  resolution: "lodash.isobject@npm:3.0.2"\n  checksum: 10c0/da4c8480d98b16835b59380b2fbd43c54081acd9466febb788ba77c434384349e0bec162d1c4e89f613f21687b2b6d8384d8a112b80da00c78d28d9915a5cdde\n  languageName: node\n  linkType: hard\n\n"lodash.isplainobject@npm:^4.0.6":\n  version: 4.0.6\n  resolution: "lodash.isplainobject@npm:4.0.6"\n  checksum: 10c0/afd70b5c450d1e09f32a737bed06ff85b873ecd3d3d3400458725283e3f2e0bb6bf48e67dbe7a309eb371a822b16a26cca4a63c8c52db3fc7dc9d5f9dd324cbb\n  languageName: node\n  linkType: hard\n\n"lodash.isstring@npm:^4.0.1":\n  version: 4.0.1\n  resolution: "lodash.isstring@npm:4.0.1"\n  checksum: 10c0/09eaf980a283f9eef58ef95b30ec7fee61df4d6bf4aba3b5f096869cc58f24c9da17900febc8ffd67819b4e29de29793190e88dc96983db92d84c95fa85d1c92\n  languageName: node\n  linkType: hard\n\n"lodash.kebabcase@npm:^4.1.1":\n  version: 4.1.1\n  resolution: "lodash.kebabcase@npm:4.1.1"\n  checksum: 10c0/da5d8f41dbb5bc723d4bf9203d5096ca8da804d6aec3d2b56457156ba6c8d999ff448d347ebd97490da853cb36696ea4da09a431499f1ee8deb17b094ecf4e33\n  languageName: node\n  linkType: hard\n\n"lodash.mapvalues@npm:^4.6.0":\n  version: 4.6.0\n  resolution: "lodash.mapvalues@npm:4.6.0"\n  checksum: 10c0/a976bfc3923d4d8d2034e049ec4700e3aaf141a6143c973d06be3b2c87697923cd0158ee770484ad1af52dfed93ae90d2b76268413db95a42a2f46d7e1754828\n  languageName: node\n  linkType: hard\n\n"lodash.merge@npm:^4.6.2":\n  version: 4.6.2\n  resolution: "lodash.merge@npm:4.6.2"\n  checksum: 10c0/402fa16a1edd7538de5b5903a90228aa48eb5533986ba7fa26606a49db2572bf414ff73a2c9f5d5fd36b31c46a5d5c7e1527749c07cbcf965ccff5fbdf32c506\n  languageName: node\n  linkType: hard\n\n"lodash.omit@npm:^4.5.0":\n  version: 4.5.0\n  resolution: "lodash.omit@npm:4.5.0"\n  checksum: 10c0/3808b9b6faae35177174b6ab327f1177e29c91f1e98dcbccf13a72a6767bba337306449d537a4e0d8a33d2673f10d39bc732e30c4b803274ea0c1168ea60e549\n  languageName: node\n  linkType: hard\n\n"lodash.once@npm:^4.0.0":\n  version: 4.1.1\n  resolution: "lodash.once@npm:4.1.1"\n  checksum: 10c0/46a9a0a66c45dd812fcc016e46605d85ad599fe87d71a02f6736220554b52ffbe82e79a483ad40f52a8a95755b0d1077fba259da8bfb6694a7abbf4a48f1fc04\n  languageName: node\n  linkType: hard\n\n"lodash.pickby@npm:^4.6.0":\n  version: 4.6.0\n  resolution: "lodash.pickby@npm:4.6.0"\n  checksum: 10c0/46befadb64ab0f61159977174b291f87b005cec1c7bd73d1b6949ec4cdff483c1be0e34398df8955b76ce06a3e93a4a5c5a552a4299520390d6993c5420c7ab9\n  languageName: node\n  linkType: hard\n\n"lodash.snakecase@npm:^4.1.1":\n  version: 4.1.1\n  resolution: "lodash.snakecase@npm:4.1.1"\n  checksum: 10c0/f0b3f2497eb20eea1a1cfc22d645ecaeb78ac14593eb0a40057977606d2f35f7aaff0913a06553c783b535aafc55b718f523f9eb78f8d5293f492af41002eaf9\n  languageName: node\n  linkType: hard\n\n"lodash.upperfirst@npm:^4.3.1":\n  version: 4.3.1\n  resolution: "lodash.upperfirst@npm:4.3.1"\n  checksum: 10c0/435625da4b3ee74e7a1367a780d9107ab0b13ef4359fc074b2a1a40458eb8d91b655af62f6795b7138d493303a98c0285340160341561d6896e4947e077fa975\n  languageName: node\n  linkType: hard\n\n"lodash@npm:^4.17.15":\n  version: 4.17.21\n  resolution: "lodash@npm:4.17.21"\n  checksum: 10c0/d8cbea072bb08655bb4c989da418994b073a608dffa608b09ac04b43a791b12aeae7cd7ad919aa4c925f33b48490b5cfe6c1f71d827956071dae2e7bb3a6b74c\n  languageName: node\n  linkType: hard\n\n"logform@npm:^2.6.0, logform@npm:^2.6.1":\n  version: 2.6.1\n  resolution: "logform@npm:2.6.1"\n  dependencies:\n    "@colors/colors": "npm:1.6.0"\n    "@types/triple-beam": "npm:^1.3.2"\n    fecha: "npm:^4.2.0"\n    ms: "npm:^2.1.1"\n    safe-stable-stringify: "npm:^2.3.1"\n    triple-beam: "npm:^1.3.0"\n  checksum: 10c0/c20019336b1da8c08adea67dd7de2b0effdc6e35289c0156722924b571df94ba9f900ef55620c56bceb07cae7cc46057c9859accdee37a131251ba34d6789bce\n  languageName: node\n  linkType: hard\n\n"lru-cache@npm:^10.0.1, lru-cache@npm:^10.2.0":\n  version: 10.4.3\n  resolution: "lru-cache@npm:10.4.3"\n  checksum: 10c0/ebd04fbca961e6c1d6c0af3799adcc966a1babe798f685bb84e6599266599cd95d94630b10262f5424539bc4640107e8a33aa28585374abf561d30d16f4b39fb\n  languageName: node\n  linkType: hard\n\n"make-dir@npm:^3.1.0":\n  version: 3.1.0\n  resolution: "make-dir@npm:3.1.0"\n  dependencies:\n    semver: "npm:^6.0.0"\n  checksum: 10c0/56aaafefc49c2dfef02c5c95f9b196c4eb6988040cf2c712185c7fe5c99b4091591a7fc4d4eafaaefa70ff763a26f6ab8c3ff60b9e75ea19876f49b18667ecaa\n  languageName: node\n  linkType: hard\n\n"make-fetch-happen@npm:^13.0.0":\n  version: 13.0.1\n  resolution: "make-fetch-happen@npm:13.0.1"\n  dependencies:\n    "@npmcli/agent": "npm:^2.0.0"\n    cacache: "npm:^18.0.0"\n    http-cache-semantics: "npm:^4.1.1"\n    is-lambda: "npm:^1.0.1"\n    minipass: "npm:^7.0.2"\n    minipass-fetch: "npm:^3.0.0"\n    minipass-flush: "npm:^1.0.5"\n    minipass-pipeline: "npm:^1.2.4"\n    negotiator: "npm:^0.6.3"\n    proc-log: "npm:^4.2.0"\n    promise-retry: "npm:^2.0.1"\n    ssri: "npm:^10.0.0"\n  checksum: 10c0/df5f4dbb6d98153b751bccf4dc4cc500de85a96a9331db9805596c46aa9f99d9555983954e6c1266d9f981ae37a9e4647f42b9a4bb5466f867f4012e582c9e7e\n  languageName: node\n  linkType: hard\n\n"math-intrinsics@npm:^1.1.0":\n  version: 1.1.0\n  resolution: "math-intrinsics@npm:1.1.0"\n  checksum: 10c0/7579ff94e899e2f76ab64491d76cf606274c874d8f2af4a442c016bd85688927fcfca157ba6bf74b08e9439dc010b248ce05b96cc7c126a354c3bae7fcb48b7f\n  languageName: node\n  linkType: hard\n\n"media-typer@npm:0.3.0":\n  version: 0.3.0\n  resolution: "media-typer@npm:0.3.0"\n  checksum: 10c0/d160f31246907e79fed398470285f21bafb45a62869dc469b1c8877f3f064f5eabc4bcc122f9479b8b605bc5c76187d7871cf84c4ee3ecd3e487da1993279928\n  languageName: node\n  linkType: hard\n\n"mime-db@npm:1.52.0":\n  version: 1.52.0\n  resolution: "mime-db@npm:1.52.0"\n  checksum: 10c0/0557a01deebf45ac5f5777fe7740b2a5c309c6d62d40ceab4e23da9f821899ce7a900b7ac8157d4548ddbb7beffe9abc621250e6d182b0397ec7f10c7b91a5aa\n  languageName: node\n  linkType: hard\n\n"mime-types@npm:^2.1.12, mime-types@npm:~2.1.24":\n  version: 2.1.35\n  resolution: "mime-types@npm:2.1.35"\n  dependencies:\n    mime-db: "npm:1.52.0"\n  checksum: 10c0/82fb07ec56d8ff1fc999a84f2f217aa46cb6ed1033fefaabd5785b9a974ed225c90dc72fff460259e66b95b73648596dbcc50d51ed69cdf464af2d237d3149b2\n  languageName: node\n  linkType: hard\n\n"minimatch@npm:^3.1.1":\n  version: 3.1.2\n  resolution: "minimatch@npm:3.1.2"\n  dependencies:\n    brace-expansion: "npm:^1.1.7"\n  checksum: 10c0/0262810a8fc2e72cca45d6fd86bd349eee435eb95ac6aa45c9ea2180e7ee875ef44c32b55b5973ceabe95ea12682f6e3725cbb63d7a2d1da3ae1163c8b210311\n  languageName: node\n  linkType: hard\n\n"minimatch@npm:^5.1.0":\n  version: 5.1.6\n  resolution: "minimatch@npm:5.1.6"\n  dependencies:\n    brace-expansion: "npm:^2.0.1"\n  checksum: 10c0/3defdfd230914f22a8da203747c42ee3c405c39d4d37ffda284dac5e45b7e1f6c49aa8be606509002898e73091ff2a3bbfc59c2c6c71d4660609f63aa92f98e3\n  languageName: node\n  linkType: hard\n\n"minimatch@npm:^9.0.4":\n  version: 9.0.5\n  resolution: "minimatch@npm:9.0.5"\n  dependencies:\n    brace-expansion: "npm:^2.0.1"\n  checksum: 10c0/de96cf5e35bdf0eab3e2c853522f98ffbe9a36c37797778d2665231ec1f20a9447a7e567cb640901f89e4daaa95ae5d70c65a9e8aa2bb0019b6facbc3c0575ed\n  languageName: node\n  linkType: hard\n\n"minipass-collect@npm:^2.0.1":\n  version: 2.0.1\n  resolution: "minipass-collect@npm:2.0.1"\n  dependencies:\n    minipass: "npm:^7.0.3"\n  checksum: 10c0/5167e73f62bb74cc5019594709c77e6a742051a647fe9499abf03c71dca75515b7959d67a764bdc4f8b361cf897fbf25e2d9869ee039203ed45240f48b9aa06e\n  languageName: node\n  linkType: hard\n\n"minipass-fetch@npm:^3.0.0":\n  version: 3.0.5\n  resolution: "minipass-fetch@npm:3.0.5"\n  dependencies:\n    encoding: "npm:^0.1.13"\n    minipass: "npm:^7.0.3"\n    minipass-sized: "npm:^1.0.3"\n    minizlib: "npm:^2.1.2"\n  dependenciesMeta:\n    encoding:\n      optional: true\n  checksum: 10c0/9d702d57f556274286fdd97e406fc38a2f5c8d15e158b498d7393b1105974b21249289ec571fa2b51e038a4872bfc82710111cf75fae98c662f3d6f95e72152b\n  languageName: node\n  linkType: hard\n\n"minipass-flush@npm:^1.0.5":\n  version: 1.0.5\n  resolution: "minipass-flush@npm:1.0.5"\n  dependencies:\n    minipass: "npm:^3.0.0"\n  checksum: 10c0/2a51b63feb799d2bb34669205eee7c0eaf9dce01883261a5b77410c9408aa447e478efd191b4de6fc1101e796ff5892f8443ef20d9544385819093dbb32d36bd\n  languageName: node\n  linkType: hard\n\n"minipass-pipeline@npm:^1.2.4":\n  version: 1.2.4\n  resolution: "minipass-pipeline@npm:1.2.4"\n  dependencies:\n    minipass: "npm:^3.0.0"\n  checksum: 10c0/cbda57cea20b140b797505dc2cac71581a70b3247b84480c1fed5ca5ba46c25ecc25f68bfc9e6dcb1a6e9017dab5c7ada5eab73ad4f0a49d84e35093e0c643f2\n  languageName: node\n  linkType: hard\n\n"minipass-sized@npm:^1.0.3":\n  version: 1.0.3\n  resolution: "minipass-sized@npm:1.0.3"\n  dependencies:\n    minipass: "npm:^3.0.0"\n  checksum: 10c0/298f124753efdc745cfe0f2bdfdd81ba25b9f4e753ca4a2066eb17c821f25d48acea607dfc997633ee5bf7b6dfffb4eee4f2051eb168663f0b99fad2fa4829cb\n  languageName: node\n  linkType: hard\n\n"minipass@npm:^3.0.0":\n  version: 3.3.6\n  resolution: "minipass@npm:3.3.6"\n  dependencies:\n    yallist: "npm:^4.0.0"\n  checksum: 10c0/a114746943afa1dbbca8249e706d1d38b85ed1298b530f5808ce51f8e9e941962e2a5ad2e00eae7dd21d8a4aae6586a66d4216d1a259385e9d0358f0c1eba16c\n  languageName: node\n  linkType: hard\n\n"minipass@npm:^5.0.0":\n  version: 5.0.0\n  resolution: "minipass@npm:5.0.0"\n  checksum: 10c0/a91d8043f691796a8ac88df039da19933ef0f633e3d7f0d35dcd5373af49131cf2399bfc355f41515dc495e3990369c3858cd319e5c2722b4753c90bf3152462\n  languageName: node\n  linkType: hard\n\n"minipass@npm:^5.0.0 || ^6.0.2 || ^7.0.0, minipass@npm:^7.0.2, minipass@npm:^7.0.3, minipass@npm:^7.1.2":\n  version: 7.1.2\n  resolution: "minipass@npm:7.1.2"\n  checksum: 10c0/b0fd20bb9fb56e5fa9a8bfac539e8915ae07430a619e4b86ff71f5fc757ef3924b23b2c4230393af1eda647ed3d75739e4e0acb250a6b1eb277cf7f8fe449557\n  languageName: node\n  linkType: hard\n\n"minizlib@npm:^2.1.1, minizlib@npm:^2.1.2":\n  version: 2.1.2\n  resolution: "minizlib@npm:2.1.2"\n  dependencies:\n    minipass: "npm:^3.0.0"\n    yallist: "npm:^4.0.0"\n  checksum: 10c0/64fae024e1a7d0346a1102bb670085b17b7f95bf6cfdf5b128772ec8faf9ea211464ea4add406a3a6384a7d87a0cd1a96263692134323477b4fb43659a6cab78\n  languageName: node\n  linkType: hard\n\n"mkdirp@npm:^1.0.3":\n  version: 1.0.4\n  resolution: "mkdirp@npm:1.0.4"\n  bin:\n    mkdirp: bin/cmd.js\n  checksum: 10c0/46ea0f3ffa8bc6a5bc0c7081ffc3907777f0ed6516888d40a518c5111f8366d97d2678911ad1a6882bf592fa9de6c784fea32e1687bb94e1f4944170af48a5cf\n  languageName: node\n  linkType: hard\n\n"ms@npm:2.0.0":\n  version: 2.0.0\n  resolution: "ms@npm:2.0.0"\n  checksum: 10c0/f8fda810b39fd7255bbdc451c46286e549794fcc700dc9cd1d25658bbc4dc2563a5de6fe7c60f798a16a60c6ceb53f033cb353f493f0cf63e5199b702943159d\n  languageName: node\n  linkType: hard\n\n"ms@npm:2.1.2":\n  version: 2.1.2\n  resolution: "ms@npm:2.1.2"\n  checksum: 10c0/a437714e2f90dbf881b5191d35a6db792efbca5badf112f87b9e1c712aace4b4b9b742dd6537f3edf90fd6f684de897cec230abde57e87883766712ddda297cc\n  languageName: node\n  linkType: hard\n\n"ms@npm:^2.1.1":\n  version: 2.1.3\n  resolution: "ms@npm:2.1.3"\n  checksum: 10c0/d924b57e7312b3b63ad21fc5b3dc0af5e78d61a1fc7cfb5457edaf26326bf62be5307cc87ffb6862ef1c2b33b0233cdb5d4f01c4c958cc0d660948b65a287a48\n  languageName: node\n  linkType: hard\n\n"negotiator@npm:^0.6.3":\n  version: 0.6.3\n  resolution: "negotiator@npm:0.6.3"\n  checksum: 10c0/3ec9fd413e7bf071c937ae60d572bc67155262068ed522cf4b3be5edbe6ddf67d095ec03a3a14ebf8fc8e95f8e1d61be4869db0dbb0de696f6b837358bd43fc2\n  languageName: node\n  linkType: hard\n\n"node-addon-api@npm:^5.0.0":\n  version: 5.1.0\n  resolution: "node-addon-api@npm:5.1.0"\n  dependencies:\n    node-gyp: "npm:latest"\n  checksum: 10c0/0eb269786124ba6fad9df8007a149e03c199b3e5a3038125dfb3e747c2d5113d406a4e33f4de1ea600aa2339be1f137d55eba1a73ee34e5fff06c52a5c296d1d\n  languageName: node\n  linkType: hard\n\n"node-fetch@npm:^2.6.7":\n  version: 2.7.0\n  resolution: "node-fetch@npm:2.7.0"\n  dependencies:\n    whatwg-url: "npm:^5.0.0"\n  peerDependencies:\n    encoding: ^0.1.0\n  peerDependenciesMeta:\n    encoding:\n      optional: true\n  checksum: 10c0/b55786b6028208e6fbe594ccccc213cab67a72899c9234eb59dba51062a299ea853210fcf526998eaa2867b0963ad72338824450905679ff0fa304b8c5093ae8\n  languageName: node\n  linkType: hard\n\n"node-gyp@npm:latest":\n  version: 10.2.0\n  resolution: "node-gyp@npm:10.2.0"\n  dependencies:\n    env-paths: "npm:^2.2.0"\n    exponential-backoff: "npm:^3.1.1"\n    glob: "npm:^10.3.10"\n    graceful-fs: "npm:^4.2.6"\n    make-fetch-happen: "npm:^13.0.0"\n    nopt: "npm:^7.0.0"\n    proc-log: "npm:^4.1.0"\n    semver: "npm:^7.3.5"\n    tar: "npm:^6.2.1"\n    which: "npm:^4.0.0"\n  bin:\n    node-gyp: bin/node-gyp.js\n  checksum: 10c0/00630d67dbd09a45aee0a5d55c05e3916ca9e6d427ee4f7bc392d2d3dc5fad7449b21fc098dd38260a53d9dcc9c879b36704a1994235d4707e7271af7e9a835b\n  languageName: node\n  linkType: hard\n\n"nodemailer@npm:^7.0.11":\n  version: 7.0.11\n  resolution: "nodemailer@npm:7.0.11"\n  checksum: 10c0/208f108fdb4c5dd0e3a2f013578d53dad505cf1b9c7a084f6d22fc9d6f3912daafb4a23793ca568ff848afc35f15f4eb24382d3f6f9fb8ede4a8410d4ca63618\n  languageName: node\n  linkType: hard\n\n"nopt@npm:^5.0.0":\n  version: 5.0.0\n  resolution: "nopt@npm:5.0.0"\n  dependencies:\n    abbrev: "npm:1"\n  bin:\n    nopt: bin/nopt.js\n  checksum: 10c0/fc5c4f07155cb455bf5fc3dd149fac421c1a40fd83c6bfe83aa82b52f02c17c5e88301321318adaa27611c8a6811423d51d29deaceab5fa158b585a61a551061\n  languageName: node\n  linkType: hard\n\n"nopt@npm:^7.0.0":\n  version: 7.2.1\n  resolution: "nopt@npm:7.2.1"\n  dependencies:\n    abbrev: "npm:^2.0.0"\n  bin:\n    nopt: bin/nopt.js\n  checksum: 10c0/a069c7c736767121242037a22a788863accfa932ab285a1eb569eb8cd534b09d17206f68c37f096ae785647435e0c5a5a0a67b42ec743e481a455e5ae6a6df81\n  languageName: node\n  linkType: hard\n\n"normalize-path@npm:^3.0.0":\n  version: 3.0.0\n  resolution: "normalize-path@npm:3.0.0"\n  checksum: 10c0/e008c8142bcc335b5e38cf0d63cfd39d6cf2d97480af9abdbe9a439221fd4d749763bab492a8ee708ce7a194bb00c9da6d0a115018672310850489137b3da046\n  languageName: node\n  linkType: hard\n\n"npmlog@npm:^5.0.1":\n  version: 5.0.1\n  resolution: "npmlog@npm:5.0.1"\n  dependencies:\n    are-we-there-yet: "npm:^2.0.0"\n    console-control-strings: "npm:^1.1.0"\n    gauge: "npm:^3.0.0"\n    set-blocking: "npm:^2.0.0"\n  checksum: 10c0/489ba519031013001135c463406f55491a17fc7da295c18a04937fe3a4d523fd65e88dd418a28b967ab743d913fdeba1e29838ce0ad8c75557057c481f7d49fa\n  languageName: node\n  linkType: hard\n\n"object-assign@npm:^4.1.1":\n  version: 4.1.1\n  resolution: "object-assign@npm:4.1.1"\n  checksum: 10c0/1f4df9945120325d041ccf7b86f31e8bcc14e73d29171e37a7903050e96b81323784ec59f93f102ec635bcf6fa8034ba3ea0a8c7e69fa202b87ae3b6cec5a414\n  languageName: node\n  linkType: hard\n\n"object-inspect@npm:^1.13.1":\n  version: 1.13.2\n  resolution: "object-inspect@npm:1.13.2"\n  checksum: 10c0/b97835b4c91ec37b5fd71add84f21c3f1047d1d155d00c0fcd6699516c256d4fcc6ff17a1aced873197fe447f91a3964178fd2a67a1ee2120cdaf60e81a050b4\n  languageName: node\n  linkType: hard\n\n"object-inspect@npm:^1.13.3":\n  version: 1.13.4\n  resolution: "object-inspect@npm:1.13.4"\n  checksum: 10c0/d7f8711e803b96ea3191c745d6f8056ce1f2496e530e6a19a0e92d89b0fa3c76d910c31f0aa270432db6bd3b2f85500a376a83aaba849a8d518c8845b3211692\n  languageName: node\n  linkType: hard\n\n"object-is@npm:^1.1.5":\n  version: 1.1.6\n  resolution: "object-is@npm:1.1.6"\n  dependencies:\n    call-bind: "npm:^1.0.7"\n    define-properties: "npm:^1.2.1"\n  checksum: 10c0/506af444c4dce7f8e31f34fc549e2fb8152d6b9c4a30c6e62852badd7f520b579c679af433e7a072f9d78eb7808d230dc12e1cf58da9154dfbf8813099ea0fe0\n  languageName: node\n  linkType: hard\n\n"object-keys@npm:^1.1.1":\n  version: 1.1.1\n  resolution: "object-keys@npm:1.1.1"\n  checksum: 10c0/b11f7ccdbc6d406d1f186cdadb9d54738e347b2692a14439ca5ac70c225fa6db46db809711b78589866d47b25fc3e8dee0b4c722ac751e11180f9380e3d8601d\n  languageName: node\n  linkType: hard\n\n"object.assign@npm:^4.1.4":\n  version: 4.1.5\n  resolution: "object.assign@npm:4.1.5"\n  dependencies:\n    call-bind: "npm:^1.0.5"\n    define-properties: "npm:^1.2.1"\n    has-symbols: "npm:^1.0.3"\n    object-keys: "npm:^1.1.1"\n  checksum: 10c0/60108e1fa2706f22554a4648299b0955236c62b3685c52abf4988d14fffb0e7731e00aa8c6448397e3eb63d087dcc124a9f21e1980f36d0b2667f3c18bacd469\n  languageName: node\n  linkType: hard\n\n"on-finished@npm:2.4.1":\n  version: 2.4.1\n  resolution: "on-finished@npm:2.4.1"\n  dependencies:\n    ee-first: "npm:1.1.1"\n  checksum: 10c0/46fb11b9063782f2d9968863d9cbba33d77aa13c17f895f56129c274318b86500b22af3a160fe9995aa41317efcd22941b6eba747f718ced08d9a73afdb087b4\n  languageName: node\n  linkType: hard\n\n"once@npm:^1.3.0":\n  version: 1.4.0\n  resolution: "once@npm:1.4.0"\n  dependencies:\n    wrappy: "npm:1"\n  checksum: 10c0/5d48aca287dfefabd756621c5dfce5c91a549a93e9fdb7b8246bc4c4790aa2ec17b34a260530474635147aeb631a2dcc8b32c613df0675f96041cbb8244517d0\n  languageName: node\n  linkType: hard\n\n"one-time@npm:^1.0.0":\n  version: 1.0.0\n  resolution: "one-time@npm:1.0.0"\n  dependencies:\n    fn.name: "npm:1.x.x"\n  checksum: 10c0/6e4887b331edbb954f4e915831cbec0a7b9956c36f4feb5f6de98c448ac02ff881fd8d9b55a6b1b55030af184c6b648f340a76eb211812f4ad8c9b4b8692fdaa\n  languageName: node\n  linkType: hard\n\n"p-map@npm:^4.0.0":\n  version: 4.0.0\n  resolution: "p-map@npm:4.0.0"\n  dependencies:\n    aggregate-error: "npm:^3.0.0"\n  checksum: 10c0/592c05bd6262c466ce269ff172bb8de7c6975afca9b50c975135b974e9bdaafbfe80e61aaaf5be6d1200ba08b30ead04b88cfa7e25ff1e3b93ab28c9f62a2c75\n  languageName: node\n  linkType: hard\n\n"package-json-from-dist@npm:^1.0.0":\n  version: 1.0.0\n  resolution: "package-json-from-dist@npm:1.0.0"\n  checksum: 10c0/e3ffaf6ac1040ab6082a658230c041ad14e72fabe99076a2081bb1d5d41210f11872403fc09082daf4387fc0baa6577f96c9c0e94c90c394fd57794b66aa4033\n  languageName: node\n  linkType: hard\n\n"path-is-absolute@npm:^1.0.0":\n  version: 1.0.1\n  resolution: "path-is-absolute@npm:1.0.1"\n  checksum: 10c0/127da03c82172a2a50099cddbf02510c1791fc2cc5f7713ddb613a56838db1e8168b121a920079d052e0936c23005562059756d653b7c544c53185efe53be078\n  languageName: node\n  linkType: hard\n\n"path-key@npm:^3.1.0":\n  version: 3.1.1\n  resolution: "path-key@npm:3.1.1"\n  checksum: 10c0/748c43efd5a569c039d7a00a03b58eecd1d75f3999f5a28303d75f521288df4823bc057d8784eb72358b2895a05f29a070bc9f1f17d28226cc4e62494cc58c4c\n  languageName: node\n  linkType: hard\n\n"path-scurry@npm:^1.11.1":\n  version: 1.11.1\n  resolution: "path-scurry@npm:1.11.1"\n  dependencies:\n    lru-cache: "npm:^10.2.0"\n    minipass: "npm:^5.0.0 || ^6.0.2 || ^7.0.0"\n  checksum: 10c0/32a13711a2a505616ae1cc1b5076801e453e7aae6ac40ab55b388bb91b9d0547a52f5aaceff710ea400205f18691120d4431e520afbe4266b836fadede15872d\n  languageName: node\n  linkType: hard\n\n"possible-typed-array-names@npm:^1.0.0":\n  version: 1.0.0\n  resolution: "possible-typed-array-names@npm:1.0.0"\n  checksum: 10c0/d9aa22d31f4f7680e20269db76791b41c3a32c01a373e25f8a4813b4d45f7456bfc2b6d68f752dc4aab0e0bb0721cb3d76fb678c9101cb7a16316664bc2c73fd\n  languageName: node\n  linkType: hard\n\n"proc-log@npm:^4.1.0, proc-log@npm:^4.2.0":\n  version: 4.2.0\n  resolution: "proc-log@npm:4.2.0"\n  checksum: 10c0/17db4757c2a5c44c1e545170e6c70a26f7de58feb985091fb1763f5081cab3d01b181fb2dd240c9f4a4255a1d9227d163d5771b7e69c9e49a561692db865efb9\n  languageName: node\n  linkType: hard\n\n"process-nextick-args@npm:~2.0.0":\n  version: 2.0.1\n  resolution: "process-nextick-args@npm:2.0.1"\n  checksum: 10c0/bec089239487833d46b59d80327a1605e1c5287eaad770a291add7f45fda1bb5e28b38e0e061add0a1d0ee0984788ce74fa394d345eed1c420cacf392c554367\n  languageName: node\n  linkType: hard\n\n"process@npm:^0.11.10":\n  version: 0.11.10\n  resolution: "process@npm:0.11.10"\n  checksum: 10c0/40c3ce4b7e6d4b8c3355479df77aeed46f81b279818ccdc500124e6a5ab882c0cc81ff7ea16384873a95a74c4570b01b120f287abbdd4c877931460eca6084b3\n  languageName: node\n  linkType: hard\n\n"promise-retry@npm:^2.0.1":\n  version: 2.0.1\n  resolution: "promise-retry@npm:2.0.1"\n  dependencies:\n    err-code: "npm:^2.0.2"\n    retry: "npm:^0.12.0"\n  checksum: 10c0/9c7045a1a2928094b5b9b15336dcd2a7b1c052f674550df63cc3f36cd44028e5080448175b6f6ca32b642de81150f5e7b1a98b728f15cb069f2dd60ac2616b96\n  languageName: node\n  linkType: hard\n\n"proxy-from-env@npm:^1.1.0":\n  version: 1.1.0\n  resolution: "proxy-from-env@npm:1.1.0"\n  checksum: 10c0/fe7dd8b1bdbbbea18d1459107729c3e4a2243ca870d26d34c2c1bcd3e4425b7bcc5112362df2d93cc7fb9746f6142b5e272fd1cc5c86ddf8580175186f6ad42b\n  languageName: node\n  linkType: hard\n\n"qs@npm:6.13.0":\n  version: 6.13.0\n  resolution: "qs@npm:6.13.0"\n  dependencies:\n    side-channel: "npm:^1.0.6"\n  checksum: 10c0/62372cdeec24dc83a9fb240b7533c0fdcf0c5f7e0b83343edd7310f0ab4c8205a5e7c56406531f2e47e1b4878a3821d652be4192c841de5b032ca83619d8f860\n  languageName: node\n  linkType: hard\n\n"queue-tick@npm:^1.0.1":\n  version: 1.0.1\n  resolution: "queue-tick@npm:1.0.1"\n  checksum: 10c0/0db998e2c9b15215317dbcf801e9b23e6bcde4044e115155dae34f8e7454b9a783f737c9a725528d677b7a66c775eb7a955cf144fe0b87f62b575ce5bfd515a9\n  languageName: node\n  linkType: hard\n\n"raw-body@npm:2.5.2":\n  version: 2.5.2\n  resolution: "raw-body@npm:2.5.2"\n  dependencies:\n    bytes: "npm:3.1.2"\n    http-errors: "npm:2.0.0"\n    iconv-lite: "npm:0.4.24"\n    unpipe: "npm:1.0.0"\n  checksum: 10c0/b201c4b66049369a60e766318caff5cb3cc5a900efd89bdac431463822d976ad0670912c931fdbdcf5543207daf6f6833bca57aa116e1661d2ea91e12ca692c4\n  languageName: node\n  linkType: hard\n\n"readable-stream@npm:^2.0.5":\n  version: 2.3.8\n  resolution: "readable-stream@npm:2.3.8"\n  dependencies:\n    core-util-is: "npm:~1.0.0"\n    inherits: "npm:~2.0.3"\n    isarray: "npm:~1.0.0"\n    process-nextick-args: "npm:~2.0.0"\n    safe-buffer: "npm:~5.1.1"\n    string_decoder: "npm:~1.1.1"\n    util-deprecate: "npm:~1.0.1"\n  checksum: 10c0/7efdb01f3853bc35ac62ea25493567bf588773213f5f4a79f9c365e1ad13bab845ac0dae7bc946270dc40c3929483228415e92a3fc600cc7e4548992f41ee3fa\n  languageName: node\n  linkType: hard\n\n"readable-stream@npm:^3.4.0, readable-stream@npm:^3.6.0, readable-stream@npm:^3.6.2":\n  version: 3.6.2\n  resolution: "readable-stream@npm:3.6.2"\n  dependencies:\n    inherits: "npm:^2.0.3"\n    string_decoder: "npm:^1.1.1"\n    util-deprecate: "npm:^1.0.1"\n  checksum: 10c0/e37be5c79c376fdd088a45fa31ea2e423e5d48854be7a22a58869b4e84d25047b193f6acb54f1012331e1bcd667ffb569c01b99d36b0bd59658fb33f513511b7\n  languageName: node\n  linkType: hard\n\n"readable-stream@npm:^4.0.0":\n  version: 4.5.2\n  resolution: "readable-stream@npm:4.5.2"\n  dependencies:\n    abort-controller: "npm:^3.0.0"\n    buffer: "npm:^6.0.3"\n    events: "npm:^3.3.0"\n    process: "npm:^0.11.10"\n    string_decoder: "npm:^1.3.0"\n  checksum: 10c0/a2c80e0e53aabd91d7df0330929e32d0a73219f9477dbbb18472f6fdd6a11a699fc5d172a1beff98d50eae4f1496c950ffa85b7cc2c4c196963f289a5f39275d\n  languageName: node\n  linkType: hard\n\n"readdir-glob@npm:^1.1.2":\n  version: 1.1.3\n  resolution: "readdir-glob@npm:1.1.3"\n  dependencies:\n    minimatch: "npm:^5.1.0"\n  checksum: 10c0/a37e0716726650845d761f1041387acd93aa91b28dd5381950733f994b6c349ddc1e21e266ec7cc1f9b92e205a7a972232f9b89d5424d07361c2c3753d5dbace\n  languageName: node\n  linkType: hard\n\n"regexp.prototype.flags@npm:^1.5.1":\n  version: 1.5.2\n  resolution: "regexp.prototype.flags@npm:1.5.2"\n  dependencies:\n    call-bind: "npm:^1.0.6"\n    define-properties: "npm:^1.2.1"\n    es-errors: "npm:^1.3.0"\n    set-function-name: "npm:^2.0.1"\n  checksum: 10c0/0f3fc4f580d9c349f8b560b012725eb9c002f36daa0041b3fbf6f4238cb05932191a4d7d5db3b5e2caa336d5150ad0402ed2be81f711f9308fe7e1a9bf9bd552\n  languageName: node\n  linkType: hard\n\n"retry@npm:^0.12.0":\n  version: 0.12.0\n  resolution: "retry@npm:0.12.0"\n  checksum: 10c0/59933e8501727ba13ad73ef4a04d5280b3717fd650408460c987392efe9d7be2040778ed8ebe933c5cbd63da3dcc37919c141ef8af0a54a6e4fca5a2af177bfe\n  languageName: node\n  linkType: hard\n\n"rimraf@npm:^3.0.2":\n  version: 3.0.2\n  resolution: "rimraf@npm:3.0.2"\n  dependencies:\n    glob: "npm:^7.1.3"\n  bin:\n    rimraf: bin.js\n  checksum: 10c0/9cb7757acb489bd83757ba1a274ab545eafd75598a9d817e0c3f8b164238dd90eba50d6b848bd4dcc5f3040912e882dc7ba71653e35af660d77b25c381d402e8\n  languageName: node\n  linkType: hard\n\n"root-workspace-0b6124@workspace:.":\n  version: 0.0.0-use.local\n  resolution: "root-workspace-0b6124@workspace:."\n  dependencies:\n    "@types/bcrypt": "npm:^5.0.2"\n    "@types/deep-equal": "npm:^1.0.4"\n    "@types/lodash.camelcase": "npm:^4.3.9"\n    "@types/lodash.compact": "npm:^3.0.9"\n    "@types/lodash.groupby": "npm:^4.6.9"\n    "@types/lodash.identity": "npm:^3.0.9"\n    "@types/lodash.isempty": "npm:^4.4.9"\n    "@types/lodash.isequal": "npm:^4.5.8"\n    "@types/lodash.isobject": "npm:^3.0.9"\n    "@types/lodash.kebabcase": "npm:^4.1.9"\n    "@types/lodash.mapvalues": "npm:^4.6.9"\n    "@types/lodash.omit": "npm:^4.5.9"\n    "@types/lodash.pickby": "npm:^4.6.9"\n    "@types/lodash.snakecase": "npm:^4.1.9"\n    "@types/lodash.upperfirst": "npm:^4.3.9"\n    "@types/uuid": "npm:^10.0.0"\n    archiver: "npm:^7.0.1"\n    axios: "npm:^1.12.0"\n    bcrypt: "npm:^5.1.1"\n    body-parser: "npm:^1.20.3"\n    deep-equal: "npm:^2.2.3"\n    jsonwebtoken: "npm:^9.0.2"\n    lodash.camelcase: "npm:^4.3.0"\n    lodash.chunk: "npm:^4.2.0"\n    lodash.compact: "npm:^3.0.1"\n    lodash.groupby: "npm:^4.6.0"\n    lodash.identity: "npm:^3.0.0"\n    lodash.isempty: "npm:^4.4.0"\n    lodash.isequal: "npm:^4.5.0"\n    lodash.isobject: "npm:^3.0.2"\n    lodash.kebabcase: "npm:^4.1.1"\n    lodash.mapvalues: "npm:^4.6.0"\n    lodash.merge: "npm:^4.6.2"\n    lodash.omit: "npm:^4.5.0"\n    lodash.pickby: "npm:^4.6.0"\n    lodash.snakecase: "npm:^4.1.1"\n    lodash.upperfirst: "npm:^4.3.1"\n    nodemailer: "npm:^7.0.11"\n    sharp: "npm:^0.33.5"\n    uuid: "npm:^10.0.0"\n    winston: "npm:^3.14.2"\n  languageName: unknown\n  linkType: soft\n\n"safe-buffer@npm:^5.0.1, safe-buffer@npm:~5.2.0":\n  version: 5.2.1\n  resolution: "safe-buffer@npm:5.2.1"\n  checksum: 10c0/6501914237c0a86e9675d4e51d89ca3c21ffd6a31642efeba25ad65720bce6921c9e7e974e5be91a786b25aa058b5303285d3c15dbabf983a919f5f630d349f3\n  languageName: node\n  linkType: hard\n\n"safe-buffer@npm:~5.1.0, safe-buffer@npm:~5.1.1":\n  version: 5.1.2\n  resolution: "safe-buffer@npm:5.1.2"\n  checksum: 10c0/780ba6b5d99cc9a40f7b951d47152297d0e260f0df01472a1b99d4889679a4b94a13d644f7dbc4f022572f09ae9005fa2fbb93bbbd83643316f365a3e9a45b21\n  languageName: node\n  linkType: hard\n\n"safe-stable-stringify@npm:^2.3.1":\n  version: 2.5.0\n  resolution: "safe-stable-stringify@npm:2.5.0"\n  checksum: 10c0/baea14971858cadd65df23894a40588ed791769db21bafb7fd7608397dbdce9c5aac60748abae9995e0fc37e15f2061980501e012cd48859740796bea2987f49\n  languageName: node\n  linkType: hard\n\n"safer-buffer@npm:>= 2.1.2 < 3, safer-buffer@npm:>= 2.1.2 < 3.0.0":\n  version: 2.1.2\n  resolution: "safer-buffer@npm:2.1.2"\n  checksum: 10c0/7e3c8b2e88a1841c9671094bbaeebd94448111dd90a81a1f606f3f67708a6ec57763b3b47f06da09fc6054193e0e6709e77325415dc8422b04497a8070fa02d4\n  languageName: node\n  linkType: hard\n\n"semver@npm:^6.0.0":\n  version: 6.3.1\n  resolution: "semver@npm:6.3.1"\n  bin:\n    semver: bin/semver.js\n  checksum: 10c0/e3d79b609071caa78bcb6ce2ad81c7966a46a7431d9d58b8800cfa9cb6a63699b3899a0e4bcce36167a284578212d9ae6942b6929ba4aa5015c079a67751d42d\n  languageName: node\n  linkType: hard\n\n"semver@npm:^7.3.5, semver@npm:^7.5.4, semver@npm:^7.6.3":\n  version: 7.6.3\n  resolution: "semver@npm:7.6.3"\n  bin:\n    semver: bin/semver.js\n  checksum: 10c0/88f33e148b210c153873cb08cfe1e281d518aaa9a666d4d148add6560db5cd3c582f3a08ccb91f38d5f379ead256da9931234ed122057f40bb5766e65e58adaf\n  languageName: node\n  linkType: hard\n\n"set-blocking@npm:^2.0.0":\n  version: 2.0.0\n  resolution: "set-blocking@npm:2.0.0"\n  checksum: 10c0/9f8c1b2d800800d0b589de1477c753492de5c1548d4ade52f57f1d1f5e04af5481554d75ce5e5c43d4004b80a3eb714398d6907027dc0534177b7539119f4454\n  languageName: node\n  linkType: hard\n\n"set-function-length@npm:^1.2.1":\n  version: 1.2.2\n  resolution: "set-function-length@npm:1.2.2"\n  dependencies:\n    define-data-property: "npm:^1.1.4"\n    es-errors: "npm:^1.3.0"\n    function-bind: "npm:^1.1.2"\n    get-intrinsic: "npm:^1.2.4"\n    gopd: "npm:^1.0.1"\n    has-property-descriptors: "npm:^1.0.2"\n  checksum: 10c0/82850e62f412a258b71e123d4ed3873fa9377c216809551192bb6769329340176f109c2eeae8c22a8d386c76739855f78e8716515c818bcaef384b51110f0f3c\n  languageName: node\n  linkType: hard\n\n"set-function-name@npm:^2.0.1":\n  version: 2.0.2\n  resolution: "set-function-name@npm:2.0.2"\n  dependencies:\n    define-data-property: "npm:^1.1.4"\n    es-errors: "npm:^1.3.0"\n    functions-have-names: "npm:^1.2.3"\n    has-property-descriptors: "npm:^1.0.2"\n  checksum: 10c0/fce59f90696c450a8523e754abb305e2b8c73586452619c2bad5f7bf38c7b6b4651895c9db895679c5bef9554339cf3ef1c329b66ece3eda7255785fbe299316\n  languageName: node\n  linkType: hard\n\n"setprototypeof@npm:1.2.0":\n  version: 1.2.0\n  resolution: "setprototypeof@npm:1.2.0"\n  checksum: 10c0/68733173026766fa0d9ecaeb07f0483f4c2dc70ca376b3b7c40b7cda909f94b0918f6c5ad5ce27a9160bdfb475efaa9d5e705a11d8eaae18f9835d20976028bc\n  languageName: node\n  linkType: hard\n\n"sharp@npm:^0.33.5":\n  version: 0.33.5\n  resolution: "sharp@npm:0.33.5"\n  dependencies:\n    "@img/sharp-darwin-arm64": "npm:0.33.5"\n    "@img/sharp-darwin-x64": "npm:0.33.5"\n    "@img/sharp-libvips-darwin-arm64": "npm:1.0.4"\n    "@img/sharp-libvips-darwin-x64": "npm:1.0.4"\n    "@img/sharp-libvips-linux-arm": "npm:1.0.5"\n    "@img/sharp-libvips-linux-arm64": "npm:1.0.4"\n    "@img/sharp-libvips-linux-s390x": "npm:1.0.4"\n    "@img/sharp-libvips-linux-x64": "npm:1.0.4"\n    "@img/sharp-libvips-linuxmusl-arm64": "npm:1.0.4"\n    "@img/sharp-libvips-linuxmusl-x64": "npm:1.0.4"\n    "@img/sharp-linux-arm": "npm:0.33.5"\n    "@img/sharp-linux-arm64": "npm:0.33.5"\n    "@img/sharp-linux-s390x": "npm:0.33.5"\n    "@img/sharp-linux-x64": "npm:0.33.5"\n    "@img/sharp-linuxmusl-arm64": "npm:0.33.5"\n    "@img/sharp-linuxmusl-x64": "npm:0.33.5"\n    "@img/sharp-wasm32": "npm:0.33.5"\n    "@img/sharp-win32-ia32": "npm:0.33.5"\n    "@img/sharp-win32-x64": "npm:0.33.5"\n    color: "npm:^4.2.3"\n    detect-libc: "npm:^2.0.3"\n    semver: "npm:^7.6.3"\n  dependenciesMeta:\n    "@img/sharp-darwin-arm64":\n      optional: true\n    "@img/sharp-darwin-x64":\n      optional: true\n    "@img/sharp-libvips-darwin-arm64":\n      optional: true\n    "@img/sharp-libvips-darwin-x64":\n      optional: true\n    "@img/sharp-libvips-linux-arm":\n      optional: true\n    "@img/sharp-libvips-linux-arm64":\n      optional: true\n    "@img/sharp-libvips-linux-s390x":\n      optional: true\n    "@img/sharp-libvips-linux-x64":\n      optional: true\n    "@img/sharp-libvips-linuxmusl-arm64":\n      optional: true\n    "@img/sharp-libvips-linuxmusl-x64":\n      optional: true\n    "@img/sharp-linux-arm":\n      optional: true\n    "@img/sharp-linux-arm64":\n      optional: true\n    "@img/sharp-linux-s390x":\n      optional: true\n    "@img/sharp-linux-x64":\n      optional: true\n    "@img/sharp-linuxmusl-arm64":\n      optional: true\n    "@img/sharp-linuxmusl-x64":\n      optional: true\n    "@img/sharp-wasm32":\n      optional: true\n    "@img/sharp-win32-ia32":\n      optional: true\n    "@img/sharp-win32-x64":\n      optional: true\n  checksum: 10c0/6b81421ddfe6ee524d8d77e325c5e147fef22884e1c7b1656dfd89a88d7025894115da02d5f984261bf2e6daa16f98cadd1721c4ba408b4212b1d2a60f233484\n  languageName: node\n  linkType: hard\n\n"shebang-command@npm:^2.0.0":\n  version: 2.0.0\n  resolution: "shebang-command@npm:2.0.0"\n  dependencies:\n    shebang-regex: "npm:^3.0.0"\n  checksum: 10c0/a41692e7d89a553ef21d324a5cceb5f686d1f3c040759c50aab69688634688c5c327f26f3ecf7001ebfd78c01f3c7c0a11a7c8bfd0a8bc9f6240d4f40b224e4e\n  languageName: node\n  linkType: hard\n\n"shebang-regex@npm:^3.0.0":\n  version: 3.0.0\n  resolution: "shebang-regex@npm:3.0.0"\n  checksum: 10c0/1dbed0726dd0e1152a92696c76c7f06084eb32a90f0528d11acd764043aacf76994b2fb30aa1291a21bd019d6699164d048286309a278855ee7bec06cf6fb690\n  languageName: node\n  linkType: hard\n\n"side-channel-list@npm:^1.0.0":\n  version: 1.0.0\n  resolution: "side-channel-list@npm:1.0.0"\n  dependencies:\n    es-errors: "npm:^1.3.0"\n    object-inspect: "npm:^1.13.3"\n  checksum: 10c0/644f4ac893456c9490ff388bf78aea9d333d5e5bfc64cfb84be8f04bf31ddc111a8d4b83b85d7e7e8a7b845bc185a9ad02c052d20e086983cf59f0be517d9b3d\n  languageName: node\n  linkType: hard\n\n"side-channel-map@npm:^1.0.1":\n  version: 1.0.1\n  resolution: "side-channel-map@npm:1.0.1"\n  dependencies:\n    call-bound: "npm:^1.0.2"\n    es-errors: "npm:^1.3.0"\n    get-intrinsic: "npm:^1.2.5"\n    object-inspect: "npm:^1.13.3"\n  checksum: 10c0/010584e6444dd8a20b85bc926d934424bd809e1a3af941cace229f7fdcb751aada0fb7164f60c2e22292b7fa3c0ff0bce237081fd4cdbc80de1dc68e95430672\n  languageName: node\n  linkType: hard\n\n"side-channel-weakmap@npm:^1.0.2":\n  version: 1.0.2\n  resolution: "side-channel-weakmap@npm:1.0.2"\n  dependencies:\n    call-bound: "npm:^1.0.2"\n    es-errors: "npm:^1.3.0"\n    get-intrinsic: "npm:^1.2.5"\n    object-inspect: "npm:^1.13.3"\n    side-channel-map: "npm:^1.0.1"\n  checksum: 10c0/71362709ac233e08807ccd980101c3e2d7efe849edc51455030327b059f6c4d292c237f94dc0685031dd11c07dd17a68afde235d6cf2102d949567f98ab58185\n  languageName: node\n  linkType: hard\n\n"side-channel@npm:^1.0.4":\n  version: 1.0.6\n  resolution: "side-channel@npm:1.0.6"\n  dependencies:\n    call-bind: "npm:^1.0.7"\n    es-errors: "npm:^1.3.0"\n    get-intrinsic: "npm:^1.2.4"\n    object-inspect: "npm:^1.13.1"\n  checksum: 10c0/d2afd163dc733cc0a39aa6f7e39bf0c436293510dbccbff446733daeaf295857dbccf94297092ec8c53e2503acac30f0b78830876f0485991d62a90e9cad305f\n  languageName: node\n  linkType: hard\n\n"side-channel@npm:^1.0.6":\n  version: 1.1.0\n  resolution: "side-channel@npm:1.1.0"\n  dependencies:\n    es-errors: "npm:^1.3.0"\n    object-inspect: "npm:^1.13.3"\n    side-channel-list: "npm:^1.0.0"\n    side-channel-map: "npm:^1.0.1"\n    side-channel-weakmap: "npm:^1.0.2"\n  checksum: 10c0/cb20dad41eb032e6c24c0982e1e5a24963a28aa6122b4f05b3f3d6bf8ae7fd5474ef382c8f54a6a3ab86e0cac4d41a23bd64ede3970e5bfb50326ba02a7996e6\n  languageName: node\n  linkType: hard\n\n"signal-exit@npm:^3.0.0":\n  version: 3.0.7\n  resolution: "signal-exit@npm:3.0.7"\n  checksum: 10c0/25d272fa73e146048565e08f3309d5b942c1979a6f4a58a8c59d5fa299728e9c2fcd1a759ec870863b1fd38653670240cd420dad2ad9330c71f36608a6a1c912\n  languageName: node\n  linkType: hard\n\n"signal-exit@npm:^4.0.1":\n  version: 4.1.0\n  resolution: "signal-exit@npm:4.1.0"\n  checksum: 10c0/41602dce540e46d599edba9d9860193398d135f7ff72cab629db5171516cfae628d21e7bfccde1bbfdf11c48726bc2a6d1a8fb8701125852fbfda7cf19c6aa83\n  languageName: node\n  linkType: hard\n\n"simple-swizzle@npm:^0.2.2":\n  version: 0.2.2\n  resolution: "simple-swizzle@npm:0.2.2"\n  dependencies:\n    is-arrayish: "npm:^0.3.1"\n  checksum: 10c0/df5e4662a8c750bdba69af4e8263c5d96fe4cd0f9fe4bdfa3cbdeb45d2e869dff640beaaeb1ef0e99db4d8d2ec92f85508c269f50c972174851bc1ae5bd64308\n  languageName: node\n  linkType: hard\n\n"smart-buffer@npm:^4.2.0":\n  version: 4.2.0\n  resolution: "smart-buffer@npm:4.2.0"\n  checksum: 10c0/a16775323e1404dd43fabafe7460be13a471e021637bc7889468eb45ce6a6b207261f454e4e530a19500cc962c4cc5348583520843b363f4193cee5c00e1e539\n  languageName: node\n  linkType: hard\n\n"socks-proxy-agent@npm:^8.0.3":\n  version: 8.0.4\n  resolution: "socks-proxy-agent@npm:8.0.4"\n  dependencies:\n    agent-base: "npm:^7.1.1"\n    debug: "npm:^4.3.4"\n    socks: "npm:^2.8.3"\n  checksum: 10c0/345593bb21b95b0508e63e703c84da11549f0a2657d6b4e3ee3612c312cb3a907eac10e53b23ede3557c6601d63252103494caa306b66560f43af7b98f53957a\n  languageName: node\n  linkType: hard\n\n"socks@npm:^2.8.3":\n  version: 2.8.3\n  resolution: "socks@npm:2.8.3"\n  dependencies:\n    ip-address: "npm:^9.0.5"\n    smart-buffer: "npm:^4.2.0"\n  checksum: 10c0/d54a52bf9325165770b674a67241143a3d8b4e4c8884560c4e0e078aace2a728dffc7f70150660f51b85797c4e1a3b82f9b7aa25e0a0ceae1a243365da5c51a7\n  languageName: node\n  linkType: hard\n\n"sprintf-js@npm:^1.1.3":\n  version: 1.1.3\n  resolution: "sprintf-js@npm:1.1.3"\n  checksum: 10c0/09270dc4f30d479e666aee820eacd9e464215cdff53848b443964202bf4051490538e5dd1b42e1a65cf7296916ca17640aebf63dae9812749c7542ee5f288dec\n  languageName: node\n  linkType: hard\n\n"ssri@npm:^10.0.0":\n  version: 10.0.6\n  resolution: "ssri@npm:10.0.6"\n  dependencies:\n    minipass: "npm:^7.0.3"\n  checksum: 10c0/e5a1e23a4057a86a97971465418f22ea89bd439ac36ade88812dd920e4e61873e8abd6a9b72a03a67ef50faa00a2daf1ab745c5a15b46d03e0544a0296354227\n  languageName: node\n  linkType: hard\n\n"stack-trace@npm:0.0.x":\n  version: 0.0.10\n  resolution: "stack-trace@npm:0.0.10"\n  checksum: 10c0/9ff3dabfad4049b635a85456f927a075c9d0c210e3ea336412d18220b2a86cbb9b13ec46d6c37b70a302a4ea4d49e30e5d4944dd60ae784073f1cde778ac8f4b\n  languageName: node\n  linkType: hard\n\n"statuses@npm:2.0.1":\n  version: 2.0.1\n  resolution: "statuses@npm:2.0.1"\n  checksum: 10c0/34378b207a1620a24804ce8b5d230fea0c279f00b18a7209646d5d47e419d1cc23e7cbf33a25a1e51ac38973dc2ac2e1e9c647a8e481ef365f77668d72becfd0\n  languageName: node\n  linkType: hard\n\n"stop-iteration-iterator@npm:^1.0.0":\n  version: 1.0.0\n  resolution: "stop-iteration-iterator@npm:1.0.0"\n  dependencies:\n    internal-slot: "npm:^1.0.4"\n  checksum: 10c0/c4158d6188aac510d9e92925b58709207bd94699e9c31186a040c80932a687f84a51356b5895e6dc72710aad83addb9411c22171832c9ae0e6e11b7d61b0dfb9\n  languageName: node\n  linkType: hard\n\n"streamx@npm:^2.15.0":\n  version: 2.19.0\n  resolution: "streamx@npm:2.19.0"\n  dependencies:\n    bare-events: "npm:^2.2.0"\n    fast-fifo: "npm:^1.3.2"\n    queue-tick: "npm:^1.0.1"\n    text-decoder: "npm:^1.1.0"\n  dependenciesMeta:\n    bare-events:\n      optional: true\n  checksum: 10c0/5833a2c1226488a015e8efde08c6cd4983d7d20098b2210d09594b23f598a8b028c083d542621e2e91ddcb33a266233c3524c60152203be40f1dd816b9ede9da\n  languageName: node\n  linkType: hard\n\n"string-width-cjs@npm:string-width@^4.2.0, string-width@npm:^1.0.2 || 2 || 3 || 4, string-width@npm:^4.1.0, string-width@npm:^4.2.3":\n  version: 4.2.3\n  resolution: "string-width@npm:4.2.3"\n  dependencies:\n    emoji-regex: "npm:^8.0.0"\n    is-fullwidth-code-point: "npm:^3.0.0"\n    strip-ansi: "npm:^6.0.1"\n  checksum: 10c0/1e525e92e5eae0afd7454086eed9c818ee84374bb80328fc41217ae72ff5f065ef1c9d7f72da41de40c75fa8bb3dee63d92373fd492c84260a552c636392a47b\n  languageName: node\n  linkType: hard\n\n"string-width@npm:^5.0.1, string-width@npm:^5.1.2":\n  version: 5.1.2\n  resolution: "string-width@npm:5.1.2"\n  dependencies:\n    eastasianwidth: "npm:^0.2.0"\n    emoji-regex: "npm:^9.2.2"\n    strip-ansi: "npm:^7.0.1"\n  checksum: 10c0/ab9c4264443d35b8b923cbdd513a089a60de339216d3b0ed3be3ba57d6880e1a192b70ae17225f764d7adbf5994e9bb8df253a944736c15a0240eff553c678ca\n  languageName: node\n  linkType: hard\n\n"string_decoder@npm:^1.1.1, string_decoder@npm:^1.3.0":\n  version: 1.3.0\n  resolution: "string_decoder@npm:1.3.0"\n  dependencies:\n    safe-buffer: "npm:~5.2.0"\n  checksum: 10c0/810614ddb030e271cd591935dcd5956b2410dd079d64ff92a1844d6b7588bf992b3e1b69b0f4d34a3e06e0bd73046ac646b5264c1987b20d0601f81ef35d731d\n  languageName: node\n  linkType: hard\n\n"string_decoder@npm:~1.1.1":\n  version: 1.1.1\n  resolution: "string_decoder@npm:1.1.1"\n  dependencies:\n    safe-buffer: "npm:~5.1.0"\n  checksum: 10c0/b4f89f3a92fd101b5653ca3c99550e07bdf9e13b35037e9e2a1c7b47cec4e55e06ff3fc468e314a0b5e80bfbaf65c1ca5a84978764884ae9413bec1fc6ca924e\n  languageName: node\n  linkType: hard\n\n"strip-ansi-cjs@npm:strip-ansi@^6.0.1, strip-ansi@npm:^6.0.0, strip-ansi@npm:^6.0.1":\n  version: 6.0.1\n  resolution: "strip-ansi@npm:6.0.1"\n  dependencies:\n    ansi-regex: "npm:^5.0.1"\n  checksum: 10c0/1ae5f212a126fe5b167707f716942490e3933085a5ff6c008ab97ab2f272c8025d3aa218b7bd6ab25729ca20cc81cddb252102f8751e13482a5199e873680952\n  languageName: node\n  linkType: hard\n\n"strip-ansi@npm:^7.0.1":\n  version: 7.1.0\n  resolution: "strip-ansi@npm:7.1.0"\n  dependencies:\n    ansi-regex: "npm:^6.0.1"\n  checksum: 10c0/a198c3762e8832505328cbf9e8c8381de14a4fa50a4f9b2160138158ea88c0f5549fb50cb13c651c3088f47e63a108b34622ec18c0499b6c8c3a5ddf6b305ac4\n  languageName: node\n  linkType: hard\n\n"tar-stream@npm:^3.0.0":\n  version: 3.1.7\n  resolution: "tar-stream@npm:3.1.7"\n  dependencies:\n    b4a: "npm:^1.6.4"\n    fast-fifo: "npm:^1.2.0"\n    streamx: "npm:^2.15.0"\n  checksum: 10c0/a09199d21f8714bd729993ac49b6c8efcb808b544b89f23378ad6ffff6d1cb540878614ba9d4cfec11a64ef39e1a6f009a5398371491eb1fda606ffc7f70f718\n  languageName: node\n  linkType: hard\n\n"tar@npm:^6.1.11, tar@npm:^6.2.1":\n  version: 6.2.1\n  resolution: "tar@npm:6.2.1"\n  dependencies:\n    chownr: "npm:^2.0.0"\n    fs-minipass: "npm:^2.0.0"\n    minipass: "npm:^5.0.0"\n    minizlib: "npm:^2.1.1"\n    mkdirp: "npm:^1.0.3"\n    yallist: "npm:^4.0.0"\n  checksum: 10c0/a5eca3eb50bc11552d453488344e6507156b9193efd7635e98e867fab275d527af53d8866e2370cd09dfe74378a18111622ace35af6a608e5223a7d27fe99537\n  languageName: node\n  linkType: hard\n\n"text-decoder@npm:^1.1.0":\n  version: 1.1.1\n  resolution: "text-decoder@npm:1.1.1"\n  dependencies:\n    b4a: "npm:^1.6.4"\n  checksum: 10c0/e527d05454b59c0fa77456495de68c88e560a122de3dd28b3ebdbf81828aabeaa7e9bb8054b9eb52bc5029ccb5899ad04f466cbba3c53b2685270599d1710cee\n  languageName: node\n  linkType: hard\n\n"text-hex@npm:1.0.x":\n  version: 1.0.0\n  resolution: "text-hex@npm:1.0.0"\n  checksum: 10c0/57d8d320d92c79d7c03ffb8339b825bb9637c2cbccf14304309f51d8950015c44464b6fd1b6820a3d4821241c68825634f09f5a2d9d501e84f7c6fd14376860d\n  languageName: node\n  linkType: hard\n\n"toidentifier@npm:1.0.1":\n  version: 1.0.1\n  resolution: "toidentifier@npm:1.0.1"\n  checksum: 10c0/93937279934bd66cc3270016dd8d0afec14fb7c94a05c72dc57321f8bd1fa97e5bea6d1f7c89e728d077ca31ea125b78320a616a6c6cd0e6b9cb94cb864381c1\n  languageName: node\n  linkType: hard\n\n"tr46@npm:~0.0.3":\n  version: 0.0.3\n  resolution: "tr46@npm:0.0.3"\n  checksum: 10c0/047cb209a6b60c742f05c9d3ace8fa510bff609995c129a37ace03476a9b12db4dbf975e74600830ef0796e18882b2381fb5fb1f6b4f96b832c374de3ab91a11\n  languageName: node\n  linkType: hard\n\n"triple-beam@npm:^1.3.0":\n  version: 1.4.1\n  resolution: "triple-beam@npm:1.4.1"\n  checksum: 10c0/4bf1db71e14fe3ff1c3adbe3c302f1fdb553b74d7591a37323a7badb32dc8e9c290738996cbb64f8b10dc5a3833645b5d8c26221aaaaa12e50d1251c9aba2fea\n  languageName: node\n  linkType: hard\n\n"tslib@npm:^2.4.0":\n  version: 2.7.0\n  resolution: "tslib@npm:2.7.0"\n  checksum: 10c0/469e1d5bf1af585742128827000711efa61010b699cb040ab1800bcd3ccdd37f63ec30642c9e07c4439c1db6e46345582614275daca3e0f4abae29b0083f04a6\n  languageName: node\n  linkType: hard\n\n"type-is@npm:~1.6.18":\n  version: 1.6.18\n  resolution: "type-is@npm:1.6.18"\n  dependencies:\n    media-typer: "npm:0.3.0"\n    mime-types: "npm:~2.1.24"\n  checksum: 10c0/a23daeb538591b7efbd61ecf06b6feb2501b683ffdc9a19c74ef5baba362b4347e42f1b4ed81f5882a8c96a3bfff7f93ce3ffaf0cbbc879b532b04c97a55db9d\n  languageName: node\n  linkType: hard\n\n"undici-types@npm:~6.19.2":\n  version: 6.19.8\n  resolution: "undici-types@npm:6.19.8"\n  checksum: 10c0/078afa5990fba110f6824823ace86073b4638f1d5112ee26e790155f481f2a868cc3e0615505b6f4282bdf74a3d8caad715fd809e870c2bb0704e3ea6082f344\n  languageName: node\n  linkType: hard\n\n"unique-filename@npm:^3.0.0":\n  version: 3.0.0\n  resolution: "unique-filename@npm:3.0.0"\n  dependencies:\n    unique-slug: "npm:^4.0.0"\n  checksum: 10c0/6363e40b2fa758eb5ec5e21b3c7fb83e5da8dcfbd866cc0c199d5534c42f03b9ea9ab069769cc388e1d7ab93b4eeef28ef506ab5f18d910ef29617715101884f\n  languageName: node\n  linkType: hard\n\n"unique-slug@npm:^4.0.0":\n  version: 4.0.0\n  resolution: "unique-slug@npm:4.0.0"\n  dependencies:\n    imurmurhash: "npm:^0.1.4"\n  checksum: 10c0/cb811d9d54eb5821b81b18205750be84cb015c20a4a44280794e915f5a0a70223ce39066781a354e872df3572e8155c228f43ff0cce94c7cbf4da2cc7cbdd635\n  languageName: node\n  linkType: hard\n\n"unpipe@npm:1.0.0":\n  version: 1.0.0\n  resolution: "unpipe@npm:1.0.0"\n  checksum: 10c0/193400255bd48968e5c5383730344fbb4fa114cdedfab26e329e50dd2d81b134244bb8a72c6ac1b10ab0281a58b363d06405632c9d49ca9dfd5e90cbd7d0f32c\n  languageName: node\n  linkType: hard\n\n"util-deprecate@npm:^1.0.1, util-deprecate@npm:~1.0.1":\n  version: 1.0.2\n  resolution: "util-deprecate@npm:1.0.2"\n  checksum: 10c0/41a5bdd214df2f6c3ecf8622745e4a366c4adced864bc3c833739791aeeeb1838119af7daed4ba36428114b5c67dcda034a79c882e97e43c03e66a4dd7389942\n  languageName: node\n  linkType: hard\n\n"uuid@npm:^10.0.0":\n  version: 10.0.0\n  resolution: "uuid@npm:10.0.0"\n  bin:\n    uuid: dist/bin/uuid\n  checksum: 10c0/eab18c27fe4ab9fb9709a5d5f40119b45f2ec8314f8d4cf12ce27e4c6f4ffa4a6321dc7db6c515068fa373c075b49691ba969f0010bf37f44c37ca40cd6bf7fe\n  languageName: node\n  linkType: hard\n\n"webidl-conversions@npm:^3.0.0":\n  version: 3.0.1\n  resolution: "webidl-conversions@npm:3.0.1"\n  checksum: 10c0/5612d5f3e54760a797052eb4927f0ddc01383550f542ccd33d5238cfd65aeed392a45ad38364970d0a0f4fea32e1f4d231b3d8dac4a3bdd385e5cf802ae097db\n  languageName: node\n  linkType: hard\n\n"whatwg-url@npm:^5.0.0":\n  version: 5.0.0\n  resolution: "whatwg-url@npm:5.0.0"\n  dependencies:\n    tr46: "npm:~0.0.3"\n    webidl-conversions: "npm:^3.0.0"\n  checksum: 10c0/1588bed84d10b72d5eec1d0faa0722ba1962f1821e7539c535558fb5398d223b0c50d8acab950b8c488b4ba69043fd833cc2697056b167d8ad46fac3995a55d5\n  languageName: node\n  linkType: hard\n\n"which-boxed-primitive@npm:^1.0.2":\n  version: 1.0.2\n  resolution: "which-boxed-primitive@npm:1.0.2"\n  dependencies:\n    is-bigint: "npm:^1.0.1"\n    is-boolean-object: "npm:^1.1.0"\n    is-number-object: "npm:^1.0.4"\n    is-string: "npm:^1.0.5"\n    is-symbol: "npm:^1.0.3"\n  checksum: 10c0/0a62a03c00c91dd4fb1035b2f0733c341d805753b027eebd3a304b9cb70e8ce33e25317add2fe9b5fea6f53a175c0633ae701ff812e604410ddd049777cd435e\n  languageName: node\n  linkType: hard\n\n"which-collection@npm:^1.0.1":\n  version: 1.0.2\n  resolution: "which-collection@npm:1.0.2"\n  dependencies:\n    is-map: "npm:^2.0.3"\n    is-set: "npm:^2.0.3"\n    is-weakmap: "npm:^2.0.2"\n    is-weakset: "npm:^2.0.3"\n  checksum: 10c0/3345fde20964525a04cdf7c4a96821f85f0cc198f1b2ecb4576e08096746d129eb133571998fe121c77782ac8f21cbd67745a3d35ce100d26d4e684c142ea1f2\n  languageName: node\n  linkType: hard\n\n"which-typed-array@npm:^1.1.13":\n  version: 1.1.15\n  resolution: "which-typed-array@npm:1.1.15"\n  dependencies:\n    available-typed-arrays: "npm:^1.0.7"\n    call-bind: "npm:^1.0.7"\n    for-each: "npm:^0.3.3"\n    gopd: "npm:^1.0.1"\n    has-tostringtag: "npm:^1.0.2"\n  checksum: 10c0/4465d5348c044032032251be54d8988270e69c6b7154f8fcb2a47ff706fe36f7624b3a24246b8d9089435a8f4ec48c1c1025c5d6b499456b9e5eff4f48212983\n  languageName: node\n  linkType: hard\n\n"which@npm:^2.0.1":\n  version: 2.0.2\n  resolution: "which@npm:2.0.2"\n  dependencies:\n    isexe: "npm:^2.0.0"\n  bin:\n    node-which: ./bin/node-which\n  checksum: 10c0/66522872a768b60c2a65a57e8ad184e5372f5b6a9ca6d5f033d4b0dc98aff63995655a7503b9c0a2598936f532120e81dd8cc155e2e92ed662a2b9377cc4374f\n  languageName: node\n  linkType: hard\n\n"which@npm:^4.0.0":\n  version: 4.0.0\n  resolution: "which@npm:4.0.0"\n  dependencies:\n    isexe: "npm:^3.1.1"\n  bin:\n    node-which: bin/which.js\n  checksum: 10c0/449fa5c44ed120ccecfe18c433296a4978a7583bf2391c50abce13f76878d2476defde04d0f79db8165bdf432853c1f8389d0485ca6e8ebce3bbcded513d5e6a\n  languageName: node\n  linkType: hard\n\n"wide-align@npm:^1.1.2":\n  version: 1.1.5\n  resolution: "wide-align@npm:1.1.5"\n  dependencies:\n    string-width: "npm:^1.0.2 || 2 || 3 || 4"\n  checksum: 10c0/1d9c2a3e36dfb09832f38e2e699c367ef190f96b82c71f809bc0822c306f5379df87bab47bed27ea99106d86447e50eb972d3c516c2f95782807a9d082fbea95\n  languageName: node\n  linkType: hard\n\n"winston-transport@npm:^4.7.0":\n  version: 4.7.1\n  resolution: "winston-transport@npm:4.7.1"\n  dependencies:\n    logform: "npm:^2.6.1"\n    readable-stream: "npm:^3.6.2"\n    triple-beam: "npm:^1.3.0"\n  checksum: 10c0/99b7b55cc2ef7f38988ab1717e7fd946c81b856b42a9530aef8ee725490ef2f2811f9cb06d63aa2f76a85fe99ae15b3bef10a54afde3be8b5059ce325e78481f\n  languageName: node\n  linkType: hard\n\n"winston@npm:^3.14.2":\n  version: 3.14.2\n  resolution: "winston@npm:3.14.2"\n  dependencies:\n    "@colors/colors": "npm:^1.6.0"\n    "@dabh/diagnostics": "npm:^2.0.2"\n    async: "npm:^3.2.3"\n    is-stream: "npm:^2.0.0"\n    logform: "npm:^2.6.0"\n    one-time: "npm:^1.0.0"\n    readable-stream: "npm:^3.4.0"\n    safe-stable-stringify: "npm:^2.3.1"\n    stack-trace: "npm:0.0.x"\n    triple-beam: "npm:^1.3.0"\n    winston-transport: "npm:^4.7.0"\n  checksum: 10c0/3f8fe505ea18310982e60452f335dd2b22fdbc9b25839b6ad882971b2416d5adc94a1f1a46e24cb37d967ad01dfe5499adaf5e53575626b5ebb2a25ff30f4e1d\n  languageName: node\n  linkType: hard\n\n"wrap-ansi-cjs@npm:wrap-ansi@^7.0.0":\n  version: 7.0.0\n  resolution: "wrap-ansi@npm:7.0.0"\n  dependencies:\n    ansi-styles: "npm:^4.0.0"\n    string-width: "npm:^4.1.0"\n    strip-ansi: "npm:^6.0.0"\n  checksum: 10c0/d15fc12c11e4cbc4044a552129ebc75ee3f57aa9c1958373a4db0292d72282f54373b536103987a4a7594db1ef6a4f10acf92978f79b98c49306a4b58c77d4da\n  languageName: node\n  linkType: hard\n\n"wrap-ansi@npm:^8.1.0":\n  version: 8.1.0\n  resolution: "wrap-ansi@npm:8.1.0"\n  dependencies:\n    ansi-styles: "npm:^6.1.0"\n    string-width: "npm:^5.0.1"\n    strip-ansi: "npm:^7.0.1"\n  checksum: 10c0/138ff58a41d2f877eae87e3282c0630fc2789012fc1af4d6bd626eeb9a2f9a65ca92005e6e69a75c7b85a68479fe7443c7dbe1eb8fbaa681a4491364b7c55c60\n  languageName: node\n  linkType: hard\n\n"wrappy@npm:1":\n  version: 1.0.2\n  resolution: "wrappy@npm:1.0.2"\n  checksum: 10c0/56fece1a4018c6a6c8e28fbc88c87e0fbf4ea8fd64fc6c63b18f4acc4bd13e0ad2515189786dd2c30d3eec9663d70f4ecf699330002f8ccb547e4a18231fc9f0\n  languageName: node\n  linkType: hard\n\n"yallist@npm:^4.0.0":\n  version: 4.0.0\n  resolution: "yallist@npm:4.0.0"\n  checksum: 10c0/2286b5e8dbfe22204ab66e2ef5cc9bbb1e55dfc873bbe0d568aa943eb255d131890dfd5bf243637273d31119b870f49c18fcde2c6ffbb7a7a092b870dc90625a\n  languageName: node\n  linkType: hard\n\n"zip-stream@npm:^6.0.1":\n  version: 6.0.1\n  resolution: "zip-stream@npm:6.0.1"\n  dependencies:\n    archiver-utils: "npm:^5.0.0"\n    compress-commons: "npm:^6.0.2"\n    readable-stream: "npm:^4.0.0"\n  checksum: 10c0/50f2fb30327fb9d09879abf7ae2493705313adf403e794b030151aaae00009162419d60d0519e807673ec04d442e140c8879ca14314df0a0192de3b233e8f28b\n  languageName: node\n  linkType: hard\n	6c28a902bca1f1b6fd2412bbafaf850a	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-06 02:42:55.931389+00	2026-01-06 02:42:55.931389+00
\.


--
-- Data for Name: twoFactorAuthenticationMethod; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."twoFactorAuthenticationMethod" (id, "userWorkspaceId", secret, status, strategy, "createdAt", "updatedAt", "deletedAt") FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."user" (id, "firstName", "lastName", email, "defaultAvatarUrl", "isEmailVerified", disabled, "passwordHash", "canImpersonate", "canAccessFullAdminPanel", "createdAt", "updatedAt", "deletedAt", locale) FROM stdin;
18cc8d6d-cf03-4764-a439-0d0d5c9451c9			jacob@split-llc.com	\N	f	f	$2b$10$cjuQYqqhY4dbKklbnLEP5.LMvbhWgbErQcoSYl4OafL71.Wodi6Iy	t	t	2026-01-05 21:37:37.469253+00	2026-01-05 21:37:37.469253+00	\N	en
\.


--
-- Data for Name: userWorkspace; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."userWorkspace" (id, "userId", "workspaceId", "defaultAvatarUrl", locale, "createdAt", "updatedAt", "deletedAt") FROM stdin;
57472eba-90b8-4391-938e-387743ae9e0f	18cc8d6d-cf03-4764-a439-0d0d5c9451c9	d3db876d-62f4-4d97-9a5c-4405cbe62b22	\N	en	2026-01-05 21:37:37.469253+00	2026-01-05 21:37:37.469253+00	\N
\.


--
-- Data for Name: view; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core.view ("universalIdentifier", id, name, "objectMetadataId", type, key, icon, "position", "isCompact", "isCustom", "openRecordIn", "kanbanAggregateOperation", "kanbanAggregateOperationFieldMetadataId", "workspaceId", "createdAt", "updatedAt", "deletedAt", "anyFieldFilterValue", "calendarLayout", "calendarFieldMetadataId", "applicationId", visibility, "createdByUserWorkspaceId", "mainGroupByFieldMetadataId", "shouldHideEmptyGroups") FROM stdin;
20202020-a001-4a01-8a01-c0aba11c0001	eb111c1a-9cc2-44a2-9744-a54024c85ea0	All {objectLabelPlural}	adf06099-b76b-47c1-9519-bb10956030eb	TABLE	INDEX	IconList	0	f	f	SIDE_PANEL	\N	\N	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	\N	\N	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232	WORKSPACE	\N	\N	f
20202020-a002-4a02-8a02-ae0a1ea11a00	54f5b7f2-cb84-447c-9102-861827605629	All {objectLabelPlural}	df5c5db0-be63-4f64-ae64-f3b354f80cb9	TABLE	INDEX	IconList	0	f	f	SIDE_PANEL	\N	\N	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	\N	\N	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232	WORKSPACE	\N	\N	f
20202020-a003-4a03-8a03-0aa0b1ca1ba0	95170ae1-30e9-4f43-ad8b-1e39e151daac	All {objectLabelPlural}	77082a20-4eaa-4b81-b4e8-564c03c1ad16	TABLE	INDEX	IconList	0	f	f	SIDE_PANEL	\N	\N	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	\N	\N	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232	WORKSPACE	\N	\N	f
20202020-a004-4a04-8a04-0aa0b1ca1ba0	793d62ac-7961-46ce-a93e-228f2c89bb3b	By Stage	77082a20-4eaa-4b81-b4e8-564c03c1ad16	KANBAN	\N	IconLayoutKanban	2	f	f	SIDE_PANEL	MIN	835bbd7c-ad4f-4443-bb9c-623ca1f77b2e	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	\N	\N	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232	WORKSPACE	\N	a74ca777-7865-41a1-a200-2ae59ee9fa2f	f
20202020-a005-4a05-8a05-a0be5a11a000	ddad3049-4e62-4119-bc29-abcf848b00e5	All {objectLabelPlural}	7f0daf26-7887-47d7-b6d6-8d792b812e94	TABLE	INDEX	IconNotes	0	f	f	SIDE_PANEL	\N	\N	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	\N	\N	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232	WORKSPACE	\N	\N	f
20202020-a006-4a06-8a06-ba5ca11a1ea0	5a9f9fc8-e571-4853-9725-cc630006c0c1	All {objectLabelPlural}	4d66f605-f9ca-43fc-9d35-db72ee5f04bc	TABLE	INDEX	IconList	0	f	f	SIDE_PANEL	\N	\N	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	\N	\N	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232	WORKSPACE	\N	\N	f
20202020-a007-4a07-8a07-ba5ca551aaed	e871dba9-4783-40fd-8582-8842ebfc8009	Assigned to Me	4d66f605-f9ca-43fc-9d35-db72ee5f04bc	TABLE	\N	IconUserCircle	2	f	f	SIDE_PANEL	\N	\N	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	\N	\N	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232	WORKSPACE	\N	514d4604-217c-4924-922d-d298ad2c1e22	f
20202020-a008-4a08-8a08-ba5cba51aba5	992b9fe6-bd0f-4f89-b4d0-48b0c2410bc0	By Status	4d66f605-f9ca-43fc-9d35-db72ee5f04bc	KANBAN	\N	IconLayoutKanban	1	f	f	SIDE_PANEL	\N	\N	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	\N	\N	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232	WORKSPACE	\N	514d4604-217c-4924-922d-d298ad2c1e22	f
20202020-a009-4a09-8a09-a0bcf10aa11a	e0331dbe-776d-4a72-b272-58972bf7102f	All {objectLabelPlural}	e89d085a-8ec2-4b37-9560-3f1f708b57a6	TABLE	INDEX	IconSettingsAutomation	0	f	f	RECORD_PAGE	\N	\N	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	\N	\N	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232	WORKSPACE	\N	\N	f
20202020-a010-4a10-8a10-a0bcf10aae15	5396faa1-ff77-4317-8462-81301c90dd20	All {objectLabelPlural}	89bcd47d-b0a0-41ba-ba13-500cb520b5a9	TABLE	INDEX	IconVersions	0	f	f	RECORD_PAGE	\N	\N	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	\N	\N	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232	WORKSPACE	\N	\N	f
20202020-a011-4a11-8a11-a0bcf10abca5	c6ec66e8-92ec-4ed3-b2a9-49f11c2115ce	All {objectLabelPlural}	37ea5922-a5c5-4fba-8148-5a5580c7ec37	TABLE	INDEX	IconHistoryToggle	0	f	f	RECORD_PAGE	\N	\N	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	\N	\N	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232	WORKSPACE	\N	\N	f
20202020-a012-4a12-8a12-da5ab0b0a001	8f76a936-17de-4801-b6cd-a477b822e0f6	All {objectLabelPlural}	7b93a0b2-03a9-457e-88ef-1cc653c60660	TABLE	INDEX	IconLayoutDashboard	0	f	f	RECORD_PAGE	\N	\N	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	\N	\N	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232	WORKSPACE	\N	\N	f
20202020-e001-4e01-8e01-a0bcaeabe100	cc25813e-7788-4f48-ab1f-381dbbcabaae	All {objectLabelPlural}	c61c10a5-fad2-4072-9902-9cec39dbe21b	TABLE	INDEX	IconList	0	f	f	SIDE_PANEL	\N	\N	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	\N	\N	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232	WORKSPACE	\N	\N	f
20202020-d001-4d01-8d01-ae55a9e5a001	b0dabd11-f2e7-482a-a118-20f12b41b388	All {objectLabelPlural}	6e84550e-a74e-4e82-8700-4a5ed617ba6b	TABLE	INDEX	IconList	0	f	f	SIDE_PANEL	\N	\N	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	\N	\N	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232	WORKSPACE	\N	\N	f
20202020-d002-4d02-8d02-ae55a9ba2002	e07a901c-2cb1-4108-a99d-09ee2e5d6956	All {objectLabelPlural}	d477715c-e571-4c79-9c3d-27cf2a3f4683	TABLE	INDEX	IconList	0	f	f	SIDE_PANEL	\N	\N	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	\N	\N	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232	WORKSPACE	\N	\N	f
20202020-c001-4c01-8c01-ca1ebe0ca001	16ed7dab-3d09-4571-9bc0-b0ab91949e19	All {objectLabelPlural}	9ab0caad-fd52-46be-98b6-f1b607f1f8b6	TABLE	INDEX	IconCalendar	0	f	f	SIDE_PANEL	\N	\N	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	\N	\N	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232	WORKSPACE	\N	\N	f
20202020-b101-4b01-8b01-ba5cc01aa001	00ecad1b-0c7e-489b-94f0-d7dcf752f04e	All {objectLabelPlural}	6cbf283c-942f-4a51-aa7c-4f6fb83d5b07	TABLE	INDEX	IconList	0	f	f	RECORD_PAGE	\N	\N	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	\N	\N	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232	WORKSPACE	\N	\N	f
\.


--
-- Data for Name: viewField; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."viewField" ("universalIdentifier", id, "fieldMetadataId", "isVisible", size, "position", "aggregateOperation", "viewId", "workspaceId", "createdAt", "updatedAt", "deletedAt", "applicationId") FROM stdin;
20202020-af01-4a01-8a01-c0aba11cf001	ed49f0e7-6d88-4a18-a183-f2b4b71a5b30	34291d1e-bd23-472f-adde-c5e7ae219b43	t	180	0	\N	eb111c1a-9cc2-44a2-9744-a54024c85ea0	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af01-4a01-8a01-c0aba11cf002	f984457e-1e55-4238-97fc-919eb300f303	2d192d9d-d23b-42c3-80ea-4f6a9c5b6e60	t	100	1	\N	eb111c1a-9cc2-44a2-9744-a54024c85ea0	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af01-4a01-8a01-c0aba11cf003	b8c8e182-b15f-4b29-8e56-6e6f71b32414	e658c61d-9b50-4ba2-a59b-d61b932f7b2a	t	150	2	\N	eb111c1a-9cc2-44a2-9744-a54024c85ea0	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af01-4a01-8a01-c0aba11cf004	e215f600-daba-43d9-b0d7-daf94a044647	a1af0d87-a071-4080-a260-3fec85c6359a	t	150	3	\N	eb111c1a-9cc2-44a2-9744-a54024c85ea0	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af01-4a01-8a01-c0aba11cf005	46f03dc8-c580-4702-bed7-4de01ec41142	670802a4-1913-4b44-9a57-30f5e2a59021	t	150	4	\N	eb111c1a-9cc2-44a2-9744-a54024c85ea0	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af01-4a01-8a01-c0aba11cf006	255a1dcb-c6ab-486a-adee-9e13f7829a7d	558e59f0-bbc5-4a21-ba4f-7a97f8423f42	t	150	5	\N	eb111c1a-9cc2-44a2-9744-a54024c85ea0	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af01-4a01-8a01-c0aba11cf007	4aeb59f6-daf5-4378-ab5b-7b4d2c7ed360	408abd61-1370-41a6-b3ae-0a09ec2d247b	t	170	6	\N	eb111c1a-9cc2-44a2-9744-a54024c85ea0	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af01-4a01-8a01-c0aba11cf008	08ed4c34-2ec8-4e6f-bf4b-8b5fa16a956f	02e15066-2f33-469b-933c-0fb519f37f8b	t	170	7	\N	eb111c1a-9cc2-44a2-9744-a54024c85ea0	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af02-4a02-8a02-ae0a1ea11af0	8aa95fe3-8ce3-4aca-9d21-5d0d11cd5ba4	f8224e96-02c4-4cb6-bfd5-55581237cbb3	t	210	0	\N	54f5b7f2-cb84-447c-9102-861827605629	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af02-4a02-8a02-ae0a1ea11af1	4f2cc551-8acb-4aac-bda0-251c3abbe3f3	a477a67b-cf0d-42fe-b95e-df0ed7f38d04	t	150	1	\N	54f5b7f2-cb84-447c-9102-861827605629	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af02-4a02-8a02-ae0a1ea11af2	5d86c7f9-885e-4154-ab29-ac669212b9d1	aaaafa1f-a60a-46c6-8dab-97497a3190c8	t	150	2	\N	54f5b7f2-cb84-447c-9102-861827605629	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af02-4a02-8a02-ae0a1ea11af3	7e7a486c-cc27-4068-948f-3ba7537b335b	570d723b-1232-4c20-b317-1f77f319dd9f	t	150	3	\N	54f5b7f2-cb84-447c-9102-861827605629	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af02-4a02-8a02-ae0a1ea11af4	0d033556-d9ca-4612-8fd6-0fde863b9132	b4d586b8-837b-4e97-a448-de6bd310bf73	t	150	4	\N	54f5b7f2-cb84-447c-9102-861827605629	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af02-4a02-8a02-ae0a1ea11af5	731ec1b5-be60-46ad-8049-b38a68143034	d1adc0fb-9e01-4a34-ae16-116ffe050b39	t	150	5	\N	54f5b7f2-cb84-447c-9102-861827605629	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af02-4a02-8a02-ae0a1ea11af6	0c24633e-7002-4ed3-b5f9-81eae86a8e36	2eea4fb8-5104-475a-baf8-12e9c538382f	t	150	6	\N	54f5b7f2-cb84-447c-9102-861827605629	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af02-4a02-8a02-ae0a1ea11af7	56123cdf-67a4-4914-998a-361440a76448	51404b8b-cb11-427e-9b8b-5d27cd8377cc	t	150	7	\N	54f5b7f2-cb84-447c-9102-861827605629	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af02-4a02-8a02-ae0a1ea11af8	8896488f-ea09-49ea-8407-516199aeb35c	73f9b7c7-c4c7-4a85-9890-6bc3256e9496	t	150	8	\N	54f5b7f2-cb84-447c-9102-861827605629	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af02-4a02-8a02-ae0a1ea11af9	2545512b-de88-4684-84ed-0d60ee6e3c1b	2e2f8cc4-bae2-45ca-b417-427794a25d11	t	150	9	\N	54f5b7f2-cb84-447c-9102-861827605629	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af03-4a03-8a03-0aa0b1ca1baf	027ca701-8258-4cc6-b44b-ccb8fc893bb7	bbeae473-1711-4438-bae1-0fb7d275e8c4	t	150	0	\N	95170ae1-30e9-4f43-ad8b-1e39e151daac	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af03-4a03-8a03-0aa0b1ca1bb0	84ffe6de-f038-4b31-ae0b-8100100bf0fa	835bbd7c-ad4f-4443-bb9c-623ca1f77b2e	t	150	1	\N	95170ae1-30e9-4f43-ad8b-1e39e151daac	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af03-4a03-8a03-0aa0b1ca1bb1	36666cc7-9345-4e68-9e08-c188c006a1ae	0a129a69-65c7-4e96-9676-5ad0ab6a5c73	t	150	2	\N	95170ae1-30e9-4f43-ad8b-1e39e151daac	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af03-4a03-8a03-0aa0b1ca1bb2	8455217f-9775-42d9-ad60-be63d7327da0	43d82dd4-18ec-442b-8e79-bf6aded3a543	t	150	3	\N	95170ae1-30e9-4f43-ad8b-1e39e151daac	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af03-4a03-8a03-0aa0b1ca1bb3	69529cce-3130-405e-ad76-d0937614a68c	0a731520-02df-4414-b033-987b2de7121d	t	150	4	\N	95170ae1-30e9-4f43-ad8b-1e39e151daac	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af03-4a03-8a03-0aa0b1ca1bb4	a8ad1e34-b62b-4eb3-8d69-5b07e65e56af	f9d85e77-e4a6-40ff-b0c4-63a0fae9e339	t	150	5	\N	95170ae1-30e9-4f43-ad8b-1e39e151daac	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af04-4a04-8a04-0aa0b2ca2baf	af0c2cb3-574c-433f-afaf-e5e2e1e94371	bbeae473-1711-4438-bae1-0fb7d275e8c4	t	150	0	\N	793d62ac-7961-46ce-a93e-228f2c89bb3b	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af04-4a04-8a04-0aa0b2ca2bb0	36fff700-b893-456e-8c07-a2bfaf92e3bb	835bbd7c-ad4f-4443-bb9c-623ca1f77b2e	t	150	1	\N	793d62ac-7961-46ce-a93e-228f2c89bb3b	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af04-4a04-8a04-0aa0b2ca2bb1	b7bd8a96-da76-45c7-af6c-8b4fda328f59	0a129a69-65c7-4e96-9676-5ad0ab6a5c73	t	150	2	\N	793d62ac-7961-46ce-a93e-228f2c89bb3b	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af04-4a04-8a04-0aa0b2ca2bb2	57ed09b7-2714-46bb-84bb-fe907f5849a8	43d82dd4-18ec-442b-8e79-bf6aded3a543	t	150	3	\N	793d62ac-7961-46ce-a93e-228f2c89bb3b	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af04-4a04-8a04-0aa0b2ca2bb3	5aa863be-fb14-476e-9dc1-1e429f14b328	0a731520-02df-4414-b033-987b2de7121d	t	150	4	\N	793d62ac-7961-46ce-a93e-228f2c89bb3b	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af04-4a04-8a04-0aa0b2ca2bb4	2680fffb-1a6a-484b-9d75-54098071cd1a	f9d85e77-e4a6-40ff-b0c4-63a0fae9e339	t	150	5	\N	793d62ac-7961-46ce-a93e-228f2c89bb3b	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af05-4a05-8a05-a0be5a11af00	01785ee0-6929-4aa3-91bf-4b728621e99e	fabb04e8-4fe5-4cb1-b807-2499c92517e5	t	210	0	\N	ddad3049-4e62-4119-bc29-abcf848b00e5	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af05-4a05-8a05-a0be5a11af01	f467fc17-3bc0-498e-a402-9459247af2e2	1133e798-06b7-44ec-a956-ad8fae111097	t	150	1	\N	ddad3049-4e62-4119-bc29-abcf848b00e5	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af05-4a05-8a05-a0be5a11af02	06123cc2-8eab-4c93-891d-7ec0b233660f	42496b73-d5cd-4268-8f0d-25bae0593390	t	150	2	\N	ddad3049-4e62-4119-bc29-abcf848b00e5	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af05-4a05-8a05-a0be5a11af03	1c86323f-1eab-4b4c-b86d-4abbb3b4eb94	0ceb9bb9-e059-428d-9c76-55195d773bd6	t	150	3	\N	ddad3049-4e62-4119-bc29-abcf848b00e5	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af05-4a05-8a05-a0be5a11af04	e7c3d718-f897-42f9-8def-2e2414da1227	1b9cdfcb-baa1-4548-8e18-9d07619a6346	t	150	4	\N	ddad3049-4e62-4119-bc29-abcf848b00e5	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af06-4a06-8a06-ba5ca11a1eaf	a66aba03-bf30-4e1a-b860-b9916077ea62	061116b6-d7a8-42a7-989e-ed8b6f89cad5	t	210	0	\N	5a9f9fc8-e571-4853-9725-cc630006c0c1	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af06-4a06-8a06-ba5ca11a1eb0	8ed4756e-8790-404f-9ea9-d4f42efc14e2	514d4604-217c-4924-922d-d298ad2c1e22	t	150	2	\N	5a9f9fc8-e571-4853-9725-cc630006c0c1	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af06-4a06-8a06-ba5ca11a1eb1	be8aa939-72c8-4f41-91d4-e4f9970ed71f	a3319c39-a0b9-460b-b693-048c6dd0bdee	t	150	3	\N	5a9f9fc8-e571-4853-9725-cc630006c0c1	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af06-4a06-8a06-ba5ca11a1eb2	30977f65-253c-4977-840b-a21aca698279	cae4dbaa-ed35-4ed3-af41-08bac41edd9c	t	150	4	\N	5a9f9fc8-e571-4853-9725-cc630006c0c1	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af06-4a06-8a06-ba5ca11a1eb3	31cae67c-d213-4c49-bee5-296a8951d333	404fe754-d86e-4733-be2a-f964c669bc1f	t	150	5	\N	5a9f9fc8-e571-4853-9725-cc630006c0c1	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af06-4a06-8a06-ba5ca11a1eb4	c3dbe951-7731-4cbc-a7bf-82e22c6225f8	f8154574-5989-4cbb-9e59-61f04faaf89a	t	150	6	\N	5a9f9fc8-e571-4853-9725-cc630006c0c1	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af06-4a06-8a06-ba5ca11a1eb5	92977e97-1b32-4c97-94c4-b36360ca2afa	0f318c60-7038-4dce-97df-c10455eccb37	t	150	7	\N	5a9f9fc8-e571-4853-9725-cc630006c0c1	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af06-4a06-8a06-ba5ca11a1eb6	5ad8f1f2-5ffa-4b9a-be2c-7d9a0f29f15e	c49d904b-5ed6-42fc-aeac-2a2cf07e2386	t	150	8	\N	5a9f9fc8-e571-4853-9725-cc630006c0c1	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af07-4a07-8a07-ba5ca551aaed	32689050-eb80-4816-967f-e694d907da6a	061116b6-d7a8-42a7-989e-ed8b6f89cad5	t	210	0	\N	e871dba9-4783-40fd-8582-8842ebfc8009	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af07-4a07-8a07-ba5ca551aaee	d618e6e1-aaee-4263-ac11-49d132652045	a3319c39-a0b9-460b-b693-048c6dd0bdee	t	150	3	\N	e871dba9-4783-40fd-8582-8842ebfc8009	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af07-4a07-8a07-ba5ca551aaef	a61384e0-d26b-474c-b6c9-80eb1f801dba	cae4dbaa-ed35-4ed3-af41-08bac41edd9c	t	150	4	\N	e871dba9-4783-40fd-8582-8842ebfc8009	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af07-4a07-8a07-ba5ca551aaf0	30288067-d315-4a7d-95a4-d1972feab4ab	404fe754-d86e-4733-be2a-f964c669bc1f	t	150	5	\N	e871dba9-4783-40fd-8582-8842ebfc8009	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af07-4a07-8a07-ba5ca551aaf1	0bbbaf62-eb93-4479-b504-075cdeea5967	f8154574-5989-4cbb-9e59-61f04faaf89a	t	150	6	\N	e871dba9-4783-40fd-8582-8842ebfc8009	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af07-4a07-8a07-ba5ca551aaf2	d5a5b4ee-83c5-4fa7-8d8f-26e636e398c0	0f318c60-7038-4dce-97df-c10455eccb37	t	150	7	\N	e871dba9-4783-40fd-8582-8842ebfc8009	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af07-4a07-8a07-ba5ca551aaf3	9cd9371a-afad-4774-929d-817cf62508a6	c49d904b-5ed6-42fc-aeac-2a2cf07e2386	t	150	8	\N	e871dba9-4783-40fd-8582-8842ebfc8009	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af08-4a08-8a08-ba5cba5babf0	52e5060a-c8eb-4e13-9460-9e51a07e5d82	061116b6-d7a8-42a7-989e-ed8b6f89cad5	t	210	0	\N	992b9fe6-bd0f-4f89-b4d0-48b0c2410bc0	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af08-4a08-8a08-ba5cba5babf1	3b3f8918-a299-40ad-a58b-3f58de10a279	514d4604-217c-4924-922d-d298ad2c1e22	t	150	2	\N	992b9fe6-bd0f-4f89-b4d0-48b0c2410bc0	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af08-4a08-8a08-ba5cba5babf2	89bc7046-66db-443c-9510-c0f91b6747da	404fe754-d86e-4733-be2a-f964c669bc1f	t	150	3	\N	992b9fe6-bd0f-4f89-b4d0-48b0c2410bc0	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af08-4a08-8a08-ba5cba5babf3	2ca83fba-9b6c-448a-8c67-7968a5f9bba3	f8154574-5989-4cbb-9e59-61f04faaf89a	t	150	4	\N	992b9fe6-bd0f-4f89-b4d0-48b0c2410bc0	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af08-4a08-8a08-ba5cba5babf4	798b8279-5f7a-4016-ae99-00d877468e4c	c49d904b-5ed6-42fc-aeac-2a2cf07e2386	t	150	6	\N	992b9fe6-bd0f-4f89-b4d0-48b0c2410bc0	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af09-4a09-8a09-a0bcf10aa11a	80759463-e1db-4f06-a023-dd02467ab08d	d214168c-902f-4fa1-995e-54bc0d51f173	t	150	0	\N	e0331dbe-776d-4a72-b272-58972bf7102f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af09-4a09-8a09-a0bcf10aa11b	19cd8078-e70f-4ee0-bc8d-99542bac6737	244f1603-d76d-4865-9357-1af112db153f	t	150	1	\N	e0331dbe-776d-4a72-b272-58972bf7102f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af09-4a09-8a09-a0bcf10aa11c	e5ab711d-aba0-4680-b9e4-ba19939deb54	582473de-3d97-4144-9d78-83fbda9107a8	t	150	2	\N	e0331dbe-776d-4a72-b272-58972bf7102f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af09-4a09-8a09-a0bcf10aa11d	d8e5b33f-cabc-4da1-b6ad-011c4c80123a	4049d80d-c196-4d1f-baaf-cac051a2733c	t	150	3	\N	e0331dbe-776d-4a72-b272-58972bf7102f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af09-4a09-8a09-a0bcf10aa11e	debd3753-18a3-411f-9b40-e2f7a56f94fd	0104ee5c-2860-4ed5-8c8d-9dd58270a29f	t	150	4	\N	e0331dbe-776d-4a72-b272-58972bf7102f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af09-4a09-8a09-a0bcf10aa11f	607279ec-bad2-4484-b2fd-ce419b7ef87a	6c697986-9d14-4102-ac34-42d58a2a21c7	f	150	5	\N	e0331dbe-776d-4a72-b272-58972bf7102f	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af10-4a10-8a10-a0bcf10aaeaf	47487ed3-ede6-4b20-a26e-279cf937c54a	1aa79add-25cd-4cdb-b579-be766190061a	t	210	0	\N	5396faa1-ff77-4317-8462-81301c90dd20	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af10-4a10-8a10-a0bcf10aaeb0	3086bcbc-72c6-4ac5-9cde-71be3df090da	c9e30ede-8a80-4887-a8a2-278030d7b001	t	150	1	\N	5396faa1-ff77-4317-8462-81301c90dd20	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af10-4a10-8a10-a0bcf10aaeb1	4ecba750-e519-4ebb-a4a9-5441dac74bc6	445f7ad1-e9b6-439b-9ac2-8ef21a567b90	t	150	2	\N	5396faa1-ff77-4317-8462-81301c90dd20	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af10-4a10-8a10-a0bcf10aaeb2	7a60af9c-a84f-4084-8368-351a04f783e2	ccc993a3-b8ee-49fa-a7db-6aeea7c9fde0	t	150	3	\N	5396faa1-ff77-4317-8462-81301c90dd20	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af10-4a10-8a10-a0bcf10aaeb3	c0fc9e43-574e-4de6-8b9a-848a4c9f8b67	808d5dfc-6ff3-417f-bd0d-9cb9c0975d54	f	150	4	\N	5396faa1-ff77-4317-8462-81301c90dd20	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af11-4a11-8a11-a0bcf10abcaf	70a988a3-9dbd-4791-82f9-9d3fde07aac9	86371281-8818-4e4b-863a-0a1b7de712a8	t	150	0	\N	c6ec66e8-92ec-4ed3-b2a9-49f11c2115ce	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af11-4a11-8a11-a0bcf10abcb0	6133663b-5a58-4b55-a414-59a2ea425786	787dd727-3b88-4dc1-a1bf-9b8ec7e0f6ea	t	150	1	\N	c6ec66e8-92ec-4ed3-b2a9-49f11c2115ce	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af11-4a11-8a11-a0bcf10abcb1	a1300ea7-bd93-43f5-ab1b-2fc2242fe937	876d5933-50db-473e-b193-b680360daebe	t	150	2	\N	c6ec66e8-92ec-4ed3-b2a9-49f11c2115ce	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af11-4a11-8a11-a0bcf10abcb2	858e93b9-f0f7-4e1c-8b51-371221576ee7	f965e069-eb09-4af1-b0a5-4fd410db61d0	t	150	3	\N	c6ec66e8-92ec-4ed3-b2a9-49f11c2115ce	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af11-4a11-8a11-a0bcf10abcb3	de8862e4-1981-4cbc-b5d0-7402d3e8f7eb	838cea6f-dfb9-4994-9a34-2a0e2cbdf38b	t	150	4	\N	c6ec66e8-92ec-4ed3-b2a9-49f11c2115ce	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af11-4a11-8a11-a0bcf10abcb4	70e002d3-041a-41fa-9aff-df2ef0e02ee5	6c5aaa63-7f20-4a7e-ad4f-21eebb59877f	t	150	5	\N	c6ec66e8-92ec-4ed3-b2a9-49f11c2115ce	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af12-4a12-8a12-da5ab0b0af01	1cfac7d0-41f2-43d6-8b38-8c9a5b1f9fbb	d4da218e-6286-4c54-921e-1f677897e0c8	t	200	0	\N	8f76a936-17de-4801-b6cd-a477b822e0f6	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af12-4a12-8a12-da5ab0b0af02	77a60273-5e9a-4ff0-8376-2a4bfe8289cb	5d2ee768-bdbe-4bda-81c2-e96afd30dc67	t	150	1	\N	8f76a936-17de-4801-b6cd-a477b822e0f6	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af12-4a12-8a12-da5ab0b0af03	1fd797c3-9914-486f-9b95-2ab49c3940bf	11c2e679-fafe-4293-82e6-c6d2eac931ad	t	150	2	\N	8f76a936-17de-4801-b6cd-a477b822e0f6	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af12-4a12-8a12-da5ab0b0af04	ae88d6de-2323-4ba8-ab15-18cd33292b69	8dd4b4a6-a290-4181-bb18-525a04dc6eb3	t	150	3	\N	8f76a936-17de-4801-b6cd-a477b822e0f6	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-ef01-4e01-8e01-a0bcaeabe1f0	be0fa1f8-1b3e-4887-a611-d1ab2166297c	98f9efe6-da7d-4d13-94ec-8f057ce60e36	t	180	0	\N	cc25813e-7788-4f48-ab1f-381dbbcabaae	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-ef01-4e01-8e01-a0bcaeabe1f1	e27dcc60-4786-4ab0-ab5a-d18b340e29d7	7da61240-debc-4efb-a0f7-3545e3d889cf	t	180	1	\N	cc25813e-7788-4f48-ab1f-381dbbcabaae	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-ef01-4e01-8e01-a0bcaeabe1f2	bb97edd8-2ffc-44ac-b70d-41986222bd8d	64370561-77cb-4153-b1a4-045f940d27d9	t	150	2	\N	cc25813e-7788-4f48-ab1f-381dbbcabaae	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-ef01-4e01-8e01-a0bcaeabe1f3	3740ae2f-c9fe-44eb-a52d-b07b15faad45	b7a29690-7ac4-4fd5-9f0b-5cbf0a2b0900	t	150	3	\N	cc25813e-7788-4f48-ab1f-381dbbcabaae	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-ef01-4e01-8e01-a0bcaeabe1f4	4455a72c-e08e-4e04-9dbc-0ed2eb4e2f80	6a72f2b8-3a13-46da-a5f5-756d141d2cd0	t	120	4	\N	cc25813e-7788-4f48-ab1f-381dbbcabaae	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-ef01-4e01-8e01-a0bcaeabe1f5	5fae2be0-0ffe-4eb1-b066-92a8beb33cde	7df943b1-71e4-4ece-8453-e52de9f2fad2	t	150	5	\N	cc25813e-7788-4f48-ab1f-381dbbcabaae	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-ef01-4e01-8e01-a0bcaeabe1f6	3537fd67-ab19-434a-91bb-f886823fab5b	40164299-36e0-40ca-89c2-157cc885e15c	t	120	6	\N	cc25813e-7788-4f48-ab1f-381dbbcabaae	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-ef01-4e01-8e01-a0bcaeabe1f7	e4abde48-d10f-43df-b135-084d0767624b	bc43f3e2-2fdd-4eb6-97de-1059d7a8ecf9	t	120	7	\N	cc25813e-7788-4f48-ab1f-381dbbcabaae	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-ef01-4e01-8e01-a0bcaeabe1f8	90031035-022a-4d4a-b948-7ace82f45a09	5a9a796f-4e32-40fc-bdad-b6ce620b7797	t	150	8	\N	cc25813e-7788-4f48-ab1f-381dbbcabaae	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-df01-4d01-8d01-ae55a9e5af01	c662cf4e-ffec-4720-bc5c-7893fbdf6379	3e6102c1-4df1-4254-be49-4347772672ea	t	180	0	\N	b0dabd11-f2e7-482a-a118-20f12b41b388	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-df01-4d01-8d01-ae55a9e5af02	2f30931d-2c2a-4d8b-8a74-89b19a165ef5	811dcd39-1513-4b0c-abc2-f39b8eb8a937	t	150	1	\N	b0dabd11-f2e7-482a-a118-20f12b41b388	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-df01-4d01-8d01-ae55a9e5af03	7a50f184-e4ff-411c-8db5-e656d0729619	0733327b-6c3b-4f39-9387-c3df5d2f12fa	t	150	2	\N	b0dabd11-f2e7-482a-a118-20f12b41b388	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-df01-4d01-8d01-ae55a9e5af04	32d7434f-acbd-4f3a-a0e7-e46a405f2ca6	14e86a0d-e0b5-49b9-92f8-23eb1582b1b2	t	150	3	\N	b0dabd11-f2e7-482a-a118-20f12b41b388	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-df01-4d01-8d01-ae55a9e5af05	a891ae45-029d-4209-84c5-b3ff9dd098b9	77084878-6697-4e35-bb52-df213cd01371	t	180	4	\N	b0dabd11-f2e7-482a-a118-20f12b41b388	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-df01-4d01-8d01-ae55a9e5af06	3d5db8b0-0ac1-4b44-8f8a-87f7af567486	690e9b12-a0b2-4e04-9598-bfca48150eda	t	200	5	\N	b0dabd11-f2e7-482a-a118-20f12b41b388	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-df01-4d01-8d01-ae55a9e5af07	cd15346b-eb2d-46c0-86af-dba335a4902f	4e149900-01a0-44f7-af5d-d450d474d5f6	t	150	6	\N	b0dabd11-f2e7-482a-a118-20f12b41b388	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-df02-4d02-8d02-ae55a9ba2f01	e0504694-9e68-4580-9e05-73d83963619c	27df5dd5-54df-43c0-868c-aba48b7b92fc	t	180	0	\N	e07a901c-2cb1-4108-a99d-09ee2e5d6956	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-df02-4d02-8d02-ae55a9ba2f02	56b25f22-32ff-4698-a9f3-a6165512eabf	9fb6a87c-971d-4ee9-bb3e-d2417d4b917a	t	150	1	\N	e07a901c-2cb1-4108-a99d-09ee2e5d6956	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-cf01-4c01-8c01-ca1ebe0caf01	554db4a3-310a-43e3-93ad-cc111844418e	1710cbd5-148a-4db8-92bb-2f0be86530c6	t	180	0	\N	16ed7dab-3d09-4571-9bc0-b0ab91949e19	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-cf01-4c01-8c01-ca1ebe0caf02	f42479b3-531a-459a-afcb-0af4c7959908	00755d5d-d67d-430e-8229-cd226b370ac2	t	150	1	\N	16ed7dab-3d09-4571-9bc0-b0ab91949e19	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-cf01-4c01-8c01-ca1ebe0caf03	07bcecae-d79d-4a4c-aea3-a117801fec4d	c5253ff4-7e3e-4941-9984-92a63736dbe9	t	150	2	\N	16ed7dab-3d09-4571-9bc0-b0ab91949e19	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-cf01-4c01-8c01-ca1ebe0caf04	99f84f3c-5599-479a-9ecb-b19730220c0f	b6efe25d-3720-4154-9a23-5eb3fafbd79a	t	100	3	\N	16ed7dab-3d09-4571-9bc0-b0ab91949e19	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-cf01-4c01-8c01-ca1ebe0caf05	f2dac113-6daf-4e17-af17-aedef741343f	50a4cf5b-cd1f-4693-a9e1-9f3672272627	t	150	4	\N	16ed7dab-3d09-4571-9bc0-b0ab91949e19	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-cf01-4c01-8c01-ca1ebe0caf06	6194f8a8-24a6-47d5-ae5d-80816308b8d3	d2a08f07-5ed9-421e-aad7-f073c6e5230f	t	150	5	\N	16ed7dab-3d09-4571-9bc0-b0ab91949e19	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-cf01-4c01-8c01-ca1ebe0caf07	2cdfc3d8-201f-4930-beaa-d6f2793198a4	34e3c5cb-022a-4274-ae7c-cd8706d59c00	t	100	6	\N	16ed7dab-3d09-4571-9bc0-b0ab91949e19	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-cf01-4c01-8c01-ca1ebe0caf08	03ebda84-0542-4085-89fa-ab9af5898457	1ee8d9a3-ff34-481c-9e0b-21f3b6232d1f	t	150	7	\N	16ed7dab-3d09-4571-9bc0-b0ab91949e19	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-bf01-4b01-8b01-ba5cc01aa011	256444a2-488e-4cff-a799-2389b2fe62a8	f99f5844-aa85-45bc-a31c-2c1a350194de	t	180	0	\N	00ecad1b-0c7e-489b-94f0-d7dcf752f04e	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-bf01-4b01-8b01-ba5cc01aa012	344c103d-c086-4f29-a41f-5125c3a98e7c	2f83d12b-ad79-442b-8772-53d280783542	t	150	1	\N	00ecad1b-0c7e-489b-94f0-d7dcf752f04e	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-bf01-4b01-8b01-ba5cc01aa019	70567906-70fc-40e4-bf88-20fba2974b4d	f01ab746-47c1-4bfb-94a9-aecba46c8938	t	200	2	\N	00ecad1b-0c7e-489b-94f0-d7dcf752f04e	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-bf01-4b01-8b01-ba5cc01aa013	33428074-e5f7-49d9-8e40-26dba2f595b8	3f387080-ee3a-4192-b190-de3f63be1b23	t	150	3	\N	00ecad1b-0c7e-489b-94f0-d7dcf752f04e	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-bf01-4b01-8b01-ba5cc01aa017	db571486-a7f6-4ffe-9a2c-1d96d1987993	35e15bad-4ecd-4c83-a09f-f2d89b0c1a22	t	200	4	\N	00ecad1b-0c7e-489b-94f0-d7dcf752f04e	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
\.


--
-- Data for Name: viewFilter; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."viewFilter" ("universalIdentifier", id, "fieldMetadataId", operand, value, "viewFilterGroupId", "positionInViewFilterGroup", "subFieldName", "viewId", "workspaceId", "createdAt", "updatedAt", "deletedAt", "applicationId") FROM stdin;
20202020-af17-4a07-8a07-ba5ca551abf1	9f8afa92-e6c3-491e-ae16-66571ba52ec0	f8154574-5989-4cbb-9e59-61f04faaf89a	IS	"{\\"isCurrentWorkspaceMemberSelected\\":true,\\"selectedRecordIds\\":[]}"	\N	\N	\N	e871dba9-4783-40fd-8582-8842ebfc8009	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
\.


--
-- Data for Name: viewFilterGroup; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."viewFilterGroup" ("universalIdentifier", id, "parentViewFilterGroupId", "logicalOperator", "positionInViewFilterGroup", "viewId", "workspaceId", "createdAt", "updatedAt", "deletedAt", "applicationId") FROM stdin;
\.


--
-- Data for Name: viewGroup; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."viewGroup" ("universalIdentifier", id, "isVisible", "fieldValue", "position", "viewId", "workspaceId", "createdAt", "updatedAt", "deletedAt", "applicationId") FROM stdin;
20202020-af14-4a04-8a04-0aa0b2ca2bf1	83e64485-0b0a-48a3-be33-0d26d15d8310	t	NEW	0	793d62ac-7961-46ce-a93e-228f2c89bb3b	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af14-4a04-8a04-0aa0b2ca2bf2	535e7e5f-d788-4c9e-b827-8177ab807d95	t	SCREENING	1	793d62ac-7961-46ce-a93e-228f2c89bb3b	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af14-4a04-8a04-0aa0b2ca2bf3	d5c622fb-ee0b-4152-bccf-345bb1a58751	t	MEETING	2	793d62ac-7961-46ce-a93e-228f2c89bb3b	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af14-4a04-8a04-0aa0b2ca2bf4	14ca392b-8378-4045-b2c8-2fb028c85751	t	PROPOSAL	3	793d62ac-7961-46ce-a93e-228f2c89bb3b	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af14-4a04-8a04-0aa0b2ca2bf5	70ffaec9-fc8c-4cf1-9f7e-62e27aa6e5c4	t	CUSTOMER	4	793d62ac-7961-46ce-a93e-228f2c89bb3b	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af17-4a07-8a07-ba5ca551abf2	3836834e-975c-456d-95ba-776b9aba44a7	t	TODO	0	e871dba9-4783-40fd-8582-8842ebfc8009	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af17-4a07-8a07-ba5ca551abf3	46e14c19-0925-4e2e-875e-0e43c890170f	t	IN_PROGRESS	1	e871dba9-4783-40fd-8582-8842ebfc8009	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af17-4a07-8a07-ba5ca551abf4	cf79e332-346d-4015-87d5-e229a158e9ae	t	DONE	2	e871dba9-4783-40fd-8582-8842ebfc8009	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af17-4a07-8a07-ba5ca551abf5	5b27eeed-637b-4779-be36-7391f49b9090	t		3	e871dba9-4783-40fd-8582-8842ebfc8009	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af18-4a08-8a08-ba5cba5bbf01	5e699eed-01fd-40d7-a168-42d873a897c8	t	TODO	0	992b9fe6-bd0f-4f89-b4d0-48b0c2410bc0	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af18-4a08-8a08-ba5cba5bbf02	54b5c22f-002b-430f-bdb9-ac403ab3269a	t	IN_PROGRESS	1	992b9fe6-bd0f-4f89-b4d0-48b0c2410bc0	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
20202020-af18-4a08-8a08-ba5cba5bbf03	52bd93cd-3113-4f0d-a567-45481fd4dbd3	t	DONE	2	992b9fe6-bd0f-4f89-b4d0-48b0c2410bc0	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	f075fdc3-4e1e-4ff5-bb37-4097737ce232
\.


--
-- Data for Name: viewSort; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."viewSort" ("universalIdentifier", id, "fieldMetadataId", direction, "viewId", "workspaceId", "createdAt", "updatedAt", "deletedAt", "applicationId") FROM stdin;
\.


--
-- Data for Name: webhook; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core.webhook (id, "targetUrl", operations, description, secret, "workspaceId", "createdAt", "updatedAt", "deletedAt") FROM stdin;
\.


--
-- Data for Name: workspace; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core.workspace (id, "displayName", logo, "inviteHash", "deletedAt", "createdAt", "updatedAt", "allowImpersonation", "isPublicInviteLinkEnabled", "activationStatus", "metadataVersion", "databaseUrl", "databaseSchema", subdomain, "customDomain", "isGoogleAuthEnabled", "isTwoFactorAuthenticationEnforced", "isPasswordAuthEnabled", "isMicrosoftAuthEnabled", "isCustomDomainEnabled", "defaultRoleId", version, "trashRetentionDays", "routerModel", "isGoogleAuthBypassEnabled", "isPasswordAuthBypassEnabled", "isMicrosoftAuthBypassEnabled", "workspaceCustomApplicationId", "editableProfileFields", "fastModel", "smartModel") FROM stdin;
d3db876d-62f4-4d97-9a5c-4405cbe62b22	Split	https://twenty-icons.com/split-llc.com	374b9690-df70-422b-92f6-7424b929b786	\N	2026-01-05 21:37:37.469253+00	2026-01-06 02:36:52.55255+00	t	t	ACTIVE	2			split-llc	\N	t	f	t	t	f	686940f2-a228-4e78-92b4-78c22d0ba18d	1.14.0	14	auto	f	f	f	bc39da16-2038-4501-822f-ba7ef921bc44	{email,profilePicture,firstName,lastName}	default-fast-model	default-smart-model
\.


--
-- Data for Name: workspaceMigration; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."workspaceMigration" (id, migrations, name, "isCustom", "appliedAt", "workspaceId", "createdAt") FROM stdin;
72e8cd78-ff52-46d9-99cf-c4d16aaf02cf	[{"name": "attachment", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "authorId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "attachment", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "SET_NULL", "columnName": "authorId", "referencedTableName": "workspaceMember", "referencedTableColumnName": "id"}]}]	1767649065658-create-relation-from-attachment-to-workspaceMember	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
90feeba8-0a9a-442a-ba40-1133f90589ff	[{"name": "attachment", "action": "create", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "name", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "fullPath", "columnType": "text", "isNullable": true, "defaultValue": null}, {"enum": ["ARCHIVE", "AUDIO", "IMAGE", "PRESENTATION", "SPREADSHEET", "TEXT_DOCUMENT", "VIDEO", "OTHER"], "action": "CREATE", "isArray": false, "isUnique": false, "columnName": "fileCategory", "columnType": "enum", "isNullable": false, "defaultValue": "'OTHER'"}, {"enum": ["EMAIL", "CALENDAR", "WORKFLOW", "AGENT", "API", "IMPORT", "MANUAL", "SYSTEM", "WEBHOOK", "APPLICATION"], "action": "CREATE", "isUnique": false, "columnName": "createdBySource", "columnType": "enum", "isNullable": false, "defaultValue": "'MANUAL'"}, {"action": "CREATE", "isUnique": false, "columnName": "createdByWorkspaceMemberId", "columnType": "uuid", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "createdByName", "columnType": "text", "isNullable": false, "defaultValue": "'System'"}, {"action": "CREATE", "isUnique": false, "columnName": "createdByContext", "columnType": "jsonb", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "id", "columnType": "uuid", "isNullable": false, "defaultValue": "public.uuid_generate_v4()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "createdAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "updatedAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "deletedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}]}]	1767649065301-create-attachment	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
75810183-7415-471a-a787-4383766b5773	[{"name": "blocklist", "action": "create", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "handle", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "id", "columnType": "uuid", "isNullable": false, "defaultValue": "public.uuid_generate_v4()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "createdAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "updatedAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "deletedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}]}]	1767649065301-create-blocklist	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
fc0e3362-31fc-4ff4-9c15-f90e2f89061b	[{"name": "calendarChannel", "action": "create", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "handle", "columnType": "text", "isNullable": true, "defaultValue": null}, {"enum": ["ONGOING", "NOT_SYNCED", "ACTIVE", "FAILED_INSUFFICIENT_PERMISSIONS", "FAILED_UNKNOWN"], "action": "CREATE", "isArray": false, "isUnique": false, "columnName": "syncStatus", "columnType": "enum", "isNullable": true, "defaultValue": null}, {"enum": ["CALENDAR_EVENT_LIST_FETCH_PENDING", "CALENDAR_EVENT_LIST_FETCH_SCHEDULED", "CALENDAR_EVENT_LIST_FETCH_ONGOING", "CALENDAR_EVENTS_IMPORT_PENDING", "CALENDAR_EVENTS_IMPORT_SCHEDULED", "CALENDAR_EVENTS_IMPORT_ONGOING", "FAILED", "PENDING_CONFIGURATION"], "action": "CREATE", "isArray": false, "isUnique": false, "columnName": "syncStage", "columnType": "enum", "isNullable": false, "defaultValue": "'PENDING_CONFIGURATION'"}, {"enum": ["METADATA", "SHARE_EVERYTHING"], "action": "CREATE", "isArray": false, "isUnique": false, "columnName": "visibility", "columnType": "enum", "isNullable": false, "defaultValue": "'SHARE_EVERYTHING'"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "isContactAutoCreationEnabled", "columnType": "boolean", "isNullable": false, "defaultValue": true}, {"enum": ["AS_PARTICIPANT_AND_ORGANIZER", "AS_PARTICIPANT", "AS_ORGANIZER", "NONE"], "action": "CREATE", "isArray": false, "isUnique": false, "columnName": "contactAutoCreationPolicy", "columnType": "enum", "isNullable": false, "defaultValue": "'AS_PARTICIPANT_AND_ORGANIZER'"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "isSyncEnabled", "columnType": "boolean", "isNullable": false, "defaultValue": true}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "syncCursor", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "syncedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "syncStageStartedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "throttleFailureCount", "columnType": "float", "isNullable": false, "defaultValue": 0}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "id", "columnType": "uuid", "isNullable": false, "defaultValue": "public.uuid_generate_v4()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "createdAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "updatedAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "deletedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}]}]	1767649065301-create-calendarChannel	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
64b87aef-e810-41dc-8c77-023f9ac7f010	[{"name": "calendarChannelEventAssociation", "action": "create", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "eventExternalId", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "recurringEventExternalId", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "id", "columnType": "uuid", "isNullable": false, "defaultValue": "public.uuid_generate_v4()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "createdAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "updatedAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "deletedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}]}]	1767649065301-create-calendarChannelEventAssociation	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
5e9bb6cf-6524-41b5-89ea-5980f81eef56	[{"name": "calendarEvent", "action": "create", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "title", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "isCanceled", "columnType": "boolean", "isNullable": false, "defaultValue": false}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "isFullDay", "columnType": "boolean", "isNullable": false, "defaultValue": false}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "startsAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "endsAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "externalCreatedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "externalUpdatedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "description", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "location", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "iCalUid", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "conferenceSolution", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "conferenceLinkPrimaryLinkLabel", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "conferenceLinkPrimaryLinkUrl", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "conferenceLinkSecondaryLinks", "columnType": "jsonb", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "id", "columnType": "uuid", "isNullable": false, "defaultValue": "public.uuid_generate_v4()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "createdAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "updatedAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "deletedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}]}]	1767649065301-create-calendarEvent	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
e9e64f71-1619-45b8-b2c1-1d1be140e741	[{"name": "noteTarget", "action": "create", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "id", "columnType": "uuid", "isNullable": false, "defaultValue": "public.uuid_generate_v4()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "createdAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "updatedAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "deletedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}]}]	1767649065301-create-noteTarget	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
6cdb2e53-678b-4fb1-9f15-d37394406fdf	[{"name": "calendarEventParticipant", "action": "create", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "handle", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "displayName", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "isOrganizer", "columnType": "boolean", "isNullable": false, "defaultValue": false}, {"enum": ["NEEDS_ACTION", "DECLINED", "TENTATIVE", "ACCEPTED"], "action": "CREATE", "isArray": false, "isUnique": false, "columnName": "responseStatus", "columnType": "enum", "isNullable": false, "defaultValue": "'NEEDS_ACTION'"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "id", "columnType": "uuid", "isNullable": false, "defaultValue": "public.uuid_generate_v4()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "createdAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "updatedAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "deletedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}]}]	1767649065301-create-calendarEventParticipant	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
b9223297-9e98-4d30-b4d9-d51b9567fa7b	[{"name": "company", "action": "create", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "name", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": true, "columnName": "domainNamePrimaryLinkLabel", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": true, "columnName": "domainNamePrimaryLinkUrl", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": true, "columnName": "domainNameSecondaryLinks", "columnType": "jsonb", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "employees", "columnType": "float", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "linkedinLinkPrimaryLinkLabel", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "linkedinLinkPrimaryLinkUrl", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "linkedinLinkSecondaryLinks", "columnType": "jsonb", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "xLinkPrimaryLinkLabel", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "xLinkPrimaryLinkUrl", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "xLinkSecondaryLinks", "columnType": "jsonb", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "annualRecurringRevenueAmountMicros", "columnType": "numeric", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "annualRecurringRevenueCurrencyCode", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "addressAddressStreet1", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "addressAddressStreet2", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "addressAddressCity", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "addressAddressPostcode", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "addressAddressState", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "addressAddressCountry", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "addressAddressLat", "columnType": "numeric", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "addressAddressLng", "columnType": "numeric", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "idealCustomerProfile", "columnType": "boolean", "isNullable": false, "defaultValue": false}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "position", "columnType": "float", "isNullable": false, "defaultValue": 0}, {"enum": ["EMAIL", "CALENDAR", "WORKFLOW", "AGENT", "API", "IMPORT", "MANUAL", "SYSTEM", "WEBHOOK", "APPLICATION"], "action": "CREATE", "isUnique": false, "columnName": "createdBySource", "columnType": "enum", "isNullable": false, "defaultValue": "'MANUAL'"}, {"action": "CREATE", "isUnique": false, "columnName": "createdByWorkspaceMemberId", "columnType": "uuid", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "createdByName", "columnType": "text", "isNullable": false, "defaultValue": "'System'"}, {"action": "CREATE", "isUnique": false, "columnName": "createdByContext", "columnType": "jsonb", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "searchVector", "columnType": "tsvector", "isNullable": true, "asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"name\\"), '') || ' ' || COALESCE(public.unaccent_immutable(\\"domainNamePrimaryLinkLabel\\"), '') || ' ' || COALESCE(public.unaccent_immutable(\\"domainNamePrimaryLinkUrl\\"), ''))", "generatedType": "STORED"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "id", "columnType": "uuid", "isNullable": false, "defaultValue": "public.uuid_generate_v4()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "createdAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "updatedAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "deletedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}]}]	1767649065301-create-company	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
ee2a50a2-80af-4ec4-ad73-7d251e67ab14	[{"name": "connectedAccount", "action": "create", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "handle", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "provider", "columnType": "text", "isNullable": false, "defaultValue": "'google'"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "accessToken", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "refreshToken", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "lastCredentialsRefreshedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "lastSyncHistoryId", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "authFailedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "handleAliases", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": true, "isUnique": false, "columnName": "scopes", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "connectionParameters", "columnType": "jsonb", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "id", "columnType": "uuid", "isNullable": false, "defaultValue": "public.uuid_generate_v4()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "createdAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "updatedAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "deletedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}]}]	1767649065301-create-connectedAccount	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
d7d26983-776e-43d6-a768-e60c7cdaa89d	[{"name": "dashboard", "action": "create", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "title", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "pageLayoutId", "columnType": "uuid", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "position", "columnType": "float", "isNullable": false, "defaultValue": 0}, {"enum": ["EMAIL", "CALENDAR", "WORKFLOW", "AGENT", "API", "IMPORT", "MANUAL", "SYSTEM", "WEBHOOK", "APPLICATION"], "action": "CREATE", "isUnique": false, "columnName": "createdBySource", "columnType": "enum", "isNullable": false, "defaultValue": "'MANUAL'"}, {"action": "CREATE", "isUnique": false, "columnName": "createdByWorkspaceMemberId", "columnType": "uuid", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "createdByName", "columnType": "text", "isNullable": false, "defaultValue": "'System'"}, {"action": "CREATE", "isUnique": false, "columnName": "createdByContext", "columnType": "jsonb", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "searchVector", "columnType": "tsvector", "isNullable": true, "asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"title\\"), ''))", "generatedType": "STORED"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "id", "columnType": "uuid", "isNullable": false, "defaultValue": "public.uuid_generate_v4()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "createdAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "updatedAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "deletedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}]}]	1767649065301-create-dashboard	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
5f26b5f2-5317-4de9-89d3-56ac28d8f077	[{"name": "favorite", "action": "create", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "position", "columnType": "float", "isNullable": false, "defaultValue": 0}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "viewId", "columnType": "uuid", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "id", "columnType": "uuid", "isNullable": false, "defaultValue": "public.uuid_generate_v4()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "createdAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "updatedAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "deletedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}]}]	1767649065301-create-favorite	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
e2964501-aad4-4b1e-848c-85a1c42f5600	[{"name": "favoriteFolder", "action": "create", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "position", "columnType": "float", "isNullable": false, "defaultValue": 0}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "name", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "id", "columnType": "uuid", "isNullable": false, "defaultValue": "public.uuid_generate_v4()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "createdAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "updatedAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "deletedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}]}]	1767649065301-create-favoriteFolder	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
85437181-5d1e-4ce7-980b-27b81a3becae	[{"name": "message", "action": "create", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "headerMessageId", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "subject", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "text", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "receivedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "id", "columnType": "uuid", "isNullable": false, "defaultValue": "public.uuid_generate_v4()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "createdAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "updatedAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "deletedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}]}]	1767649065301-create-message	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
d2e60fec-bc6b-470a-9261-82ab2adfbccb	[{"name": "messageChannel", "action": "create", "columns": [{"enum": ["METADATA", "SUBJECT", "SHARE_EVERYTHING"], "action": "CREATE", "isArray": false, "isUnique": false, "columnName": "visibility", "columnType": "enum", "isNullable": false, "defaultValue": "'SHARE_EVERYTHING'"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "handle", "columnType": "text", "isNullable": true, "defaultValue": null}, {"enum": ["EMAIL", "SMS"], "action": "CREATE", "isArray": false, "isUnique": false, "columnName": "type", "columnType": "enum", "isNullable": false, "defaultValue": "'EMAIL'"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "isContactAutoCreationEnabled", "columnType": "boolean", "isNullable": false, "defaultValue": true}, {"enum": ["SENT_AND_RECEIVED", "SENT", "NONE"], "action": "CREATE", "isArray": false, "isUnique": false, "columnName": "contactAutoCreationPolicy", "columnType": "enum", "isNullable": false, "defaultValue": "'SENT'"}, {"enum": ["ALL_FOLDERS", "SELECTED_FOLDERS"], "action": "CREATE", "isArray": false, "isUnique": false, "columnName": "messageFolderImportPolicy", "columnType": "enum", "isNullable": false, "defaultValue": "'ALL_FOLDERS'"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "excludeNonProfessionalEmails", "columnType": "boolean", "isNullable": false, "defaultValue": true}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "excludeGroupEmails", "columnType": "boolean", "isNullable": false, "defaultValue": true}, {"enum": ["GROUP_EMAILS_DELETION", "GROUP_EMAILS_IMPORT", "NONE"], "action": "CREATE", "isArray": false, "isUnique": false, "columnName": "pendingGroupEmailsAction", "columnType": "enum", "isNullable": false, "defaultValue": "'NONE'"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "isSyncEnabled", "columnType": "boolean", "isNullable": false, "defaultValue": true}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "syncCursor", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "syncedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}, {"enum": ["ONGOING", "NOT_SYNCED", "ACTIVE", "FAILED_INSUFFICIENT_PERMISSIONS", "FAILED_UNKNOWN"], "action": "CREATE", "isArray": false, "isUnique": false, "columnName": "syncStatus", "columnType": "enum", "isNullable": true, "defaultValue": null}, {"enum": ["MESSAGE_LIST_FETCH_PENDING", "MESSAGE_LIST_FETCH_SCHEDULED", "MESSAGE_LIST_FETCH_ONGOING", "MESSAGES_IMPORT_PENDING", "MESSAGES_IMPORT_SCHEDULED", "MESSAGES_IMPORT_ONGOING", "FAILED", "PENDING_CONFIGURATION"], "action": "CREATE", "isArray": false, "isUnique": false, "columnName": "syncStage", "columnType": "enum", "isNullable": false, "defaultValue": "'PENDING_CONFIGURATION'"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "syncStageStartedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "throttleFailureCount", "columnType": "float", "isNullable": false, "defaultValue": 0}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "id", "columnType": "uuid", "isNullable": false, "defaultValue": "public.uuid_generate_v4()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "createdAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "updatedAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "deletedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}]}]	1767649065301-create-messageChannel	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
b2769fab-04b8-44fe-a024-a802df745b23	[{"name": "messageChannelMessageAssociation", "action": "create", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "messageExternalId", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "messageThreadExternalId", "columnType": "text", "isNullable": true, "defaultValue": null}, {"enum": ["INCOMING", "OUTGOING"], "action": "CREATE", "isArray": false, "isUnique": false, "columnName": "direction", "columnType": "enum", "isNullable": false, "defaultValue": "'INCOMING'"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "id", "columnType": "uuid", "isNullable": false, "defaultValue": "public.uuid_generate_v4()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "createdAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "updatedAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "deletedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}]}]	1767649065301-create-messageChannelMessageAssociation	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
be4dbb7f-1b9f-4ab6-8020-8fb99109a6d3	[{"name": "messageFolder", "action": "create", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "name", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "syncCursor", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "isSentFolder", "columnType": "boolean", "isNullable": false, "defaultValue": false}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "isSynced", "columnType": "boolean", "isNullable": false, "defaultValue": false}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "parentFolderId", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "externalId", "columnType": "text", "isNullable": true, "defaultValue": null}, {"enum": ["FOLDER_DELETION", "NONE"], "action": "CREATE", "isArray": false, "isUnique": false, "columnName": "pendingSyncAction", "columnType": "enum", "isNullable": false, "defaultValue": "'NONE'"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "id", "columnType": "uuid", "isNullable": false, "defaultValue": "public.uuid_generate_v4()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "createdAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "updatedAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "deletedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}]}]	1767649065301-create-messageFolder	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
168bf191-66dd-4a96-9778-76875274fe04	[{"name": "messageParticipant", "action": "create", "columns": [{"enum": ["FROM", "TO", "CC", "BCC"], "action": "CREATE", "isArray": false, "isUnique": false, "columnName": "role", "columnType": "enum", "isNullable": false, "defaultValue": "'FROM'"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "handle", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "displayName", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "id", "columnType": "uuid", "isNullable": false, "defaultValue": "public.uuid_generate_v4()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "createdAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "updatedAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "deletedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}]}]	1767649065301-create-messageParticipant	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
c6f7de50-f7f8-4ba8-98f9-9970e221f610	[{"name": "messageThread", "action": "create", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "id", "columnType": "uuid", "isNullable": false, "defaultValue": "public.uuid_generate_v4()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "createdAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "updatedAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "deletedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}]}]	1767649065301-create-messageThread	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
f19d4d69-a45f-4d28-898f-e7b94f2b04be	[{"name": "note", "action": "create", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "position", "columnType": "float", "isNullable": false, "defaultValue": 0}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "title", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "bodyV2Blocknote", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "bodyV2Markdown", "columnType": "text", "isNullable": true, "defaultValue": null}, {"enum": ["EMAIL", "CALENDAR", "WORKFLOW", "AGENT", "API", "IMPORT", "MANUAL", "SYSTEM", "WEBHOOK", "APPLICATION"], "action": "CREATE", "isUnique": false, "columnName": "createdBySource", "columnType": "enum", "isNullable": false, "defaultValue": "'MANUAL'"}, {"action": "CREATE", "isUnique": false, "columnName": "createdByWorkspaceMemberId", "columnType": "uuid", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "createdByName", "columnType": "text", "isNullable": false, "defaultValue": "'System'"}, {"action": "CREATE", "isUnique": false, "columnName": "createdByContext", "columnType": "jsonb", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "searchVector", "columnType": "tsvector", "isNullable": true, "asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"title\\"), '') || ' ' || COALESCE(public.unaccent_immutable(\\"bodyV2Markdown\\"), ''))", "generatedType": "STORED"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "id", "columnType": "uuid", "isNullable": false, "defaultValue": "public.uuid_generate_v4()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "createdAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "updatedAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "deletedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}]}]	1767649065301-create-note	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
d2b66973-addc-46d6-b287-01bb84eb35f1	[{"name": "opportunity", "action": "create", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "name", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "amountAmountMicros", "columnType": "numeric", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "amountCurrencyCode", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "closeDate", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}, {"enum": ["NEW", "SCREENING", "MEETING", "PROPOSAL", "CUSTOMER"], "action": "CREATE", "isArray": false, "isUnique": false, "columnName": "stage", "columnType": "enum", "isNullable": false, "defaultValue": "'NEW'"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "position", "columnType": "float", "isNullable": false, "defaultValue": 0}, {"enum": ["EMAIL", "CALENDAR", "WORKFLOW", "AGENT", "API", "IMPORT", "MANUAL", "SYSTEM", "WEBHOOK", "APPLICATION"], "action": "CREATE", "isUnique": false, "columnName": "createdBySource", "columnType": "enum", "isNullable": false, "defaultValue": "'MANUAL'"}, {"action": "CREATE", "isUnique": false, "columnName": "createdByWorkspaceMemberId", "columnType": "uuid", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "createdByName", "columnType": "text", "isNullable": false, "defaultValue": "'System'"}, {"action": "CREATE", "isUnique": false, "columnName": "createdByContext", "columnType": "jsonb", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "searchVector", "columnType": "tsvector", "isNullable": true, "asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"name\\"), ''))", "generatedType": "STORED"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "id", "columnType": "uuid", "isNullable": false, "defaultValue": "public.uuid_generate_v4()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "createdAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "updatedAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "deletedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}]}]	1767649065301-create-opportunity	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
a7454621-9cec-4eb2-bf15-f8d4a4c283e8	[{"name": "person", "action": "create", "columns": [{"action": "CREATE", "isUnique": false, "columnName": "nameFirstName", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "nameLastName", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": true, "columnName": "emailsPrimaryEmail", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": true, "columnName": "emailsAdditionalEmails", "columnType": "jsonb", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "linkedinLinkPrimaryLinkLabel", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "linkedinLinkPrimaryLinkUrl", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "linkedinLinkSecondaryLinks", "columnType": "jsonb", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "xLinkPrimaryLinkLabel", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "xLinkPrimaryLinkUrl", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "xLinkSecondaryLinks", "columnType": "jsonb", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "jobTitle", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "phonesPrimaryPhoneNumber", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "phonesPrimaryPhoneCountryCode", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "phonesPrimaryPhoneCallingCode", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "phonesAdditionalPhones", "columnType": "jsonb", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "city", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "avatarUrl", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "position", "columnType": "float", "isNullable": false, "defaultValue": 0}, {"enum": ["EMAIL", "CALENDAR", "WORKFLOW", "AGENT", "API", "IMPORT", "MANUAL", "SYSTEM", "WEBHOOK", "APPLICATION"], "action": "CREATE", "isUnique": false, "columnName": "createdBySource", "columnType": "enum", "isNullable": false, "defaultValue": "'MANUAL'"}, {"action": "CREATE", "isUnique": false, "columnName": "createdByWorkspaceMemberId", "columnType": "uuid", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "createdByName", "columnType": "text", "isNullable": false, "defaultValue": "'System'"}, {"action": "CREATE", "isUnique": false, "columnName": "createdByContext", "columnType": "jsonb", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "searchVector", "columnType": "tsvector", "isNullable": true, "asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"nameFirstName\\"), '') || ' ' || COALESCE(public.unaccent_immutable(\\"nameLastName\\"), '') || ' ' || \\n      COALESCE(public.unaccent_immutable(\\"emailsPrimaryEmail\\"), '') || ' ' ||\\n      COALESCE(public.unaccent_immutable(SPLIT_PART(\\"emailsPrimaryEmail\\", '@', 2)), '') || ' ' || COALESCE(\\"phonesPrimaryPhoneNumber\\", '') || ' ' || COALESCE(\\"phonesPrimaryPhoneCallingCode\\", '') || ' ' || COALESCE(\\"phonesPrimaryPhoneCallingCode\\" || \\"phonesPrimaryPhoneNumber\\", '') || ' ' || COALESCE(REPLACE(\\"phonesPrimaryPhoneCallingCode\\", '+', '') || \\"phonesPrimaryPhoneNumber\\", '') || ' ' || COALESCE('0' || \\"phonesPrimaryPhoneNumber\\", '') || ' ' || COALESCE(public.unaccent_immutable(\\"jobTitle\\"), ''))", "generatedType": "STORED"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "id", "columnType": "uuid", "isNullable": false, "defaultValue": "public.uuid_generate_v4()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "createdAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "updatedAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "deletedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}]}]	1767649065301-create-person	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
b1301fe9-53e3-48db-b984-d3844c24cc1f	[{"name": "task", "action": "create", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "position", "columnType": "float", "isNullable": false, "defaultValue": 0}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "title", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "bodyV2Blocknote", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "bodyV2Markdown", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "dueAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}, {"enum": ["TODO", "IN_PROGRESS", "DONE"], "action": "CREATE", "isArray": false, "isUnique": false, "columnName": "status", "columnType": "enum", "isNullable": true, "defaultValue": "'TODO'"}, {"enum": ["EMAIL", "CALENDAR", "WORKFLOW", "AGENT", "API", "IMPORT", "MANUAL", "SYSTEM", "WEBHOOK", "APPLICATION"], "action": "CREATE", "isUnique": false, "columnName": "createdBySource", "columnType": "enum", "isNullable": false, "defaultValue": "'MANUAL'"}, {"action": "CREATE", "isUnique": false, "columnName": "createdByWorkspaceMemberId", "columnType": "uuid", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "createdByName", "columnType": "text", "isNullable": false, "defaultValue": "'System'"}, {"action": "CREATE", "isUnique": false, "columnName": "createdByContext", "columnType": "jsonb", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "searchVector", "columnType": "tsvector", "isNullable": true, "asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"title\\"), '') || ' ' || COALESCE(public.unaccent_immutable(\\"bodyV2Markdown\\"), ''))", "generatedType": "STORED"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "id", "columnType": "uuid", "isNullable": false, "defaultValue": "public.uuid_generate_v4()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "createdAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "updatedAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "deletedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}]}]	1767649065301-create-task	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
c24018ee-f6b6-4d11-bb8a-b61839917a3f	[{"name": "taskTarget", "action": "create", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "id", "columnType": "uuid", "isNullable": false, "defaultValue": "public.uuid_generate_v4()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "createdAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "updatedAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "deletedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}]}]	1767649065301-create-taskTarget	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
32f7d816-24f5-4632-b2d2-2d848bd12f64	[{"name": "timelineActivity", "action": "create", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "happensAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "name", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "properties", "columnType": "jsonb", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "linkedRecordCachedName", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "linkedRecordId", "columnType": "uuid", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "linkedObjectMetadataId", "columnType": "uuid", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "id", "columnType": "uuid", "isNullable": false, "defaultValue": "public.uuid_generate_v4()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "createdAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "updatedAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "deletedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}]}]	1767649065301-create-timelineActivity	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
0b62ba21-9f75-4a72-a261-c2875d01f348	[{"name": "workflow", "action": "create", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "name", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "lastPublishedVersionId", "columnType": "text", "isNullable": true, "defaultValue": null}, {"enum": ["DRAFT", "ACTIVE", "DEACTIVATED"], "action": "CREATE", "isArray": true, "isUnique": false, "columnName": "statuses", "columnType": "enum", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "position", "columnType": "float", "isNullable": false, "defaultValue": 0}, {"action": "CREATE", "isUnique": false, "columnName": "searchVector", "columnType": "tsvector", "isNullable": true, "asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"name\\"), ''))", "generatedType": "STORED"}, {"enum": ["EMAIL", "CALENDAR", "WORKFLOW", "AGENT", "API", "IMPORT", "MANUAL", "SYSTEM", "WEBHOOK", "APPLICATION"], "action": "CREATE", "isUnique": false, "columnName": "createdBySource", "columnType": "enum", "isNullable": false, "defaultValue": "'MANUAL'"}, {"action": "CREATE", "isUnique": false, "columnName": "createdByWorkspaceMemberId", "columnType": "uuid", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "createdByName", "columnType": "text", "isNullable": false, "defaultValue": "'System'"}, {"action": "CREATE", "isUnique": false, "columnName": "createdByContext", "columnType": "jsonb", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "id", "columnType": "uuid", "isNullable": false, "defaultValue": "public.uuid_generate_v4()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "createdAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "updatedAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "deletedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}]}]	1767649065301-create-workflow	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
8b6994a8-fa03-46f5-bfb7-24b47778af2c	[{"name": "workflowAutomatedTrigger", "action": "create", "columns": [{"enum": ["DATABASE_EVENT", "CRON"], "action": "CREATE", "isArray": false, "isUnique": false, "columnName": "type", "columnType": "enum", "isNullable": false, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "settings", "columnType": "jsonb", "isNullable": false, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "id", "columnType": "uuid", "isNullable": false, "defaultValue": "public.uuid_generate_v4()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "createdAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "updatedAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "deletedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}]}]	1767649065301-create-workflowAutomatedTrigger	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
4aa901b6-e8db-4047-8b61-a308e8477b78	[{"name": "workflowRun", "action": "create", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "name", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "enqueuedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "startedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "endedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}, {"enum": ["NOT_STARTED", "RUNNING", "COMPLETED", "FAILED", "ENQUEUED", "STOPPING", "STOPPED"], "action": "CREATE", "isArray": false, "isUnique": false, "columnName": "status", "columnType": "enum", "isNullable": false, "defaultValue": "'NOT_STARTED'"}, {"enum": ["EMAIL", "CALENDAR", "WORKFLOW", "AGENT", "API", "IMPORT", "MANUAL", "SYSTEM", "WEBHOOK", "APPLICATION"], "action": "CREATE", "isUnique": false, "columnName": "createdBySource", "columnType": "enum", "isNullable": false, "defaultValue": "'MANUAL'"}, {"action": "CREATE", "isUnique": false, "columnName": "createdByWorkspaceMemberId", "columnType": "uuid", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "createdByName", "columnType": "text", "isNullable": false, "defaultValue": "'System'"}, {"action": "CREATE", "isUnique": false, "columnName": "createdByContext", "columnType": "jsonb", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "state", "columnType": "jsonb", "isNullable": false, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "position", "columnType": "float", "isNullable": false, "defaultValue": 0}, {"action": "CREATE", "isUnique": false, "columnName": "searchVector", "columnType": "tsvector", "isNullable": true, "asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"name\\"), ''))", "generatedType": "STORED"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "id", "columnType": "uuid", "isNullable": false, "defaultValue": "public.uuid_generate_v4()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "createdAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "updatedAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "deletedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}]}]	1767649065301-create-workflowRun	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
16223b1c-5d1c-45e0-a2ba-55e09d02b690	[{"name": "workflowVersion", "action": "create", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "name", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "trigger", "columnType": "jsonb", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "steps", "columnType": "jsonb", "isNullable": true, "defaultValue": null}, {"enum": ["DRAFT", "ACTIVE", "DEACTIVATED", "ARCHIVED"], "action": "CREATE", "isArray": false, "isUnique": false, "columnName": "status", "columnType": "enum", "isNullable": false, "defaultValue": "'DRAFT'"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "position", "columnType": "float", "isNullable": false, "defaultValue": 0}, {"action": "CREATE", "isUnique": false, "columnName": "searchVector", "columnType": "tsvector", "isNullable": true, "asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"name\\"), ''))", "generatedType": "STORED"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "id", "columnType": "uuid", "isNullable": false, "defaultValue": "public.uuid_generate_v4()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "createdAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "updatedAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "deletedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}]}]	1767649065301-create-workflowVersion	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
32b6de31-8e1d-4d9c-9930-767771a5667d	[{"name": "workspaceMember", "action": "create", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "position", "columnType": "float", "isNullable": false, "defaultValue": 0}, {"action": "CREATE", "isUnique": false, "columnName": "nameFirstName", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isUnique": false, "columnName": "nameLastName", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "colorScheme", "columnType": "text", "isNullable": false, "defaultValue": "'System'"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "locale", "columnType": "text", "isNullable": false, "defaultValue": "'en'"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "avatarUrl", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "userEmail", "columnType": "text", "isNullable": true, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "calendarStartDay", "columnType": "float", "isNullable": false, "defaultValue": 7}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "userId", "columnType": "uuid", "isNullable": false, "defaultValue": null}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "timeZone", "columnType": "text", "isNullable": false, "defaultValue": "'system'"}, {"enum": ["SYSTEM", "MONTH_FIRST", "DAY_FIRST", "YEAR_FIRST"], "action": "CREATE", "isArray": false, "isUnique": false, "columnName": "dateFormat", "columnType": "enum", "isNullable": false, "defaultValue": "'SYSTEM'"}, {"enum": ["SYSTEM", "HOUR_24", "HOUR_12"], "action": "CREATE", "isArray": false, "isUnique": false, "columnName": "timeFormat", "columnType": "enum", "isNullable": false, "defaultValue": "'SYSTEM'"}, {"action": "CREATE", "isUnique": false, "columnName": "searchVector", "columnType": "tsvector", "isNullable": true, "asExpression": "to_tsvector('simple', COALESCE(public.unaccent_immutable(\\"nameFirstName\\"), '') || ' ' || COALESCE(public.unaccent_immutable(\\"nameLastName\\"), '') || ' ' || COALESCE(public.unaccent_immutable(\\"userEmail\\"), ''))", "generatedType": "STORED"}, {"enum": ["SYSTEM", "COMMAS_AND_DOT", "SPACES_AND_COMMA", "DOTS_AND_COMMA", "APOSTROPHE_AND_DOT"], "action": "CREATE", "isArray": false, "isUnique": false, "columnName": "numberFormat", "columnType": "enum", "isNullable": false, "defaultValue": "'SYSTEM'"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "id", "columnType": "uuid", "isNullable": false, "defaultValue": "public.uuid_generate_v4()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "createdAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "updatedAt", "columnType": "timestamptz", "isNullable": false, "defaultValue": "now()"}, {"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "deletedAt", "columnType": "timestamptz", "isNullable": true, "defaultValue": null}]}]	1767649065301-create-workspaceMember	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
3d6e978c-4389-4a96-afaa-0ac8754bb7e6	[{"name": "attachment", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "noteId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "attachment", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "SET_NULL", "columnName": "noteId", "referencedTableName": "note", "referencedTableColumnName": "id"}]}]	1767649065658-create-relation-from-attachment-to-note	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
6105eb67-f108-424e-8054-b66444b5e95d	[{"name": "attachment", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "personId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "attachment", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "personId", "referencedTableName": "person", "referencedTableColumnName": "id"}]}]	1767649065658-create-relation-from-attachment-to-person	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
c7e6c8cc-a02f-4b49-851b-a0393ceee8f9	[{"name": "attachment", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "taskId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "attachment", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "SET_NULL", "columnName": "taskId", "referencedTableName": "task", "referencedTableColumnName": "id"}]}]	1767649065658-create-relation-from-attachment-to-task	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
9154efbd-bc2e-4f23-9d97-962dca1d5717	[{"name": "attachment", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "companyId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "attachment", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "companyId", "referencedTableName": "company", "referencedTableColumnName": "id"}]}]	1767649065659-create-relation-from-attachment-to-company	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
16571226-0fd5-4654-a8de-c1712b0b9768	[{"name": "attachment", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "dashboardId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "attachment", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "dashboardId", "referencedTableName": "dashboard", "referencedTableColumnName": "id"}]}]	1767649065659-create-relation-from-attachment-to-dashboard	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
178a2c2d-5558-4505-b6c1-e4868675b04e	[{"name": "attachment", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "opportunityId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "attachment", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "opportunityId", "referencedTableName": "opportunity", "referencedTableColumnName": "id"}]}]	1767649065659-create-relation-from-attachment-to-opportunity	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
8ac7e9c3-7d40-4204-b399-ebb5c42e7e63	[{"name": "attachment", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "workflowId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "attachment", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "workflowId", "referencedTableName": "workflow", "referencedTableColumnName": "id"}]}]	1767649065659-create-relation-from-attachment-to-workflow	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
9ba7a6ec-d3d0-4633-a336-709f0496239d	[{"name": "blocklist", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "workspaceMemberId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "blocklist", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "SET_NULL", "columnName": "workspaceMemberId", "referencedTableName": "workspaceMember", "referencedTableColumnName": "id"}]}]	1767649065659-create-relation-from-blocklist-to-workspaceMember	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
8dbd0d41-be89-42a2-b59e-e211ee6f627e	[{"name": "calendarChannel", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "connectedAccountId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "calendarChannel", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "connectedAccountId", "referencedTableName": "connectedAccount", "referencedTableColumnName": "id"}]}]	1767649065659-create-relation-from-calendarChannel-to-connectedAccount	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
ea03ab24-6de3-4725-88ed-471d91be7774	[{"name": "calendarChannelEventAssociation", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "calendarChannelId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "calendarChannelEventAssociation", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "calendarChannelId", "referencedTableName": "calendarChannel", "referencedTableColumnName": "id"}]}]	1767649065659-create-relation-from-calendarChannelEventAssociation-to-calendarChannel	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
574e5704-8b60-4a74-b4bf-f7ed90cbac1e	[{"name": "calendarChannelEventAssociation", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "calendarEventId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "calendarChannelEventAssociation", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "calendarEventId", "referencedTableName": "calendarEvent", "referencedTableColumnName": "id"}]}]	1767649065659-create-relation-from-calendarChannelEventAssociation-to-calendarEvent	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
c777c125-e014-45d9-9c2a-00bf5a0295f9	[{"name": "calendarEventParticipant", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "calendarEventId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "calendarEventParticipant", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "calendarEventId", "referencedTableName": "calendarEvent", "referencedTableColumnName": "id"}]}]	1767649065659-create-relation-from-calendarEventParticipant-to-calendarEvent	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
6ade078f-9402-4019-99ad-50e529768d0d	[{"name": "calendarEventParticipant", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "personId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "calendarEventParticipant", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "SET_NULL", "columnName": "personId", "referencedTableName": "person", "referencedTableColumnName": "id"}]}]	1767649065659-create-relation-from-calendarEventParticipant-to-person	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
f2e39168-9774-4f8c-8bfe-e5c2c77d3ca8	[{"name": "calendarEventParticipant", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "workspaceMemberId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "calendarEventParticipant", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "SET_NULL", "columnName": "workspaceMemberId", "referencedTableName": "workspaceMember", "referencedTableColumnName": "id"}]}]	1767649065659-create-relation-from-calendarEventParticipant-to-workspaceMember	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
8e41678e-684f-45df-a1f6-314d9d7ad136	[{"name": "company", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "accountOwnerId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "company", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "SET_NULL", "columnName": "accountOwnerId", "referencedTableName": "workspaceMember", "referencedTableColumnName": "id"}]}]	1767649065659-create-relation-from-company-to-workspaceMember	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
bc2fd51c-d41f-4fa8-8595-b6adfdf3afb1	[{"name": "connectedAccount", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "accountOwnerId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "connectedAccount", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "accountOwnerId", "referencedTableName": "workspaceMember", "referencedTableColumnName": "id"}]}]	1767649065659-create-relation-from-connectedAccount-to-workspaceMember	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
549fb6a4-0489-4321-adeb-24ced910163e	[{"name": "favorite", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "companyId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "favorite", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "companyId", "referencedTableName": "company", "referencedTableColumnName": "id"}]}]	1767649065660-create-relation-from-favorite-to-company	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
aa69ca11-b1d0-42ae-83c8-215d5348ff17	[{"name": "favorite", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "dashboardId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "favorite", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "dashboardId", "referencedTableName": "dashboard", "referencedTableColumnName": "id"}]}]	1767649065660-create-relation-from-favorite-to-dashboard	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
b6e98968-ca16-4198-963a-d5185a82fb50	[{"name": "favorite", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "favoriteFolderId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "favorite", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "SET_NULL", "columnName": "favoriteFolderId", "referencedTableName": "favoriteFolder", "referencedTableColumnName": "id"}]}]	1767649065660-create-relation-from-favorite-to-favoriteFolder	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
df14dcef-423e-40d8-86a7-aca8a2329da8	[{"name": "favorite", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "noteId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "favorite", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "noteId", "referencedTableName": "note", "referencedTableColumnName": "id"}]}]	1767649065660-create-relation-from-favorite-to-note	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
707c23cb-7189-4012-a9f4-349b1e872ca8	[{"name": "favorite", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "opportunityId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "favorite", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "opportunityId", "referencedTableName": "opportunity", "referencedTableColumnName": "id"}]}]	1767649065660-create-relation-from-favorite-to-opportunity	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
4c08e161-0e99-459b-9a31-d9df576dfe57	[{"name": "favorite", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "personId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "favorite", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "personId", "referencedTableName": "person", "referencedTableColumnName": "id"}]}]	1767649065660-create-relation-from-favorite-to-person	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
f6a92f48-0c05-46e2-87e6-4e4f53b90743	[{"name": "favorite", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "taskId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "favorite", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "taskId", "referencedTableName": "task", "referencedTableColumnName": "id"}]}]	1767649065660-create-relation-from-favorite-to-task	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
74307d73-24f5-4122-b34e-19a1c56295e4	[{"name": "favorite", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "workflowId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "favorite", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "workflowId", "referencedTableName": "workflow", "referencedTableColumnName": "id"}]}]	1767649065660-create-relation-from-favorite-to-workflow	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
ac40d7ae-9bac-47ee-ba02-32d6a27f73dc	[{"name": "favorite", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "workflowRunId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "favorite", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "workflowRunId", "referencedTableName": "workflowRun", "referencedTableColumnName": "id"}]}]	1767649065660-create-relation-from-favorite-to-workflowRun	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
021a00ca-a4e3-4fc7-aef9-5b5fe474cc87	[{"name": "favorite", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "workflowVersionId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "favorite", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "workflowVersionId", "referencedTableName": "workflowVersion", "referencedTableColumnName": "id"}]}]	1767649065660-create-relation-from-favorite-to-workflowVersion	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
6683e460-5258-4fa6-b1c2-01f5640a19f4	[{"name": "favorite", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "forWorkspaceMemberId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "favorite", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "forWorkspaceMemberId", "referencedTableName": "workspaceMember", "referencedTableColumnName": "id"}]}]	1767649065660-create-relation-from-favorite-to-workspaceMember	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
75712db8-2936-4238-9763-3971ac27b155	[{"name": "timelineActivity", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "targetCompanyId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "timelineActivity", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "targetCompanyId", "referencedTableName": "company", "referencedTableColumnName": "id"}]}]	1767649065660-create-relation-from-timelineActivity-to-company	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
1ccfa4a7-4047-44cb-8dc7-54a81e7b6f9e	[{"name": "timelineActivity", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "targetDashboardId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "timelineActivity", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "SET_NULL", "columnName": "targetDashboardId", "referencedTableName": "dashboard", "referencedTableColumnName": "id"}]}]	1767649065660-create-relation-from-timelineActivity-to-dashboard	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
45a6625a-ca54-4a2f-926b-27d3379c6f55	[{"name": "timelineActivity", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "targetPersonId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "timelineActivity", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "targetPersonId", "referencedTableName": "person", "referencedTableColumnName": "id"}]}]	1767649065660-create-relation-from-timelineActivity-to-person	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
6a3717b7-b077-45e7-bc1a-f2faa2d8ed70	[{"name": "timelineActivity", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "workspaceMemberId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "timelineActivity", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "workspaceMemberId", "referencedTableName": "workspaceMember", "referencedTableColumnName": "id"}]}]	1767649065660-create-relation-from-timelineActivity-to-workspaceMember	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
33333312-70c2-4a7b-a6b4-ecdcb18c50df	[{"name": "message", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "messageThreadId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "message", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "messageThreadId", "referencedTableName": "messageThread", "referencedTableColumnName": "id"}]}]	1767649065661-create-relation-from-message-to-messageThread	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
d0dac4b1-350a-4710-88f9-e208c400fa37	[{"name": "messageChannel", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "connectedAccountId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "messageChannel", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "connectedAccountId", "referencedTableName": "connectedAccount", "referencedTableColumnName": "id"}]}]	1767649065661-create-relation-from-messageChannel-to-connectedAccount	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
026cb79a-6bc8-431c-94a4-4f749b389efd	[{"name": "messageChannelMessageAssociation", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "messageId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "messageChannelMessageAssociation", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "messageId", "referencedTableName": "message", "referencedTableColumnName": "id"}]}]	1767649065661-create-relation-from-messageChannelMessageAssociation-to-message	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
bca857ea-147e-4b8a-a77a-ac278c290cfe	[{"name": "messageChannelMessageAssociation", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "messageChannelId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "messageChannelMessageAssociation", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "messageChannelId", "referencedTableName": "messageChannel", "referencedTableColumnName": "id"}]}]	1767649065661-create-relation-from-messageChannelMessageAssociation-to-messageChannel	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
7b7bc4c3-3f75-4197-b992-6c2a96e91309	[{"name": "messageFolder", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "messageChannelId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "messageFolder", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "messageChannelId", "referencedTableName": "messageChannel", "referencedTableColumnName": "id"}]}]	1767649065661-create-relation-from-messageFolder-to-messageChannel	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
613eda12-fd45-4b00-b4aa-493c1cccfa0f	[{"name": "messageParticipant", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "messageId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "messageParticipant", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "messageId", "referencedTableName": "message", "referencedTableColumnName": "id"}]}]	1767649065661-create-relation-from-messageParticipant-to-message	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
21502c99-8738-46a0-b9fd-6385831aaeaa	[{"name": "messageParticipant", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "personId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "messageParticipant", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "SET_NULL", "columnName": "personId", "referencedTableName": "person", "referencedTableColumnName": "id"}]}]	1767649065661-create-relation-from-messageParticipant-to-person	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
d176cf62-8e8d-4095-9df9-1520a3d9dc47	[{"name": "messageParticipant", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "workspaceMemberId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "messageParticipant", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "SET_NULL", "columnName": "workspaceMemberId", "referencedTableName": "workspaceMember", "referencedTableColumnName": "id"}]}]	1767649065661-create-relation-from-messageParticipant-to-workspaceMember	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
bbc1faa0-1a32-4d9a-82b5-607c0aa93c4d	[{"name": "noteTarget", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "companyId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "noteTarget", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "companyId", "referencedTableName": "company", "referencedTableColumnName": "id"}]}]	1767649065661-create-relation-from-noteTarget-to-company	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
0c533988-5f58-4038-bdf2-077b366036a9	[{"name": "noteTarget", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "noteId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "noteTarget", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "SET_NULL", "columnName": "noteId", "referencedTableName": "note", "referencedTableColumnName": "id"}]}]	1767649065661-create-relation-from-noteTarget-to-note	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
a56375e6-11ed-4553-a644-57d2b0118835	[{"name": "noteTarget", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "opportunityId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "noteTarget", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "opportunityId", "referencedTableName": "opportunity", "referencedTableColumnName": "id"}]}]	1767649065661-create-relation-from-noteTarget-to-opportunity	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
4cb3c68e-0af1-401c-bbf0-0650f4ed8292	[{"name": "noteTarget", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "personId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "noteTarget", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "personId", "referencedTableName": "person", "referencedTableColumnName": "id"}]}]	1767649065661-create-relation-from-noteTarget-to-person	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
a9eb383f-b8fb-467b-89e7-a4ebaf7562f2	[{"name": "opportunity", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "companyId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "opportunity", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "SET_NULL", "columnName": "companyId", "referencedTableName": "company", "referencedTableColumnName": "id"}]}]	1767649065661-create-relation-from-opportunity-to-company	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
37761f62-0417-4a8b-83ce-b81d4ed8e4bd	[{"name": "opportunity", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "pointOfContactId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "opportunity", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "SET_NULL", "columnName": "pointOfContactId", "referencedTableName": "person", "referencedTableColumnName": "id"}]}]	1767649065661-create-relation-from-opportunity-to-person	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
a88b774e-f8e6-414d-8097-69c1397c47c5	[{"name": "person", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "companyId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "person", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "SET_NULL", "columnName": "companyId", "referencedTableName": "company", "referencedTableColumnName": "id"}]}]	1767649065661-create-relation-from-person-to-company	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
f14be9ab-2b41-4b35-b482-2a90752c6d8e	[{"name": "task", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "assigneeId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "task", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "SET_NULL", "columnName": "assigneeId", "referencedTableName": "workspaceMember", "referencedTableColumnName": "id"}]}]	1767649065661-create-relation-from-task-to-workspaceMember	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
8739b37c-1f45-481b-a322-072d78a6372f	[{"name": "taskTarget", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "companyId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "taskTarget", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "companyId", "referencedTableName": "company", "referencedTableColumnName": "id"}]}]	1767649065661-create-relation-from-taskTarget-to-company	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
759b3f0a-5ec0-4f05-ba28-3128f7fe5599	[{"name": "taskTarget", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "opportunityId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "taskTarget", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "opportunityId", "referencedTableName": "opportunity", "referencedTableColumnName": "id"}]}]	1767649065661-create-relation-from-taskTarget-to-opportunity	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
d2f8ba94-ead1-4365-82e6-fb3d74f57c78	[{"name": "taskTarget", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "personId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "taskTarget", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "personId", "referencedTableName": "person", "referencedTableColumnName": "id"}]}]	1767649065661-create-relation-from-taskTarget-to-person	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
557350bc-c976-408e-9102-4207e4ef20ea	[{"name": "taskTarget", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "taskId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "taskTarget", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "SET_NULL", "columnName": "taskId", "referencedTableName": "task", "referencedTableColumnName": "id"}]}]	1767649065661-create-relation-from-taskTarget-to-task	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
34a1e6d3-5a19-43fa-aa40-af8d4967279a	[{"name": "timelineActivity", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "targetNoteId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "timelineActivity", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "SET_NULL", "columnName": "targetNoteId", "referencedTableName": "note", "referencedTableColumnName": "id"}]}]	1767649065661-create-relation-from-timelineActivity-to-note	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
33313f42-5867-4fe5-8230-b17e14523d45	[{"name": "timelineActivity", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "targetOpportunityId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "timelineActivity", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "SET_NULL", "columnName": "targetOpportunityId", "referencedTableName": "opportunity", "referencedTableColumnName": "id"}]}]	1767649065661-create-relation-from-timelineActivity-to-opportunity	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
008cf5f9-6071-440a-8b48-a2c9cd1b1488	[{"name": "timelineActivity", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "targetTaskId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "timelineActivity", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "SET_NULL", "columnName": "targetTaskId", "referencedTableName": "task", "referencedTableColumnName": "id"}]}]	1767649065661-create-relation-from-timelineActivity-to-task	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
011ecda8-d38c-4338-a25e-c358fd8da6b1	[{"name": "timelineActivity", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "targetWorkflowId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "timelineActivity", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "targetWorkflowId", "referencedTableName": "workflow", "referencedTableColumnName": "id"}]}]	1767649065661-create-relation-from-timelineActivity-to-workflow	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
16f963ce-0f2e-4827-9614-0ed3587dc344	[{"name": "timelineActivity", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "targetWorkflowRunId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "timelineActivity", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "targetWorkflowRunId", "referencedTableName": "workflowRun", "referencedTableColumnName": "id"}]}]	1767649065661-create-relation-from-timelineActivity-to-workflowRun	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
627dab33-2fc8-49c4-ae68-6774a65f05e3	[{"name": "timelineActivity", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "targetWorkflowVersionId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "timelineActivity", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "targetWorkflowVersionId", "referencedTableName": "workflowVersion", "referencedTableColumnName": "id"}]}]	1767649065661-create-relation-from-timelineActivity-to-workflowVersion	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
33c7e443-6e5c-421b-ba0b-b617eb8bbfe7	[{"name": "workflowAutomatedTrigger", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "workflowId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "workflowAutomatedTrigger", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "workflowId", "referencedTableName": "workflow", "referencedTableColumnName": "id"}]}]	1767649065661-create-relation-from-workflowAutomatedTrigger-to-workflow	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
3c39f68a-7f6c-479e-bdfa-666d997972f8	[{"name": "workflowRun", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "workflowId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "workflowRun", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "workflowId", "referencedTableName": "workflow", "referencedTableColumnName": "id"}]}]	1767649065661-create-relation-from-workflowRun-to-workflow	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
2e99b1b9-e854-463a-82ea-051282d701fa	[{"name": "workflowRun", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "workflowVersionId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "workflowRun", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "SET_NULL", "columnName": "workflowVersionId", "referencedTableName": "workflowVersion", "referencedTableColumnName": "id"}]}]	1767649065661-create-relation-from-workflowRun-to-workflowVersion	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
687fd416-3fd5-4905-8b3a-79fcf9d5b4b6	[{"name": "messageFolder", "action": "alter_indexes", "indexes": [{"name": "IDX_8606361c00c3d44e1a23024e1f8", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["messageChannelId", "deletedAt"], "isUnique": false}, {"name": "IDX_UNIQUE_da740cfc9b8edd57936cc18f66f", "type": "BTREE", "where": "\\"deletedAt\\" IS NULL", "action": "CREATE", "columns": ["messageChannelId", "externalId"], "isUnique": true}]}]	1767649065753-create-messageFolder-indexes	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
7e3d0e37-8a72-40f6-966a-5bec1b80b625	[{"name": "workflowVersion", "action": "alter", "columns": [{"action": "CREATE", "isArray": false, "isUnique": false, "columnName": "workflowId", "columnType": "uuid", "isNullable": true, "defaultValue": null}]}, {"name": "workflowVersion", "action": "alter", "columns": [{"action": "CREATE_FOREIGN_KEY", "onDelete": "CASCADE", "columnName": "workflowId", "referencedTableName": "workflow", "referencedTableColumnName": "id"}]}]	1767649065661-create-relation-from-workflowVersion-to-workflow	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
7a36bb69-04fc-47e1-b24c-e35fe08787f3	[{"name": "attachment", "action": "alter_indexes", "indexes": [{"name": "IDX_30f969e0ec549acca94396d3efe", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["authorId", "deletedAt"], "isUnique": false}, {"name": "IDX_2055e4e583e9a2e5b4c239fd992", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["taskId", "deletedAt"], "isUnique": false}, {"name": "IDX_0698fed0e67005b7051b5d353b6", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["noteId", "deletedAt"], "isUnique": false}, {"name": "IDX_3ca1d5243ff67f58c7c65c9a8a2", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["personId", "deletedAt"], "isUnique": false}, {"name": "IDX_91e687ea21123af4e02c9a07a43", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["companyId", "deletedAt"], "isUnique": false}, {"name": "IDX_73615a6bdc972b013956b19c59e", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["opportunityId", "deletedAt"], "isUnique": false}, {"name": "IDX_b4787dfe0ab22620ab04dcdffba", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["dashboardId", "deletedAt"], "isUnique": false}, {"name": "IDX_1c0459cd093778c23aef5b1e0d2", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["workflowId", "deletedAt"], "isUnique": false}]}]	1767649065752-create-attachment-indexes	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
fb9450b5-8053-4c51-9441-9f6b425715b5	[{"name": "blocklist", "action": "alter_indexes", "indexes": [{"name": "IDX_76a190ab8a6f439791358d63d60", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["workspaceMemberId", "deletedAt"], "isUnique": false}]}]	1767649065752-create-blocklist-indexes	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
e25258f4-da3b-4d25-83e0-4074f4057d81	[{"name": "calendarChannel", "action": "alter_indexes", "indexes": [{"name": "IDX_3465c79448bacd2f1268e5f6310", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["connectedAccountId", "deletedAt"], "isUnique": false}]}]	1767649065752-create-calendarChannel-indexes	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
ff31ebcd-aaa7-4665-8668-fe8ab94d8fcf	[{"name": "calendarChannelEventAssociation", "action": "alter_indexes", "indexes": [{"name": "IDX_a88c3ab301c25202d4b52fb4b1b", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["calendarChannelId", "deletedAt"], "isUnique": false}, {"name": "IDX_92a888b681107c4f78926820db7", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["calendarEventId", "deletedAt"], "isUnique": false}]}]	1767649065752-create-calendarChannelEventAssociation-indexes	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
f9712a7e-ce4d-4d38-bc7e-6f83a58ab9bc	[{"name": "calendarEventParticipant", "action": "alter_indexes", "indexes": [{"name": "IDX_dd22aee9059fd7002165df6d8cc", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["calendarEventId", "deletedAt"], "isUnique": false}, {"name": "IDX_0da422bbe7adbabb8144c696ebd", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["personId", "deletedAt"], "isUnique": false}, {"name": "IDX_2bf094726f6d91639302c1c143d", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["workspaceMemberId", "deletedAt"], "isUnique": false}]}]	1767649065752-create-calendarEventParticipant-indexes	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
facad4b4-0f88-470c-8383-cda47bfa12bd	[{"name": "company", "action": "alter_indexes", "indexes": [{"name": "IDX_2a32339058d0b6910b0834ddf81", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["domainNamePrimaryLinkUrl"], "isUnique": true}, {"name": "IDX_123501237187c835ede626367b7", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["accountOwnerId", "deletedAt"], "isUnique": false}, {"name": "IDX_fb1f4905546cfc6d70a971c76f7", "type": "GIN", "where": null, "action": "CREATE", "columns": ["searchVector"], "isUnique": false}]}]	1767649065752-create-company-indexes	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
49539ee0-cd1a-427d-b257-1f8fef7dcd67	[{"name": "connectedAccount", "action": "alter_indexes", "indexes": [{"name": "IDX_7d1b454b2a538273bdb947e848f", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["accountOwnerId", "deletedAt"], "isUnique": false}]}]	1767649065752-create-connectedAccount-indexes	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
e0862739-e724-480d-8c64-b449e500fd82	[{"name": "dashboard", "action": "alter_indexes", "indexes": [{"name": "IDX_f3b76c5322b31cba175b2eccec8", "type": "GIN", "where": null, "action": "CREATE", "columns": ["searchVector"], "isUnique": false}]}]	1767649065752-create-dashboard-indexes	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
a0d97af2-4315-44f1-9ebf-61db097ce4ec	[{"name": "messageParticipant", "action": "alter_indexes", "indexes": [{"name": "IDX_8d0144e4074d86d0cb7094f40c2", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["messageId", "deletedAt"], "isUnique": false}, {"name": "IDX_6d9700e5ae2ab8c294d614e72f6", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["personId", "deletedAt"], "isUnique": false}, {"name": "IDX_8c4f617db0813d41aef587e49ea", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["workspaceMemberId", "deletedAt"], "isUnique": false}]}]	1767649065753-create-messageParticipant-indexes	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
4ea459d5-0d25-4f47-918a-827c96ac053f	[{"name": "note", "action": "alter_indexes", "indexes": [{"name": "IDX_f20de8d7fc74a405e4083051275", "type": "GIN", "where": null, "action": "CREATE", "columns": ["searchVector"], "isUnique": false}]}]	1767649065753-create-note-indexes	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
a4fef06c-d895-4c80-a6f7-e93da8d67982	[{"name": "favorite", "action": "alter_indexes", "indexes": [{"name": "IDX_180e5f1d82cbdbae0dc8c4b5c40", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["forWorkspaceMemberId", "deletedAt"], "isUnique": false}, {"name": "IDX_1f7e4cb168e77496349c8cefed6", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["personId", "deletedAt"], "isUnique": false}, {"name": "IDX_a900d9f809273abe54dc5e166fa", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["companyId", "deletedAt"], "isUnique": false}, {"name": "IDX_b810a8e37adf5cafd342170ccf8", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["favoriteFolderId", "deletedAt"], "isUnique": false}, {"name": "IDX_85f024f9ec673d530d14cf75fe5", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["opportunityId", "deletedAt"], "isUnique": false}, {"name": "IDX_eecddc968e93b9b8ebbfd85dad3", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["workflowId", "deletedAt"], "isUnique": false}, {"name": "IDX_110d1dc7f0ecd231a18f6784cf3", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["workflowVersionId", "deletedAt"], "isUnique": false}, {"name": "IDX_7c59b29a053016fc596ddad8a0e", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["workflowRunId", "deletedAt"], "isUnique": false}, {"name": "IDX_e14b3424016bea8b7fe220f7761", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["taskId", "deletedAt"], "isUnique": false}, {"name": "IDX_21d905e0adf19e835f6059a9f3d", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["noteId", "deletedAt"], "isUnique": false}, {"name": "IDX_8ea5d02aec60a7ceabc36fb2b41", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["dashboardId", "deletedAt"], "isUnique": false}]}]	1767649065752-create-favorite-indexes	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
f5506222-1e3b-4c5e-8c14-5a1a0b03f43c	[{"name": "message", "action": "alter_indexes", "indexes": [{"name": "IDX_78fa73d661d632619e17de211e6", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["messageThreadId", "deletedAt"], "isUnique": false}]}]	1767649065752-create-message-indexes	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
8b22f8ac-6aba-4063-9cd4-8b01808f4254	[{"name": "messageChannel", "action": "alter_indexes", "indexes": [{"name": "IDX_c3af632ce35236d21f8ae1f4cfd", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["connectedAccountId", "deletedAt"], "isUnique": false}]}]	1767649065752-create-messageChannel-indexes	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
75ca2cfd-b150-4748-bb81-f49acbf2a241	[{"name": "timelineActivity", "action": "alter_indexes", "indexes": [{"name": "IDX_a930d316a6b4f3b81d3f026dd16", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["workspaceMemberId", "deletedAt"], "isUnique": false}, {"name": "IDX_b0f33146379167855851cceef65", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["targetPersonId", "deletedAt"], "isUnique": false}, {"name": "IDX_17a660a8931bb14627a59b23b25", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["targetCompanyId", "deletedAt"], "isUnique": false}, {"name": "IDX_3e44fabc86a1b3bb9ab56c7d23c", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["targetOpportunityId", "deletedAt"], "isUnique": false}, {"name": "IDX_7cf577fad5154f025f50f63d0c6", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["targetNoteId", "deletedAt"], "isUnique": false}, {"name": "IDX_98455b50fdd00d9b234e26b64e9", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["targetTaskId", "deletedAt"], "isUnique": false}, {"name": "IDX_e655425fbac9c7bbb09ae8c0e81", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["targetWorkflowId", "deletedAt"], "isUnique": false}, {"name": "IDX_0b3dec6c7b728aa5d5686e041b2", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["targetWorkflowVersionId", "deletedAt"], "isUnique": false}, {"name": "IDX_2ac2dcf03c86f5654df25cb6587", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["targetWorkflowRunId", "deletedAt"], "isUnique": false}, {"name": "IDX_b55a639f9e6efaca7ad5ee77119", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["targetDashboardId", "deletedAt"], "isUnique": false}]}]	1767649065752-create-timelineActivity-indexes	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
a12a9cfc-8830-4e14-905b-7017ab9d4081	[{"name": "workflow", "action": "alter_indexes", "indexes": [{"name": "IDX_d09fc4b1711543f42c127270f1e", "type": "GIN", "where": null, "action": "CREATE", "columns": ["searchVector"], "isUnique": false}]}]	1767649065752-create-workflow-indexes	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
db54e2e1-e3eb-4308-a579-6d6b18369999	[{"name": "workflowAutomatedTrigger", "action": "alter_indexes", "indexes": [{"name": "IDX_5960ffd71d6ecb88ad89cc023f0", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["workflowId", "deletedAt"], "isUnique": false}]}]	1767649065752-create-workflowAutomatedTrigger-indexes	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
3e3e56f5-f936-4621-a055-fa66e6db0a13	[{"name": "workflowRun", "action": "alter_indexes", "indexes": [{"name": "IDX_261d8661b94dbb98cc85cffab46", "type": "GIN", "where": null, "action": "CREATE", "columns": ["searchVector"], "isUnique": false}, {"name": "IDX_faa5772594c4ce15b9305919f2f", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["workflowVersionId", "deletedAt"], "isUnique": false}, {"name": "IDX_eee970874f46ff99eefc0015001", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["workflowId", "deletedAt"], "isUnique": false}]}]	1767649065752-create-workflowRun-indexes	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
2cf51a94-442e-4a36-9c2d-bcee2f9ad5b2	[{"name": "workflowVersion", "action": "alter_indexes", "indexes": [{"name": "IDX_51329bbcdab6618a75361670c26", "type": "GIN", "where": null, "action": "CREATE", "columns": ["searchVector"], "isUnique": false}, {"name": "IDX_a362c5eff4a28fcdffdd3bdff16", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["workflowId", "deletedAt"], "isUnique": false}]}]	1767649065752-create-workflowVersion-indexes	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
1911bc14-558b-483d-8629-a856378c9a69	[{"name": "workspaceMember", "action": "alter_indexes", "indexes": [{"name": "IDX_39954942ffa78c957b5dee47739", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["userEmail"], "isUnique": true}, {"name": "IDX_e47451872f70c8f187a6b460ac7", "type": "GIN", "where": null, "action": "CREATE", "columns": ["searchVector"], "isUnique": false}]}]	1767649065752-create-workspaceMember-indexes	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
86667c2f-6c5d-4cc2-b217-9905d21be8c8	[{"name": "messageChannelMessageAssociation", "action": "alter_indexes", "indexes": [{"name": "IDX_63953e5f88351922043480b8801", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["messageChannelId", "deletedAt"], "isUnique": false}, {"name": "IDX_671dd9e01a80d1e4c89fc166c3b", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["messageId", "deletedAt"], "isUnique": false}, {"name": "IDX_UNIQUE_da56d8b595a778d404eae01f29b", "type": "BTREE", "where": "\\"deletedAt\\" IS NULL", "action": "CREATE", "columns": ["messageChannelId", "messageId"], "isUnique": true}]}]	1767649065753-create-messageChannelMessageAssociation-indexes	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
b631cc8e-0f19-4db4-a65f-16975179f931	[{"name": "noteTarget", "action": "alter_indexes", "indexes": [{"name": "IDX_241f0cca089399c8c5954086b8d", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["noteId", "deletedAt"], "isUnique": false}, {"name": "IDX_56454973bce16e65ee1ae3d2e40", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["personId", "deletedAt"], "isUnique": false}, {"name": "IDX_68bce49f4de05facd5365a3a797", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["companyId", "deletedAt"], "isUnique": false}, {"name": "IDX_19ea95ddb39f610f7dcad4c4336", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["opportunityId", "deletedAt"], "isUnique": false}]}]	1767649065753-create-noteTarget-indexes	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
094df93c-b033-479a-a5c5-b6b1a1bb6b39	[{"name": "opportunity", "action": "alter_indexes", "indexes": [{"name": "IDX_4f469d3a7ee08aefdc099836364", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["stage", "deletedAt"], "isUnique": false}, {"name": "IDX_82cdf247553f960093baa7c6635", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["pointOfContactId", "deletedAt"], "isUnique": false}, {"name": "IDX_425ac6c73ecb993cf9cbc2c2b00", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["companyId", "deletedAt"], "isUnique": false}, {"name": "IDX_9f96d65260c4676faac27cb6bf3", "type": "GIN", "where": null, "action": "CREATE", "columns": ["searchVector"], "isUnique": false}]}]	1767649065753-create-opportunity-indexes	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
e75c0b96-fe0e-447c-ae88-aca82974740b	[{"name": "person", "action": "alter_indexes", "indexes": [{"name": "IDX_87914cd3ce963115f8cb943e2ac", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["emailsPrimaryEmail"], "isUnique": true}, {"name": "IDX_6a862a788ac6ce967afa06df812", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["companyId", "deletedAt"], "isUnique": false}, {"name": "IDX_bbd7aec1976fc684a0a5e4816c9", "type": "GIN", "where": null, "action": "CREATE", "columns": ["searchVector"], "isUnique": false}]}]	1767649065753-create-person-indexes	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
93461e77-b5a1-4c85-9679-6552134e1ecd	[{"name": "task", "action": "alter_indexes", "indexes": [{"name": "IDX_ee5298b25512b38b29390e084f7", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["assigneeId", "deletedAt"], "isUnique": false}, {"name": "IDX_d01a000cf26e1225d894dc3d364", "type": "GIN", "where": null, "action": "CREATE", "columns": ["searchVector"], "isUnique": false}]}]	1767649065753-create-task-indexes	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
c9f08135-a5f2-4369-a09f-beadff049785	[{"name": "taskTarget", "action": "alter_indexes", "indexes": [{"name": "IDX_627d4437c96f22d5d46cc9a85bb", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["taskId", "deletedAt"], "isUnique": false}, {"name": "IDX_cf12e6c92058f11b59852ffdfe3", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["personId", "deletedAt"], "isUnique": false}, {"name": "IDX_4e929e3af362914c41035c4d438", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["companyId", "deletedAt"], "isUnique": false}, {"name": "IDX_b0ba7efcd8c529922bf6e858bc1", "type": "BTREE", "where": null, "action": "CREATE", "columns": ["opportunityId", "deletedAt"], "isUnique": false}]}]	1767649065753-create-taskTarget-indexes	f	2026-01-05 21:37:45.239371+00	d3db876d-62f4-4d97-9a5c-4405cbe62b22	2026-01-05 21:37:45.239371+00
\.


--
-- Data for Name: workspaceSSOIdentityProvider; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core."workspaceSSOIdentityProvider" (id, name, status, "workspaceId", "createdAt", "updatedAt", type, issuer, "clientID", "clientSecret", "ssoURL", certificate, fingerprint) FROM stdin;
\.


--
-- Data for Name: attachment; Type: TABLE DATA; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

COPY workspace_cjj1w48f60br2q6wtz6trrdb6.attachment (name, "fullPath", "fileCategory", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", id, "createdAt", "updatedAt", "deletedAt", "noteId", "personId", "taskId", "authorId", "companyId", "dashboardId", "opportunityId", "workflowId") FROM stdin;
\.


--
-- Data for Name: blocklist; Type: TABLE DATA; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

COPY workspace_cjj1w48f60br2q6wtz6trrdb6.blocklist (handle, id, "createdAt", "updatedAt", "deletedAt", "workspaceMemberId") FROM stdin;
\.


--
-- Data for Name: calendarChannel; Type: TABLE DATA; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

COPY workspace_cjj1w48f60br2q6wtz6trrdb6."calendarChannel" (handle, "syncStatus", "syncStage", visibility, "isContactAutoCreationEnabled", "contactAutoCreationPolicy", "isSyncEnabled", "syncCursor", "syncedAt", "syncStageStartedAt", "throttleFailureCount", id, "createdAt", "updatedAt", "deletedAt", "connectedAccountId") FROM stdin;
\.


--
-- Data for Name: calendarChannelEventAssociation; Type: TABLE DATA; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

COPY workspace_cjj1w48f60br2q6wtz6trrdb6."calendarChannelEventAssociation" ("eventExternalId", "recurringEventExternalId", id, "createdAt", "updatedAt", "deletedAt", "calendarChannelId", "calendarEventId") FROM stdin;
\.


--
-- Data for Name: calendarEvent; Type: TABLE DATA; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

COPY workspace_cjj1w48f60br2q6wtz6trrdb6."calendarEvent" (title, "isCanceled", "isFullDay", "startsAt", "endsAt", "externalCreatedAt", "externalUpdatedAt", description, location, "iCalUid", "conferenceSolution", "conferenceLinkPrimaryLinkLabel", "conferenceLinkPrimaryLinkUrl", "conferenceLinkSecondaryLinks", id, "createdAt", "updatedAt", "deletedAt") FROM stdin;
\.


--
-- Data for Name: calendarEventParticipant; Type: TABLE DATA; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

COPY workspace_cjj1w48f60br2q6wtz6trrdb6."calendarEventParticipant" (handle, "displayName", "isOrganizer", "responseStatus", id, "createdAt", "updatedAt", "deletedAt", "calendarEventId", "personId", "workspaceMemberId") FROM stdin;
\.


--
-- Data for Name: company; Type: TABLE DATA; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

COPY workspace_cjj1w48f60br2q6wtz6trrdb6.company (name, "domainNamePrimaryLinkLabel", "domainNamePrimaryLinkUrl", "domainNameSecondaryLinks", employees, "linkedinLinkPrimaryLinkLabel", "linkedinLinkPrimaryLinkUrl", "linkedinLinkSecondaryLinks", "xLinkPrimaryLinkLabel", "xLinkPrimaryLinkUrl", "xLinkSecondaryLinks", "annualRecurringRevenueAmountMicros", "annualRecurringRevenueCurrencyCode", "addressAddressStreet1", "addressAddressStreet2", "addressAddressCity", "addressAddressPostcode", "addressAddressState", "addressAddressCountry", "addressAddressLat", "addressAddressLng", "idealCustomerProfile", "position", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", id, "createdAt", "updatedAt", "deletedAt", "accountOwnerId") FROM stdin;
Anthropic	\N	https://anthropic.com	\N	1100	\N	\N	\N	\N	\N	\N	\N	\N	548 Market Street	\N	San Francisco	94104	CA	United States	\N	\N	f	2	SYSTEM	\N	System	\N	f45ee421-8a3e-4aa5-a1cf-7207cc6754e1	2026-01-05 21:37:46.248819+00	2026-01-05 22:57:26.481039+00	2026-01-05 22:57:26.481039+00	\N
Stripe	\N	https://stripe.com	\N	8000	\N	\N	\N	\N	\N	\N	\N	\N	Eutaw Street	\N	Dublin	\N	\N	Ireland	\N	\N	f	3	SYSTEM	\N	System	\N	1f70157c-4ea5-4d81-bc49-e1401abfbb94	2026-01-05 21:37:46.248819+00	2026-01-05 22:57:26.481039+00	2026-01-05 22:57:26.481039+00	\N
Figma	\N	https://figma.com	\N	800	\N	\N	\N	\N	\N	\N	\N	\N	760 Market St	Floor 10	San Francisco	94102	\N	United States	\N	\N	f	4	SYSTEM	\N	System	\N	9d5bcf43-7d38-4e88-82cb-d6d4ce638bf0	2026-01-05 21:37:46.248819+00	2026-01-05 22:57:26.481039+00	2026-01-05 22:57:26.481039+00	\N
Notion	\N	https://notion.com	\N	400	\N	\N	\N	\N	\N	\N	\N	\N	2300 Harrison St	\N	San Francisco	94110	CA	United States	\N	\N	f	5	SYSTEM	\N	System	\N	06290608-8bf0-4806-99ae-a715a6a93fad	2026-01-05 21:37:46.248819+00	2026-01-05 22:57:26.481039+00	2026-01-05 22:57:26.481039+00	\N
Airbnb	\N	https://airbnb.com	\N	5000	\N	\N	\N	\N	\N	\N	\N	\N	888 Brannan St	\N	San Francisco	94103	CA	United States	\N	\N	f	1	SYSTEM	\N	System	\N	c776ee49-f608-4a77-8cc8-6fe96ae1e43f	2026-01-05 21:37:46.248819+00	2026-01-05 22:57:26.481039+00	2026-01-05 22:57:26.481039+00	\N
\.


--
-- Data for Name: connectedAccount; Type: TABLE DATA; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

COPY workspace_cjj1w48f60br2q6wtz6trrdb6."connectedAccount" (handle, provider, "accessToken", "refreshToken", "lastCredentialsRefreshedAt", "lastSyncHistoryId", "authFailedAt", "handleAliases", scopes, "connectionParameters", id, "createdAt", "updatedAt", "deletedAt", "accountOwnerId") FROM stdin;
\.


--
-- Data for Name: dashboard; Type: TABLE DATA; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

COPY workspace_cjj1w48f60br2q6wtz6trrdb6.dashboard (title, "pageLayoutId", "position", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", id, "createdAt", "updatedAt", "deletedAt") FROM stdin;
\.


--
-- Data for Name: favorite; Type: TABLE DATA; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

COPY workspace_cjj1w48f60br2q6wtz6trrdb6.favorite ("position", "viewId", id, "createdAt", "updatedAt", "deletedAt", "companyId", "dashboardId", "favoriteFolderId", "noteId", "opportunityId", "personId", "taskId", "workflowId", "workflowRunId", "workflowVersionId", "forWorkspaceMemberId") FROM stdin;
0	eb111c1a-9cc2-44a2-9744-a54024c85ea0	748ac30a-2b4b-4daa-af25-6259f2c6dfd1	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	54f5b7f2-cb84-447c-9102-861827605629	c99fa7aa-aaca-4347-a35d-2d798d6ffb02	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	95170ae1-30e9-4f43-ad8b-1e39e151daac	3b232048-6205-457d-93f0-e61fb1ca05ca	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	ddad3049-4e62-4119-bc29-abcf848b00e5	b6d9330e-2a44-4f24-bdf0-a7a8080ca86f	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	5a9f9fc8-e571-4853-9725-cc630006c0c1	fca629c9-641d-45db-84cd-7f86a0d09e84	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	e0331dbe-776d-4a72-b272-58972bf7102f	edacc5ae-fc20-4b6b-abe2-1e95ebadd302	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	8f76a936-17de-4801-b6cd-a477b822e0f6	faf272d8-da8e-4f5c-a5ba-0a7d25b05adb	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	cc25813e-7788-4f48-ab1f-381dbbcabaae	0cb35869-a491-4c44-9911-9f0a7ff12f00	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	b0dabd11-f2e7-482a-a118-20f12b41b388	1f58af47-8d6c-413f-a8ad-bfb017d328d6	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	e07a901c-2cb1-4108-a99d-09ee2e5d6956	9edf5af7-6478-4e99-8358-e9962f7f2f0a	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	16ed7dab-3d09-4571-9bc0-b0ab91949e19	78f7ac28-b937-4c35-8855-d1c335143c39	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	00ecad1b-0c7e-489b-94f0-d7dcf752f04e	bd92e7c5-dfd5-4c01-9732-915d88e42f81	2026-01-05 21:37:46.248855+00	2026-01-05 21:37:46.248855+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: favoriteFolder; Type: TABLE DATA; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

COPY workspace_cjj1w48f60br2q6wtz6trrdb6."favoriteFolder" ("position", name, id, "createdAt", "updatedAt", "deletedAt") FROM stdin;
\.


--
-- Data for Name: message; Type: TABLE DATA; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

COPY workspace_cjj1w48f60br2q6wtz6trrdb6.message ("headerMessageId", subject, text, "receivedAt", id, "createdAt", "updatedAt", "deletedAt", "messageThreadId") FROM stdin;
\.


--
-- Data for Name: messageChannel; Type: TABLE DATA; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

COPY workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel" (visibility, handle, type, "isContactAutoCreationEnabled", "contactAutoCreationPolicy", "messageFolderImportPolicy", "excludeNonProfessionalEmails", "excludeGroupEmails", "pendingGroupEmailsAction", "isSyncEnabled", "syncCursor", "syncedAt", "syncStatus", "syncStage", "syncStageStartedAt", "throttleFailureCount", id, "createdAt", "updatedAt", "deletedAt", "connectedAccountId") FROM stdin;
\.


--
-- Data for Name: messageChannelMessageAssociation; Type: TABLE DATA; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

COPY workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannelMessageAssociation" ("messageExternalId", "messageThreadExternalId", direction, id, "createdAt", "updatedAt", "deletedAt", "messageId", "messageChannelId") FROM stdin;
\.


--
-- Data for Name: messageFolder; Type: TABLE DATA; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

COPY workspace_cjj1w48f60br2q6wtz6trrdb6."messageFolder" (name, "syncCursor", "isSentFolder", "isSynced", "parentFolderId", "externalId", "pendingSyncAction", id, "createdAt", "updatedAt", "deletedAt", "messageChannelId") FROM stdin;
\.


--
-- Data for Name: messageParticipant; Type: TABLE DATA; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

COPY workspace_cjj1w48f60br2q6wtz6trrdb6."messageParticipant" (role, handle, "displayName", id, "createdAt", "updatedAt", "deletedAt", "messageId", "personId", "workspaceMemberId") FROM stdin;
\.


--
-- Data for Name: messageThread; Type: TABLE DATA; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

COPY workspace_cjj1w48f60br2q6wtz6trrdb6."messageThread" (id, "createdAt", "updatedAt", "deletedAt") FROM stdin;
\.


--
-- Data for Name: note; Type: TABLE DATA; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

COPY workspace_cjj1w48f60br2q6wtz6trrdb6.note ("position", title, "bodyV2Blocknote", "bodyV2Markdown", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", id, "createdAt", "updatedAt", "deletedAt") FROM stdin;
\.


--
-- Data for Name: noteTarget; Type: TABLE DATA; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

COPY workspace_cjj1w48f60br2q6wtz6trrdb6."noteTarget" (id, "createdAt", "updatedAt", "deletedAt", "companyId", "noteId", "opportunityId", "personId") FROM stdin;
\.


--
-- Data for Name: opportunity; Type: TABLE DATA; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

COPY workspace_cjj1w48f60br2q6wtz6trrdb6.opportunity (name, "amountAmountMicros", "amountCurrencyCode", "closeDate", stage, "position", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", id, "createdAt", "updatedAt", "deletedAt", "companyId", "pointOfContactId") FROM stdin;
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

COPY workspace_cjj1w48f60br2q6wtz6trrdb6.person ("nameFirstName", "nameLastName", "emailsPrimaryEmail", "emailsAdditionalEmails", "linkedinLinkPrimaryLinkLabel", "linkedinLinkPrimaryLinkUrl", "linkedinLinkSecondaryLinks", "xLinkPrimaryLinkLabel", "xLinkPrimaryLinkUrl", "xLinkSecondaryLinks", "jobTitle", "phonesPrimaryPhoneNumber", "phonesPrimaryPhoneCountryCode", "phonesPrimaryPhoneCallingCode", "phonesAdditionalPhones", city, "avatarUrl", "position", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", id, "createdAt", "updatedAt", "deletedAt", "companyId") FROM stdin;
Brian	Chesky	chesky@airbnb.com	\N	\N	\N	\N	\N	\N	\N	\N	123456789	\N	+1	\N	San Francisco	https://twentyhq.github.io/placeholder-images/people/image-3.png	1	SYSTEM	\N	System	\N	bdb3aa68-ef0d-4ee4-8499-863d330f4bcc	2026-01-05 21:37:46.248819+00	2026-01-05 21:37:46.248819+00	\N	c776ee49-f608-4a77-8cc8-6fe96ae1e43f
Dario	Amodei	amodei@anthropic.com	\N	\N	\N	\N	\N	\N	\N	\N	555123456	\N	+1	\N	San Francisco	https://twentyhq.github.io/placeholder-images/people/image-89.png	2	SYSTEM	\N	System	\N	9c356f9c-77fd-4c1b-808e-6a67989e6772	2026-01-05 21:37:46.248819+00	2026-01-05 21:37:46.248819+00	\N	f45ee421-8a3e-4aa5-a1cf-7207cc6754e1
Patrick	Collison	collison@stripe.com	\N	\N	\N	\N	\N	\N	\N	\N	987625341	\N	+1	\N	San Francisco	https://twentyhq.github.io/placeholder-images/people/image-47.png	3	SYSTEM	\N	System	\N	c0bdaaad-73de-4548-b52d-18c0143fdfac	2026-01-05 21:37:46.248819+00	2026-01-05 21:37:46.248819+00	\N	1f70157c-4ea5-4d81-bc49-e1401abfbb94
Dylan	Field	field@figma.com	\N	\N	\N	\N	\N	\N	\N	\N	098822619	\N	+1	\N	San Francisco	https://twentyhq.github.io/placeholder-images/people/image-40.png	4	SYSTEM	\N	System	\N	e6efb675-cd88-42c7-ae2f-d10030da5fe9	2026-01-05 21:37:46.248819+00	2026-01-05 21:37:46.248819+00	\N	9d5bcf43-7d38-4e88-82cb-d6d4ce638bf0
Ivan	Zhao	zhao@notion.com	\N	\N	\N	\N	\N	\N	\N	\N	882261739	\N	+1	\N	San Francisco	https://twentyhq.github.io/placeholder-images/people/image-68.png	5	SYSTEM	\N	System	\N	5fdd0545-e99c-4e9f-93ac-922547a02593	2026-01-05 21:37:46.248819+00	2026-01-05 21:37:46.248819+00	\N	06290608-8bf0-4806-99ae-a715a6a93fad
\.


--
-- Data for Name: task; Type: TABLE DATA; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

COPY workspace_cjj1w48f60br2q6wtz6trrdb6.task ("position", title, "bodyV2Blocknote", "bodyV2Markdown", "dueAt", status, "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", id, "createdAt", "updatedAt", "deletedAt", "assigneeId") FROM stdin;
\.


--
-- Data for Name: taskTarget; Type: TABLE DATA; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

COPY workspace_cjj1w48f60br2q6wtz6trrdb6."taskTarget" (id, "createdAt", "updatedAt", "deletedAt", "companyId", "opportunityId", "personId", "taskId") FROM stdin;
\.


--
-- Data for Name: timelineActivity; Type: TABLE DATA; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

COPY workspace_cjj1w48f60br2q6wtz6trrdb6."timelineActivity" ("happensAt", name, properties, "linkedRecordCachedName", "linkedRecordId", "linkedObjectMetadataId", id, "createdAt", "updatedAt", "deletedAt", "targetCompanyId", "targetDashboardId", "targetPersonId", "workspaceMemberId", "targetNoteId", "targetOpportunityId", "targetTaskId", "targetWorkflowId", "targetWorkflowRunId", "targetWorkflowVersionId") FROM stdin;
2026-01-05 22:57:28.439595+00	company.deleted	{}		\N	\N	ef5f00b9-1789-42a1-9b2b-e3d522be2306	2026-01-05 22:57:28.439595+00	2026-01-05 22:57:28.439595+00	\N	f45ee421-8a3e-4aa5-a1cf-7207cc6754e1	\N	\N	0cc9529b-874a-4bf2-917e-ef173b7bee88	\N	\N	\N	\N	\N	\N
2026-01-05 22:57:28.439595+00	company.deleted	{}		\N	\N	b9818423-dacc-4ef9-9961-cbcbba6df0b4	2026-01-05 22:57:28.439595+00	2026-01-05 22:57:28.439595+00	\N	1f70157c-4ea5-4d81-bc49-e1401abfbb94	\N	\N	0cc9529b-874a-4bf2-917e-ef173b7bee88	\N	\N	\N	\N	\N	\N
2026-01-05 22:57:28.439595+00	company.deleted	{}		\N	\N	031012a1-56a8-4504-a906-a973b34d6652	2026-01-05 22:57:28.439595+00	2026-01-05 22:57:28.439595+00	\N	9d5bcf43-7d38-4e88-82cb-d6d4ce638bf0	\N	\N	0cc9529b-874a-4bf2-917e-ef173b7bee88	\N	\N	\N	\N	\N	\N
2026-01-05 22:57:28.439595+00	company.deleted	{}		\N	\N	4f9f3a50-3108-401d-854f-dfb94c25c47f	2026-01-05 22:57:28.439595+00	2026-01-05 22:57:28.439595+00	\N	06290608-8bf0-4806-99ae-a715a6a93fad	\N	\N	0cc9529b-874a-4bf2-917e-ef173b7bee88	\N	\N	\N	\N	\N	\N
2026-01-05 22:57:28.439595+00	company.deleted	{}		\N	\N	b049f8f9-e16a-4d7b-9932-77574aefc960	2026-01-05 22:57:28.439595+00	2026-01-05 22:57:28.439595+00	\N	c776ee49-f608-4a77-8cc8-6fe96ae1e43f	\N	\N	0cc9529b-874a-4bf2-917e-ef173b7bee88	\N	\N	\N	\N	\N	\N
2026-01-06 01:41:04.368407+00	dashboard.created	{}		\N	\N	8f8ea088-2d0a-4288-8932-580fd673685a	2026-01-06 01:41:04.368407+00	2026-01-06 01:41:04.368407+00	\N	\N	\N	\N	0cc9529b-874a-4bf2-917e-ef173b7bee88	\N	\N	\N	\N	\N	\N
2026-01-06 01:42:07.116515+00	dashboard.deleted	{}		\N	\N	59891f84-a115-40e9-b5da-21e619b34ea4	2026-01-06 01:42:07.116515+00	2026-01-06 01:42:07.116515+00	\N	\N	\N	\N	0cc9529b-874a-4bf2-917e-ef173b7bee88	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: workflow; Type: TABLE DATA; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

COPY workspace_cjj1w48f60br2q6wtz6trrdb6.workflow (name, "lastPublishedVersionId", statuses, "position", "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", id, "createdAt", "updatedAt", "deletedAt") FROM stdin;
Quick Lead	ac67974f-c524-4288-9d88-af8515400b68	{ACTIVE}	1	SYSTEM	\N	System	{}	8b213cac-a68b-4ffe-817a-3ec994e9932d	2026-01-05 21:37:46.248819+00	2026-01-05 21:37:46.248819+00	\N
\.


--
-- Data for Name: workflowAutomatedTrigger; Type: TABLE DATA; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

COPY workspace_cjj1w48f60br2q6wtz6trrdb6."workflowAutomatedTrigger" (type, settings, id, "createdAt", "updatedAt", "deletedAt", "workflowId") FROM stdin;
\.


--
-- Data for Name: workflowRun; Type: TABLE DATA; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

COPY workspace_cjj1w48f60br2q6wtz6trrdb6."workflowRun" (name, "enqueuedAt", "startedAt", "endedAt", status, "createdBySource", "createdByWorkspaceMemberId", "createdByName", "createdByContext", state, "position", id, "createdAt", "updatedAt", "deletedAt", "workflowId", "workflowVersionId") FROM stdin;
\.


--
-- Data for Name: workflowVersion; Type: TABLE DATA; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

COPY workspace_cjj1w48f60br2q6wtz6trrdb6."workflowVersion" (name, trigger, steps, status, "position", id, "createdAt", "updatedAt", "deletedAt", "workflowId") FROM stdin;
v1	{"name": "Launch manually", "type": "MANUAL", "settings": {"icon": "IconUserPlus", "availability": {"type": "GLOBAL"}, "outputSchema": {}}, "nextStepIds": ["6e089bc9-aabd-435f-865f-f31c01c8f4a7"]}	[{"id": "6e089bc9-aabd-435f-865f-f31c01c8f4a7", "name": "Quick Lead Form", "type": "FORM", "valid": false, "settings": {"input": [{"id": "14d669f0-5249-4fa4-b0bb-f8bd408328d5", "name": "firstName", "type": "TEXT", "label": "First name", "placeholder": "Tim"}, {"id": "4eb6ce85-d231-4aef-9837-744490c026d0", "name": "lastName", "type": "TEXT", "label": "Last Name", "placeholder": "Apple"}, {"id": "adbf0e9f-1427-49be-b4fb-092b34d97350", "name": "email", "type": "TEXT", "label": "Email", "placeholder": "timapple@apple.com"}, {"id": "4ffc7992-9e65-4a4d-9baf-b52e62f2c273", "name": "jobTitle", "type": "TEXT", "label": "Job title", "placeholder": "CEO"}, {"id": "42f11926-04ea-4924-94a4-2293cc748362", "name": "companyName", "type": "TEXT", "label": "Company name", "placeholder": "Apple"}, {"id": "d6ca80ee-26cd-466d-91bf-984d7205451c", "name": "companyDomain", "type": "TEXT", "label": "Company domain", "placeholder": "https://www.apple.com"}], "outputSchema": {"email": {"type": "TEXT", "label": "Email", "value": "My text", "isLeaf": true}, "jobTitle": {"type": "TEXT", "label": "Job title", "value": "My text", "isLeaf": true}, "lastName": {"type": "TEXT", "label": "Last Name", "value": "My text", "isLeaf": true}, "firstName": {"type": "TEXT", "label": "First name", "value": "My text", "isLeaf": true}, "companyName": {"type": "TEXT", "label": "Company name", "value": "My text", "isLeaf": true}, "companyDomain": {"type": "TEXT", "label": "Company domain", "value": "My text", "isLeaf": true}}, "errorHandlingOptions": {"retryOnFailure": {"value": false}, "continueOnFailure": {"value": false}}}, "__typename": "WorkflowAction", "nextStepIds": ["0715b6cd-7cc1-4b98-971b-00f54dfe643b"]}, {"id": "0715b6cd-7cc1-4b98-971b-00f54dfe643b", "name": "Create Company", "type": "CREATE_RECORD", "valid": false, "settings": {"input": {"objectName": "company", "objectRecord": {"name": "{{6e089bc9-aabd-435f-865f-f31c01c8f4a7.companyName}}", "domainName": {"primaryLinkUrl": "{{6e089bc9-aabd-435f-865f-f31c01c8f4a7.companyDomain}}", "primaryLinkLabel": ""}}}, "outputSchema": {"fields": {"id": {"icon": "Icon123", "type": "UUID", "label": "Id", "value": "123e4567-e89b-12d3-a456-426614174000", "isLeaf": true, "fieldMetadataId": "5ec17413-5f28-44d9-8330-04665679ff14"}, "name": {"icon": "IconBuildingSkyscraper", "type": "TEXT", "label": "Name", "value": "My text", "isLeaf": true, "fieldMetadataId": "34291d1e-bd23-472f-adde-c5e7ae219b43"}, "xLink": {"icon": "IconBrandX", "type": "LINKS", "label": "X", "value": {"primaryLinkUrl": {"type": "TEXT", "label": "Primary Link Url", "value": "My text", "isLeaf": true, "fieldMetadataId": "3a607544-804f-4753-87c1-ab4f0166f389", "isCompositeSubField": true}, "secondaryLinks": {"type": "RAW_JSON", "label": "Secondary Links", "value": null, "isLeaf": true, "fieldMetadataId": "3a607544-804f-4753-87c1-ab4f0166f389", "isCompositeSubField": true}, "primaryLinkLabel": {"type": "TEXT", "label": "Primary Link Label", "value": "My text", "isLeaf": true, "fieldMetadataId": "3a607544-804f-4753-87c1-ab4f0166f389", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "3a607544-804f-4753-87c1-ab4f0166f389"}, "address": {"icon": "IconMap", "type": "ADDRESS", "label": "Address", "value": {"addressLat": {"type": "NUMERIC", "label": "Address Lat", "value": null, "isLeaf": true, "fieldMetadataId": "02e15066-2f33-469b-933c-0fb519f37f8b", "isCompositeSubField": true}, "addressLng": {"type": "NUMERIC", "label": "Address Lng", "value": null, "isLeaf": true, "fieldMetadataId": "02e15066-2f33-469b-933c-0fb519f37f8b", "isCompositeSubField": true}, "addressCity": {"type": "TEXT", "label": "Address City", "value": "My text", "isLeaf": true, "fieldMetadataId": "02e15066-2f33-469b-933c-0fb519f37f8b", "isCompositeSubField": true}, "addressState": {"type": "TEXT", "label": "Address State", "value": "My text", "isLeaf": true, "fieldMetadataId": "02e15066-2f33-469b-933c-0fb519f37f8b", "isCompositeSubField": true}, "addressCountry": {"type": "TEXT", "label": "Address Country", "value": "My text", "isLeaf": true, "fieldMetadataId": "02e15066-2f33-469b-933c-0fb519f37f8b", "isCompositeSubField": true}, "addressStreet1": {"type": "TEXT", "label": "Address Street1", "value": "My text", "isLeaf": true, "fieldMetadataId": "02e15066-2f33-469b-933c-0fb519f37f8b", "isCompositeSubField": true}, "addressStreet2": {"type": "TEXT", "label": "Address Street2", "value": "My text", "isLeaf": true, "fieldMetadataId": "02e15066-2f33-469b-933c-0fb519f37f8b", "isCompositeSubField": true}, "addressPostcode": {"type": "TEXT", "label": "Address Postcode", "value": "My text", "isLeaf": true, "fieldMetadataId": "02e15066-2f33-469b-933c-0fb519f37f8b", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "02e15066-2f33-469b-933c-0fb519f37f8b"}, "createdAt": {"icon": "IconCalendar", "type": "DATE_TIME", "label": "Creation date", "value": "01/23/2025 15:16", "isLeaf": true, "fieldMetadataId": "670802a4-1913-4b44-9a57-30f5e2a59021"}, "createdBy": {"icon": "IconCreativeCommonsSa", "type": "ACTOR", "label": "Created by", "value": {"name": {"type": "TEXT", "label": "Name", "value": "My text", "isLeaf": true, "fieldMetadataId": "e658c61d-9b50-4ba2-a59b-d61b932f7b2a", "isCompositeSubField": true}, "source": {"type": "SELECT", "label": "Source", "value": null, "isLeaf": true, "fieldMetadataId": "e658c61d-9b50-4ba2-a59b-d61b932f7b2a", "isCompositeSubField": true}, "context": {"type": "RAW_JSON", "label": "Context", "value": null, "isLeaf": true, "fieldMetadataId": "e658c61d-9b50-4ba2-a59b-d61b932f7b2a", "isCompositeSubField": true}, "workspaceMemberId": {"type": "UUID", "label": "Workspace Member Id", "value": "123e4567-e89b-12d3-a456-426614174000", "isLeaf": true, "fieldMetadataId": "e658c61d-9b50-4ba2-a59b-d61b932f7b2a", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "e658c61d-9b50-4ba2-a59b-d61b932f7b2a"}, "deletedAt": {"icon": "IconCalendarMinus", "type": "DATE_TIME", "label": "Deleted at", "value": "01/23/2025 15:16", "isLeaf": true, "fieldMetadataId": "321d5427-3283-443b-b4c9-504bc2c30da7"}, "employees": {"icon": "IconUsers", "type": "NUMBER", "label": "Employees", "value": 20, "isLeaf": true, "fieldMetadataId": "558e59f0-bbc5-4a21-ba4f-7a97f8423f42"}, "updatedAt": {"icon": "IconCalendarClock", "type": "DATE_TIME", "label": "Last update", "value": "01/23/2025 15:16", "isLeaf": true, "fieldMetadataId": "682928e1-bfb6-4e29-b866-d698432825e4"}, "domainName": {"icon": "IconLink", "type": "LINKS", "label": "Domain Name", "value": {"primaryLinkUrl": {"type": "TEXT", "label": "Primary Link Url", "value": "My text", "isLeaf": true, "fieldMetadataId": "2d192d9d-d23b-42c3-80ea-4f6a9c5b6e60", "isCompositeSubField": true}, "secondaryLinks": {"type": "RAW_JSON", "label": "Secondary Links", "value": null, "isLeaf": true, "fieldMetadataId": "2d192d9d-d23b-42c3-80ea-4f6a9c5b6e60", "isCompositeSubField": true}, "primaryLinkLabel": {"type": "TEXT", "label": "Primary Link Label", "value": "My text", "isLeaf": true, "fieldMetadataId": "2d192d9d-d23b-42c3-80ea-4f6a9c5b6e60", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "2d192d9d-d23b-42c3-80ea-4f6a9c5b6e60"}, "linkedinLink": {"icon": "IconBrandLinkedin", "type": "LINKS", "label": "Linkedin", "value": {"primaryLinkUrl": {"type": "TEXT", "label": "Primary Link Url", "value": "My text", "isLeaf": true, "fieldMetadataId": "408abd61-1370-41a6-b3ae-0a09ec2d247b", "isCompositeSubField": true}, "secondaryLinks": {"type": "RAW_JSON", "label": "Secondary Links", "value": null, "isLeaf": true, "fieldMetadataId": "408abd61-1370-41a6-b3ae-0a09ec2d247b", "isCompositeSubField": true}, "primaryLinkLabel": {"type": "TEXT", "label": "Primary Link Label", "value": "My text", "isLeaf": true, "fieldMetadataId": "408abd61-1370-41a6-b3ae-0a09ec2d247b", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "408abd61-1370-41a6-b3ae-0a09ec2d247b"}, "accountOwnerId": {"icon": "IconUserCircle", "type": "UUID", "label": "Account Owner Id", "value": "123e4567-e89b-12d3-a456-426614174000", "isLeaf": true, "fieldMetadataId": "a1af0d87-a071-4080-a260-3fec85c6359a"}, "idealCustomerProfile": {"icon": "IconTarget", "type": "BOOLEAN", "label": "ICP", "value": true, "isLeaf": true, "fieldMetadataId": "82d94d80-8c97-44bd-991f-2464f7895f5e"}, "annualRecurringRevenue": {"icon": "IconMoneybag", "type": "CURRENCY", "label": "ARR", "value": {"amountMicros": {"type": "NUMERIC", "label": "Amount Micros", "value": null, "isLeaf": true, "fieldMetadataId": "9f06b921-27e0-4e37-908d-a23c798eca29", "isCompositeSubField": true}, "currencyCode": {"type": "TEXT", "label": "Currency Code", "value": "My text", "isLeaf": true, "fieldMetadataId": "9f06b921-27e0-4e37-908d-a23c798eca29", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "9f06b921-27e0-4e37-908d-a23c798eca29"}}, "object": {"icon": "IconBuildingSkyscraper", "label": "Company", "value": "A company", "isLeaf": true, "fieldIdName": "id", "nameSingular": "company"}, "_outputSchemaType": "RECORD"}, "errorHandlingOptions": {"retryOnFailure": {"value": false}, "continueOnFailure": {"value": false}}}, "__typename": "WorkflowAction", "nextStepIds": ["6f553ea7-b00e-4371-9d88-d8298568a246"]}, {"id": "6f553ea7-b00e-4371-9d88-d8298568a246", "name": "Create Person", "type": "CREATE_RECORD", "valid": false, "settings": {"input": {"objectName": "person", "objectRecord": {"name": {"lastName": "{{6e089bc9-aabd-435f-865f-f31c01c8f4a7.lastName}}", "firstName": "{{6e089bc9-aabd-435f-865f-f31c01c8f4a7.firstName}}"}, "emails": {"primaryEmail": "{{6e089bc9-aabd-435f-865f-f31c01c8f4a7.email}}", "additionalEmails": []}, "company": {"id": "{{0715b6cd-7cc1-4b98-971b-00f54dfe643b.id}}"}}}, "outputSchema": {"fields": {"id": {"icon": "Icon123", "type": "UUID", "label": "Id", "value": "123e4567-e89b-12d3-a456-426614174000", "isLeaf": true, "fieldMetadataId": "2f66cb03-f858-492f-a10f-481dbaf6e30a"}, "city": {"icon": "IconMap", "type": "TEXT", "label": "City", "value": "My text", "isLeaf": true, "fieldMetadataId": "2eea4fb8-5104-475a-baf8-12e9c538382f"}, "name": {"icon": "IconUser", "type": "FULL_NAME", "label": "Name", "value": {"lastName": {"type": "TEXT", "label": "Last Name", "value": "My text", "isLeaf": true, "fieldMetadataId": "f8224e96-02c4-4cb6-bfd5-55581237cbb3", "isCompositeSubField": true}, "firstName": {"type": "TEXT", "label": "First Name", "value": "My text", "isLeaf": true, "fieldMetadataId": "f8224e96-02c4-4cb6-bfd5-55581237cbb3", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "f8224e96-02c4-4cb6-bfd5-55581237cbb3"}, "xLink": {"icon": "IconBrandX", "type": "LINKS", "label": "X", "value": {"primaryLinkUrl": {"type": "TEXT", "label": "Primary Link Url", "value": "My text", "isLeaf": true, "fieldMetadataId": "2e2f8cc4-bae2-45ca-b417-427794a25d11", "isCompositeSubField": true}, "secondaryLinks": {"type": "RAW_JSON", "label": "Secondary Links", "value": null, "isLeaf": true, "fieldMetadataId": "2e2f8cc4-bae2-45ca-b417-427794a25d11", "isCompositeSubField": true}, "primaryLinkLabel": {"type": "TEXT", "label": "Primary Link Label", "value": "My text", "isLeaf": true, "fieldMetadataId": "2e2f8cc4-bae2-45ca-b417-427794a25d11", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "2e2f8cc4-bae2-45ca-b417-427794a25d11"}, "emails": {"icon": "IconMail", "type": "EMAILS", "label": "Emails", "value": {"primaryEmail": {"type": "TEXT", "label": "Primary Email", "value": "My text", "isLeaf": true, "fieldMetadataId": "a477a67b-cf0d-42fe-b95e-df0ed7f38d04", "isCompositeSubField": true}, "additionalEmails": {"type": "RAW_JSON", "label": "Additional Emails", "value": null, "isLeaf": true, "fieldMetadataId": "a477a67b-cf0d-42fe-b95e-df0ed7f38d04", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "a477a67b-cf0d-42fe-b95e-df0ed7f38d04"}, "phones": {"icon": "IconPhone", "type": "PHONES", "label": "Phones", "value": {"additionalPhones": {"type": "RAW_JSON", "label": "Additional Phones", "value": null, "isLeaf": true, "fieldMetadataId": "b4d586b8-837b-4e97-a448-de6bd310bf73", "isCompositeSubField": true}, "primaryPhoneNumber": {"type": "TEXT", "label": "Primary Phone Number", "value": "My text", "isLeaf": true, "fieldMetadataId": "b4d586b8-837b-4e97-a448-de6bd310bf73", "isCompositeSubField": true}, "primaryPhoneCallingCode": {"type": "TEXT", "label": "Primary Phone Calling Code", "value": "My text", "isLeaf": true, "fieldMetadataId": "b4d586b8-837b-4e97-a448-de6bd310bf73", "isCompositeSubField": true}, "primaryPhoneCountryCode": {"type": "TEXT", "label": "Primary Phone Country Code", "value": "My text", "isLeaf": true, "fieldMetadataId": "b4d586b8-837b-4e97-a448-de6bd310bf73", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "b4d586b8-837b-4e97-a448-de6bd310bf73"}, "jobTitle": {"icon": "IconBriefcase", "type": "TEXT", "label": "Job Title", "value": "My text", "isLeaf": true, "fieldMetadataId": "51404b8b-cb11-427e-9b8b-5d27cd8377cc"}, "avatarUrl": {"icon": "IconFileUpload", "type": "TEXT", "label": "Avatar", "value": "My text", "isLeaf": true, "fieldMetadataId": "b680e99d-220f-4d6c-8781-bd2e6206f920"}, "companyId": {"icon": "IconBuildingSkyscraper", "type": "UUID", "label": "Company Id", "value": "123e4567-e89b-12d3-a456-426614174000", "isLeaf": true, "fieldMetadataId": "570d723b-1232-4c20-b317-1f77f319dd9f"}, "createdAt": {"icon": "IconCalendar", "type": "DATE_TIME", "label": "Creation date", "value": "01/23/2025 15:16", "isLeaf": true, "fieldMetadataId": "d1adc0fb-9e01-4a34-ae16-116ffe050b39"}, "createdBy": {"icon": "IconCreativeCommonsSa", "type": "ACTOR", "label": "Created by", "value": {"name": {"type": "TEXT", "label": "Name", "value": "My text", "isLeaf": true, "fieldMetadataId": "aaaafa1f-a60a-46c6-8dab-97497a3190c8", "isCompositeSubField": true}, "source": {"type": "SELECT", "label": "Source", "value": null, "isLeaf": true, "fieldMetadataId": "aaaafa1f-a60a-46c6-8dab-97497a3190c8", "isCompositeSubField": true}, "context": {"type": "RAW_JSON", "label": "Context", "value": null, "isLeaf": true, "fieldMetadataId": "aaaafa1f-a60a-46c6-8dab-97497a3190c8", "isCompositeSubField": true}, "workspaceMemberId": {"type": "UUID", "label": "Workspace Member Id", "value": "123e4567-e89b-12d3-a456-426614174000", "isLeaf": true, "fieldMetadataId": "aaaafa1f-a60a-46c6-8dab-97497a3190c8", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "aaaafa1f-a60a-46c6-8dab-97497a3190c8"}, "deletedAt": {"icon": "IconCalendarMinus", "type": "DATE_TIME", "label": "Deleted at", "value": "01/23/2025 15:16", "isLeaf": true, "fieldMetadataId": "391e3a75-34f3-4c01-a1d1-aae7aab48daa"}, "updatedAt": {"icon": "IconCalendarClock", "type": "DATE_TIME", "label": "Last update", "value": "01/23/2025 15:16", "isLeaf": true, "fieldMetadataId": "e2decc1b-9d2d-4d0a-8b78-eea86fb10fae"}, "linkedinLink": {"icon": "IconBrandLinkedin", "type": "LINKS", "label": "Linkedin", "value": {"primaryLinkUrl": {"type": "TEXT", "label": "Primary Link Url", "value": "My text", "isLeaf": true, "fieldMetadataId": "73f9b7c7-c4c7-4a85-9890-6bc3256e9496", "isCompositeSubField": true}, "secondaryLinks": {"type": "RAW_JSON", "label": "Secondary Links", "value": null, "isLeaf": true, "fieldMetadataId": "73f9b7c7-c4c7-4a85-9890-6bc3256e9496", "isCompositeSubField": true}, "primaryLinkLabel": {"type": "TEXT", "label": "Primary Link Label", "value": "My text", "isLeaf": true, "fieldMetadataId": "73f9b7c7-c4c7-4a85-9890-6bc3256e9496", "isCompositeSubField": true}}, "isLeaf": false, "fieldMetadataId": "73f9b7c7-c4c7-4a85-9890-6bc3256e9496"}}}, "errorHandlingOptions": {"retryOnFailure": {"value": false}, "continueOnFailure": {"value": false}}}, "__typename": "WorkflowAction", "nextStepIds": null}]	ACTIVE	1	ac67974f-c524-4288-9d88-af8515400b68	2026-01-05 21:37:46.248819+00	2026-01-05 21:37:46.248819+00	\N	8b213cac-a68b-4ffe-817a-3ec994e9932d
\.


--
-- Data for Name: workspaceMember; Type: TABLE DATA; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

COPY workspace_cjj1w48f60br2q6wtz6trrdb6."workspaceMember" ("position", "nameFirstName", "nameLastName", "colorScheme", locale, "avatarUrl", "userEmail", "calendarStartDay", "userId", "timeZone", "dateFormat", "timeFormat", "numberFormat", id, "createdAt", "updatedAt", "deletedAt") FROM stdin;
0	Jacob	Stanley	Light	en	profile-picture/original/feb10b6e-1560-437f-a4ff-c0045a7b192d.png	jacob@split-llc.com	7	18cc8d6d-cf03-4764-a439-0d0d5c9451c9	system	SYSTEM	SYSTEM	SYSTEM	0cc9529b-874a-4bf2-917e-ef173b7bee88	2026-01-05 21:37:46.648861+00	2026-01-06 02:35:09.736652+00	\N
\.


--
-- Name: _typeorm_migrations_id_seq; Type: SEQUENCE SET; Schema: core; Owner: postgres
--

SELECT pg_catalog.setval('core._typeorm_migrations_id_seq', 70, true);


--
-- Name: applicationVariable IDX_APPLICATION_VARIABLE_KEY_APPLICATION_ID_UNIQUE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."applicationVariable"
    ADD CONSTRAINT "IDX_APPLICATION_VARIABLE_KEY_APPLICATION_ID_UNIQUE" UNIQUE (key, "applicationId");


--
-- Name: approvedAccessDomain IDX_APPROVED_ACCESS_DOMAIN_DOMAIN_WORKSPACE_ID_UNIQUE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."approvedAccessDomain"
    ADD CONSTRAINT "IDX_APPROVED_ACCESS_DOMAIN_DOMAIN_WORKSPACE_ID_UNIQUE" UNIQUE (domain, "workspaceId");


--
-- Name: emailingDomain IDX_EMAILING_DOMAIN_DOMAIN_WORKSPACE_ID_UNIQUE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."emailingDomain"
    ADD CONSTRAINT "IDX_EMAILING_DOMAIN_DOMAIN_WORKSPACE_ID_UNIQUE" UNIQUE (domain, "workspaceId");


--
-- Name: featureFlag IDX_FEATURE_FLAG_KEY_WORKSPACE_ID_UNIQUE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."featureFlag"
    ADD CONSTRAINT "IDX_FEATURE_FLAG_KEY_WORKSPACE_ID_UNIQUE" UNIQUE (key, "workspaceId");


--
-- Name: fieldMetadata IDX_FIELD_METADATA_NAME_OBJECT_METADATA_ID_WORKSPACE_ID_UNIQUE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."fieldMetadata"
    ADD CONSTRAINT "IDX_FIELD_METADATA_NAME_OBJECT_METADATA_ID_WORKSPACE_ID_UNIQUE" UNIQUE (name, "objectMetadataId", "workspaceId");


--
-- Name: fieldPermission IDX_FIELD_PERMISSION_FIELD_METADATA_ID_ROLE_ID_UNIQUE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."fieldPermission"
    ADD CONSTRAINT "IDX_FIELD_PERMISSION_FIELD_METADATA_ID_ROLE_ID_UNIQUE" UNIQUE ("fieldMetadataId", "roleId");


--
-- Name: indexMetadata IDX_INDEX_METADATA_NAME_WORKSPACE_ID_OBJECT_METADATA_ID_UNIQUE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."indexMetadata"
    ADD CONSTRAINT "IDX_INDEX_METADATA_NAME_WORKSPACE_ID_OBJECT_METADATA_ID_UNIQUE" UNIQUE (name, "workspaceId", "objectMetadataId");


--
-- Name: keyValuePair IDX_KEY_VALUE_PAIR_KEY_USER_ID_WORKSPACE_ID_UNIQUE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."keyValuePair"
    ADD CONSTRAINT "IDX_KEY_VALUE_PAIR_KEY_USER_ID_WORKSPACE_ID_UNIQUE" UNIQUE (key, "userId", "workspaceId");


--
-- Name: objectMetadata IDX_OBJECT_METADATA_NAME_PLURAL_WORKSPACE_ID_UNIQUE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."objectMetadata"
    ADD CONSTRAINT "IDX_OBJECT_METADATA_NAME_PLURAL_WORKSPACE_ID_UNIQUE" UNIQUE ("namePlural", "workspaceId");


--
-- Name: objectMetadata IDX_OBJECT_METADATA_NAME_SINGULAR_WORKSPACE_ID_UNIQUE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."objectMetadata"
    ADD CONSTRAINT "IDX_OBJECT_METADATA_NAME_SINGULAR_WORKSPACE_ID_UNIQUE" UNIQUE ("nameSingular", "workspaceId");


--
-- Name: objectPermission IDX_OBJECT_PERMISSION_OBJECT_METADATA_ID_ROLE_ID_UNIQUE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."objectPermission"
    ADD CONSTRAINT "IDX_OBJECT_PERMISSION_OBJECT_METADATA_ID_ROLE_ID_UNIQUE" UNIQUE ("objectMetadataId", "roleId");


--
-- Name: permissionFlag IDX_PERMISSION_FLAG_FLAG_ROLE_ID_UNIQUE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."permissionFlag"
    ADD CONSTRAINT "IDX_PERMISSION_FLAG_FLAG_ROLE_ID_UNIQUE" UNIQUE (flag, "roleId");


--
-- Name: role IDX_ROLE_LABEL_WORKSPACE_ID_UNIQUE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.role
    ADD CONSTRAINT "IDX_ROLE_LABEL_WORKSPACE_ID_UNIQUE" UNIQUE (label, "workspaceId");


--
-- Name: roleTarget IDX_ROLE_TARGET_UNIQUE_AGENT; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."roleTarget"
    ADD CONSTRAINT "IDX_ROLE_TARGET_UNIQUE_AGENT" UNIQUE ("workspaceId", "agentId");


--
-- Name: roleTarget IDX_ROLE_TARGET_UNIQUE_API_KEY; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."roleTarget"
    ADD CONSTRAINT "IDX_ROLE_TARGET_UNIQUE_API_KEY" UNIQUE ("workspaceId", "apiKeyId");


--
-- Name: roleTarget IDX_ROLE_TARGET_UNIQUE_USER_WORKSPACE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."roleTarget"
    ADD CONSTRAINT "IDX_ROLE_TARGET_UNIQUE_USER_WORKSPACE" UNIQUE ("workspaceId", "userWorkspaceId");


--
-- Name: routeTrigger IDX_ROUTE_TRIGGER_PATH_HTTP_METHOD_WORKSPACE_ID_UNIQUE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."routeTrigger"
    ADD CONSTRAINT "IDX_ROUTE_TRIGGER_PATH_HTTP_METHOD_WORKSPACE_ID_UNIQUE" UNIQUE (path, "httpMethod", "workspaceId");


--
-- Name: searchFieldMetadata IDX_SEARCH_FIELD_METADATA_OBJECT_FIELD_UNIQUE; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."searchFieldMetadata"
    ADD CONSTRAINT "IDX_SEARCH_FIELD_METADATA_OBJECT_FIELD_UNIQUE" UNIQUE ("objectMetadataId", "fieldMetadataId");


--
-- Name: searchFieldMetadata PK_085190eb7531f4aeb8ccab3f42c; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."searchFieldMetadata"
    ADD CONSTRAINT "PK_085190eb7531f4aeb8ccab3f42c" PRIMARY KEY (id);


--
-- Name: routeTrigger PK_08affcd076e46415e5821acf52d; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."routeTrigger"
    ADD CONSTRAINT "PK_08affcd076e46415e5821acf52d" PRIMARY KEY (id);


--
-- Name: viewFilter PK_09f9ffa2f66263b9eb301460137; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewFilter"
    ADD CONSTRAINT "PK_09f9ffa2f66263b9eb301460137" PRIMARY KEY (id);


--
-- Name: agentTurn PK_0e3f599ba7cf6a02fc940d9f18d; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."agentTurn"
    ADD CONSTRAINT "PK_0e3f599ba7cf6a02fc940d9f18d" PRIMARY KEY (id);


--
-- Name: roleTarget PK_0fe0b3be0a4a966e76c00f44df9; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."roleTarget"
    ADD CONSTRAINT "PK_0fe0b3be0a4a966e76c00f44df9" PRIMARY KEY (id);


--
-- Name: agent PK_1000e989398c5d4ed585cf9a46f; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.agent
    ADD CONSTRAINT "PK_1000e989398c5d4ed585cf9a46f" PRIMARY KEY (id);


--
-- Name: appToken PK_143bfe36c6284c6d3a52c94741f; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."appToken"
    ADD CONSTRAINT "PK_143bfe36c6284c6d3a52c94741f" PRIMARY KEY (id);


--
-- Name: cronTrigger PK_153e054abdb2663942d4661e3bb; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."cronTrigger"
    ADD CONSTRAINT "PK_153e054abdb2663942d4661e3bb" PRIMARY KEY (id);


--
-- Name: viewFilterGroup PK_16f55359d609168b826405ed307; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewFilterGroup"
    ADD CONSTRAINT "PK_16f55359d609168b826405ed307" PRIMARY KEY (id);


--
-- Name: userWorkspace PK_222871f3641385e36e0b9f82aeb; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."userWorkspace"
    ADD CONSTRAINT "PK_222871f3641385e36e0b9f82aeb" PRIMARY KEY (id);


--
-- Name: objectPermission PK_23a4033c1aa380d0d1431731add; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."objectPermission"
    ADD CONSTRAINT "PK_23a4033c1aa380d0d1431731add" PRIMARY KEY (id);


--
-- Name: apiKey PK_2ae3a5e8e04fb402b2dc8d6ce4b; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."apiKey"
    ADD CONSTRAINT "PK_2ae3a5e8e04fb402b2dc8d6ce4b" PRIMARY KEY (id);


--
-- Name: pageLayoutWidget PK_2f997489b8b15cb26a0b9d4220b; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."pageLayoutWidget"
    ADD CONSTRAINT "PK_2f997489b8b15cb26a0b9d4220b" PRIMARY KEY (id);


--
-- Name: databaseEventTrigger PK_30dd6c9713cb9dc86d75211d84c; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."databaseEventTrigger"
    ADD CONSTRAINT "PK_30dd6c9713cb9dc86d75211d84c" PRIMARY KEY (id);


--
-- Name: workspaceMigration PK_33f481ae58d08030a3a007efde1; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."workspaceMigration"
    ADD CONSTRAINT "PK_33f481ae58d08030a3a007efde1" PRIMARY KEY (id);


--
-- Name: file PK_36b46d232307066b3a2c9ea3a1d; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.file
    ADD CONSTRAINT "PK_36b46d232307066b3a2c9ea3a1d" PRIMARY KEY (id);


--
-- Name: postgresCredentials PK_3f9c4cdf895bfea0a6ea15bdd81; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."postgresCredentials"
    ADD CONSTRAINT "PK_3f9c4cdf895bfea0a6ea15bdd81" PRIMARY KEY (id);


--
-- Name: serverlessFunction PK_49bfacee064bee9d0d486483b60; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."serverlessFunction"
    ADD CONSTRAINT "PK_49bfacee064bee9d0d486483b60" PRIMARY KEY (id);


--
-- Name: pageLayout PK_5028ccb46ffa0c945d2f9246dfa; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."pageLayout"
    ADD CONSTRAINT "PK_5028ccb46ffa0c945d2f9246dfa" PRIMARY KEY (id);


--
-- Name: approvedAccessDomain PK_523281ce57c84e1a039f4538c19; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."approvedAccessDomain"
    ADD CONSTRAINT "PK_523281ce57c84e1a039f4538c19" PRIMARY KEY (id);


--
-- Name: application PK_569e0c3e863ebdf5f2408ee1670; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.application
    ADD CONSTRAINT "PK_569e0c3e863ebdf5f2408ee1670" PRIMARY KEY (id);


--
-- Name: indexFieldMetadata PK_5928f67e43eff7d95aa79fd96fd; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."indexFieldMetadata"
    ADD CONSTRAINT "PK_5928f67e43eff7d95aa79fd96fd" PRIMARY KEY (id);


--
-- Name: applicationVariable PK_62f7823eb5f1e416c9d60614dfb; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."applicationVariable"
    ADD CONSTRAINT "PK_62f7823eb5f1e416c9d60614dfb" PRIMARY KEY (id);


--
-- Name: remoteTable PK_632b3858de52c8c2eb00c709b52; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."remoteTable"
    ADD CONSTRAINT "PK_632b3858de52c8c2eb00c709b52" PRIMARY KEY (id);


--
-- Name: dataSource PK_6d01ae6c0f47baf4f8e37342268; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."dataSource"
    ADD CONSTRAINT "PK_6d01ae6c0f47baf4f8e37342268" PRIMARY KEY (id);


--
-- Name: agentMessagePart PK_7e8c9f0b1a2b3c4d5e6f7a8b9c0; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."agentMessagePart"
    ADD CONSTRAINT "PK_7e8c9f0b1a2b3c4d5e6f7a8b9c0" PRIMARY KEY (id);


--
-- Name: objectMetadata PK_81fb7f4f4244211cfbd188af1e8; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."objectMetadata"
    ADD CONSTRAINT "PK_81fb7f4f4244211cfbd188af1e8" PRIMARY KEY (id);


--
-- Name: agentChatThread PK_82f67c93227868769e9553f059e; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."agentChatThread"
    ADD CONSTRAINT "PK_82f67c93227868769e9553f059e" PRIMARY KEY (id);


--
-- Name: view PK_86cfb9e426c77d60b900fe2b543; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.view
    ADD CONSTRAINT "PK_86cfb9e426c77d60b900fe2b543" PRIMARY KEY (id);


--
-- Name: featureFlag PK_894efa1b1822de801f3b9e04069; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."featureFlag"
    ADD CONSTRAINT "PK_894efa1b1822de801f3b9e04069" PRIMARY KEY (id);


--
-- Name: agentMessage PK_8c2e7b0c3c9e1b7a9e5e3f4d5c6; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."agentMessage"
    ADD CONSTRAINT "PK_8c2e7b0c3c9e1b7a9e5e3f4d5c6" PRIMARY KEY (id);


--
-- Name: remoteServer PK_8e5d208498fa2c9710bb934023a; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."remoteServer"
    ADD CONSTRAINT "PK_8e5d208498fa2c9710bb934023a" PRIMARY KEY (id);


--
-- Name: permissionFlag PK_a02789db60620a1e9f90147b50f; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."permissionFlag"
    ADD CONSTRAINT "PK_a02789db60620a1e9f90147b50f" PRIMARY KEY (id);


--
-- Name: serverlessFunctionLayer PK_a1077708d1b19463ab2eda7c246; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."serverlessFunctionLayer"
    ADD CONSTRAINT "PK_a1077708d1b19463ab2eda7c246" PRIMARY KEY (id);


--
-- Name: workspaceSSOIdentityProvider PK_a4e3928eb641e7cd612042b628b; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."workspaceSSOIdentityProvider"
    ADD CONSTRAINT "PK_a4e3928eb641e7cd612042b628b" PRIMARY KEY (id);


--
-- Name: _typeorm_migrations PK_a6ff2a8e8bb563f3d15635efd01; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core._typeorm_migrations
    ADD CONSTRAINT "PK_a6ff2a8e8bb563f3d15635efd01" PRIMARY KEY (id);


--
-- Name: agentTurnEvaluation PK_agentTurnEvaluation; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."agentTurnEvaluation"
    ADD CONSTRAINT "PK_agentTurnEvaluation" PRIMARY KEY (id);


--
-- Name: role PK_b36bcfe02fc8de3c57a8b2391c2; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.role
    ADD CONSTRAINT "PK_b36bcfe02fc8de3c57a8b2391c2" PRIMARY KEY (id);


--
-- Name: viewField PK_ba2a5aa5f0bd7ac82788fae921e; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewField"
    ADD CONSTRAINT "PK_ba2a5aa5f0bd7ac82788fae921e" PRIMARY KEY (id);


--
-- Name: twoFactorAuthenticationMethod PK_c455f6a499e7110fc95e4bea540; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."twoFactorAuthenticationMethod"
    ADD CONSTRAINT "PK_c455f6a499e7110fc95e4bea540" PRIMARY KEY (id);


--
-- Name: keyValuePair PK_c5a1ca828435d3eaf8f9361ed4b; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."keyValuePair"
    ADD CONSTRAINT "PK_c5a1ca828435d3eaf8f9361ed4b" PRIMARY KEY (id);


--
-- Name: workspace PK_ca86b6f9b3be5fe26d307d09b49; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.workspace
    ADD CONSTRAINT "PK_ca86b6f9b3be5fe26d307d09b49" PRIMARY KEY (id);


--
-- Name: user PK_cace4a159ff9f2512dd42373760; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."user"
    ADD CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY (id);


--
-- Name: fieldMetadata PK_d046b1c7cea325ebc4cdc25e7a9; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."fieldMetadata"
    ADD CONSTRAINT "PK_d046b1c7cea325ebc4cdc25e7a9" PRIMARY KEY (id);


--
-- Name: viewGroup PK_d2aa8cad01e9d5e99c23f9ccec3; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewGroup"
    ADD CONSTRAINT "PK_d2aa8cad01e9d5e99c23f9ccec3" PRIMARY KEY (id);


--
-- Name: fieldPermission PK_d7bb911e4f9b1b5e3bfcfdd1c4b; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."fieldPermission"
    ADD CONSTRAINT "PK_d7bb911e4f9b1b5e3bfcfdd1c4b" PRIMARY KEY (id);


--
-- Name: emailingDomain PK_dca7032537b5d307f8cc6d74f1d; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."emailingDomain"
    ADD CONSTRAINT "PK_dca7032537b5d307f8cc6d74f1d" PRIMARY KEY (id);


--
-- Name: webhook PK_e6765510c2d078db49632b59020; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.webhook
    ADD CONSTRAINT "PK_e6765510c2d078db49632b59020" PRIMARY KEY (id);


--
-- Name: viewSort PK_eceb74d297f926313af6463d496; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewSort"
    ADD CONSTRAINT "PK_eceb74d297f926313af6463d496" PRIMARY KEY (id);


--
-- Name: pageLayoutTab PK_f1327f6ea950cdc59fe17569c5c; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."pageLayoutTab"
    ADD CONSTRAINT "PK_f1327f6ea950cdc59fe17569c5c" PRIMARY KEY (id);


--
-- Name: indexMetadata PK_f73bb3c3678aee204e341f0ca4e; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."indexMetadata"
    ADD CONSTRAINT "PK_f73bb3c3678aee204e341f0ca4e" PRIMARY KEY (id);


--
-- Name: publicDomain PK_ff55a0f1bc3b6e2c32feff734b1; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."publicDomain"
    ADD CONSTRAINT "PK_ff55a0f1bc3b6e2c32feff734b1" PRIMARY KEY (id);


--
-- Name: fieldMetadata REL_47a6c57e1652b6475f8248cff7; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."fieldMetadata"
    ADD CONSTRAINT "REL_47a6c57e1652b6475f8248cff7" UNIQUE ("relationTargetFieldMetadataId");


--
-- Name: publicDomain UQ_1311e24fbd049c561c53a274f2a; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."publicDomain"
    ADD CONSTRAINT "UQ_1311e24fbd049c561c53a274f2a" UNIQUE (domain);


--
-- Name: workspace UQ_900f0a3eb789159c26c8bcb39cd; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.workspace
    ADD CONSTRAINT "UQ_900f0a3eb789159c26c8bcb39cd" UNIQUE ("customDomain");


--
-- Name: workspace UQ_cba6255a24deb1fff07dd7351b8; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.workspace
    ADD CONSTRAINT "UQ_cba6255a24deb1fff07dd7351b8" UNIQUE (subdomain);


--
-- Name: company PK_056f7854a7afdba7cbd6d45fc20; Type: CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.company
    ADD CONSTRAINT "PK_056f7854a7afdba7cbd6d45fc20" PRIMARY KEY (id);


--
-- Name: opportunity PK_085fd6d6f4765325e6c16163568; Type: CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.opportunity
    ADD CONSTRAINT "PK_085fd6d6f4765325e6c16163568" PRIMARY KEY (id);


--
-- Name: messageChannelMessageAssociation PK_1a362709b248dbf0105195ba9a0; Type: CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannelMessageAssociation"
    ADD CONSTRAINT "PK_1a362709b248dbf0105195ba9a0" PRIMARY KEY (id);


--
-- Name: dashboard PK_233ed28fa3a1f9fbe743f571f75; Type: CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.dashboard
    ADD CONSTRAINT "PK_233ed28fa3a1f9fbe743f571f75" PRIMARY KEY (id);


--
-- Name: calendarEventParticipant PK_24b52b100e7371407d951323e43; Type: CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."calendarEventParticipant"
    ADD CONSTRAINT "PK_24b52b100e7371407d951323e43" PRIMARY KEY (id);


--
-- Name: messageChannel PK_438b9412475f39712ed065f77af; Type: CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel"
    ADD CONSTRAINT "PK_438b9412475f39712ed065f77af" PRIMARY KEY (id);


--
-- Name: favorite PK_495675cec4fb09666704e4f610f; Type: CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.favorite
    ADD CONSTRAINT "PK_495675cec4fb09666704e4f610f" PRIMARY KEY (id);


--
-- Name: favoriteFolder PK_52c3152b3d4dbce626912d0676e; Type: CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."favoriteFolder"
    ADD CONSTRAINT "PK_52c3152b3d4dbce626912d0676e" PRIMARY KEY (id);


--
-- Name: workflowVersion PK_53ba9b0065179d205a551b83ff2; Type: CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."workflowVersion"
    ADD CONSTRAINT "PK_53ba9b0065179d205a551b83ff2" PRIMARY KEY (id);


--
-- Name: messageParticipant PK_5614af772aa889e41ecf83d655c; Type: CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."messageParticipant"
    ADD CONSTRAINT "PK_5614af772aa889e41ecf83d655c" PRIMARY KEY (id);


--
-- Name: person PK_5fdaf670315c4b7e70cce85daa3; Type: CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.person
    ADD CONSTRAINT "PK_5fdaf670315c4b7e70cce85daa3" PRIMARY KEY (id);


--
-- Name: workspaceMember PK_68d25e836fb0289293cf4d9a449; Type: CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."workspaceMember"
    ADD CONSTRAINT "PK_68d25e836fb0289293cf4d9a449" PRIMARY KEY (id);


--
-- Name: calendarChannel PK_796d701c0c35518517d0f3e0e0b; Type: CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."calendarChannel"
    ADD CONSTRAINT "PK_796d701c0c35518517d0f3e0e0b" PRIMARY KEY (id);


--
-- Name: messageFolder PK_85cb5a339d9f7f1106dde9e4db8; Type: CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."messageFolder"
    ADD CONSTRAINT "PK_85cb5a339d9f7f1106dde9e4db8" PRIMARY KEY (id);


--
-- Name: calendarChannelEventAssociation PK_8ba7dd9e43449ee83b6dd1be728; Type: CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."calendarChannelEventAssociation"
    ADD CONSTRAINT "PK_8ba7dd9e43449ee83b6dd1be728" PRIMARY KEY (id);


--
-- Name: connectedAccount PK_8e7a0a0bbc2e06ac2acf89b7f3a; Type: CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."connectedAccount"
    ADD CONSTRAINT "PK_8e7a0a0bbc2e06ac2acf89b7f3a" PRIMARY KEY (id);


--
-- Name: messageThread PK_916a19ecc51fe66feb4af6fc090; Type: CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."messageThread"
    ADD CONSTRAINT "PK_916a19ecc51fe66feb4af6fc090" PRIMARY KEY (id);


--
-- Name: note PK_96d0c172a4fba276b1bbed43058; Type: CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.note
    ADD CONSTRAINT "PK_96d0c172a4fba276b1bbed43058" PRIMARY KEY (id);


--
-- Name: taskTarget PK_9b0cc5218f09444e452e5367c66; Type: CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."taskTarget"
    ADD CONSTRAINT "PK_9b0cc5218f09444e452e5367c66" PRIMARY KEY (id);


--
-- Name: calendarEvent PK_b8a91f93657e19694a8e768f46c; Type: CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."calendarEvent"
    ADD CONSTRAINT "PK_b8a91f93657e19694a8e768f46c" PRIMARY KEY (id);


--
-- Name: message PK_ba01f0a3e0123651915008bc578; Type: CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.message
    ADD CONSTRAINT "PK_ba01f0a3e0123651915008bc578" PRIMARY KEY (id);


--
-- Name: blocklist PK_c3a1a2ea2ffda610496ce852572; Type: CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.blocklist
    ADD CONSTRAINT "PK_c3a1a2ea2ffda610496ce852572" PRIMARY KEY (id);


--
-- Name: workflowRun PK_c7b2e05e8bd586329d74133bc1f; Type: CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."workflowRun"
    ADD CONSTRAINT "PK_c7b2e05e8bd586329d74133bc1f" PRIMARY KEY (id);


--
-- Name: attachment PK_d2a80c3a8d467f08a750ac4b420; Type: CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.attachment
    ADD CONSTRAINT "PK_d2a80c3a8d467f08a750ac4b420" PRIMARY KEY (id);


--
-- Name: noteTarget PK_ddde0340e34125aaab284e0fd47; Type: CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."noteTarget"
    ADD CONSTRAINT "PK_ddde0340e34125aaab284e0fd47" PRIMARY KEY (id);


--
-- Name: workflow PK_eb5e4cc1a9ef2e94805b676751b; Type: CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.workflow
    ADD CONSTRAINT "PK_eb5e4cc1a9ef2e94805b676751b" PRIMARY KEY (id);


--
-- Name: workflowAutomatedTrigger PK_ecc1deb61ba0ebe598ae2373173; Type: CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."workflowAutomatedTrigger"
    ADD CONSTRAINT "PK_ecc1deb61ba0ebe598ae2373173" PRIMARY KEY (id);


--
-- Name: timelineActivity PK_f333e653c7b3d4d25e6dcbc1a3b; Type: CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."timelineActivity"
    ADD CONSTRAINT "PK_f333e653c7b3d4d25e6dcbc1a3b" PRIMARY KEY (id);


--
-- Name: task PK_fb213f79ee45060ba925ecd576e; Type: CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.task
    ADD CONSTRAINT "PK_fb213f79ee45060ba925ecd576e" PRIMARY KEY (id);


--
-- Name: IDX_0082568653b80c15903c5a2ba9; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_0082568653b80c15903c5a2ba9" ON core."roleTarget" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_0cc4d03dbcc269e77ba4d297fb; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_0cc4d03dbcc269e77ba4d297fb" ON core.agent USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_256fabec226411154baba649df; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_256fabec226411154baba649df" ON core."pageLayout" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_2909f5139c479e4632df03fd5e; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_2909f5139c479e4632df03fd5e" ON core."twoFactorAuthenticationMethod" USING btree ("userWorkspaceId", strategy);


--
-- Name: IDX_2a33a0e7e44c393ca7bb578dae; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_2a33a0e7e44c393ca7bb578dae" ON core."pageLayoutWidget" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_2aff9daad5cc3b5e15ca717334; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_2aff9daad5cc3b5e15ca717334" ON core."agentMessagePart" USING btree ("messageId");


--
-- Name: IDX_3763c4e8f942ff1e24040a13a9; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_3763c4e8f942ff1e24040a13a9" ON core."pageLayoutTab" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_38232fc0c6567ed029c2b1a12c; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_38232fc0c6567ed029c2b1a12c" ON core."viewSort" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_3a00d35710f4227ded320fd96d; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_3a00d35710f4227ded320fd96d" ON core."objectMetadata" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_3b7ff27925c0959777682c1adc; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_3b7ff27925c0959777682c1adc" ON core.role USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_3bd935d6f8c5ce87194b8db824; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_3bd935d6f8c5ce87194b8db824" ON core."agentChatThread" USING btree ("userWorkspaceId");


--
-- Name: IDX_3be906dca9d5b50fbfe40e33f0; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_3be906dca9d5b50fbfe40e33f0" ON core."agentTurn" USING btree ("threadId");


--
-- Name: IDX_48c75cb32ff0d2887ef0dc547f; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_48c75cb32ff0d2887ef0dc547f" ON core."agentMessage" USING btree ("agentId");


--
-- Name: IDX_4c31daa882e3130534995bf90c; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_4c31daa882e3130534995bf90c" ON core."agentMessage" USING btree ("threadId");


--
-- Name: IDX_552aa6908966e980099b3e5ebf; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_552aa6908966e980099b3e5ebf" ON core.view USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_5b43e65e322d516c9307bed97a; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_5b43e65e322d516c9307bed97a" ON core."serverlessFunction" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_87dbab10ac94d9a091f8efaa67; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_87dbab10ac94d9a091f8efaa67" ON core."agentMessage" USING btree ("turnId");


--
-- Name: IDX_8adc1fd6cb0dad2fbfd945954d; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_8adc1fd6cb0dad2fbfd945954d" ON core."cronTrigger" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_960465af116edf9ac501bfb3db; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_960465af116edf9ac501bfb3db" ON core."databaseEventTrigger" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_AGENT_ID_DELETED_AT; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_AGENT_ID_DELETED_AT" ON core.agent USING btree (id, "deletedAt");


--
-- Name: IDX_AGENT_NAME_WORKSPACE_ID_UNIQUE; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_AGENT_NAME_WORKSPACE_ID_UNIQUE" ON core.agent USING btree (name, "workspaceId") WHERE ("deletedAt" IS NULL);


--
-- Name: IDX_API_KEY_WORKSPACE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_API_KEY_WORKSPACE_ID" ON core."apiKey" USING btree ("workspaceId");


--
-- Name: IDX_APPLICATION_UNIVERSAL_IDENTIFIER_WORKSPACE_ID_UNIQUE; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_APPLICATION_UNIVERSAL_IDENTIFIER_WORKSPACE_ID_UNIQUE" ON core.application USING btree ("universalIdentifier", "workspaceId") WHERE (("deletedAt" IS NULL) AND ("universalIdentifier" IS NOT NULL));


--
-- Name: IDX_APPLICATION_WORKSPACE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_APPLICATION_WORKSPACE_ID" ON core.application USING btree ("workspaceId");


--
-- Name: IDX_CRON_TRIGGER_WORKSPACE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_CRON_TRIGGER_WORKSPACE_ID" ON core."cronTrigger" USING btree ("workspaceId");


--
-- Name: IDX_DATABASE_EVENT_TRIGGER_WORKSPACE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_DATABASE_EVENT_TRIGGER_WORKSPACE_ID" ON core."databaseEventTrigger" USING btree ("workspaceId");


--
-- Name: IDX_DATA_SOURCE_WORKSPACE_ID_CREATED_AT; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_DATA_SOURCE_WORKSPACE_ID_CREATED_AT" ON core."dataSource" USING btree ("workspaceId", "createdAt");


--
-- Name: IDX_FIELD_METADATA_OBJECT_METADATA_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_FIELD_METADATA_OBJECT_METADATA_ID" ON core."fieldMetadata" USING btree ("objectMetadataId");


--
-- Name: IDX_FIELD_METADATA_OBJECT_METADATA_ID_WORKSPACE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_FIELD_METADATA_OBJECT_METADATA_ID_WORKSPACE_ID" ON core."fieldMetadata" USING btree ("objectMetadataId", "workspaceId");


--
-- Name: IDX_FIELD_METADATA_RELATION_TARGET_FIELD_METADATA_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_FIELD_METADATA_RELATION_TARGET_FIELD_METADATA_ID" ON core."fieldMetadata" USING btree ("relationTargetFieldMetadataId");


--
-- Name: IDX_FIELD_METADATA_RELATION_TARGET_OBJECT_METADATA_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_FIELD_METADATA_RELATION_TARGET_OBJECT_METADATA_ID" ON core."fieldMetadata" USING btree ("relationTargetObjectMetadataId");


--
-- Name: IDX_FIELD_METADATA_WORKSPACE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_FIELD_METADATA_WORKSPACE_ID" ON core."fieldMetadata" USING btree ("workspaceId");


--
-- Name: IDX_FIELD_PERMISSION_WORKSPACE_ID_ROLE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_FIELD_PERMISSION_WORKSPACE_ID_ROLE_ID" ON core."fieldPermission" USING btree ("workspaceId", "roleId");


--
-- Name: IDX_FILE_WORKSPACE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_FILE_WORKSPACE_ID" ON core.file USING btree ("workspaceId");


--
-- Name: IDX_INDEX_FIELD_METADATA_FIELD_METADATA_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_INDEX_FIELD_METADATA_FIELD_METADATA_ID" ON core."indexFieldMetadata" USING btree ("fieldMetadataId");


--
-- Name: IDX_INDEX_METADATA_WORKSPACE_ID_OBJECT_METADATA_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_INDEX_METADATA_WORKSPACE_ID_OBJECT_METADATA_ID" ON core."indexMetadata" USING btree ("workspaceId", "objectMetadataId");


--
-- Name: IDX_KEY_VALUE_PAIR_KEY_USER_ID_NULL_WORKSPACE_ID_UNIQUE; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_KEY_VALUE_PAIR_KEY_USER_ID_NULL_WORKSPACE_ID_UNIQUE" ON core."keyValuePair" USING btree (key, "userId") WHERE ("workspaceId" IS NULL);


--
-- Name: IDX_KEY_VALUE_PAIR_KEY_WORKSPACE_ID_NULL_USER_ID_UNIQUE; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_KEY_VALUE_PAIR_KEY_WORKSPACE_ID_NULL_USER_ID_UNIQUE" ON core."keyValuePair" USING btree (key, "workspaceId") WHERE ("userId" IS NULL);


--
-- Name: IDX_OBJECT_PERMISSION_WORKSPACE_ID_ROLE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_OBJECT_PERMISSION_WORKSPACE_ID_ROLE_ID" ON core."objectPermission" USING btree ("workspaceId", "roleId");


--
-- Name: IDX_PAGE_LAYOUT_TAB_WORKSPACE_ID_PAGE_LAYOUT_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_PAGE_LAYOUT_TAB_WORKSPACE_ID_PAGE_LAYOUT_ID" ON core."pageLayoutTab" USING btree ("workspaceId", "pageLayoutId") WHERE ("deletedAt" IS NULL);


--
-- Name: IDX_PAGE_LAYOUT_WIDGET_WORKSPACE_ID_PAGE_LAYOUT_TAB_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_PAGE_LAYOUT_WIDGET_WORKSPACE_ID_PAGE_LAYOUT_TAB_ID" ON core."pageLayoutWidget" USING btree ("workspaceId", "pageLayoutTabId") WHERE ("deletedAt" IS NULL);


--
-- Name: IDX_PAGE_LAYOUT_WORKSPACE_ID_OBJECT_METADATA_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_PAGE_LAYOUT_WORKSPACE_ID_OBJECT_METADATA_ID" ON core."pageLayout" USING btree ("workspaceId", "objectMetadataId") WHERE ("deletedAt" IS NULL);


--
-- Name: IDX_ROLE_TARGET_AGENT_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_ROLE_TARGET_AGENT_ID" ON core."roleTarget" USING btree ("agentId");


--
-- Name: IDX_ROLE_TARGET_API_KEY_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_ROLE_TARGET_API_KEY_ID" ON core."roleTarget" USING btree ("apiKeyId");


--
-- Name: IDX_ROLE_TARGET_WORKSPACE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_ROLE_TARGET_WORKSPACE_ID" ON core."roleTarget" USING btree ("userWorkspaceId", "workspaceId");


--
-- Name: IDX_SEARCH_FIELD_METADATA_OBJECT_METADATA_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_SEARCH_FIELD_METADATA_OBJECT_METADATA_ID" ON core."searchFieldMetadata" USING btree ("objectMetadataId");


--
-- Name: IDX_SEARCH_FIELD_METADATA_WORKSPACE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_SEARCH_FIELD_METADATA_WORKSPACE_ID" ON core."searchFieldMetadata" USING btree ("workspaceId");


--
-- Name: IDX_SERVERLESS_FUNCTION_ID_DELETED_AT; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_SERVERLESS_FUNCTION_ID_DELETED_AT" ON core."serverlessFunction" USING btree (id, "deletedAt");


--
-- Name: IDX_USER_WORKSPACE_USER_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_USER_WORKSPACE_USER_ID" ON core."userWorkspace" USING btree ("userId");


--
-- Name: IDX_USER_WORKSPACE_USER_ID_WORKSPACE_ID_UNIQUE; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_USER_WORKSPACE_USER_ID_WORKSPACE_ID_UNIQUE" ON core."userWorkspace" USING btree ("userId", "workspaceId") WHERE ("deletedAt" IS NULL);


--
-- Name: IDX_USER_WORKSPACE_WORKSPACE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_USER_WORKSPACE_WORKSPACE_ID" ON core."userWorkspace" USING btree ("workspaceId");


--
-- Name: IDX_VIEW_FIELD_FIELD_METADATA_ID_VIEW_ID_UNIQUE; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_VIEW_FIELD_FIELD_METADATA_ID_VIEW_ID_UNIQUE" ON core."viewField" USING btree ("fieldMetadataId", "viewId") WHERE ("deletedAt" IS NULL);


--
-- Name: IDX_VIEW_FIELD_VIEW_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_FIELD_VIEW_ID" ON core."viewField" USING btree ("viewId") WHERE ("deletedAt" IS NULL);


--
-- Name: IDX_VIEW_FIELD_WORKSPACE_ID_VIEW_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_FIELD_WORKSPACE_ID_VIEW_ID" ON core."viewField" USING btree ("workspaceId", "viewId");


--
-- Name: IDX_VIEW_FILTER_FIELD_METADATA_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_FILTER_FIELD_METADATA_ID" ON core."viewFilter" USING btree ("fieldMetadataId");


--
-- Name: IDX_VIEW_FILTER_GROUP_VIEW_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_FILTER_GROUP_VIEW_ID" ON core."viewFilterGroup" USING btree ("viewId") WHERE ("deletedAt" IS NULL);


--
-- Name: IDX_VIEW_FILTER_GROUP_WORKSPACE_ID_VIEW_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_FILTER_GROUP_WORKSPACE_ID_VIEW_ID" ON core."viewFilterGroup" USING btree ("workspaceId", "viewId");


--
-- Name: IDX_VIEW_FILTER_VIEW_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_FILTER_VIEW_ID" ON core."viewFilter" USING btree ("viewId") WHERE ("deletedAt" IS NULL);


--
-- Name: IDX_VIEW_FILTER_WORKSPACE_ID_VIEW_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_FILTER_WORKSPACE_ID_VIEW_ID" ON core."viewFilter" USING btree ("workspaceId", "viewId");


--
-- Name: IDX_VIEW_GROUP_VIEW_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_GROUP_VIEW_ID" ON core."viewGroup" USING btree ("viewId") WHERE ("deletedAt" IS NULL);


--
-- Name: IDX_VIEW_GROUP_WORKSPACE_ID_VIEW_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_GROUP_WORKSPACE_ID_VIEW_ID" ON core."viewGroup" USING btree ("workspaceId", "viewId");


--
-- Name: IDX_VIEW_SORT_FIELD_METADATA_ID_VIEW_ID_UNIQUE; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_VIEW_SORT_FIELD_METADATA_ID_VIEW_ID_UNIQUE" ON core."viewSort" USING btree ("fieldMetadataId", "viewId") WHERE ("deletedAt" IS NULL);


--
-- Name: IDX_VIEW_SORT_VIEW_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_SORT_VIEW_ID" ON core."viewSort" USING btree ("viewId") WHERE ("deletedAt" IS NULL);


--
-- Name: IDX_VIEW_SORT_WORKSPACE_ID_VIEW_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_SORT_WORKSPACE_ID_VIEW_ID" ON core."viewSort" USING btree ("workspaceId", "viewId");


--
-- Name: IDX_VIEW_VISIBILITY; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_VISIBILITY" ON core.view USING btree (visibility);


--
-- Name: IDX_VIEW_WORKSPACE_ID_OBJECT_METADATA_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_VIEW_WORKSPACE_ID_OBJECT_METADATA_ID" ON core.view USING btree ("workspaceId", "objectMetadataId");


--
-- Name: IDX_WEBHOOK_WORKSPACE_ID; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_WEBHOOK_WORKSPACE_ID" ON core.webhook USING btree ("workspaceId");


--
-- Name: IDX_WORKSPACE_ACTIVATION_STATUS; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_WORKSPACE_ACTIVATION_STATUS" ON core.workspace USING btree ("activationStatus");


--
-- Name: IDX_a44e3b03f0eca32d0504d5ef73; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_a44e3b03f0eca32d0504d5ef73" ON core."viewGroup" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_b27c681286ac581f81498c5d4b; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_b27c681286ac581f81498c5d4b" ON core."indexMetadata" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_b86af4ea24cae518dee8eae996; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_b86af4ea24cae518dee8eae996" ON core."viewField" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_c94f072dbd3c11f7df51db5293; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_c94f072dbd3c11f7df51db5293" ON core."agentTurnEvaluation" USING btree ("turnId");


--
-- Name: IDX_cd4588bfc9ad73345b3953a039; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_cd4588bfc9ad73345b3953a039" ON core."viewFilter" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_e6d7c07f32e6f0f08cf639d4f5; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX "IDX_e6d7c07f32e6f0f08cf639d4f5" ON core."agentTurn" USING btree ("agentId");


--
-- Name: IDX_e6ed40a61e4584e98584019a47; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_e6ed40a61e4584e98584019a47" ON core."viewFilterGroup" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_e9c53b9ac5035d3202a8737020; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_e9c53b9ac5035d3202a8737020" ON core."routeTrigger" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: IDX_f1c88fdfc3ad8910b17fc1fd73; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_f1c88fdfc3ad8910b17fc1fd73" ON core."fieldMetadata" USING btree ("workspaceId", "universalIdentifier");


--
-- Name: UQ_USER_EMAIL; Type: INDEX; Schema: core; Owner: postgres
--

CREATE UNIQUE INDEX "UQ_USER_EMAIL" ON core."user" USING btree (email) WHERE ("deletedAt" IS NULL);


--
-- Name: IDX_0698fed0e67005b7051b5d353b6; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_0698fed0e67005b7051b5d353b6" ON workspace_cjj1w48f60br2q6wtz6trrdb6.attachment USING btree ("noteId", "deletedAt");


--
-- Name: IDX_0b3dec6c7b728aa5d5686e041b2; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_0b3dec6c7b728aa5d5686e041b2" ON workspace_cjj1w48f60br2q6wtz6trrdb6."timelineActivity" USING btree ("targetWorkflowVersionId", "deletedAt");


--
-- Name: IDX_0da422bbe7adbabb8144c696ebd; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_0da422bbe7adbabb8144c696ebd" ON workspace_cjj1w48f60br2q6wtz6trrdb6."calendarEventParticipant" USING btree ("personId", "deletedAt");


--
-- Name: IDX_110d1dc7f0ecd231a18f6784cf3; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_110d1dc7f0ecd231a18f6784cf3" ON workspace_cjj1w48f60br2q6wtz6trrdb6.favorite USING btree ("workflowVersionId", "deletedAt");


--
-- Name: IDX_123501237187c835ede626367b7; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_123501237187c835ede626367b7" ON workspace_cjj1w48f60br2q6wtz6trrdb6.company USING btree ("accountOwnerId", "deletedAt");


--
-- Name: IDX_17a660a8931bb14627a59b23b25; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_17a660a8931bb14627a59b23b25" ON workspace_cjj1w48f60br2q6wtz6trrdb6."timelineActivity" USING btree ("targetCompanyId", "deletedAt");


--
-- Name: IDX_180e5f1d82cbdbae0dc8c4b5c40; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_180e5f1d82cbdbae0dc8c4b5c40" ON workspace_cjj1w48f60br2q6wtz6trrdb6.favorite USING btree ("forWorkspaceMemberId", "deletedAt");


--
-- Name: IDX_19ea95ddb39f610f7dcad4c4336; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_19ea95ddb39f610f7dcad4c4336" ON workspace_cjj1w48f60br2q6wtz6trrdb6."noteTarget" USING btree ("opportunityId", "deletedAt");


--
-- Name: IDX_1c0459cd093778c23aef5b1e0d2; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_1c0459cd093778c23aef5b1e0d2" ON workspace_cjj1w48f60br2q6wtz6trrdb6.attachment USING btree ("workflowId", "deletedAt");


--
-- Name: IDX_1f7e4cb168e77496349c8cefed6; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_1f7e4cb168e77496349c8cefed6" ON workspace_cjj1w48f60br2q6wtz6trrdb6.favorite USING btree ("personId", "deletedAt");


--
-- Name: IDX_2055e4e583e9a2e5b4c239fd992; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_2055e4e583e9a2e5b4c239fd992" ON workspace_cjj1w48f60br2q6wtz6trrdb6.attachment USING btree ("taskId", "deletedAt");


--
-- Name: IDX_21d905e0adf19e835f6059a9f3d; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_21d905e0adf19e835f6059a9f3d" ON workspace_cjj1w48f60br2q6wtz6trrdb6.favorite USING btree ("noteId", "deletedAt");


--
-- Name: IDX_241f0cca089399c8c5954086b8d; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_241f0cca089399c8c5954086b8d" ON workspace_cjj1w48f60br2q6wtz6trrdb6."noteTarget" USING btree ("noteId", "deletedAt");


--
-- Name: IDX_261d8661b94dbb98cc85cffab46; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_261d8661b94dbb98cc85cffab46" ON workspace_cjj1w48f60br2q6wtz6trrdb6."workflowRun" USING gin ("searchVector");


--
-- Name: IDX_2a32339058d0b6910b0834ddf81; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_2a32339058d0b6910b0834ddf81" ON workspace_cjj1w48f60br2q6wtz6trrdb6.company USING btree ("domainNamePrimaryLinkUrl");


--
-- Name: IDX_2ac2dcf03c86f5654df25cb6587; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_2ac2dcf03c86f5654df25cb6587" ON workspace_cjj1w48f60br2q6wtz6trrdb6."timelineActivity" USING btree ("targetWorkflowRunId", "deletedAt");


--
-- Name: IDX_2bf094726f6d91639302c1c143d; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_2bf094726f6d91639302c1c143d" ON workspace_cjj1w48f60br2q6wtz6trrdb6."calendarEventParticipant" USING btree ("workspaceMemberId", "deletedAt");


--
-- Name: IDX_30f969e0ec549acca94396d3efe; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_30f969e0ec549acca94396d3efe" ON workspace_cjj1w48f60br2q6wtz6trrdb6.attachment USING btree ("authorId", "deletedAt");


--
-- Name: IDX_3465c79448bacd2f1268e5f6310; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_3465c79448bacd2f1268e5f6310" ON workspace_cjj1w48f60br2q6wtz6trrdb6."calendarChannel" USING btree ("connectedAccountId", "deletedAt");


--
-- Name: IDX_39954942ffa78c957b5dee47739; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_39954942ffa78c957b5dee47739" ON workspace_cjj1w48f60br2q6wtz6trrdb6."workspaceMember" USING btree ("userEmail");


--
-- Name: IDX_3ca1d5243ff67f58c7c65c9a8a2; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_3ca1d5243ff67f58c7c65c9a8a2" ON workspace_cjj1w48f60br2q6wtz6trrdb6.attachment USING btree ("personId", "deletedAt");


--
-- Name: IDX_3e44fabc86a1b3bb9ab56c7d23c; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_3e44fabc86a1b3bb9ab56c7d23c" ON workspace_cjj1w48f60br2q6wtz6trrdb6."timelineActivity" USING btree ("targetOpportunityId", "deletedAt");


--
-- Name: IDX_425ac6c73ecb993cf9cbc2c2b00; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_425ac6c73ecb993cf9cbc2c2b00" ON workspace_cjj1w48f60br2q6wtz6trrdb6.opportunity USING btree ("companyId", "deletedAt");


--
-- Name: IDX_4e929e3af362914c41035c4d438; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_4e929e3af362914c41035c4d438" ON workspace_cjj1w48f60br2q6wtz6trrdb6."taskTarget" USING btree ("companyId", "deletedAt");


--
-- Name: IDX_4f469d3a7ee08aefdc099836364; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_4f469d3a7ee08aefdc099836364" ON workspace_cjj1w48f60br2q6wtz6trrdb6.opportunity USING btree (stage, "deletedAt");


--
-- Name: IDX_51329bbcdab6618a75361670c26; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_51329bbcdab6618a75361670c26" ON workspace_cjj1w48f60br2q6wtz6trrdb6."workflowVersion" USING gin ("searchVector");


--
-- Name: IDX_56454973bce16e65ee1ae3d2e40; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_56454973bce16e65ee1ae3d2e40" ON workspace_cjj1w48f60br2q6wtz6trrdb6."noteTarget" USING btree ("personId", "deletedAt");


--
-- Name: IDX_5960ffd71d6ecb88ad89cc023f0; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_5960ffd71d6ecb88ad89cc023f0" ON workspace_cjj1w48f60br2q6wtz6trrdb6."workflowAutomatedTrigger" USING btree ("workflowId", "deletedAt");


--
-- Name: IDX_627d4437c96f22d5d46cc9a85bb; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_627d4437c96f22d5d46cc9a85bb" ON workspace_cjj1w48f60br2q6wtz6trrdb6."taskTarget" USING btree ("taskId", "deletedAt");


--
-- Name: IDX_63953e5f88351922043480b8801; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_63953e5f88351922043480b8801" ON workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannelMessageAssociation" USING btree ("messageChannelId", "deletedAt");


--
-- Name: IDX_671dd9e01a80d1e4c89fc166c3b; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_671dd9e01a80d1e4c89fc166c3b" ON workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannelMessageAssociation" USING btree ("messageId", "deletedAt");


--
-- Name: IDX_68bce49f4de05facd5365a3a797; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_68bce49f4de05facd5365a3a797" ON workspace_cjj1w48f60br2q6wtz6trrdb6."noteTarget" USING btree ("companyId", "deletedAt");


--
-- Name: IDX_6a862a788ac6ce967afa06df812; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_6a862a788ac6ce967afa06df812" ON workspace_cjj1w48f60br2q6wtz6trrdb6.person USING btree ("companyId", "deletedAt");


--
-- Name: IDX_6d9700e5ae2ab8c294d614e72f6; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_6d9700e5ae2ab8c294d614e72f6" ON workspace_cjj1w48f60br2q6wtz6trrdb6."messageParticipant" USING btree ("personId", "deletedAt");


--
-- Name: IDX_73615a6bdc972b013956b19c59e; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_73615a6bdc972b013956b19c59e" ON workspace_cjj1w48f60br2q6wtz6trrdb6.attachment USING btree ("opportunityId", "deletedAt");


--
-- Name: IDX_76a190ab8a6f439791358d63d60; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_76a190ab8a6f439791358d63d60" ON workspace_cjj1w48f60br2q6wtz6trrdb6.blocklist USING btree ("workspaceMemberId", "deletedAt");


--
-- Name: IDX_78fa73d661d632619e17de211e6; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_78fa73d661d632619e17de211e6" ON workspace_cjj1w48f60br2q6wtz6trrdb6.message USING btree ("messageThreadId", "deletedAt");


--
-- Name: IDX_7c59b29a053016fc596ddad8a0e; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_7c59b29a053016fc596ddad8a0e" ON workspace_cjj1w48f60br2q6wtz6trrdb6.favorite USING btree ("workflowRunId", "deletedAt");


--
-- Name: IDX_7cf577fad5154f025f50f63d0c6; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_7cf577fad5154f025f50f63d0c6" ON workspace_cjj1w48f60br2q6wtz6trrdb6."timelineActivity" USING btree ("targetNoteId", "deletedAt");


--
-- Name: IDX_7d1b454b2a538273bdb947e848f; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_7d1b454b2a538273bdb947e848f" ON workspace_cjj1w48f60br2q6wtz6trrdb6."connectedAccount" USING btree ("accountOwnerId", "deletedAt");


--
-- Name: IDX_82cdf247553f960093baa7c6635; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_82cdf247553f960093baa7c6635" ON workspace_cjj1w48f60br2q6wtz6trrdb6.opportunity USING btree ("pointOfContactId", "deletedAt");


--
-- Name: IDX_85f024f9ec673d530d14cf75fe5; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_85f024f9ec673d530d14cf75fe5" ON workspace_cjj1w48f60br2q6wtz6trrdb6.favorite USING btree ("opportunityId", "deletedAt");


--
-- Name: IDX_8606361c00c3d44e1a23024e1f8; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_8606361c00c3d44e1a23024e1f8" ON workspace_cjj1w48f60br2q6wtz6trrdb6."messageFolder" USING btree ("messageChannelId", "deletedAt");


--
-- Name: IDX_87914cd3ce963115f8cb943e2ac; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_87914cd3ce963115f8cb943e2ac" ON workspace_cjj1w48f60br2q6wtz6trrdb6.person USING btree ("emailsPrimaryEmail");


--
-- Name: IDX_8c4f617db0813d41aef587e49ea; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_8c4f617db0813d41aef587e49ea" ON workspace_cjj1w48f60br2q6wtz6trrdb6."messageParticipant" USING btree ("workspaceMemberId", "deletedAt");


--
-- Name: IDX_8d0144e4074d86d0cb7094f40c2; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_8d0144e4074d86d0cb7094f40c2" ON workspace_cjj1w48f60br2q6wtz6trrdb6."messageParticipant" USING btree ("messageId", "deletedAt");


--
-- Name: IDX_8ea5d02aec60a7ceabc36fb2b41; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_8ea5d02aec60a7ceabc36fb2b41" ON workspace_cjj1w48f60br2q6wtz6trrdb6.favorite USING btree ("dashboardId", "deletedAt");


--
-- Name: IDX_91e687ea21123af4e02c9a07a43; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_91e687ea21123af4e02c9a07a43" ON workspace_cjj1w48f60br2q6wtz6trrdb6.attachment USING btree ("companyId", "deletedAt");


--
-- Name: IDX_92a888b681107c4f78926820db7; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_92a888b681107c4f78926820db7" ON workspace_cjj1w48f60br2q6wtz6trrdb6."calendarChannelEventAssociation" USING btree ("calendarEventId", "deletedAt");


--
-- Name: IDX_98455b50fdd00d9b234e26b64e9; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_98455b50fdd00d9b234e26b64e9" ON workspace_cjj1w48f60br2q6wtz6trrdb6."timelineActivity" USING btree ("targetTaskId", "deletedAt");


--
-- Name: IDX_9f96d65260c4676faac27cb6bf3; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_9f96d65260c4676faac27cb6bf3" ON workspace_cjj1w48f60br2q6wtz6trrdb6.opportunity USING gin ("searchVector");


--
-- Name: IDX_UNIQUE_da56d8b595a778d404eae01f29b; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_UNIQUE_da56d8b595a778d404eae01f29b" ON workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannelMessageAssociation" USING btree ("messageChannelId", "messageId") WHERE ("deletedAt" IS NULL);


--
-- Name: IDX_UNIQUE_da740cfc9b8edd57936cc18f66f; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_UNIQUE_da740cfc9b8edd57936cc18f66f" ON workspace_cjj1w48f60br2q6wtz6trrdb6."messageFolder" USING btree ("messageChannelId", "externalId") WHERE ("deletedAt" IS NULL);


--
-- Name: IDX_a362c5eff4a28fcdffdd3bdff16; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_a362c5eff4a28fcdffdd3bdff16" ON workspace_cjj1w48f60br2q6wtz6trrdb6."workflowVersion" USING btree ("workflowId", "deletedAt");


--
-- Name: IDX_a88c3ab301c25202d4b52fb4b1b; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_a88c3ab301c25202d4b52fb4b1b" ON workspace_cjj1w48f60br2q6wtz6trrdb6."calendarChannelEventAssociation" USING btree ("calendarChannelId", "deletedAt");


--
-- Name: IDX_a900d9f809273abe54dc5e166fa; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_a900d9f809273abe54dc5e166fa" ON workspace_cjj1w48f60br2q6wtz6trrdb6.favorite USING btree ("companyId", "deletedAt");


--
-- Name: IDX_a930d316a6b4f3b81d3f026dd16; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_a930d316a6b4f3b81d3f026dd16" ON workspace_cjj1w48f60br2q6wtz6trrdb6."timelineActivity" USING btree ("workspaceMemberId", "deletedAt");


--
-- Name: IDX_b0ba7efcd8c529922bf6e858bc1; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_b0ba7efcd8c529922bf6e858bc1" ON workspace_cjj1w48f60br2q6wtz6trrdb6."taskTarget" USING btree ("opportunityId", "deletedAt");


--
-- Name: IDX_b0f33146379167855851cceef65; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_b0f33146379167855851cceef65" ON workspace_cjj1w48f60br2q6wtz6trrdb6."timelineActivity" USING btree ("targetPersonId", "deletedAt");


--
-- Name: IDX_b4787dfe0ab22620ab04dcdffba; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_b4787dfe0ab22620ab04dcdffba" ON workspace_cjj1w48f60br2q6wtz6trrdb6.attachment USING btree ("dashboardId", "deletedAt");


--
-- Name: IDX_b55a639f9e6efaca7ad5ee77119; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_b55a639f9e6efaca7ad5ee77119" ON workspace_cjj1w48f60br2q6wtz6trrdb6."timelineActivity" USING btree ("targetDashboardId", "deletedAt");


--
-- Name: IDX_b810a8e37adf5cafd342170ccf8; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_b810a8e37adf5cafd342170ccf8" ON workspace_cjj1w48f60br2q6wtz6trrdb6.favorite USING btree ("favoriteFolderId", "deletedAt");


--
-- Name: IDX_bbd7aec1976fc684a0a5e4816c9; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_bbd7aec1976fc684a0a5e4816c9" ON workspace_cjj1w48f60br2q6wtz6trrdb6.person USING gin ("searchVector");


--
-- Name: IDX_c3af632ce35236d21f8ae1f4cfd; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_c3af632ce35236d21f8ae1f4cfd" ON workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel" USING btree ("connectedAccountId", "deletedAt");


--
-- Name: IDX_cf12e6c92058f11b59852ffdfe3; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_cf12e6c92058f11b59852ffdfe3" ON workspace_cjj1w48f60br2q6wtz6trrdb6."taskTarget" USING btree ("personId", "deletedAt");


--
-- Name: IDX_d01a000cf26e1225d894dc3d364; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_d01a000cf26e1225d894dc3d364" ON workspace_cjj1w48f60br2q6wtz6trrdb6.task USING gin ("searchVector");


--
-- Name: IDX_d09fc4b1711543f42c127270f1e; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_d09fc4b1711543f42c127270f1e" ON workspace_cjj1w48f60br2q6wtz6trrdb6.workflow USING gin ("searchVector");


--
-- Name: IDX_dd22aee9059fd7002165df6d8cc; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_dd22aee9059fd7002165df6d8cc" ON workspace_cjj1w48f60br2q6wtz6trrdb6."calendarEventParticipant" USING btree ("calendarEventId", "deletedAt");


--
-- Name: IDX_e14b3424016bea8b7fe220f7761; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_e14b3424016bea8b7fe220f7761" ON workspace_cjj1w48f60br2q6wtz6trrdb6.favorite USING btree ("taskId", "deletedAt");


--
-- Name: IDX_e47451872f70c8f187a6b460ac7; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_e47451872f70c8f187a6b460ac7" ON workspace_cjj1w48f60br2q6wtz6trrdb6."workspaceMember" USING gin ("searchVector");


--
-- Name: IDX_e655425fbac9c7bbb09ae8c0e81; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_e655425fbac9c7bbb09ae8c0e81" ON workspace_cjj1w48f60br2q6wtz6trrdb6."timelineActivity" USING btree ("targetWorkflowId", "deletedAt");


--
-- Name: IDX_ee5298b25512b38b29390e084f7; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_ee5298b25512b38b29390e084f7" ON workspace_cjj1w48f60br2q6wtz6trrdb6.task USING btree ("assigneeId", "deletedAt");


--
-- Name: IDX_eecddc968e93b9b8ebbfd85dad3; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_eecddc968e93b9b8ebbfd85dad3" ON workspace_cjj1w48f60br2q6wtz6trrdb6.favorite USING btree ("workflowId", "deletedAt");


--
-- Name: IDX_eee970874f46ff99eefc0015001; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_eee970874f46ff99eefc0015001" ON workspace_cjj1w48f60br2q6wtz6trrdb6."workflowRun" USING btree ("workflowId", "deletedAt");


--
-- Name: IDX_f20de8d7fc74a405e4083051275; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_f20de8d7fc74a405e4083051275" ON workspace_cjj1w48f60br2q6wtz6trrdb6.note USING gin ("searchVector");


--
-- Name: IDX_f3b76c5322b31cba175b2eccec8; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_f3b76c5322b31cba175b2eccec8" ON workspace_cjj1w48f60br2q6wtz6trrdb6.dashboard USING gin ("searchVector");


--
-- Name: IDX_faa5772594c4ce15b9305919f2f; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_faa5772594c4ce15b9305919f2f" ON workspace_cjj1w48f60br2q6wtz6trrdb6."workflowRun" USING btree ("workflowVersionId", "deletedAt");


--
-- Name: IDX_fb1f4905546cfc6d70a971c76f7; Type: INDEX; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

CREATE INDEX "IDX_fb1f4905546cfc6d70a971c76f7" ON workspace_cjj1w48f60br2q6wtz6trrdb6.company USING gin ("searchVector");


--
-- Name: pageLayoutTab FK_0177b1574efe6e6f24651977340; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."pageLayoutTab"
    ADD CONSTRAINT "FK_0177b1574efe6e6f24651977340" FOREIGN KEY ("pageLayoutId") REFERENCES core."pageLayout"(id) ON DELETE CASCADE;


--
-- Name: indexMetadata FK_051487e9b745cb175950130b63f; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."indexMetadata"
    ADD CONSTRAINT "FK_051487e9b745cb175950130b63f" FOREIGN KEY ("objectMetadataId") REFERENCES core."objectMetadata"(id) ON DELETE CASCADE;


--
-- Name: fieldMetadata FK_05453a954e458e3d91f2ff5043f; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."fieldMetadata"
    ADD CONSTRAINT "FK_05453a954e458e3d91f2ff5043f" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: indexMetadata FK_056363e1599f5b9a0e33323d9da; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."indexMetadata"
    ADD CONSTRAINT "FK_056363e1599f5b9a0e33323d9da" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: pageLayoutWidget FK_0659a4d171c93f5c046f18d24cd; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."pageLayoutWidget"
    ADD CONSTRAINT "FK_0659a4d171c93f5c046f18d24cd" FOREIGN KEY ("pageLayoutTabId") REFERENCES core."pageLayoutTab"(id) ON DELETE CASCADE;


--
-- Name: viewFilter FK_06858adf0fb54ec88fa602198ca; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewFilter"
    ADD CONSTRAINT "FK_06858adf0fb54ec88fa602198ca" FOREIGN KEY ("viewId") REFERENCES core.view(id) ON DELETE CASCADE;


--
-- Name: application FK_08d1d5e33c2a3ce7c140e9b335b; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.application
    ADD CONSTRAINT "FK_08d1d5e33c2a3ce7c140e9b335b" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED;


--
-- Name: viewField FK_0a48a0b66daedac1314437be5eb; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewField"
    ADD CONSTRAINT "FK_0a48a0b66daedac1314437be5eb" FOREIGN KEY ("fieldMetadataId") REFERENCES core."fieldMetadata"(id) ON DELETE CASCADE;


--
-- Name: objectMetadata FK_0b19dd17369574578bc18c405b2; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."objectMetadata"
    ADD CONSTRAINT "FK_0b19dd17369574578bc18c405b2" FOREIGN KEY ("dataSourceId") REFERENCES core."dataSource"(id) ON DELETE CASCADE;


--
-- Name: keyValuePair FK_0dae35d1c0fbdda6495be4ae71a; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."keyValuePair"
    ADD CONSTRAINT "FK_0dae35d1c0fbdda6495be4ae71a" FOREIGN KEY ("userId") REFERENCES core."user"(id) ON DELETE CASCADE;


--
-- Name: permissionFlag FK_13f8ca9c517976733a1ce4c10eb; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."permissionFlag"
    ADD CONSTRAINT "FK_13f8ca9c517976733a1ce4c10eb" FOREIGN KEY ("roleId") REFERENCES core.role(id) ON DELETE CASCADE;


--
-- Name: viewFilter FK_193548db5abc45713087f7d1af6; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewFilter"
    ADD CONSTRAINT "FK_193548db5abc45713087f7d1af6" FOREIGN KEY ("fieldMetadataId") REFERENCES core."fieldMetadata"(id) ON DELETE CASCADE;


--
-- Name: searchFieldMetadata FK_1b78544eb06f82059a2a01013a3; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."searchFieldMetadata"
    ADD CONSTRAINT "FK_1b78544eb06f82059a2a01013a3" FOREIGN KEY ("objectMetadataId") REFERENCES core."objectMetadata"(id) ON DELETE CASCADE;


--
-- Name: userWorkspace FK_22f5e76f493c3fb20237cfc48b0; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."userWorkspace"
    ADD CONSTRAINT "FK_22f5e76f493c3fb20237cfc48b0" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: pageLayoutTab FK_2528e67c8c0c953d8303172989e; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."pageLayoutTab"
    ADD CONSTRAINT "FK_2528e67c8c0c953d8303172989e" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: agent FK_259c48f99f625708723414adb5d; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.agent
    ADD CONSTRAINT "FK_259c48f99f625708723414adb5d" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: fieldPermission FK_2763aee5614b54019d692333fe1; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."fieldPermission"
    ADD CONSTRAINT "FK_2763aee5614b54019d692333fe1" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: agentMessagePart FK_2aff9daad5cc3b5e15ca7173342; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."agentMessagePart"
    ADD CONSTRAINT "FK_2aff9daad5cc3b5e15ca7173342" FOREIGN KEY ("messageId") REFERENCES core."agentMessage"(id) ON DELETE CASCADE;


--
-- Name: viewSort FK_2b36c6adea4542b4844d9fb1806; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewSort"
    ADD CONSTRAINT "FK_2b36c6adea4542b4844d9fb1806" FOREIGN KEY ("viewId") REFERENCES core.view(id) ON DELETE CASCADE;


--
-- Name: viewGroup FK_2d7cfc4748058a0ca648835d046; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewGroup"
    ADD CONSTRAINT "FK_2d7cfc4748058a0ca648835d046" FOREIGN KEY ("viewId") REFERENCES core.view(id) ON DELETE CASCADE;


--
-- Name: viewFilter FK_32cabc67e40d24acab541c469a8; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewFilter"
    ADD CONSTRAINT "FK_32cabc67e40d24acab541c469a8" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: view FK_348e25d584c7e51417f4e097941; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.view
    ADD CONSTRAINT "FK_348e25d584c7e51417f4e097941" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: view FK_394132f681ecbffa8ac912d1e5f; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.view
    ADD CONSTRAINT "FK_394132f681ecbffa8ac912d1e5f" FOREIGN KEY ("createdByUserWorkspaceId") REFERENCES core."userWorkspace"(id) ON DELETE SET NULL;


--
-- Name: workspace FK_3b1acb13a5dac9956d1a4b32755; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.workspace
    ADD CONSTRAINT "FK_3b1acb13a5dac9956d1a4b32755" FOREIGN KEY ("workspaceCustomApplicationId") REFERENCES core.application(id) ON DELETE RESTRICT;


--
-- Name: agentChatThread FK_3bd935d6f8c5ce87194b8db8240; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."agentChatThread"
    ADD CONSTRAINT "FK_3bd935d6f8c5ce87194b8db8240" FOREIGN KEY ("userWorkspaceId") REFERENCES core."userWorkspace"(id) ON DELETE CASCADE;


--
-- Name: agentTurn FK_3be906dca9d5b50fbfe40e33f07; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."agentTurn"
    ADD CONSTRAINT "FK_3be906dca9d5b50fbfe40e33f07" FOREIGN KEY ("threadId") REFERENCES core."agentChatThread"(id) ON DELETE CASCADE;


--
-- Name: remoteTable FK_3db5ae954f9197def326053f06a; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."remoteTable"
    ADD CONSTRAINT "FK_3db5ae954f9197def326053f06a" FOREIGN KEY ("remoteServerId") REFERENCES core."remoteServer"(id) ON DELETE CASCADE;


--
-- Name: view FK_3e5ea41c239ef1b75b0d42bef99; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.view
    ADD CONSTRAINT "FK_3e5ea41c239ef1b75b0d42bef99" FOREIGN KEY ("objectMetadataId") REFERENCES core."objectMetadata"(id) ON DELETE CASCADE;


--
-- Name: pageLayoutTab FK_4493447c2e4029aa26cabf30460; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."pageLayoutTab"
    ADD CONSTRAINT "FK_4493447c2e4029aa26cabf30460" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: fieldMetadata FK_47a6c57e1652b6475f8248cff78; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."fieldMetadata"
    ADD CONSTRAINT "FK_47a6c57e1652b6475f8248cff78" FOREIGN KEY ("relationTargetFieldMetadataId") REFERENCES core."fieldMetadata"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: roleTarget FK_4b3865868c7da0747ee8e480851; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."roleTarget"
    ADD CONSTRAINT "FK_4b3865868c7da0747ee8e480851" FOREIGN KEY ("apiKeyId") REFERENCES core."apiKey"(id) ON DELETE CASCADE;


--
-- Name: serverlessFunction FK_4b9625a4babf7f4fa942fd26514; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."serverlessFunction"
    ADD CONSTRAINT "FK_4b9625a4babf7f4fa942fd26514" FOREIGN KEY ("serverlessFunctionLayerId") REFERENCES core."serverlessFunctionLayer"(id);


--
-- Name: agentMessage FK_4c31daa882e3130534995bf90ca; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."agentMessage"
    ADD CONSTRAINT "FK_4c31daa882e3130534995bf90ca" FOREIGN KEY ("threadId") REFERENCES core."agentChatThread"(id) ON DELETE CASCADE;


--
-- Name: applicationVariable FK_51adb49e7f8df35dd23e01c4830; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."applicationVariable"
    ADD CONSTRAINT "FK_51adb49e7f8df35dd23e01c4830" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: pageLayoutWidget FK_555948f84165dce1fe1f5f955ce; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."pageLayoutWidget"
    ADD CONSTRAINT "FK_555948f84165dce1fe1f5f955ce" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: view FK_580dad12c8b92f3a3c307c4e66d; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.view
    ADD CONSTRAINT "FK_580dad12c8b92f3a3c307c4e66d" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: webhook FK_597ab5e7de76f1836b8fd80d6b9; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.webhook
    ADD CONSTRAINT "FK_597ab5e7de76f1836b8fd80d6b9" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: viewGroup FK_5aff384532c78fa8a42ceeae282; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewGroup"
    ADD CONSTRAINT "FK_5aff384532c78fa8a42ceeae282" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: view FK_5c0d21d6b8d5544a24ab9787114; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.view
    ADD CONSTRAINT "FK_5c0d21d6b8d5544a24ab9787114" FOREIGN KEY ("calendarFieldMetadataId") REFERENCES core."fieldMetadata"(id) ON DELETE CASCADE;


--
-- Name: pageLayout FK_5e7f19b88c0864db19e2bad0fc5; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."pageLayout"
    ADD CONSTRAINT "FK_5e7f19b88c0864db19e2bad0fc5" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: searchFieldMetadata FK_5f10e00da471e19f52513f47d8b; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."searchFieldMetadata"
    ADD CONSTRAINT "FK_5f10e00da471e19f52513f47d8b" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: viewSort FK_5f3278d6791aa4c58423e556ae6; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewSort"
    ADD CONSTRAINT "FK_5f3278d6791aa4c58423e556ae6" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: viewGroup FK_61053f5509cc31e5d7139fba1cb; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewGroup"
    ADD CONSTRAINT "FK_61053f5509cc31e5d7139fba1cb" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: serverlessFunction FK_62cbd26626ff76df897181c7994; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."serverlessFunction"
    ADD CONSTRAINT "FK_62cbd26626ff76df897181c7994" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: viewFilterGroup FK_6aa17342705ae5526de377bf7ed; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewFilterGroup"
    ADD CONSTRAINT "FK_6aa17342705ae5526de377bf7ed" FOREIGN KEY ("parentViewFilterGroupId") REFERENCES core."viewFilterGroup"(id) ON DELETE CASCADE;


--
-- Name: featureFlag FK_6be7761fa8453f3a498aab6e72b; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."featureFlag"
    ADD CONSTRAINT "FK_6be7761fa8453f3a498aab6e72b" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: searchFieldMetadata FK_6d5c6922bfd1578b1eff2abb9d6; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."searchFieldMetadata"
    ADD CONSTRAINT "FK_6d5c6922bfd1578b1eff2abb9d6" FOREIGN KEY ("fieldMetadataId") REFERENCES core."fieldMetadata"(id) ON DELETE CASCADE;


--
-- Name: routeTrigger FK_6edf47a8bfe17a5811998dc7162; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."routeTrigger"
    ADD CONSTRAINT "FK_6edf47a8bfe17a5811998dc7162" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: fieldMetadata FK_6f6c87ec32cca956d8be321071c; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."fieldMetadata"
    ADD CONSTRAINT "FK_6f6c87ec32cca956d8be321071c" FOREIGN KEY ("relationTargetObjectMetadataId") REFERENCES core."objectMetadata"(id) ON DELETE CASCADE;


--
-- Name: objectMetadata FK_71a7af5a5c916f0b96f358f25f7; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."objectMetadata"
    ADD CONSTRAINT "FK_71a7af5a5c916f0b96f358f25f7" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: approvedAccessDomain FK_73d3e340b6ce0716a25a86361fc; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."approvedAccessDomain"
    ADD CONSTRAINT "FK_73d3e340b6ce0716a25a86361fc" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: pageLayout FK_760ec8b78721991220b76accd55; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."pageLayout"
    ADD CONSTRAINT "FK_760ec8b78721991220b76accd55" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: databaseEventTrigger FK_7650f1b8b693cde204f44ab0aa4; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."databaseEventTrigger"
    ADD CONSTRAINT "FK_7650f1b8b693cde204f44ab0aa4" FOREIGN KEY ("serverlessFunctionId") REFERENCES core."serverlessFunction"(id) ON DELETE CASCADE;


--
-- Name: emailingDomain FK_793a938bef2aae0a2129f78951f; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."emailingDomain"
    ADD CONSTRAINT "FK_793a938bef2aae0a2129f78951f" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: publicDomain FK_7e9ca5fd7aa30b8396ea3d1d6be; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."publicDomain"
    ADD CONSTRAINT "FK_7e9ca5fd7aa30b8396ea3d1d6be" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: role FK_7f3b96f15aaf5a27549288d264b; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.role
    ADD CONSTRAINT "FK_7f3b96f15aaf5a27549288d264b" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: cronTrigger FK_817ea28e71e3b19acc258dd7dcd; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."cronTrigger"
    ADD CONSTRAINT "FK_817ea28e71e3b19acc258dd7dcd" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: viewSort FK_818522b962a9b756accb5b3149d; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewSort"
    ADD CONSTRAINT "FK_818522b962a9b756accb5b3149d" FOREIGN KEY ("fieldMetadataId") REFERENCES core."fieldMetadata"(id) ON DELETE CASCADE;


--
-- Name: objectPermission FK_826052747c82e59f0a006204256; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."objectPermission"
    ADD CONSTRAINT "FK_826052747c82e59f0a006204256" FOREIGN KEY ("roleId") REFERENCES core.role(id) ON DELETE CASCADE;


--
-- Name: roleTarget FK_83ea4a0433da5007a198db7667e; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."roleTarget"
    ADD CONSTRAINT "FK_83ea4a0433da5007a198db7667e" FOREIGN KEY ("roleId") REFERENCES core.role(id) ON DELETE CASCADE;


--
-- Name: agentMessage FK_87dbab10ac94d9a091f8efaa67b; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."agentMessage"
    ADD CONSTRAINT "FK_87dbab10ac94d9a091f8efaa67b" FOREIGN KEY ("turnId") REFERENCES core."agentTurn"(id) ON DELETE CASCADE;


--
-- Name: viewFilterGroup FK_8919a390f4022ab1e40182a5ac3; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewFilterGroup"
    ADD CONSTRAINT "FK_8919a390f4022ab1e40182a5ac3" FOREIGN KEY ("viewId") REFERENCES core.view(id) ON DELETE CASCADE;


--
-- Name: appToken FK_8cd4819144baf069777b5729136; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."appToken"
    ADD CONSTRAINT "FK_8cd4819144baf069777b5729136" FOREIGN KEY ("userId") REFERENCES core."user"(id) ON DELETE CASCADE;


--
-- Name: postgresCredentials FK_9494639abc06f9c8c3691bf5d22; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."postgresCredentials"
    ADD CONSTRAINT "FK_9494639abc06f9c8c3691bf5d22" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: viewField FK_96158de54c78944b5340b6f708e; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewField"
    ADD CONSTRAINT "FK_96158de54c78944b5340b6f708e" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: databaseEventTrigger FK_9acc2804037a5c885633024368d; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."databaseEventTrigger"
    ADD CONSTRAINT "FK_9acc2804037a5c885633024368d" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: userWorkspace FK_a2da2ea7d6cd1e5a4c5cb1791f8; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."userWorkspace"
    ADD CONSTRAINT "FK_a2da2ea7d6cd1e5a4c5cb1791f8" FOREIGN KEY ("userId") REFERENCES core."user"(id) ON DELETE CASCADE;


--
-- Name: twoFactorAuthenticationMethod FK_b0f44ffd7c794beb48cb1e1b1a9; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."twoFactorAuthenticationMethod"
    ADD CONSTRAINT "FK_b0f44ffd7c794beb48cb1e1b1a9" FOREIGN KEY ("userWorkspaceId") REFERENCES core."userWorkspace"(id) ON DELETE CASCADE;


--
-- Name: roleTarget FK_b1db027b64f44029389ace305ac; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."roleTarget"
    ADD CONSTRAINT "FK_b1db027b64f44029389ace305ac" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: indexFieldMetadata FK_b20192c432612eb710801dd5664; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."indexFieldMetadata"
    ADD CONSTRAINT "FK_b20192c432612eb710801dd5664" FOREIGN KEY ("indexMetadataId") REFERENCES core."indexMetadata"(id) ON DELETE CASCADE;


--
-- Name: view FK_b3cc95732479f7a1337350c398f; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.view
    ADD CONSTRAINT "FK_b3cc95732479f7a1337350c398f" FOREIGN KEY ("kanbanAggregateOperationFieldMetadataId") REFERENCES core."fieldMetadata"(id) ON DELETE CASCADE;


--
-- Name: viewFilter FK_b518bd61175e0963370e09ef15e; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewFilter"
    ADD CONSTRAINT "FK_b518bd61175e0963370e09ef15e" FOREIGN KEY ("viewFilterGroupId") REFERENCES core."viewFilterGroup"(id) ON DELETE CASCADE;


--
-- Name: viewField FK_b560ea62a958deff0c6059caa45; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewField"
    ADD CONSTRAINT "FK_b560ea62a958deff0c6059caa45" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: fieldPermission FK_bbf16a91f5a10199e5b18c019ba; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."fieldPermission"
    ADD CONSTRAINT "FK_bbf16a91f5a10199e5b18c019ba" FOREIGN KEY ("roleId") REFERENCES core.role(id) ON DELETE CASCADE;


--
-- Name: workspaceSSOIdentityProvider FK_bc8d8855198de1fbc32fba8df93; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."workspaceSSOIdentityProvider"
    ADD CONSTRAINT "FK_bc8d8855198de1fbc32fba8df93" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: indexFieldMetadata FK_be0950612a54b58c72bd62d629e; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."indexFieldMetadata"
    ADD CONSTRAINT "FK_be0950612a54b58c72bd62d629e" FOREIGN KEY ("fieldMetadataId") REFERENCES core."fieldMetadata"(id) ON DELETE CASCADE;


--
-- Name: viewFilterGroup FK_bfc3498b964ef1bfc89b1f2bee3; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewFilterGroup"
    ADD CONSTRAINT "FK_bfc3498b964ef1bfc89b1f2bee3" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: keyValuePair FK_c137e3d8b3980901e114941daa2; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."keyValuePair"
    ADD CONSTRAINT "FK_c137e3d8b3980901e114941daa2" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: agent FK_c4cb56621768a4a325dd772bbe1; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.agent
    ADD CONSTRAINT "FK_c4cb56621768a4a325dd772bbe1" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: pageLayoutWidget FK_c4dc95034f53a12601e623d9171; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."pageLayoutWidget"
    ADD CONSTRAINT "FK_c4dc95034f53a12601e623d9171" FOREIGN KEY ("objectMetadataId") REFERENCES core."objectMetadata"(id) ON DELETE CASCADE;


--
-- Name: viewField FK_c5ab40cd4debb51d588752a4857; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewField"
    ADD CONSTRAINT "FK_c5ab40cd4debb51d588752a4857" FOREIGN KEY ("viewId") REFERENCES core.view(id) ON DELETE CASCADE;


--
-- Name: routeTrigger FK_c89ed9d929873119478fc0d9cc5; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."routeTrigger"
    ADD CONSTRAINT "FK_c89ed9d929873119478fc0d9cc5" FOREIGN KEY ("serverlessFunctionId") REFERENCES core."serverlessFunction"(id) ON DELETE CASCADE;


--
-- Name: apiKey FK_c8b3efa54a29aa873043e72fb1d; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."apiKey"
    ADD CONSTRAINT "FK_c8b3efa54a29aa873043e72fb1d" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: agentTurnEvaluation FK_c94f072dbd3c11f7df51db52934; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."agentTurnEvaluation"
    ADD CONSTRAINT "FK_c94f072dbd3c11f7df51db52934" FOREIGN KEY ("turnId") REFERENCES core."agentTurn"(id) ON DELETE CASCADE;


--
-- Name: view FK_d1fa625016e36ec6f79fb13e824; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.view
    ADD CONSTRAINT "FK_d1fa625016e36ec6f79fb13e824" FOREIGN KEY ("mainGroupByFieldMetadataId") REFERENCES core."fieldMetadata"(id) ON DELETE CASCADE;


--
-- Name: viewFilter FK_d5651cf33fa56a47cd262a3fb2c; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewFilter"
    ADD CONSTRAINT "FK_d5651cf33fa56a47cd262a3fb2c" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: fieldPermission FK_d5c47a26fe71648894d05da3d3a; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."fieldPermission"
    ADD CONSTRAINT "FK_d5c47a26fe71648894d05da3d3a" FOREIGN KEY ("fieldMetadataId") REFERENCES core."fieldMetadata"(id) ON DELETE CASCADE;


--
-- Name: appToken FK_d6ae19a7aa2bbd4919053257772; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."appToken"
    ADD CONSTRAINT "FK_d6ae19a7aa2bbd4919053257772" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: fieldPermission FK_dc8e552397f5e44d175fedf752a; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."fieldPermission"
    ADD CONSTRAINT "FK_dc8e552397f5e44d175fedf752a" FOREIGN KEY ("objectMetadataId") REFERENCES core."objectMetadata"(id) ON DELETE CASCADE;


--
-- Name: viewFilterGroup FK_dce74ab06fa7a2effcbf1b98dff; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewFilterGroup"
    ADD CONSTRAINT "FK_dce74ab06fa7a2effcbf1b98dff" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: pageLayout FK_dd63ca42614bacf58971aabdcbb; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."pageLayout"
    ADD CONSTRAINT "FK_dd63ca42614bacf58971aabdcbb" FOREIGN KEY ("objectMetadataId") REFERENCES core."objectMetadata"(id) ON DELETE CASCADE;


--
-- Name: fieldMetadata FK_de2a09b9e3e690440480d2dee26; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."fieldMetadata"
    ADD CONSTRAINT "FK_de2a09b9e3e690440480d2dee26" FOREIGN KEY ("objectMetadataId") REFERENCES core."objectMetadata"(id) ON DELETE CASCADE;


--
-- Name: file FK_de468b3d8dcf7e94f7074220929; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.file
    ADD CONSTRAINT "FK_de468b3d8dcf7e94f7074220929" FOREIGN KEY ("workspaceId") REFERENCES core.workspace(id) ON DELETE CASCADE;


--
-- Name: objectPermission FK_efbcf3528718de2b5c45c0a8a83; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."objectPermission"
    ADD CONSTRAINT "FK_efbcf3528718de2b5c45c0a8a83" FOREIGN KEY ("objectMetadataId") REFERENCES core."objectMetadata"(id) ON DELETE CASCADE;


--
-- Name: cronTrigger FK_f70831ec336e0cb42d6a33b80ba; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."cronTrigger"
    ADD CONSTRAINT "FK_f70831ec336e0cb42d6a33b80ba" FOREIGN KEY ("serverlessFunctionId") REFERENCES core."serverlessFunction"(id) ON DELETE CASCADE;


--
-- Name: pageLayoutWidget FK_fb84d310b4cfe5916ced6fc3e2a; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."pageLayoutWidget"
    ADD CONSTRAINT "FK_fb84d310b4cfe5916ced6fc3e2a" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: viewSort FK_ff8cbebe1704954120df82bf393; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core."viewSort"
    ADD CONSTRAINT "FK_ff8cbebe1704954120df82bf393" FOREIGN KEY ("applicationId") REFERENCES core.application(id) ON DELETE CASCADE;


--
-- Name: timelineActivity FK_017f8e2306dc1b0182a33b062a5; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."timelineActivity"
    ADD CONSTRAINT "FK_017f8e2306dc1b0182a33b062a5" FOREIGN KEY ("targetWorkflowId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.workflow(id) ON DELETE CASCADE;


--
-- Name: timelineActivity FK_0482ca18fc5e49456ce97cf61aa; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."timelineActivity"
    ADD CONSTRAINT "FK_0482ca18fc5e49456ce97cf61aa" FOREIGN KEY ("targetOpportunityId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.opportunity(id) ON DELETE SET NULL;


--
-- Name: timelineActivity FK_068146151017a5f32c3b152ac04; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."timelineActivity"
    ADD CONSTRAINT "FK_068146151017a5f32c3b152ac04" FOREIGN KEY ("targetNoteId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.note(id) ON DELETE SET NULL;


--
-- Name: calendarEventParticipant FK_082f03025609e55b3d55de7cc28; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."calendarEventParticipant"
    ADD CONSTRAINT "FK_082f03025609e55b3d55de7cc28" FOREIGN KEY ("calendarEventId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6."calendarEvent"(id) ON DELETE CASCADE;


--
-- Name: calendarChannelEventAssociation FK_1fc99b189521f153bf3bbac7324; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."calendarChannelEventAssociation"
    ADD CONSTRAINT "FK_1fc99b189521f153bf3bbac7324" FOREIGN KEY ("calendarEventId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6."calendarEvent"(id) ON DELETE CASCADE;


--
-- Name: favorite FK_202ea98eb9e6c2e264c4f445909; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.favorite
    ADD CONSTRAINT "FK_202ea98eb9e6c2e264c4f445909" FOREIGN KEY ("workflowVersionId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6."workflowVersion"(id) ON DELETE CASCADE;


--
-- Name: timelineActivity FK_23ea8a9080759633a448287c157; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."timelineActivity"
    ADD CONSTRAINT "FK_23ea8a9080759633a448287c157" FOREIGN KEY ("targetWorkflowVersionId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6."workflowVersion"(id) ON DELETE CASCADE;


--
-- Name: workflowRun FK_25b2bf1832ffa264f8dc39f7dab; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."workflowRun"
    ADD CONSTRAINT "FK_25b2bf1832ffa264f8dc39f7dab" FOREIGN KEY ("workflowVersionId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6."workflowVersion"(id) ON DELETE SET NULL;


--
-- Name: messageChannel FK_2e966cbb240771c67630d52895c; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel"
    ADD CONSTRAINT "FK_2e966cbb240771c67630d52895c" FOREIGN KEY ("connectedAccountId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6."connectedAccount"(id) ON DELETE CASCADE;


--
-- Name: attachment FK_336215924656712491529388934; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.attachment
    ADD CONSTRAINT "FK_336215924656712491529388934" FOREIGN KEY ("companyId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.company(id) ON DELETE CASCADE;


--
-- Name: timelineActivity FK_393340ea834ab8660b51d482f29; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."timelineActivity"
    ADD CONSTRAINT "FK_393340ea834ab8660b51d482f29" FOREIGN KEY ("targetDashboardId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.dashboard(id) ON DELETE SET NULL;


--
-- Name: timelineActivity FK_3c53994e4a67712996d6a9cbf8d; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."timelineActivity"
    ADD CONSTRAINT "FK_3c53994e4a67712996d6a9cbf8d" FOREIGN KEY ("targetWorkflowRunId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6."workflowRun"(id) ON DELETE CASCADE;


--
-- Name: messageFolder FK_4237a2fe8a6583354f807c2f8fe; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."messageFolder"
    ADD CONSTRAINT "FK_4237a2fe8a6583354f807c2f8fe" FOREIGN KEY ("messageChannelId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel"(id) ON DELETE CASCADE;


--
-- Name: timelineActivity FK_4d266cbeff57096026be4b97ee3; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."timelineActivity"
    ADD CONSTRAINT "FK_4d266cbeff57096026be4b97ee3" FOREIGN KEY ("targetTaskId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.task(id) ON DELETE SET NULL;


--
-- Name: favorite FK_50b4b08647162251102055f8605; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.favorite
    ADD CONSTRAINT "FK_50b4b08647162251102055f8605" FOREIGN KEY ("opportunityId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.opportunity(id) ON DELETE CASCADE;


--
-- Name: message FK_51fa5df1094bfdbf99ea91a72fa; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.message
    ADD CONSTRAINT "FK_51fa5df1094bfdbf99ea91a72fa" FOREIGN KEY ("messageThreadId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6."messageThread"(id) ON DELETE CASCADE;


--
-- Name: noteTarget FK_52050fd9cf6b7ba9982ef9d867a; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."noteTarget"
    ADD CONSTRAINT "FK_52050fd9cf6b7ba9982ef9d867a" FOREIGN KEY ("noteId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.note(id) ON DELETE SET NULL;


--
-- Name: opportunity FK_5a104112b21bbebb37fca93a548; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.opportunity
    ADD CONSTRAINT "FK_5a104112b21bbebb37fca93a548" FOREIGN KEY ("companyId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.company(id) ON DELETE SET NULL;


--
-- Name: favorite FK_5abbb386c4f07b05622d7e5dbd7; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.favorite
    ADD CONSTRAINT "FK_5abbb386c4f07b05622d7e5dbd7" FOREIGN KEY ("workflowId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.workflow(id) ON DELETE CASCADE;


--
-- Name: attachment FK_5bf006c84a1a7f95f165d8b4432; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.attachment
    ADD CONSTRAINT "FK_5bf006c84a1a7f95f165d8b4432" FOREIGN KEY ("dashboardId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.dashboard(id) ON DELETE CASCADE;


--
-- Name: attachment FK_611282e10752b2ecbd5c8525ab5; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.attachment
    ADD CONSTRAINT "FK_611282e10752b2ecbd5c8525ab5" FOREIGN KEY ("taskId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.task(id) ON DELETE SET NULL;


--
-- Name: favorite FK_64cc36ffa2e72ad304dfff1c1b6; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.favorite
    ADD CONSTRAINT "FK_64cc36ffa2e72ad304dfff1c1b6" FOREIGN KEY ("noteId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.note(id) ON DELETE CASCADE;


--
-- Name: messageParticipant FK_670c8b151ad702613fce89b3662; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."messageParticipant"
    ADD CONSTRAINT "FK_670c8b151ad702613fce89b3662" FOREIGN KEY ("messageId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.message(id) ON DELETE CASCADE;


--
-- Name: connectedAccount FK_6b4f87f1cff07faee5635ff6a6d; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."connectedAccount"
    ADD CONSTRAINT "FK_6b4f87f1cff07faee5635ff6a6d" FOREIGN KEY ("accountOwnerId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6."workspaceMember"(id) ON DELETE CASCADE;


--
-- Name: taskTarget FK_6bf30a6234085e67b5754d1270a; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."taskTarget"
    ADD CONSTRAINT "FK_6bf30a6234085e67b5754d1270a" FOREIGN KEY ("companyId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.company(id) ON DELETE CASCADE;


--
-- Name: favorite FK_6c07cb1ca91ef6ddf680ea76c23; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.favorite
    ADD CONSTRAINT "FK_6c07cb1ca91ef6ddf680ea76c23" FOREIGN KEY ("taskId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.task(id) ON DELETE CASCADE;


--
-- Name: task FK_7384988f7eeb777e44802a0baca; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.task
    ADD CONSTRAINT "FK_7384988f7eeb777e44802a0baca" FOREIGN KEY ("assigneeId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6."workspaceMember"(id) ON DELETE SET NULL;


--
-- Name: timelineActivity FK_7460f3992bc8d73165b3b2874e6; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."timelineActivity"
    ADD CONSTRAINT "FK_7460f3992bc8d73165b3b2874e6" FOREIGN KEY ("targetCompanyId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.company(id) ON DELETE CASCADE;


--
-- Name: attachment FK_76c5cd056cd033bd8a9b6117bf4; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.attachment
    ADD CONSTRAINT "FK_76c5cd056cd033bd8a9b6117bf4" FOREIGN KEY ("noteId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.note(id) ON DELETE SET NULL;


--
-- Name: taskTarget FK_77baecea6c197525c17c8e04a4b; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."taskTarget"
    ADD CONSTRAINT "FK_77baecea6c197525c17c8e04a4b" FOREIGN KEY ("opportunityId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.opportunity(id) ON DELETE CASCADE;


--
-- Name: calendarEventParticipant FK_78e8a7e863f3d614d3d30034479; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."calendarEventParticipant"
    ADD CONSTRAINT "FK_78e8a7e863f3d614d3d30034479" FOREIGN KEY ("personId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.person(id) ON DELETE SET NULL;


--
-- Name: attachment FK_79ecbbd8c212dc3877c7d0d1785; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.attachment
    ADD CONSTRAINT "FK_79ecbbd8c212dc3877c7d0d1785" FOREIGN KEY ("workflowId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.workflow(id) ON DELETE CASCADE;


--
-- Name: attachment FK_7e7734164970ebef01a8542c341; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.attachment
    ADD CONSTRAINT "FK_7e7734164970ebef01a8542c341" FOREIGN KEY ("personId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.person(id) ON DELETE CASCADE;


--
-- Name: favorite FK_7f94f531f1d68952732ce0713b8; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.favorite
    ADD CONSTRAINT "FK_7f94f531f1d68952732ce0713b8" FOREIGN KEY ("personId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.person(id) ON DELETE CASCADE;


--
-- Name: messageParticipant FK_840b9ccea0055abb8b3e980638c; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."messageParticipant"
    ADD CONSTRAINT "FK_840b9ccea0055abb8b3e980638c" FOREIGN KEY ("workspaceMemberId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6."workspaceMember"(id) ON DELETE SET NULL;


--
-- Name: timelineActivity FK_875809b410c253073b5aa812c9a; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."timelineActivity"
    ADD CONSTRAINT "FK_875809b410c253073b5aa812c9a" FOREIGN KEY ("targetPersonId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.person(id) ON DELETE CASCADE;


--
-- Name: favorite FK_87c60f46f8b173156d5443dff94; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.favorite
    ADD CONSTRAINT "FK_87c60f46f8b173156d5443dff94" FOREIGN KEY ("companyId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.company(id) ON DELETE CASCADE;


--
-- Name: messageChannelMessageAssociation FK_882fe28be3f73b2c3fd84acc866; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannelMessageAssociation"
    ADD CONSTRAINT "FK_882fe28be3f73b2c3fd84acc866" FOREIGN KEY ("messageChannelId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannel"(id) ON DELETE CASCADE;


--
-- Name: noteTarget FK_89d3f25e1ff1084ff7ecbc45e9f; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."noteTarget"
    ADD CONSTRAINT "FK_89d3f25e1ff1084ff7ecbc45e9f" FOREIGN KEY ("opportunityId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.opportunity(id) ON DELETE CASCADE;


--
-- Name: attachment FK_8cfd54311aaba8ecba3f30c1428; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.attachment
    ADD CONSTRAINT "FK_8cfd54311aaba8ecba3f30c1428" FOREIGN KEY ("opportunityId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.opportunity(id) ON DELETE CASCADE;


--
-- Name: favorite FK_9b2f7992b7be7ef4894f9164402; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.favorite
    ADD CONSTRAINT "FK_9b2f7992b7be7ef4894f9164402" FOREIGN KEY ("workflowRunId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6."workflowRun"(id) ON DELETE CASCADE;


--
-- Name: messageChannelMessageAssociation FK_9b53fe617a3a4c0fa231703a64f; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."messageChannelMessageAssociation"
    ADD CONSTRAINT "FK_9b53fe617a3a4c0fa231703a64f" FOREIGN KEY ("messageId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.message(id) ON DELETE CASCADE;


--
-- Name: company FK_abe91dff1e48d77edca339f387c; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.company
    ADD CONSTRAINT "FK_abe91dff1e48d77edca339f387c" FOREIGN KEY ("accountOwnerId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6."workspaceMember"(id) ON DELETE SET NULL;


--
-- Name: noteTarget FK_b7f4c99a3f58104e013ecb50350; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."noteTarget"
    ADD CONSTRAINT "FK_b7f4c99a3f58104e013ecb50350" FOREIGN KEY ("personId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.person(id) ON DELETE CASCADE;


--
-- Name: timelineActivity FK_b8af01591f389f596f7be54b13d; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."timelineActivity"
    ADD CONSTRAINT "FK_b8af01591f389f596f7be54b13d" FOREIGN KEY ("workspaceMemberId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6."workspaceMember"(id) ON DELETE CASCADE;


--
-- Name: calendarChannelEventAssociation FK_b9d204c4dacbb164d1ec444116e; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."calendarChannelEventAssociation"
    ADD CONSTRAINT "FK_b9d204c4dacbb164d1ec444116e" FOREIGN KEY ("calendarChannelId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6."calendarChannel"(id) ON DELETE CASCADE;


--
-- Name: blocklist FK_bbaebad9d11e773689cb3cdf997; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.blocklist
    ADD CONSTRAINT "FK_bbaebad9d11e773689cb3cdf997" FOREIGN KEY ("workspaceMemberId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6."workspaceMember"(id) ON DELETE SET NULL;


--
-- Name: workflowVersion FK_c3d1cd364eab2fe2a207964738c; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."workflowVersion"
    ADD CONSTRAINT "FK_c3d1cd364eab2fe2a207964738c" FOREIGN KEY ("workflowId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.workflow(id) ON DELETE CASCADE;


--
-- Name: favorite FK_c5e1f330d88ce857fa72f5734a8; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.favorite
    ADD CONSTRAINT "FK_c5e1f330d88ce857fa72f5734a8" FOREIGN KEY ("favoriteFolderId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6."favoriteFolder"(id) ON DELETE SET NULL;


--
-- Name: calendarChannel FK_c7bc368c97a18a072413d67cf45; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."calendarChannel"
    ADD CONSTRAINT "FK_c7bc368c97a18a072413d67cf45" FOREIGN KEY ("connectedAccountId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6."connectedAccount"(id) ON DELETE CASCADE;


--
-- Name: attachment FK_c8cacbfb04fdb38644032d02aa5; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.attachment
    ADD CONSTRAINT "FK_c8cacbfb04fdb38644032d02aa5" FOREIGN KEY ("authorId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6."workspaceMember"(id) ON DELETE SET NULL;


--
-- Name: taskTarget FK_c95f3cce2b95309005a9d1ed824; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."taskTarget"
    ADD CONSTRAINT "FK_c95f3cce2b95309005a9d1ed824" FOREIGN KEY ("taskId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.task(id) ON DELETE SET NULL;


--
-- Name: messageParticipant FK_cbfaa3bb38cced64ea9576016c2; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."messageParticipant"
    ADD CONSTRAINT "FK_cbfaa3bb38cced64ea9576016c2" FOREIGN KEY ("personId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.person(id) ON DELETE SET NULL;


--
-- Name: taskTarget FK_cd49e6663fc94ba1b22cb831f5f; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."taskTarget"
    ADD CONSTRAINT "FK_cd49e6663fc94ba1b22cb831f5f" FOREIGN KEY ("personId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.person(id) ON DELETE CASCADE;


--
-- Name: calendarEventParticipant FK_cd980caeb07e091a71780e5a367; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."calendarEventParticipant"
    ADD CONSTRAINT "FK_cd980caeb07e091a71780e5a367" FOREIGN KEY ("workspaceMemberId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6."workspaceMember"(id) ON DELETE SET NULL;


--
-- Name: opportunity FK_ce5aa294b17fe23a0b19267f1e1; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.opportunity
    ADD CONSTRAINT "FK_ce5aa294b17fe23a0b19267f1e1" FOREIGN KEY ("pointOfContactId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.person(id) ON DELETE SET NULL;


--
-- Name: workflowRun FK_da6e20d423109a993f1d63938e6; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."workflowRun"
    ADD CONSTRAINT "FK_da6e20d423109a993f1d63938e6" FOREIGN KEY ("workflowId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.workflow(id) ON DELETE CASCADE;


--
-- Name: favorite FK_db69e02d020b006ee625873748c; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.favorite
    ADD CONSTRAINT "FK_db69e02d020b006ee625873748c" FOREIGN KEY ("dashboardId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.dashboard(id) ON DELETE CASCADE;


--
-- Name: workflowAutomatedTrigger FK_e078063f0cbce9767a0f8ca431d; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."workflowAutomatedTrigger"
    ADD CONSTRAINT "FK_e078063f0cbce9767a0f8ca431d" FOREIGN KEY ("workflowId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.workflow(id) ON DELETE CASCADE;


--
-- Name: person FK_ee066ddacfce46c9a7cb90edd1a; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.person
    ADD CONSTRAINT "FK_ee066ddacfce46c9a7cb90edd1a" FOREIGN KEY ("companyId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.company(id) ON DELETE SET NULL;


--
-- Name: favorite FK_f81cf8d2eb2a9e36b44f32e7ccc; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6.favorite
    ADD CONSTRAINT "FK_f81cf8d2eb2a9e36b44f32e7ccc" FOREIGN KEY ("forWorkspaceMemberId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6."workspaceMember"(id) ON DELETE CASCADE;


--
-- Name: noteTarget FK_fc8e7addc9538c81a60dd2ef894; Type: FK CONSTRAINT; Schema: workspace_cjj1w48f60br2q6wtz6trrdb6; Owner: postgres
--

ALTER TABLE ONLY workspace_cjj1w48f60br2q6wtz6trrdb6."noteTarget"
    ADD CONSTRAINT "FK_fc8e7addc9538c81a60dd2ef894" FOREIGN KEY ("companyId") REFERENCES workspace_cjj1w48f60br2q6wtz6trrdb6.company(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict SCYFlpdLr1jGlMfIxIqnOZ7WObMQEyLhemFxvTR6pf4ZbzV1Pl0zfC8ZRPXarku

