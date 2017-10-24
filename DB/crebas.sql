/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     2017/10/24 14:55:25                          */
/*==============================================================*/


drop table if exists ADMIN;

drop table if exists ARTICLE;

drop table if exists ARTICLE_CLASSIFICATION;

/*==============================================================*/
/* Table: ADMIN                                                 */
/*==============================================================*/
create table ADMIN 
(
   ID                   varchar(50)                    not null,
   NAME                 varchar(50)                    null,
   LOGIN_NAME           varchar(50)                    null,
   LOGIN_PASS           varchar(50)                    null,
   IDCARD               varchar(50)                    null,
   STATUS               varchar(10)                    null,
   ROLE_ID              varchar(10)                    null,
   PHONE                varchar(20)                    null,
   CREATED_DATE         date                           null,
   UPDATE_DATE          date                           null,
   EXT1                 varchar(50)                    null,
   EXT2                 varchar(50)                    null,
   constraint PK_ADMIN primary key clustered (ID)
);

comment on table ADMIN is 
'����Ա��';

comment on column ADMIN.ID is 
'�û�ID';

comment on column ADMIN.NAME is 
'�û���';

comment on column ADMIN.LOGIN_NAME is 
'��¼�˻�';

comment on column ADMIN.LOGIN_PASS is 
'��¼����';

comment on column ADMIN.IDCARD is 
'���֤';

comment on column ADMIN.STATUS is 
'״̬';

comment on column ADMIN.ROLE_ID is 
'Ȩ��';

comment on column ADMIN.PHONE is 
'�ֻ���';

comment on column ADMIN.CREATED_DATE is 
'����ʱ��';

comment on column ADMIN.UPDATE_DATE is 
'�޸�ʱ��';

/*==============================================================*/
/* Table: ARTICLE                                               */
/*==============================================================*/
create table ARTICLE 
(
   ID                   varchar(50)                    not null,
   CATE_ID              varchar(50)                    null,
   TITLE                varchar(50)                    null,
   IMAGE                text                           null,
   ABST                 text                           null,
   INFO                 text                           null,
   LIST_SORT            integer                        null,
   STATUS               binary                         null default 0,
   URL                  integer                        null,
   IS_FOCUS             binary                         null default 0,
   IS_HOT               binary                         null default 0,
   CLASS                varchar(50)                    null,
   IS_COMMEND           binary                         null default 0,
   CREATED_DATE         date                           null,
   UPDATE_DATE          date                           null,
   EXT1                 varchar(50)                    null,
   constraint PK_ARTICLE primary key clustered (ID)
);

comment on table ARTICLE is 
'���±�';

comment on column ARTICLE.ID is 
'����ID';

comment on column ARTICLE.CATE_ID is 
'������ID';

comment on column ARTICLE.TITLE is 
'����';

comment on column ARTICLE.IMAGE is 
'��������ͼ';

comment on column ARTICLE.ABST is 
'����ժҪ';

comment on column ARTICLE.INFO is 
'��������';

comment on column ARTICLE.LIST_SORT is 
'����Ȩ��';

comment on column ARTICLE.STATUS is 
'״̬';

comment on column ARTICLE.IS_FOCUS is 
'�Ƿ��ǽ���';

comment on column ARTICLE.IS_HOT is 
'�Ƿ��ȵ�';

comment on column ARTICLE.CLASS is 
'���·���';

comment on column ARTICLE.IS_COMMEND is 
'�Ƿ��Ƽ�';

/*==============================================================*/
/* Table: ARTICLE_CLASSIFICATION                                */
/*==============================================================*/
create table ARTICLE_CLASSIFICATION 
(
   ID                   varchar(50)                    not null default null,
   NAME                 varchar(50)                    null,
   ALIAS                varchar(50)                    null,
   PID                  varchar(32)                    null,
   STATUS               binary(10)                     null default 0,
   LIST_SORT            binary(10)                     null,
   EXT1                 varchar(50)                    null,
   constraint PK_ARTICLE_CLASSIFICATION primary key clustered (ID)
);

comment on table ARTICLE_CLASSIFICATION is 
'���·���';

comment on column ARTICLE_CLASSIFICATION.ID is 
'���·���ID';

comment on column ARTICLE_CLASSIFICATION.NAME is 
'��������';

comment on column ARTICLE_CLASSIFICATION.ALIAS is 
'�������';

comment on column ARTICLE_CLASSIFICATION.STATUS is 
'״̬';

comment on column ARTICLE_CLASSIFICATION.LIST_SORT is 
'����Ȩ��';

