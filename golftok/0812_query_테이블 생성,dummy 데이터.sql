use MDPRJ

------------------drop table-------------------
DROP TABLE comment_like
DROP TABLE post_like
DROP TABLE hashtag
DROP TABLE follow
DROP TABLE nasmo
DROP TABLE comments
DROP TABLE tok_posts
DROP TABLE tok_users


------------------table create------------------
----users----
create table tok_users (
	user_id int primary key,
	user_name nvarchar(50) not null,
	user_password nvarchar(100) not null,
	user_nickname nvarchar(50) not null,
	user_icon nvarchar(600),
	introduction_message nvarchar(400),
	user_age int not null,
	user_grade nvarchar(50) not null,
	following_count int not null,
	follower_count int not null
)

----posts----
create table tok_posts (
	post_id int primary key,
	user_id int FOREIGN KEY REFERENCES tok_users(user_id) ON DELETE CASCADE,
	post_content nvarchar(800),
	video_root nvarchar(600),
	upload_date datetime not null,
	like_count int not null,
	comment_count int not null,
	locations nvarchar(200),
	post_thumbnail nvarchar(600) not null
)

----follow----
create table follow(
	follow_id int primary key,
	user_id int FOREIGN KEY REFERENCES tok_users(user_id),
	friend_id int not null
)

----comments----
create table comments(
	comment_id int primary key,
	post_id int FOREIGN KEY REFERENCES tok_posts(post_id),
	user_id int FOREIGN KEY REFERENCES tok_users(user_id),
	comment_text nvarchar(200),
	upload_date datetime not null,
	like_count int not null,
	comment_group nvarchar(10) not null,
	group_order nvarchar(10) not null,
	group_layer int not null
)

----nasmo----
create table nasmo(
	nasmo_id int primary key,
	user_id int FOREIGN KEY REFERENCES tok_users(user_id),
	video_root nvarchar(600) not null,
	nasmo_thumbnail nvarchar(600) not null
)

----hashtag----
create table hashtag(
	hashtag_id int primary key,
	post_id int FOREIGN KEY REFERENCES tok_posts(post_id),
	hashtag_content nvarchar(50)
)

----post_like----
create table post_like(
	post_like_id int primary key,
	post_id int FOREIGN KEY REFERENCES tok_posts(post_id) not null,
	user_id int FOREIGN KEY REFERENCES tok_users(user_id) not null
)

----comment_like----
create table comment_like(
	comment_like_id int primary key,
	comment_id int FOREIGN KEY REFERENCES comments(comment_id) not null,
	user_id int FOREIGN KEY REFERENCES tok_users(user_id) not null
)


---------------- data -----------------
----users data----
insert into tok_users values (1,'mul1234','mul1234','mul4321','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage2.jpg?alt=media&token=1cf84666-7c3b-42e9-9050-1fee04eaf2c6','�ȳ��ϼ���!',28,'��ġ',25,40)
insert into tok_users values (2,'hok333','hok333','���õ�����','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage3.jpg?alt=media&token=c63ed6ca-b4b4-4ee5-84f7-ac61b917a8e1','ȩ���Դϴ�',29,'����',3,2)
insert into tok_users values (3,'qaz1234','qaz1234','qaz1234','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage4.jpg?alt=media&token=3128f63c-c852-4a99-a7ba-04aef0a2dd18','������',36,'��',8,10)
insert into tok_users values (4,'qwer111','qwer111','qwer111','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage5.jpg?alt=media&token=feb4afed-ead7-46f4-8753-dd2d5a321f22','',33,'����',33,10)
insert into tok_users values (5,'qsxc000','qsxc000','������õ��','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage6.jpg?alt=media&token=6f7d029a-8c1a-4849-8760-d697f3ef5ec2','���� �����ؿ�!',42,'����',3,0)
insert into tok_users values (6,'popo333','popo333','������','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage7.jpg?alt=media&token=0c36198b-64a1-4933-8ed9-ed701adc7d62','���� ���� ĥ �� ���մϴ�',24,'��',3,7)
insert into tok_users values (7,'progolf567','progolf567','���ΰ���','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage8.jpg?alt=media&token=5e211670-712d-4517-b25f-c1e2e8ef0846','',37,'������',42,56)
insert into tok_users values (8,'gfdsa989','gfdsa989','���������̽���','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage9.jpg?alt=media&token=8f33d1e7-8c75-49d5-9131-b643991129c7','���� ��ġ�� �� �� ����!',36,'����',1,2)
insert into tok_users values (9,'hansu310','hansu310','�Ѽ�','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage10.jpg?alt=media&token=82a796be-de05-41a3-9c10-2be274285592','',31,'����',3,1)
insert into tok_users values (10,'hany456','hany456','�����ֿ���','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage11.jpg?alt=media&token=4d725b28-a948-494b-a932-9ad852045afc','�� ��Ź�����',37,'��',13,6)
insert into tok_users values (11,'flyfly99','flyfly99','flyfly99','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage25.jpg?alt=media&token=82923318-8878-4987-afe8-730c08648af1','',36,'��',4,6)
insert into tok_users values (12,'apple123','apple123','�������Ƹ�','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage12.jpg?alt=media&token=778c04a7-0490-4909-8a07-c8ddaaaf4ae1','���� ���� ���Ƹ� �Դϴ٤���',38,'��ġ',5,3)
insert into tok_users values (13,'banana454','banana454','����������','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage13.jpg?alt=media&token=c5800a00-cfd1-4956-8ca0-6eed6c2ca23d','����ģ�� ��û ���� ���ּ���',44,'������',2,3)
insert into tok_users values (14,'grayjam383','grayjam383','gray_jam','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage14.jpg?alt=media&token=8b8dc51a-2253-40e7-93cf-8cee994e0c30','',29,'����',3,2)
insert into tok_users values (15,'hamberger5556','hamberger5556','�ܹ���','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage15.jpg?alt=media&token=2cc41728-eaf2-4d4f-a1ef-769b1d8610c7','',34,'����',5,2)
insert into tok_users values (16,'hhk455','hhk455','hhk455','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage16.jpg?alt=media&token=82af733b-08bd-4f4f-86ea-a8e5637a5c8a','���� �޾ƿ뤾��',28,'����',10,8)
insert into tok_users values (17,'qwerqq8989','qwerqq8989','qwerqq8989','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage17.jpg?alt=media&token=90fdac83-fe04-439b-8cba-670abaea6b9d','',34,'����',0,2)
insert into tok_users values (18,'jeayoung123','jeayoung123','�翵','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage18.jpg?alt=media&token=eed70f1b-001a-4776-b76b-dc0d5acb65b4','',38,'����',28,33)
insert into tok_users values (19,'folwer999','folwer999','�ȷ��ȷι�','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage19.jpg?alt=media&token=29e70d89-1356-4740-a9b1-25de7bfd538d','',31,'������',17,7)
insert into tok_users values (20,'golf584','golf584','����õ��','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage20.png?alt=media&token=4e26d1ab-0272-4bca-b87a-81c0cfc340a2','',44,'��',3,9)
insert into tok_users values (21,'catttt1','catttt1','���������','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage21.jpg?alt=media&token=cff5463e-d0e4-43fc-9a40-b5d9c9d810d3','',36,'����',2,2)
insert into tok_users values (22,'party333','party333','����p','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage22.jpg?alt=media&token=949ead3d-b39d-41ef-a318-4cf38534c573','���� ����������~',34,'��ġ',13,17)
insert into tok_users values (23,'maybe232','maybe232','���̺��̺�','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage24.jpg?alt=media&token=22c49727-dece-45f3-8f9b-131667b75188','�ȷο� ���� ��Ź�ؿ�~',27,'����',8,11)
insert into tok_users values (24,'minz387','minz387','minz_387','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage23.jpg?alt=media&token=30fafb52-a27a-4569-8eb6-0bd44899306e','���� ����������~',32,'����',6,4)
insert into tok_users values (25,'varzar000','varzar000','������','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage28.jpg?alt=media&token=40b87865-fb90-4a1a-9c7b-c85e3c5e2503','������ ����ϴ� ���',38,'������',3,7)
insert into tok_users values (26,'moon1221','moon1221','m_o_o_n','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage29.jpg?alt=media&token=6758143a-4a25-4153-bc43-57828035c818','���� ����������~',43,'��',5,2)
insert into tok_users values (27,'gogogolf','gogogolf00','gogogolf','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage26.jpg?alt=media&token=8ec50b7f-ed8e-4747-a0ef-e935fdd361e4','',36,'��ġ',0,3)
insert into tok_users values (28,'dogcat367','dogcat367','�����','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage27.jpg?alt=media&token=c9a19774-8024-4b32-b7fd-81d7072bb632','',38,'����',11,7)
insert into tok_users values (29,'sincer881','sincer881','sinser','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage30.jpg?alt=media&token=1cf3f95f-b62c-4a04-8476-a9db77cd8ba7','',31,'��',2,0)
insert into tok_users values (30,'525angel','525angel','angel','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage31.jpg?alt=media&token=f9a39c25-7895-4a6d-a4b4-181b0ab2f666','���� �� ġ�� �;��!',22,'��ġ',7,14)

----tok_posts data----
insert into tok_posts values(1,1,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo1.mp4?alt=media&token=7e802ee5-88b7-475d-85d1-8bc7afafd840',DATEADD(dd,-10,getdate()),21,2,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail1.JPG?alt=media&token=f7404741-4888-44d7-b3fc-9b735cb74839')
insert into tok_posts values(2,1,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo2.mp4?alt=media&token=636c149d-5aa2-4270-a9ea-4455b8dff3a8',DATEADD(dd,-10,getdate()),12,0,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail2.JPG?alt=media&token=07a4a97e-ecfa-40b2-bc4c-cfe5eb81a652')
insert into tok_posts values(3,2,'�� ��°� �����','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo3.mp4?alt=media&token=81aa829b-e33f-4f8c-b409-898c1451cb57',DATEADD(dd,-8,getdate()),4,1,'����Ư���� ������ ������ 833 ������','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail3.JPG?alt=media&token=8edd989d-8021-46be-9c2d-06bff5b6f3c5')
insert into tok_posts values(4,4,'�ɽ��ϴ�','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo4.mp4?alt=media&token=e3f9581b-7b87-4b4a-9633-91520a86fa96',DATEADD(dd,-8,getdate()),6,0,'����Ư���� ���빮�� ���ҹ��� 37 �����δ������','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail4.JPG?alt=media&token=d5d815a8-7330-4431-9d81-8aaee92c2a07')
insert into tok_posts values(5,5,'#�ÿ����ѹ� #���� #���̽���','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo5.mp4?alt=media&token=0deb2132-760f-4fb1-8d2b-d0505af43cbf',DATEADD(dd,-8,getdate()),3,0,'����Ư���� �߶��� �븶���129���� 6 4��','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail5.JPG?alt=media&token=2ca149c3-5d90-40c1-aa27-c3b81dfc4320')
insert into tok_posts values(6,6,'���� ���� #���ó������̷�','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo7.mp4?alt=media&token=8680bf05-eb81-4b81-8af3-6efb1f11b4c4',DATEADD(dd,-7,getdate()),14,1,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail6.JPG?alt=media&token=58155043-fdbb-4cc4-87e9-9638397d567b')
insert into tok_posts values(7,5,'������ ���� �� ������ ��','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo8.mp4?alt=media&token=5fff0fc8-00e1-4d3e-800c-807daa62af4e',DATEADD(dd,-7,getdate()),22,4,'����Ư���� ���Ǳ� ���Ƿ�15�� 23-11 ���Ǹƽ��� B1','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail7.JPG?alt=media&token=aaeeed41-2255-467c-9a30-9c7267f3d2d6')
insert into tok_posts values(8,8,'���� ��ǥ�� ����!!','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo9.mp4?alt=media&token=51bc1e0e-1171-4fe9-828a-6d7e95643602',DATEADD(dd,-6,getdate()),28,1,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail8.JPG?alt=media&token=a445a15b-8190-4ee0-8916-f2400c044073')
insert into tok_posts values(9,8,'���� #��ũ�������� �� ��ȹ �����µ� ģ�� ���� ������ #�ڼ��Ҿ��� #�����ʺ�','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo11.mp4?alt=media&token=dbef66c8-21d9-4c7a-8d83-9cebd8e20a88',DATEADD(dd,-6,getdate()),42,0,'����Ư���� �߶��� �븶���129���� 6 4��','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail9.JPG?alt=media&token=0441516d-27d4-4b4a-958c-2f1e25db9b9d')
insert into tok_posts values(10,8,'fire','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo12.mp4?alt=media&token=d31fae88-c636-479a-8cbc-f0c3f2fb8b5e',DATEADD(dd,-6,getdate()),39,3,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail10.JPG?alt=media&token=0272314d-0cc6-4a1f-a95f-2f20064108e1')
insert into tok_posts values(11,3,'#���� #���� #���ƿ� #������','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo13.mp4?alt=media&token=cb2ec5f6-9119-4171-be01-fe5529b80a9c',DATEADD(dd,-6,getdate()),20,0,'����Ư���� �������� �ǻ���� 127 �Ե�ĳ�������̾�','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail11.JPG?alt=media&token=9be497db-e2a0-42b1-aba0-24012e16ca52')
insert into tok_posts values(12,4,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo14.mp4?alt=media&token=14e45cc3-42a2-4ef0-aa46-c33d9d1f09ff',DATEADD(dd,-5,getdate()),13,1,'����Ư���� ���빮�� ������ 36 ���ο��ݺ���','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail12.JPG?alt=media&token=c393a39e-5dfb-4cf3-8b2d-b4500a20b6fc')
insert into tok_posts values(13,9,'�ɽ��ؤѤ�','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo15.mp4?alt=media&token=1adedcc4-b027-49a3-8206-dd909cf36172',DATEADD(dd,-5,getdate()),11,3,'����Ư���� ���� �������� 94 �ＺŸ�����Ʈ�� ����1��','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail13.JPG?alt=media&token=969168c6-224f-45d5-87e4-15c46493ba4a')
insert into tok_posts values(14,2,'���� �־��٤̤̤� #���ΰ��� �� �Ǵ� �� ������!!!','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo16.mp4?alt=media&token=65d67d36-a452-43d1-9b45-5824b77645f8',DATEADD(dd,-5,getdate()),1,0,'����Ư���� ������ ������81�� 28','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail14.JPG?alt=media&token=db595da3-2ff2-4bef-9fa5-5ed5203b0a2e')
insert into tok_posts values(15,2,'�ڼ� ���̷��� ��������','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo17.mp4?alt=media&token=e365f36a-f05b-4f86-8bd9-c23039fc7797',DATEADD(dd,-5,getdate()),7,3,'����Ư���� ����� ������ 688 5��','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail15.JPG?alt=media&token=cfed2105-0b76-425c-ab67-1874b7c3716f')
insert into tok_posts values(16,10,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo18.mp4?alt=media&token=21dad949-244a-4987-8581-e6581aa6a4e2',DATEADD(dd,-4,getdate()),2,0,'����Ư���� ���빮�� ȫ���߾ӷ� 29','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail16.JPG?alt=media&token=3d891aa4-c60f-4742-af0f-c6e820a1ba32')
insert into tok_posts values(17,3,'#���� 1���� #����','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo20.mp4?alt=media&token=dc8dad6c-007b-461a-90eb-79a99dfb649e',DATEADD(dd,-4,getdate()),0,0,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail17.JPG?alt=media&token=40382f64-bb64-40b2-9fa7-b87e143b97e2')
insert into tok_posts values(18,2,'�ڼ� ������..','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo21.mp4?alt=media&token=a12a8a6a-723e-4c86-a9d3-af7bd322e4c8',DATEADD(dd,-4,getdate()),33,7,'����Ư���� ���� ����� 315 1��','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail18.JPG?alt=media&token=80c7b2ac-71c7-4e57-85c0-2c48d33974c1')
insert into tok_posts values(19,6,'�ʹ� ������������','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo22.mp4?alt=media&token=339c41c4-d6bc-41cd-9c9e-76ed5262111c',DATEADD(dd,-4,getdate()),13,2,'����Ư���� �߶��� �븶���129���� 6','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail19.JPG?alt=media&token=1ff0da42-f875-43e0-acf7-c92062f713ec')
insert into tok_posts values(20,3,'���� #�Ƿ� �� �þ�°� ������ �ѵ��ϴ٤���','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo23.mp4?alt=media&token=622670f6-ca84-403e-a39b-b9ce83956da8',DATEADD(dd,-4,getdate()),8,0,'����Ư���� ����� ���Ϸ� 986 ��������̾����','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail20.JPG?alt=media&token=5d58248f-9bc4-4557-b0ae-3e5db40ebb4e')
insert into tok_posts values(21,8,'�������� �ָ��� ������~','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo24.mp4?alt=media&token=db2033e1-0e44-4926-8f9f-6a831f527359',DATEADD(dd,-3,getdate()),17,1,'����Ư���� ���� �������� 94 �ＺŸ�����Ʈ�� ����1��','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail21.JPG?alt=media&token=5b399576-6150-4ffc-be44-d3f5a30700b7')
insert into tok_posts values(22,3,'�ÿ��� �ѹ�~','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo25.mp4?alt=media&token=d52b9099-603c-4c3e-b6bc-854594d4994c',DATEADD(dd,-3,getdate()),12,2,'����Ư���� �������� �ǻ���� 127 �Ե�ĳ�������̾�','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail22.JPG?alt=media&token=e6863d0a-a8de-43a1-a70d-58a4be6454ba')
insert into tok_posts values(23,4,'�� �����ϴ� #�����','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo26.mp4?alt=media&token=37d68704-7788-40d5-8f16-112959c41c88',DATEADD(dd,-3,getdate()),18,5,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail23.JPG?alt=media&token=3d036dfe-58be-4cb9-8996-9cc232750461')
insert into tok_posts values(24,4,'#�۽�Ÿ�׷� #������ #����� #����','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo27.mp4?alt=media&token=cc6a5163-f87f-49ca-a14e-12894fce9a48',DATEADD(dd,-3,getdate()),55,0,'����Ư���� ����� ���Ϸ�234�� 27','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail24.JPG?alt=media&token=e4097f35-8cc1-4b6d-b35b-6e814db19281')
insert into tok_posts values(25,9,'#�۽�Ÿ�׷�','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo28.mp4?alt=media&token=ce40953c-df98-4b6f-9510-1d8da32786b7',DATEADD(dd,-3,getdate()),25,1,'����Ư���� ����� ����� 258 �ǿ��ȴϹ�ȭ��','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail25.JPG?alt=media&token=15fc2919-c7fd-467f-8a0b-401f74439d96')
insert into tok_posts values(26,14,'������','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo29.mp4?alt=media&token=8c594b3d-6bd1-4a26-8b5f-662dcc93b718',DATEADD(dd,-2,getdate()),30,0,'����Ư���� ����� ����� 31 �׶�������Ʈ','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail26.JPG?alt=media&token=fa3ca0bd-ff90-4c47-ae21-e6189e037aa9')
insert into tok_posts values(27,13,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo30.mp4?alt=media&token=23bee688-66f3-4514-b3ea-113b668c2776',DATEADD(dd,-2,getdate()),3,0,'����Ư���� ������ ���μ�ȯ��370�� 33','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail27.JPG?alt=media&token=bb92ac90-aeb5-4058-ab9a-2f51591d8df9')
insert into tok_posts values(28,10,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo31.mp4?alt=media&token=c1b86b1f-2d85-45a8-a079-211f57cf4eaf',DATEADD(dd,-2,getdate()),17,1,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail28.JPG?alt=media&token=98a9cde8-3d8f-44db-824f-12e41776fb3e')
insert into tok_posts values(29,7,'#���� #����','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo32.mp4?alt=media&token=d0e3df54-3646-4521-b25e-c837c28602a2',DATEADD(dd,-2,getdate()),8,2,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail29.JPG?alt=media&token=af8d399f-5f18-49fe-afa5-aedefddbb056')
insert into tok_posts values(30,7,'�������� �ļ� �� �ȵǴ� ����^^','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo33.mp4?alt=media&token=9b37468f-17d9-4ba2-87fc-64b4c9d2ed67',DATEADD(dd,-2,getdate()),8,0,'����Ư���� ������ �������106�� 17 ��������','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail30.JPG?alt=media&token=bc159c2f-022d-4423-b907-a0a6c5f19d2f')
insert into tok_posts values(31,17,'���̽��� #���ƿ�','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo34.mp4?alt=media&token=5d837b66-8148-4ae7-9ff8-94fb6064c6b4',DATEADD(dd,-2,getdate()),1,0,'���� ���ı� �ø��ȷ� 25 �������տ��','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail31.JPG?alt=media&token=7c6216a4-f499-43f3-a348-68b01dd83391')
insert into tok_posts values(32,22,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo35.mp4?alt=media&token=9b6daa11-bfeb-4287-854c-67bea1d6ff69',DATEADD(dd,-1,getdate()),42,2,'����Ư���� ������ �������106�� 17 �������� ���� 1��','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail32.JPG?alt=media&token=251ea696-46e5-4abb-8c2a-ba26ebca5176')
insert into tok_posts values(33,23,'���� #����Ż�� ���� ���� #��','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo36.mp4?alt=media&token=43924a5f-a1a6-4907-8f41-cc7032cebfd4',DATEADD(dd,-1,getdate()),41,2,'���� ���ʱ� �������2�� 92 ��������','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail33.JPG?alt=media&token=6e4ec90d-9309-4f47-bd38-5140d21eb587')
insert into tok_posts values(34,25,'����ϸ� �� �ð���..?','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo37.mp4?alt=media&token=54429bf8-e7ec-46d1-8b5e-9cf889c55d9e',DATEADD(dd,-1,getdate()),58,1,'����Ư���� ������ �������106�� 17 �������� ���� 1��','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail34.JPG?alt=media&token=87761d5d-d684-46bb-a2aa-64e5a6369875')
insert into tok_posts values(35,25,'���ο� #����ä �ڶ����� �̰� ���� #��õ #�ʼ���','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo38.mp4?alt=media&token=e129344f-b1d6-4b98-9606-f6c8a322cbcb',DATEADD(dd,-1,getdate()),14,0,'��� �ϳ��� ���̷� 317','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail35.JPG?alt=media&token=b3f2bc27-382d-412c-8b63-32b83300e34a')
insert into tok_posts values(36,25,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo39.mp4?alt=media&token=2300e42a-2426-48f6-b717-1548b6cb96a5',GETDATE(),15,0,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail36.JPG?alt=media&token=3bc18198-588c-437f-8298-987d500fda06')
insert into tok_posts values(37,26,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo40.mp4?alt=media&token=cec2f160-8094-45c6-8fd9-0869adfaf756',GETDATE(),19,1,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail37.JPG?alt=media&token=678cafbd-3b28-4fe2-b1e3-ecb2b1a86028')
insert into tok_posts values(38,26,'#��Ÿ�����ŷ #����ŷ ���̺���������^^','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo41.mp4?alt=media&token=3e22c648-ad57-49e8-929c-c78a6bff5b21',GETDATE(),21,0,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail38.JPG?alt=media&token=216d40fc-8a24-40e8-af8e-e1382a1947fb')
insert into tok_posts values(39,28,'�������� �Ǳ� ����','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo42.mp4?alt=media&token=45b64d4d-d474-43ba-81e2-fced8cbd4b5c',GETDATE(),27,0,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail39.JPG?alt=media&token=b8701ca7-2dd4-4698-a595-1639f9258a1b')
insert into tok_posts values(40,29,'#�巳 ����','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo43.mp4?alt=media&token=c9643439-c48e-4e06-b08c-22dce79a1492',GETDATE(),38,4,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail40.JPG?alt=media&token=84c056f1-a2a8-4ec7-80d1-3aeebbf6f6ed')

----golf_friends data----
insert into follow values(1,1,3)
insert into follow values(2,1,6)
insert into follow values(3,2,6)
insert into follow values(4,3,8)
insert into follow values(5,3,1)
insert into follow values(6,3,7)
insert into follow values(7,3,9)
insert into follow values(8,6,1)
insert into follow values(9,6,2)
insert into follow values(10,7,3)
insert into follow values(11,8,3)
insert into follow values(12,8,11)
insert into follow values(13,9,3)
insert into follow values(14,9,15)
insert into follow values(15,9,11)
insert into follow values(16,11,8)
insert into follow values(17,11,9)
insert into follow values(18,11,13)
insert into follow values(19,11,15)
insert into follow values(20,13,11)
insert into follow values(21,15,9)
insert into follow values(22,15,1)
insert into follow values(23,16,1)
insert into follow values(24,15,14)
insert into follow values(25,1,14)
insert into follow values(26,17,3)
insert into follow values(27,17,5)
insert into follow values(28,17,9)
insert into follow values(29,18,11)
insert into follow values(30,18,19)
insert into follow values(31,19,18)
insert into follow values(32,19,1)
insert into follow values(33,19,7)
insert into follow values(34,19,17)
insert into follow values(35,20,2)
insert into follow values(36,20,21)
insert into follow values(37,22,3)
insert into follow values(38,2,13)
insert into follow values(39,2,17)
insert into follow values(40,1,19)
insert into follow values(41,1,22)
insert into follow values(42,23,3)
insert into follow values(43,23,4)
insert into follow values(44,24,7)
insert into follow values(45,24,28)
insert into follow values(46,26,12)
insert into follow values(47,26,10)
insert into follow values(48,26,19)
insert into follow values(49,28,1)
insert into follow values(50,29,21)

----nasmo data-----
insert into nasmo values(1,1,'http://techslides.com/demos/sample-videos/small.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail1.JPG?alt=media&token=637d6650-1b51-401c-8d81-27d59ecbc23e')
insert into nasmo values(2,4,'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail9.JPG?alt=media&token=3c4879c5-e5e4-4698-81b9-2080c2d8accc')
insert into nasmo values(3,6,'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail5.JPG?alt=media&token=181fb399-26fa-4bc1-9dd0-1149b93dbe13')
insert into nasmo values(4,16,'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail10.JPG?alt=media&token=e39f5576-5b11-4668-8956-8d17398c7445')
insert into nasmo values(5,10,'https://www.rmp-streaming.com/media/big-buck-bunny-360p.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail7.JPG?alt=media&token=9c7082b6-8327-431b-80ed-10c8acdf6ca7')
insert into nasmo values(6,3,'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail10.JPG?alt=media&token=e39f5576-5b11-4668-8956-8d17398c7445')
insert into nasmo values(7,2,'https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail4.JPG?alt=media&token=cb5a6ad1-e066-48d3-8aca-83a69713983a')
insert into nasmo values(8,6,'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail10.JPG?alt=media&token=e39f5576-5b11-4668-8956-8d17398c7445')
insert into nasmo values(9,16,'https://www.rmp-streaming.com/media/big-buck-bunny-360p.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail7.JPG?alt=media&token=9c7082b6-8327-431b-80ed-10c8acdf6ca7')
insert into nasmo values(10,3,'http://techslides.com/demos/sample-videos/small.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail1.JPG?alt=media&token=637d6650-1b51-401c-8d81-27d59ecbc23e')
insert into nasmo values(11,16,'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail9.JPG?alt=media&token=3c4879c5-e5e4-4698-81b9-2080c2d8accc')
insert into nasmo values(12,16,'https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail4.JPG?alt=media&token=cb5a6ad1-e066-48d3-8aca-83a69713983a')
insert into nasmo values(13,13,'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail10.JPG?alt=media&token=e39f5576-5b11-4668-8956-8d17398c7445')
insert into nasmo values(14,10,'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail5.JPG?alt=media&token=181fb399-26fa-4bc1-9dd0-1149b93dbe13')
insert into nasmo values(15,7,'https://vt.tumblr.com/tumblr_o600t8hzf51qcbnq0_480.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail11.JPG?alt=media&token=b968e3bc-be41-466c-a9d1-003632ac1685')
insert into nasmo values(16,10,'https://vt.tumblr.com/tumblr_o600t8hzf51qcbnq0_480.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail11.JPG?alt=media&token=b968e3bc-be41-466c-a9d1-003632ac1685')
insert into nasmo values(17,10,'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail8.JPG?alt=media&token=2ce56ea7-9529-48fb-b808-3b5c9886918a')
insert into nasmo values(18,16,'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail8.JPG?alt=media&token=2ce56ea7-9529-48fb-b808-3b5c9886918a')

----comments data----
insert into comments values(1,1,4,'������!!',DATEADD(dd,-4,getdate()),2,'1','0',0)
insert into comments values(2,1,1,'�����մϴ٤�����',DATEADD(dd,-4,getdate()),1,'1','1',1)
insert into comments values(3,6,2,'���߿� ������ ���� �Ŀ䤾��',DATEADD(dd,-4,getdate()),1,'4','0',0)
insert into comments values(4,7,8,'�Ƿ��� �� ���̳׿䤻����',DATEADD(dd,-3,getdate()),4,'5','0',0)
insert into comments values(5,7,12,'���� ���� ���ƿ�',DATEADD(dd,-3,getdate()),2,'7','0',0)
insert into comments values(6,7,5,'���� �����մϴ� ����',DATEADD(dd,-3,getdate()),1,'5','1',1)
insert into comments values(7,7,5,'�����մϴ� ���߿� ���� �Ŀ�~~',DATEADD(dd,-3,getdate()),3,'7','1',1)
insert into comments values(8,7,12,'���� ���� �� �� �ҷ��ּ��䤾����',DATEADD(dd,-2,getdate()),3,'7','2',1)
insert into comments values(9,3,11,'�������Űſ��䤻������',DATEADD(dd,-2,getdate()),0,'3','0',0)
insert into comments values(10,8,1,'������ �ÿ��ϳ׿�',DATEADD(dd,-2,getdate()),3,'10','0',0)
insert into comments values(11,7,5,'�פ���',DATEADD(dd,-2,getdate()),3,'7','3',1)
insert into comments values(12,8,8,'�����մϴ٤���������� ���׿�',DATEADD(dd,-2,getdate()),2,'10','1',1)
insert into comments values(13,10,4,'�����ΰ��䤻����',DATEADD(dd,-1,getdate()),0,'13','0',0)
insert into comments values(14,10,5,'���� �ÿ��ϳ�~~',DATEADD(dd,-1,getdate()),2,'14','1',0)
insert into comments values(15,10,13,'���� ���ΰ�������??',DATEADD(dd,-1,getdate()),4,'15','2',0)
insert into comments values(16,12,7,'���߿� ���� ����!!',DATEADD(dd,-1,getdate()),3,'16','0',0)
insert into comments values(17,13,10,'����������',DATEADD(dd,-1,getdate()),3,'17','0',0)
insert into comments values(18,13,9,'����������ť',DATEADD(dd,-1,getdate()),0,'17','1',1)
insert into comments values(19,13,10,'�츮 ������??',DATEADD(dd,-1,getdate()),1,'19','0',0)
insert into comments values(20,15,9,'���� ģ���ؿ䤾����',DATEADD(dd,-1,getdate()),2,'20','0',0)
insert into comments values(21,15,2,'���ƿ� ��û�߾��~',GETDATE(),5,'20','1',1)
insert into comments values(22,15,15,'���� �ص� �ǳ��뤻������',GETDATE(),3,'20','2',1)
insert into comments values(23,18,3,'�츮 ���� ���� ��?','2021-07-21 22:10:22.280',7,'23','0',0)
insert into comments values(24,18,2,'�ָ� ����',GETDATE(),3,'23','1',1)
insert into comments values(25,18,3,'�Ͽ��Ͽ� ����?',GETDATE(),0,'23','2',1)
insert into comments values(26,18,2,'���������Ͽ� ��',GETDATE(),0,'23','3',1)
insert into comments values(27,18,3,'2��?',GETDATE(),4,'23','4',1)
insert into comments values(28,19,12,'�ʺ��� �Ƿ��� �ƴѵ�???����',GETDATE(),2,'28','0',0)
insert into comments values(29,19,6,'�������� 3�����ۿ� �ȵƾ��',GETDATE(),6,'28','1',1)
insert into comments values(30,18,6,'����������',GETDATE(),6,'30','0',0)
insert into comments values(31,18,6,'��վ� ���δ٤�����',GETDATE(),6,'31','0',0)
insert into comments values(32,24,16,'�̤̤̤�',GETDATE(),2,'32','0',0)
insert into comments values(33,24,8,'��ʹ��Ϳ��',GETDATE(),11,'33','0',0)
insert into comments values(34,24,19,'���� ��򰡿�??',GETDATE(),1,'34','0',0)
insert into comments values(35,24,25,'���Ǻ���!!',GETDATE(),4,'33','1',1)
insert into comments values(36,30,2,'�� ġ�ó׿�! ������ �ÿ��մϴ�~',GETDATE(),22,'36','0',0)
insert into comments values(37,30,7,'�����մϴ٤����β����׿�',GETDATE(),3,'36','1',1)
insert into comments values(38,35,29,'��� ��̳���? ������ �ּ���',GETDATE(),10,'38','0',0)
insert into comments values(39,35,17,'�����ּ���~',GETDATE(),1,'38','1',1)
insert into comments values(40,35,11,'���� ��� ���ƾ� �մϴ٤�����',GETDATE(),25,'40','0',0)
insert into comments values(41,36,6,'�����ؿ�~',GETDATE(),8,'41','0',0)
insert into comments values(42,36,6,'�Ƿ��� �� �þ��פ���������',GETDATE(),31,'42','0',0)
insert into comments values(43,39,6,'����ŷ ��� �ϼ���??',GETDATE(),5,'43','0',0)
insert into comments values(44,39,6,'�� �Դϴ�!!!',GETDATE(),11,'44','0',0)

----hashtag data----
insert into hashtag values(1,5,'�ÿ����ѹ�')
insert into hashtag values(2,5,'����')
insert into hashtag values(3,5,'���̽���')
insert into hashtag values(4,6,'���ó������̷�')
insert into hashtag values(5,9,'��ũ��������')
insert into hashtag values(6,9,'�ڼ��Ҿ���')
insert into hashtag values(7,9,'�����ʺ�')
insert into hashtag values(8,11,'����')
insert into hashtag values(9,11,'����')
insert into hashtag values(10,11,'���ƿ�')
insert into hashtag values(11,11,'������')
insert into hashtag values(12,17,'����')
insert into hashtag values(13,17,'����')
insert into hashtag values(14,20,'�Ƿ�')
insert into hashtag values(15,23,'�����')
insert into hashtag values(16,24,'�۽�Ÿ�׷�')
insert into hashtag values(17,24,'������')
insert into hashtag values(18,24,'�����')
insert into hashtag values(19,24,'����')
insert into hashtag values(20,25,'�۽�Ÿ�׷�')
insert into hashtag values(21,29,'����')
insert into hashtag values(22,29,'����')
insert into hashtag values(23,31,'���̽���')
insert into hashtag values(24,31,'���ƿ�')
insert into hashtag values(25,33,'����Ż��')
insert into hashtag values(26,33,'��')
insert into hashtag values(27,35,'����ä')
insert into hashtag values(28,35,'��õ')
insert into hashtag values(29,35,'�ʼ���')
insert into hashtag values(30,38,'��Ÿ�����ŷ')
insert into hashtag values(31,38,'����ŷ')
insert into hashtag values(32,40,'�巳')

----post_like data----
insert into post_like values(1,12,14)
insert into post_like values(2,12,10)
insert into post_like values(3,12,7)
insert into post_like values(4,2,6)
insert into post_like values(5,2,6)
insert into post_like values(6,3,1)
insert into post_like values(7,5,15)
insert into post_like values(8,5,12)
insert into post_like values(9,5,13)
insert into post_like values(10,6,1)
insert into post_like values(11,6,2)
insert into post_like values(12,6,3)
insert into post_like values(13,6,7)
insert into post_like values(14,7,18)
insert into post_like values(15,7,14)
insert into post_like values(16,8,10)
insert into post_like values(17,8,1)
insert into post_like values(18,8,5)
insert into post_like values(19,8,6)
insert into post_like values(20,8,9)
insert into post_like values(21,9,10)
insert into post_like values(22,9,15)
insert into post_like values(23,9,11)
insert into post_like values(24,11,7)
insert into post_like values(25,11,8)
insert into post_like values(26,11,17)
insert into post_like values(27,12,22)
insert into post_like values(28,13,23)
insert into post_like values(29,13,28)
insert into post_like values(30,13,4)
insert into post_like values(31,13,7)
insert into post_like values(32,14,16)
insert into post_like values(33,14,29)
insert into post_like values(34,14,22)
insert into post_like values(35,14,21)
insert into post_like values(36,14,6)
insert into post_like values(37,16,4)
insert into post_like values(38,16,3)
insert into post_like values(39,18,1)
insert into post_like values(40,18,11)
insert into post_like values(41,18,19)
insert into post_like values(42,19,27)
insert into post_like values(43,20,25)

----comment_like----
insert into comment_like values(1,1,11)
insert into comment_like values(2,2,10)
insert into comment_like values(3,2,5)
insert into comment_like values(4,4,6)
insert into comment_like values(5,4,2)
insert into comment_like values(6,4,1)
insert into comment_like values(7,4,15)
insert into comment_like values(8,5,12)
insert into comment_like values(9,5,13)
insert into comment_like values(10,6,1)
insert into comment_like values(11,6,12)
insert into comment_like values(12,6,3)
insert into comment_like values(13,6,10)
insert into comment_like values(14,9,18)
insert into comment_like values(15,9,11)
insert into comment_like values(16,9,4)
insert into comment_like values(17,9,1)
insert into comment_like values(18,11,5)
insert into comment_like values(19,11,13)
insert into comment_like values(20,13,5)
insert into comment_like values(21,13,14)
insert into comment_like values(22,13,5)
insert into comment_like values(23,14,3)
insert into comment_like values(24,15,18)
insert into comment_like values(25,15,17)
insert into comment_like values(26,16,13)
insert into comment_like values(27,18,12)
insert into comment_like values(28,18,24)
insert into comment_like values(29,18,28)
insert into comment_like values(30,19,29)
insert into comment_like values(31,20,30)
insert into comment_like values(32,20,21)
insert into comment_like values(33,20,23)
insert into comment_like values(34,20,24)
insert into comment_like values(35,21,8)
insert into comment_like values(36,22,9)
insert into comment_like values(37,23,10)
insert into comment_like values(38,26,14)
insert into comment_like values(39,26,23)
insert into comment_like values(40,27,24)

