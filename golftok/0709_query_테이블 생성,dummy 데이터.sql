use MDPRJ

------------------drop table-------------------
DROP TABLE friend_request
DROP TABLE golf_friends
DROP TABLE nasmo
DROP TABLE comments
DROP TABLE tok_posts
DROP TABLE tok_users


----------------golf tok ���̺� ���� ����-----------------
----users-----
create table tok_users (
	user_id int primary key,
	user_name nvarchar(20) not null,
	user_nickname nvarchar(20) not null,
	user_password nvarchar(30) not null,
	user_icon nvarchar(200),
	friend_count int not null,
	introduction_message nvarchar(200),
	account_access nvarchar(15) not null,
	user_age int not null
)

----posts----
create table tok_posts (
	post_id int primary key,
	user_id int FOREIGN KEY REFERENCES tok_users(user_id),
	post_content nvarchar(800),
	video_root nvarchar(600),
	upload_date datetime not null,
	post_access nvarchar(20) not null,
	like_count int not null,
	comment_count int not null,
	locations nvarchar(200)
)

----golf_friends----
create table golf_friends(
	golf_friend_id int primary key,
	user_id int FOREIGN KEY REFERENCES tok_users(user_id),
	friend_id int not null
)

----friend_request-----
create table friend_request(
	request_id int primary key,
	user_id int FOREIGN KEY REFERENCES tok_users(user_id),
	requested_id int not null,
	request_date datetime not null
)

----comments-----
create table comments(
	comment_id int primary key,
	post_id int FOREIGN KEY REFERENCES tok_posts(post_id),
	comment_text nvarchar(200),
	upload_date datetime not null,
	like_count int not null,
	comment_group nvarchar(10) not null,
	group_order nvarchar(10) not null,
	group_layer int not null
)

-----nasmo-----
create table nasmo(
	nasmo_id int primary key,
	user_id int FOREIGN KEY REFERENCES tok_users(user_id),
	video_root nvarchar(600) not null,
)


-----users data-----
insert into tok_users values (1,'mul1234','mul1234','mul4321','D:\golfzon\project_golftok\sample_image\image2.jpg',2,'�ȳ��ϼ���!','public',28)
insert into tok_users values (2,'hok333','hok333','ȩ123','D:\golfzon\project_golftok\sample_image\image3.jpg',1,'ȩ���Դϴ�','public',29)
insert into tok_users values (3,'qaz1234','qaz1234','qaz1234','D:\golfzon\project_golftok\sample_image\image4.jpg',0,'������','private',36)
insert into tok_users values (4,'qwer111','qwer111','qwer111','D:\golfzon\project_golftok\sample_image\image5.jpg',4,'','protected',33)
insert into tok_users values (5,'qsxc000','qsxc000','������õ��','D:\golfzon\project_golftok\sample_image\image6.jpg',0,'���� �����ؿ�!','public',42)
insert into tok_users values (6,'popo333','popo333','������','D:\golfzon\project_golftok\sample_image\image7.jpg',2,'���� ���� ĥ �� ���մϴ�','public',24)
insert into tok_users values (7,'progolf567','progolf567','���ΰ���','D:\golfzon\project_golftok\sample_image\image8.jpg',1,'','protected',37)
insert into tok_users values (8,'gfdsa989','gfdsa989','���������̽���','D:\golfzon\project_golftok\sample_image\image9.jpg',2,'���� ��ġ�� �� �� ����!','public',36)
insert into tok_users values (9,'hansu310','hansu310','�Ѽ�','D:\golfzon\project_golftok\sample_image\image10.jpg',3,'','private',31)
insert into tok_users values (10,'hany456','hany456','�����ֿ���','D:\golfzon\project_golftok\sample_image\image12.jpg',0,'�� ��Ź�����','public',22)
insert into tok_users values (11,'ffrrt009','ffrrt009','ffrrt009','',4,'','public',36)
insert into tok_users values (12,'apple123','apple123','�������Ƹ�','',0,'���� ���� ���Ƹ� �Դϴ٤���','protected',38)
insert into tok_users values (13,'banana454','banana454','����������','D:\golfzon\project_golftok\sample_image\image13.jpg',1,'����ģ�� ��û ���� ���ּ���','public',44)
insert into tok_users values (14,'grayjam383','grayjam383','gray_jam','D:\golfzon\project_golftok\sample_image\image14.jpg',0,'','public',29)
insert into tok_users values (15,'hamberger5556','hamberger5556','�ܹ���','D:\golfzon\project_golftok\sample_image\image15.jpg',2,'','private',34)

----tok_posts data-----
insert into tok_posts values(1,1,'���̽���','http://techslides.com/demos/sample-videos/small.mp4',GETDATE(),'public',3,2,'����Ư���� ������ ������ 510 ')
insert into tok_posts values(2,1,'���̽���^.^','D:\golfzon\project_golftok\sample_video\testVideo2.mp4',GETDATE(),'public',2,0,'����Ư���� ������ ������81�� 28')
insert into tok_posts values(3,2,'','D:\golfzon\project_golftok\sample_video\testVideo5.mp4',GETDATE(),'public',1,1,'����Ư���� ������ ������ 833 ������')
insert into tok_posts values(4,4,'�ɽ��ϴ�','https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4',GETDATE(),'private',0,0,'����Ư���� ���빮�� ���ҹ��� 37 �����δ������')
insert into tok_posts values(5,5,'','D:\golfzon\project_golftok\sample_video\testVideo1.mp4',GETDATE(),'protected',3,0,'����Ư���� �߶��� �븶���129���� 6 4��')
insert into tok_posts values(6,6,'������ �� ġ�� �ɱ�?�̤�','https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',GETDATE(),'protected',4,1,'����Ư���� ����� ���Ϸ�248�� 16 ������ũ��')
insert into tok_posts values(7,5,'������ ���� �� ������ ��','D:\golfzon\project_golftok\sample_video\testVideo3.mp4',GETDATE(),'public',2,4,'����Ư���� ���Ǳ� ���Ƿ�15�� 23-11 ���Ǹƽ��� B1')
insert into tok_posts values(8,8,'���� ��ǥ�� ����!!','http://techslides.com/demos/sample-videos/small.mp4',GETDATE(),'private',24,1,'')
insert into tok_posts values(9,8,'��������!','D:\golfzon\project_golftok\sample_video\testVideo6.mp4',GETDATE(),'public',9,0,'����Ư���� �߶��� �븶���129���� 6 4��')
insert into tok_posts values(10,8,'�ٷ� ���� �Ѱ� ������','D:\golfzon\project_golftok\sample_video\testVideo7.mp4',GETDATE(),'public',3,3,'����Ư���� ���� ���Ϸ�83�� 6-29 ��������')
insert into tok_posts values(11,3,'','D:\golfzon\project_golftok\sample_video\testVideo8.mp4',GETDATE(),'private',0,0,'����Ư���� �������� �ǻ���� 127 �Ե�ĳ�������̾�')
insert into tok_posts values(12,4,'','D:\golfzon\project_golftok\sample_video\testVideo9.mp4',GETDATE(),'protected',3,1,'����Ư���� ���빮�� ������ 36 ���ο��ݺ���')
insert into tok_posts values(13,9,'�ɽ��ؤѤ�','D:\golfzon\project_golftok\sample_video\testVideo10.mp4',GETDATE(),'public',11,3,'����Ư���� ���� �������� 94 �ＺŸ�����Ʈ�� ����1��')
insert into tok_posts values(14,2,'���� �־��٤̤̤� ���� ���۰� �Ǵ� �� ������!!!','D:\golfzon\project_golftok\sample_video\testVideo11.mp4',GETDATE(),'public',1,0,'����Ư���� ������ ������81�� 28')
insert into tok_posts values(15,2,'�ڼ� ���̷��� ��������','D:\golfzon\project_golftok\sample_video\testVideo12.mp4',GETDATE(),'public',7,3,'����Ư���� ����� ������ 688 5��')
insert into tok_posts values(16,10,'','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',GETDATE(),'public',2,0,'����Ư���� ���빮�� ȫ���߾ӷ� 29')
insert into tok_posts values(17,3,'','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',GETDATE(),'protected',0,0,'')
insert into tok_posts values(18,2,'','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',GETDATE(),'public',33,5,'����Ư���� ���� ����� 315 1��.����1�� ��ũ��������')
insert into tok_posts values(19,6,'�ʹ� ������������','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',GETDATE(),'public',13,2,'����Ư���� �߶��� �븶���129���� 6 4��')
insert into tok_posts values(20,8,'test!','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',GETDATE(),'public',8,0,'����Ư���� ����� ���Ϸ� 986 ��������̾���� ����2��')


----golf_friends data-----
insert into golf_friends values(1,1,3)
insert into golf_friends values(2,1,6)
insert into golf_friends values(3,2,6)
insert into golf_friends values(4,3,8)
insert into golf_friends values(5,3,1)
insert into golf_friends values(6,3,7)
insert into golf_friends values(7,3,9)
insert into golf_friends values(8,6,1)
insert into golf_friends values(9,6,2)
insert into golf_friends values(10,7,3)
insert into golf_friends values(11,8,3)
insert into golf_friends values(12,8,11)
insert into golf_friends values(13,9,3)
insert into golf_friends values(14,9,15)
insert into golf_friends values(15,9,11)
insert into golf_friends values(16,11,8)
insert into golf_friends values(17,11,9)
insert into golf_friends values(18,11,13)
insert into golf_friends values(19,11,15)
insert into golf_friends values(20,13,11)
insert into golf_friends values(21,15,9)
insert into golf_friends values(22,15,11)

-----nasmo data------
insert into nasmo values(1,1,'http://techslides.com/demos/sample-videos/small.mp4')
insert into nasmo values(2,4,'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4')
insert into nasmo values(3,6,'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4.mp4')
insert into nasmo values(4,8,'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4')
insert into nasmo values(5,10,'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4')
insert into nasmo values(6,3,'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4')
insert into nasmo values(7,2,'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4')
insert into nasmo values(8,6,'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4')
insert into nasmo values(9,8,'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4')

----comments data-----
insert into comments values(1,1,'������!!',GETDATE(),2,'1','0',0)
insert into comments values(2,1,'�����մϴ٤�����',GETDATE(),1,'1','1',1)
insert into comments values(3,6,'���߿� ������ ���� �Ŀ䤾��',GETDATE(),1,'4','0',0)
insert into comments values(4,7,'�Ƿ��� �� ���̳׿䤻����',GETDATE(),4,'5','0',0)
insert into comments values(5,7,'���� ���� ���ƿ�',GETDATE(),2,'7','0',0)
insert into comments values(6,7,'���� �����մϴ� ����',GETDATE(),1,'5','1',1)
insert into comments values(7,7,'�����մϴ� ���߿� ���� �Ŀ�~~',GETDATE(),3,'7','1',1)
insert into comments values(8,7,'���� ���� �� �� �ҷ��ּ��䤾����',GETDATE(),3,'7','2',1)
insert into comments values(9,3,'�������Űſ��䤻������',GETDATE(),0,'3','0',0)
insert into comments values(10,8,'������ �ÿ��ϳ׿�',GETDATE(),3,'10','0',0)
insert into comments values(11,7,'�פ���',GETDATE(),3,'7','3',1)
insert into comments values(12,8,'�����մϴ٤���������� ���׿�',GETDATE(),2,'10','1',1)
insert into comments values(13,10,'�����ΰ��䤻����',GETDATE(),0,'13','0',0)
insert into comments values(14,10,'���� �ÿ��ϳ�~~',GETDATE(),2,'14','1',0)
insert into comments values(15,10,'���� ���ΰ�������??',GETDATE(),4,'15','2',0)
insert into comments values(16,12,'���߿� ���� ����!!',GETDATE(),3,'16','0',0)
insert into comments values(17,13,'����������',GETDATE(),3,'17','0',0)
insert into comments values(18,13,'����������ť',GETDATE(),0,'17','1',1)
insert into comments values(19,13,'�츮 ������??',GETDATE(),1,'19','0',0)
insert into comments values(20,15,'���� ģ���ؿ䤾����',GETDATE(),2,'20','0',0)
insert into comments values(21,15,'���ƿ� ��û�߾��~',GETDATE(),5,'20','1',1)
insert into comments values(22,15,'���� �ص� �ǳ��뤻������',GETDATE(),3,'20','2',1)
insert into comments values(23,18,'�츮 ���� ���� �ĤѤ�',GETDATE(),7,'23','0',0)
insert into comments values(24,18,'�ָ� ����',GETDATE(),3,'23','1',1)
insert into comments values(25,18,'�� �Ͽ��ϸ� ���ɤ�',GETDATE(),0,'23','2',1)
insert into comments values(26,18,'���������Ͽ� ��',GETDATE(),0,'23','3',1)
insert into comments values(27,18,'2�ä�?',GETDATE(),4,'23','4',1)
insert into comments values(28,19,'�ʺ��� �Ƿ��� �ƴѵ�???����',GETDATE(),2,'28','0',0)
insert into comments values(29,19,'�������� 3�����ۿ� �ȵƾ��',GETDATE(),6,'28','1',1)

