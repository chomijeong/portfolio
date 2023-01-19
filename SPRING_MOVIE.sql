DROP TABLE MEMBERS;

-- ȸ�� ���� ���̺�
CREATE TABLE MEMBERS(
    MID                 NVARCHAR2(10),                          -- ���̵�
    MPW                NVARCHAR2(10) NOT NULL,      -- ��й�ȣ
    MNAME           NVARCHAR2(10) NOT NULL,       -- �̸�
    MBIRTH          DATE,                                             -- �������
    MEMAIL          NVARCHAR2(50),                           -- �̸���
    MADDRESS      NVARCHAR2(100),                         --�ּ�
    MPROFILE       NVARCHAR2(100),                         -- �������̹���
    MSTATE          NUMBER(1)                                     -- ȸ������

);


ALTER TABLE MEMBERS
ADD CONSTRAINT PK_MID PRIMARY KEY (MID);


--2. ��ȭ ���� ���̺� (MOVIES)
CREATE TABLE MOVIES(
    MVCODE  NVARCHAR2(5),           -- ��ȭ�ڵ�
    MVNAME  NVARCHAR2(200),       -- ��ȭ�̸�
    MVPD    NVARCHAR2(20),            -- ��ȭ����
    MVACTOR NVARCHAR2(200),      -- ���
    MVGENRE NVARCHAR2(50),        -- �帣
    MVAGE   NVARCHAR2(20),           -- ����
    MVTIME  NVARCHAR2(20),          -- �ð�
    MVOPEN  DATE,                            -- ������
    MVPOSTER NVARCHAR2(100) 
    
);
ALTER TABLE MOVIES
ADD CONSTRAINT PK_MVCODE PRIMARY KEY(MVCODE);



--3. ���� ���� ���̺�(THEATERS)
CREATE TABLE THEATERS(
    THCODE NVARCHAR2(4),    -- �����ڵ�
    THNAME NVARCHAR2(20),   -- �����̸�
    THADDR NVARCHAR2(50),   -- �����ּ�
    THTEL  NVARCHAR2(15),    -- ������ȭ��ȣ
    THSTATE NUMBER(1)
);
ALTER TABLE THEATERS
ADD CONSTRAINT PK_THCODE PRIMARY KEY(THCODE);

Insert into THEATERS (THCODE,THNAME,THADDR,THTEL) values ('TH01','CGV���','��õ������ ��籸 ������ 899-1 ��Ʈ�θ� 8��','1544-1122');
Insert into THEATERS (THCODE,THNAME,THADDR,THTEL) values ('TH02','CGV����','��õ ������ ���� ûõ�� 386���� ��������ƿ﷿ 2��','1544-1122');
Insert into THEATERS (THCODE,THNAME,THADDR,THTEL) values ('TH03','CGV�۵�Ÿ�ӽ����̽�','��õ������ ������ �۵��� 8-21 A�� ����1��','1544-1122');
Insert into THEATERS (THCODE,THNAME,THADDR,THTEL) values ('TH04','CGV������','��õ������ ������ û�е� 496-4 8��','1544-1122');
Insert into THEATERS (THCODE,THNAME,THADDR,THTEL) values ('TH05','CGV��õ','��õ������ ������ ������ 1130���� ���� 4��','1544-1122');



--4. �󿵽����� (SCHEDULES)
CREATE TABLE SCHEDULES(
    SCROOM NVARCHAR2(10),     -- �󿵰�
    SCDATE DATE,              -- ��¥�׽ð�
    SCTHCODE NVARCHAR2(4),    -- �����ڵ�(FK)
    SCMVCODE NVARCHAR2(5)     -- ��ȭ�ڵ�(FK)
);
ALTER TABLE SCHEDULES
ADD CONSTRAINT FK_SCTHCODE FOREIGN KEY(SCTHCODE) REFERENCES THEATERS(THCODE);
ALTER TABLE SCHEDULES
ADD CONSTRAINT FK_SCMVCODE FOREIGN KEY(SCMVCODE) REFERENCES MOVIES(MVCODE);
ALTER TABLE SCHEDULES
ADD CONSTRAINT PK_SCHEDULES PRIMARY KEY(SCROOM,SCDATE,SCTHCODE);



-- 5. �������� ���̺� ���� (RESERVATION) RE 
CREATE TABLE RESERVATION (
    RECODE NVARCHAR2(4),      -- �����ڵ� (PK) 
    REMID NVARCHAR2(10),      -- �����ھ��̵� (FK - MEMBERS MID)
    RESCTHCODE NVARCHAR2(4),  -- �����ڵ� 
    RESCROOM NVARCHAR2(10),   -- �󿵰�
    RESCDATE DATE,            -- ��¥�׽ð�  (FK)  SCHEDULES(SCTHCODE,SCROOM,SCDATE)
    REAMOUNT NUMBER           -- �����ο�
);

ALTER TABLE RESERVATION
ADD CONSTRAINT PK_RECODE PRIMARY KEY(RECODE);
ALTER TABLE RESERVATION
ADD CONSTRAINT FK_REMID FOREIGN KEY(REMID) REFERENCES MEMBERS(MID);
ALTER TABLE RESERVATION
ADD CONSTRAINT FK_RESERV FOREIGN KEY(RESCTHCODE,RESCROOM,RESCDATE) REFERENCES SCHEDULES(SCTHCODE,SCROOM,SCDATE);
    
  
    
COMMIT;

-- 6. ������ ���̺�(REVIEW)
--  �����ڵ� , ������ ���̵� ,  ��ȭ�ڵ� , �����򳻿� , �������ۼ��� , ��õ/����õ

CREATE TABLE REVIEW(
    RVRECODE NVARCHAR2(4),                  -- �����ڵ�
    RVMID NVARCHAR2(10),                        -- ���̵�
    RVMVCODE NVARCHAR2(5),                  -- ��ȭ�ڵ�
    RVCONTENTS NVARCHAR2(200),          -- ������
    RVDATE DATE,                                        -- �ۼ���
    RVCOMMEND NUMBER(1)                   -- ��õ(1) / ����õ(0)

);
ALTER TABLE REVIEW
ADD CONSTRAINT PK_RVRECODE PRIMARY KEY (RVRECODE);
ALTER TABLE REVIEW
ADD CONSTRAINT FK_RVRECODE FOREIGN KEY (RVRECODE)
REFERENCES RESERVATION (RECODE);

ALTER TABLE REVIEW
ADD CONSTRAINT FK_RVMID FOREIGN KEY (RVMID)
REFERENCES MEMBERS (MID);

ALTER TABLE REVIEW
ADD CONSTRAINT FK_RVMVCODE FOREIGN KEY (RVMVCODE)
REFERENCES MOVIES (MVCODE);


COMMIT;



