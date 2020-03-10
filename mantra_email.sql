--Table creation for tenants
CREATE TABLE mantra_tenants
							(
							 tenant_id		NUMBER(12,0) NOT NULL
							 ,tenant_name	VARCHAR2(30) NOT NULL
							 ,lmod			DATE 		 NOT NULL
							 ,CONSTRAINT tenant_pk	PRIMARY KEY (tenant_id)
							);

--Table to store the users
CREATE TABLE mantra_users
						(
						 mu_usr_id		NUMBER(12,0)	NOT NULL
						 ,mu_usr_name	VARCHAR2(30)	NOT NULL
						 ,first_name	VARCHAR2(100)	NOT NULL
						 ,last_name		VARCHAR2(100)	NULL
						 ,lmod			DATE			NOT NULL
						 ,tenant_id		NUMBER(12,0)	NOT NULL
						 ,CONSTRAINT mu_usr_pk	PRIMARY KEY (mu_usr_id)
						 ,CONSTRAINT tenant_fk	FOREIGN	KEY (tenant_id)
						 REFERENCES mantra_tenants(tenant_id)
						);

--Table to store email messages
CREATE TABLE mantra_messages
							(
							 message_id	NUMBER (12,0)	NOT NULL
							,subject	VARCHAR2(2000)	NULL
							,mssg_body	CLOB			NULL	
							,lmod		DATE			NOT NULL
							,author_id	NUMBER(12,0)	NOT NULL
							,CONSTRAINT	message_pk	PRIMARY KEY(message_id) 
							);

--Table for place holders --> Sent, Inbox, Draft, Bin

CREATE TABLE mantra_place_holder
								(
								 place_holder_id	NUMBER(12,0)	NOT NULL
								 ,place_holder		VARCHAR2(100) 	NOT NULL
								 ,lmod				DATE			NOT NULL
								 ,CONSTRAINT place_holder_pk	PRIMARY KEY(place_holder_id)
								);

--Mapping of all tables
CREATE	TABLE mantra_email_mapping(
									map_id			NUMBER(12,0)	NOT NULL
								   ,mu_usr_id			NUMBER(12,0)	NOT NULL
								   ,message_id 		NUMBER(12,0) 	NOT NULL
								   ,place_holder_id NUMBER(12,0)	NOT NULL
								   ,CONSTRAINT	map_pk	PRIMARY KEY (map_id)
								   ,CONSTRAINT	mu_user_fk	FOREIGN KEY (mu_usr_id)
								    REFERENCES	mantra_users(mu_usr_id)
								   ,CONSTRAINT	message_fk	FOREIGN KEY (message_id)
								    REFERENCES	mantra_messages(message_id)
								   ,CONSTRAINT	place_holder_fk	FOREIGN KEY (place_holder_id)
								    REFERENCES	mantra_place_holder(place_holder_id)
								   ,CONSTRAINT map_uk	UNIQUE (mu_usr_id,message_id,place_holder_id)  
								   );
						
--Create sequneces for primary keys 

CREATE SEQUENCE mantra_tenant_seq	
		MINVALUE 1
		MAXVALUE 999999999999999
		START WITH 1
		INCREMENT BY 1;

CREATE SEQUENCE mantra_user_seq	
		MINVALUE 1
		MAXVALUE 999999999999999
		START WITH 1
		INCREMENT BY 1;

CREATE SEQUENCE mantra_message_seq	
		MINVALUE 1
		MAXVALUE 999999999999999
		START WITH 1
		INCREMENT BY 1;

CREATE SEQUENCE mantra_place_seq	
		MINVALUE 1
		MAXVALUE 999999999999999
		START WITH 1
		INCREMENT BY 1;

CREATE SEQUENCE mantra_mapping_seq	
		MINVALUE 1
		MAXVALUE 999999999999999
		START WITH 1
		INCREMENT BY 1;