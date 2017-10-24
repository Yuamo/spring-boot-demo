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
'管理员表';

comment on column ADMIN.ID is 
'用户ID';

comment on column ADMIN.NAME is 
'用户名';

comment on column ADMIN.LOGIN_NAME is 
'登录账户';

comment on column ADMIN.LOGIN_PASS is 
'登录密码';

comment on column ADMIN.IDCARD is 
'身份证';

comment on column ADMIN.STATUS is 
'状态';

comment on column ADMIN.ROLE_ID is 
'权限';

comment on column ADMIN.PHONE is 
'手机号';

comment on column ADMIN.CREATED_DATE is 
'创建时间';

comment on column ADMIN.UPDATE_DATE is 
'修改时间';

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
'文章表';

comment on column ARTICLE.ID is 
'文章ID';

comment on column ARTICLE.CATE_ID is 
'创建者ID';

comment on column ARTICLE.TITLE is 
'标题';

comment on column ARTICLE.IMAGE is 
'文章缩略图';

comment on column ARTICLE.ABST is 
'文章摘要';

comment on column ARTICLE.INFO is 
'文章内容';

comment on column ARTICLE.LIST_SORT is 
'排序权重';

comment on column ARTICLE.STATUS is 
'状态';

comment on column ARTICLE.IS_FOCUS is 
'是否是焦点';

comment on column ARTICLE.IS_HOT is 
'是否热点';

comment on column ARTICLE.CLASS is 
'文章分类';

comment on column ARTICLE.IS_COMMEND is 
'是否推荐';

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
'文章分类';

comment on column ARTICLE_CLASSIFICATION.ID is 
'文章分类ID';

comment on column ARTICLE_CLASSIFICATION.NAME is 
'分类名称';

comment on column ARTICLE_CLASSIFICATION.ALIAS is 
'分类别名';

comment on column ARTICLE_CLASSIFICATION.STATUS is 
'状态';

comment on column ARTICLE_CLASSIFICATION.LIST_SORT is 
'排序权重';

