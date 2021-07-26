use MDPRJ

------------------drop table-------------------
DROP TABLE hashtag
DROP TABLE follow
DROP TABLE nasmo
DROP TABLE comments
DROP TABLE tok_posts
DROP TABLE tok_users


----------------golf tok ���̺� ���� ����-----------------
----users-----
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
	user_id int FOREIGN KEY REFERENCES tok_users(user_id),
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

----comments-----
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

-----nasmo-----
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


-----users data-----
insert into tok_users values (1,'mul1234','mul1234','mul4321','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage2.jpg?alt=media&token=1cf84666-7c3b-42e9-9050-1fee04eaf2c6','�ȳ��ϼ���!',28,'������',5,6)
insert into tok_users values (2,'hok333','hok333','ȩ123','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage3.jpg?alt=media&token=c63ed6ca-b4b4-4ee5-84f7-ac61b917a8e1','ȩ���Դϴ�',29,'����',3,2)
insert into tok_users values (3,'qaz1234','qaz1234','qaz1234','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage4.jpg?alt=media&token=3128f63c-c852-4a99-a7ba-04aef0a2dd18','������',36,'��',4,1)
insert into tok_users values (4,'qwer111','qwer111','qwer111','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage5.jpg?alt=media&token=feb4afed-ead7-46f4-8753-dd2d5a321f22','',33,'����',1,0)
insert into tok_users values (5,'qsxc000','qsxc000','������õ��','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage6.jpg?alt=media&token=6f7d029a-8c1a-4849-8760-d697f3ef5ec2','���� �����ؿ�!',42,'����',3,0)
insert into tok_users values (6,'popo333','popo333','������','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage7.jpg?alt=media&token=0c36198b-64a1-4933-8ed9-ed701adc7d62','���� ���� ĥ �� ���մϴ�',24,'��',3,7)
insert into tok_users values (7,'progolf567','progolf567','���ΰ���','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage8.jpg?alt=media&token=5e211670-712d-4517-b25f-c1e2e8ef0846','',37,'������',4,5)
insert into tok_users values (8,'gfdsa989','gfdsa989','���������̽���','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage9.jpg?alt=media&token=8f33d1e7-8c75-49d5-9131-b643991129c7','���� ��ġ�� �� �� ����!',36,'����',1,2)
insert into tok_users values (9,'hansu310','hansu310','�Ѽ�','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage10.jpg?alt=media&token=82a796be-de05-41a3-9c10-2be274285592','',31,'����',3,1)
insert into tok_users values (10,'hany456','hany456','�����ֿ���','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage11.jpg?alt=media&token=4d725b28-a948-494b-a932-9ad852045afc','�� ��Ź�����',22,'������',3,6)
insert into tok_users values (11,'ffrrt009','ffrrt009','ffrrt009','','',36,'��',4,6)
insert into tok_users values (12,'apple123','apple123','�������Ƹ�','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage12.jpg?alt=media&token=778c04a7-0490-4909-8a07-c8ddaaaf4ae1','���� ���� ���Ƹ� �Դϴ٤���',38,'��',5,3)
insert into tok_users values (13,'banana454','banana454','����������','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage13.jpg?alt=media&token=c5800a00-cfd1-4956-8ca0-6eed6c2ca23d','����ģ�� ��û ���� ���ּ���',44,'������',2,3)
insert into tok_users values (14,'grayjam383','grayjam383','gray_jam','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage14.jpg?alt=media&token=8b8dc51a-2253-40e7-93cf-8cee994e0c30','',29,'����',3,2)
insert into tok_users values (15,'hamberger5556','hamberger5556','�ܹ���','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage15.jpg?alt=media&token=2cc41728-eaf2-4d4f-a1ef-769b1d8610c7','',34,'����',5,2)

----tok_posts data-----
insert into tok_posts values(1,1,'���̽��� #���ƿ�','http://techslides.com/demos/sample-videos/small.mp4','2021-07-07 10:11:22.280',3,2,'����Ư���� ������ ������ 510','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail1.JPG?alt=media&token=637d6650-1b51-401c-8d81-27d59ecbc23e')
insert into tok_posts values(2,1,'���̽���^.^','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4','2021-07-07 11:11:22.280',2,0,'����Ư���� ������ ������81�� 28','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail2.JPG?alt=media&token=656d194c-2c52-4349-92c9-a09bc17a74e9')
insert into tok_posts values(3,2,'���� ���� ġ�� ��?','https://www.dropbox.com/s/df2d2gf1dvnr5uj/Sample_1280x720_mp4','2021-07-07 17:11:22.280',1,1,'����Ư���� ������ ������ 833 ������','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail3.JPG?alt=media&token=7f226d1c-e2b4-4ef7-bbf7-e8b30c808414')
insert into tok_posts values(4,4,'�ɽ��ϴ�','https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4','2021-07-07 11:11:22.280',0,0,'����Ư���� ���빮�� ���ҹ��� 37 �����δ������','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail4.JPG?alt=media&token=cb5a6ad1-e066-48d3-8aca-83a69713983a')
insert into tok_posts values(5,5,'','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4','2021-07-08 11:11:22.280',3,0,'����Ư���� �߶��� �븶���129���� 6 4��','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail2.JPG?alt=media&token=656d194c-2c52-4349-92c9-a09bc17a74e9')
insert into tok_posts values(6,6,'������ �� ġ�� �ɱ�?�̤�','https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4','2021-07-08 11:11:22.280',4,1,'����Ư���� ����� ���Ϸ�248�� 16 ������ũ��','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail5.JPG?alt=media&token=181fb399-26fa-4bc1-9dd0-1149b93dbe13')
insert into tok_posts values(7,5,'������ ���� �� ������ ��','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4','2021-07-09 22:10:22.280',2,4,'����Ư���� ���Ǳ� ���Ƿ�15�� 23-11 ���Ǹƽ��� B1','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail6.JPG?alt=media&token=f7f59013-1654-4bed-a550-49d40250a1a0')
insert into tok_posts values(8,8,'���� ��ǥ�� ����!!','http://techslides.com/demos/sample-videos/small.mp4','2021-07-09 01:11:22.280',24,1,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail1.JPG?alt=media&token=637d6650-1b51-401c-8d81-27d59ecbc23e')
insert into tok_posts values(9,8,'���� #��ũ�������� �� ��ȹ �����µ� ģ�� ���� ������ #�ڼ��Ҿ��� #�����ʺ�','https://www.rmp-streaming.com/media/big-buck-bunny-360p.mp4','2021-07-10 11:11:22.280',9,0,'����Ư���� �߶��� �븶���129���� 6 4��','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail7.JPG?alt=media&token=9c7082b6-8327-431b-80ed-10c8acdf6ca7')
insert into tok_posts values(10,8,'�ٷ� ���� �Ѱ� ������','https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4','2021-07-10 14:11:22.280',3,3,'����Ư���� ���� ���Ϸ�83�� 6-29 ��������','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail4.JPG?alt=media&token=cb5a6ad1-e066-48d3-8aca-83a69713983a')
insert into tok_posts values(11,3,'#���� #���� #���ƿ� #������','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4','2021-07-12 17:11:22.280',0,0,'����Ư���� �������� �ǻ���� 127 �Ե�ĳ�������̾�','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail2.JPG?alt=media&token=656d194c-2c52-4349-92c9-a09bc17a74e9')
insert into tok_posts values(12,4,'','https://www.dropbox.com/s/df2d2gf1dvnr5uj/Sample_1280x720_mp4','2021-07-13 17:11:22.280',3,1,'����Ư���� ���빮�� ������ 36 ���ο��ݺ���','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail3.JPG?alt=media&token=7f226d1c-e2b4-4ef7-bbf7-e8b30c808414')
insert into tok_posts values(13,9,'�ɽ��ؤѤ�','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4','2021-07-12 22:37:22.280',11,3,'����Ư���� ���� �������� 94 �ＺŸ�����Ʈ�� ����1��','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail6.JPG?alt=media&token=f7f59013-1654-4bed-a550-49d40250a1a0')
insert into tok_posts values(14,2,'���� �־��٤̤̤� #���ΰ��� �� �Ǵ� �� ������!!!','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4','2021-07-13 14:11:22.280',1,0,'����Ư���� ������ ������81�� 28','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail2.JPG?alt=media&token=656d194c-2c52-4349-92c9-a09bc17a74e9')
insert into tok_posts values(15,2,'�ڼ� ���̷��� ��������','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4','2021-07-13 14:11:22.280',7,3,'����Ư���� ����� ������ 688 5��','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail8.JPG?alt=media&token=2ce56ea7-9529-48fb-b808-3b5c9886918a')
insert into tok_posts values(16,10,'','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4','2021-07-14 20:11:22.280',2,0,'����Ư���� ���빮�� ȫ���߾ӷ� 29','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail9.JPG?alt=media&token=3c4879c5-e5e4-4698-81b9-2080c2d8accc')
insert into tok_posts values(17,3,'#���� 1���� #����','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4','2021-07-14 23:11:22.280',0,0,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail8.JPG?alt=media&token=2ce56ea7-9529-48fb-b808-3b5c9886918a')
insert into tok_posts values(18,2,'','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4','2021-07-15 18:11:22.280',33,5,'����Ư���� ���� ����� 315 1��.����1�� ��ũ��������','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail10.JPG?alt=media&token=e39f5576-5b11-4668-8956-8d17398c7445')
insert into tok_posts values(19,6,'�ʹ� ������������','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4','2021-07-15 09:53:22.280',13,2,'����Ư���� �߶��� �븶���129���� 6 4��','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail10.JPG?alt=media&token=e39f5576-5b11-4668-8956-8d17398c7445')
insert into tok_posts values(20,3,'���� #�Ƿ� �� �þ�°� ������ �ѵ��ϴ٤���','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4','2021-07-16 11:53:22.280',8,0,'����Ư���� ����� ���Ϸ� 986 ��������̾���� ����2��','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail8.JPG?alt=media&token=2ce56ea7-9529-48fb-b808-3b5c9886918a')
insert into tok_posts values(21,8,'','https://vt.tumblr.com/tumblr_o600t8hzf51qcbnq0_480.mp4','2021-07-16 13:03:22.280',3,1,'����Ư���� ���� �������� 94 �ＺŸ�����Ʈ�� ����1��','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail11.JPG?alt=media&token=b968e3bc-be41-466c-a9d1-003632ac1685')
insert into tok_posts values(22,3,'�ÿ��� �ѹ�~','http://techslides.com/demos/sample-videos/small.mp4','2021-07-16 14:15:22.280',12,2,'����Ư���� �������� �ǻ���� 127 �Ե�ĳ�������̾�','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail1.JPG?alt=media&token=637d6650-1b51-401c-8d81-27d59ecbc23e')
insert into tok_posts values(23,4,'','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',GETDATE(),14,5,'����Ư���� ����� ���Ϸ� 986 ��������̾���� ����2��','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail9.JPG?alt=media&token=3c4879c5-e5e4-4698-81b9-2080c2d8accc')
insert into tok_posts values(24,4,'���� #���� Ż���ΰ� ����','https://www.rmp-streaming.com/media/big-buck-bunny-360p.mp4',GETDATE(),8,0,'����Ư���� ����� ���Ϸ�234�� 27','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail7.JPG?alt=media&token=9c7082b6-8327-431b-80ed-10c8acdf6ca7')
insert into tok_posts values(25,9,'�ʹ� ���٤̤�','https://vt.tumblr.com/tumblr_o600t8hzf51qcbnq0_480.mp4',GETDATE(),5,1,'����Ư���� ����� ����� 258 �ǿ��ȴϹ�ȭ��','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail11.JPG?alt=media&token=b968e3bc-be41-466c-a9d1-003632ac1685')
insert into tok_posts values(26,14,'«���� ġ���� #���� ^^','https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4',GETDATE(),0,0,'����Ư���� ����� ����� 31 �׶�������Ʈ','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail4.JPG?alt=media&token=cb5a6ad1-e066-48d3-8aca-83a69713983a')
insert into tok_posts values(27,13,'','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',GETDATE(),3,0,'����Ư���� ������ ���μ�ȯ��370�� 33','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail10.JPG?alt=media&token=e39f5576-5b11-4668-8956-8d17398c7445')
insert into tok_posts values(28,10,'','https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',GETDATE(),17,3,'����Ư���� ������ ������� 721 ���� 1��','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail5.JPG?alt=media&token=181fb399-26fa-4bc1-9dd0-1149b93dbe13')
insert into tok_posts values(29,7,'���� �� �� #��ũ�������� �ε� �����ϰ� �±�','https://vt.tumblr.com/tumblr_o600t8hzf51qcbnq0_480.mp4',GETDATE(),11,2,'����Ư���� ����� ���Ϸ� 986 ��������̾���� ����2��','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail11.JPG?alt=media&token=b968e3bc-be41-466c-a9d1-003632ac1685')
insert into tok_posts values(30,7,'','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',GETDATE(),1,0,'����Ư���� ������ �������106�� 17 �������� ���� 1��','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail10.JPG?alt=media&token=e39f5576-5b11-4668-8956-8d17398c7445')


----golf_friends data-----
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
insert into follow values(22,15,11)

-----nasmo data------
insert into nasmo values(1,1,'http://techslides.com/demos/sample-videos/small.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail1.JPG?alt=media&token=637d6650-1b51-401c-8d81-27d59ecbc23e')
insert into nasmo values(2,4,'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail9.JPG?alt=media&token=3c4879c5-e5e4-4698-81b9-2080c2d8accc')
insert into nasmo values(3,6,'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail5.JPG?alt=media&token=181fb399-26fa-4bc1-9dd0-1149b93dbe13')
insert into nasmo values(4,8,'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail10.JPG?alt=media&token=e39f5576-5b11-4668-8956-8d17398c7445')
insert into nasmo values(5,10,'https://www.rmp-streaming.com/media/big-buck-bunny-360p.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail7.JPG?alt=media&token=9c7082b6-8327-431b-80ed-10c8acdf6ca7')
insert into nasmo values(6,3,'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail10.JPG?alt=media&token=e39f5576-5b11-4668-8956-8d17398c7445')
insert into nasmo values(7,2,'https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail4.JPG?alt=media&token=cb5a6ad1-e066-48d3-8aca-83a69713983a')
insert into nasmo values(8,6,'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail10.JPG?alt=media&token=e39f5576-5b11-4668-8956-8d17398c7445')
insert into nasmo values(9,8,'https://www.rmp-streaming.com/media/big-buck-bunny-360p.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail7.JPG?alt=media&token=9c7082b6-8327-431b-80ed-10c8acdf6ca7')
insert into nasmo values(10,3,'http://techslides.com/demos/sample-videos/small.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail1.JPG?alt=media&token=637d6650-1b51-401c-8d81-27d59ecbc23e')
insert into nasmo values(11,4,'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail9.JPG?alt=media&token=3c4879c5-e5e4-4698-81b9-2080c2d8accc')
insert into nasmo values(12,14,'https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail4.JPG?alt=media&token=cb5a6ad1-e066-48d3-8aca-83a69713983a')
insert into nasmo values(13,13,'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail10.JPG?alt=media&token=e39f5576-5b11-4668-8956-8d17398c7445')
insert into nasmo values(14,10,'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail5.JPG?alt=media&token=181fb399-26fa-4bc1-9dd0-1149b93dbe13')
insert into nasmo values(15,7,'https://vt.tumblr.com/tumblr_o600t8hzf51qcbnq0_480.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail11.JPG?alt=media&token=b968e3bc-be41-466c-a9d1-003632ac1685')
insert into nasmo values(16,10,'https://vt.tumblr.com/tumblr_o600t8hzf51qcbnq0_480.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail11.JPG?alt=media&token=b968e3bc-be41-466c-a9d1-003632ac1685')
insert into nasmo values(17,10,'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail8.JPG?alt=media&token=2ce56ea7-9529-48fb-b808-3b5c9886918a')
insert into nasmo values(18,3,'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail8.JPG?alt=media&token=2ce56ea7-9529-48fb-b808-3b5c9886918a')


----comments data-----
insert into comments values(1,1,4,'������!!',GETDATE(),2,'1','0',0)
insert into comments values(2,1,1,'�����մϴ٤�����',GETDATE(),1,'1','1',1)
insert into comments values(3,6,2,'���߿� ������ ���� �Ŀ䤾��',GETDATE(),1,'4','0',0)
insert into comments values(4,7,8,'�Ƿ��� �� ���̳׿䤻����',GETDATE(),4,'5','0',0)
insert into comments values(5,7,12,'���� ���� ���ƿ�',GETDATE(),2,'7','0',0)
insert into comments values(6,7,5,'���� �����մϴ� ����',GETDATE(),1,'5','1',1)
insert into comments values(7,7,5,'�����մϴ� ���߿� ���� �Ŀ�~~',GETDATE(),3,'7','1',1)
insert into comments values(8,7,12,'���� ���� �� �� �ҷ��ּ��䤾����',GETDATE(),3,'7','2',1)
insert into comments values(9,3,11,'�������Űſ��䤻������',GETDATE(),0,'3','0',0)
insert into comments values(10,8,1,'������ �ÿ��ϳ׿�',GETDATE(),3,'10','0',0)
insert into comments values(11,7,5,'�פ���',GETDATE(),3,'7','3',1)
insert into comments values(12,8,8,'�����մϴ٤���������� ���׿�',GETDATE(),2,'10','1',1)
insert into comments values(13,10,4,'�����ΰ��䤻����',GETDATE(),0,'13','0',0)
insert into comments values(14,10,5,'���� �ÿ��ϳ�~~',GETDATE(),2,'14','1',0)
insert into comments values(15,10,13,'���� ���ΰ�������??',GETDATE(),4,'15','2',0)
insert into comments values(16,12,7,'���߿� ���� ����!!',GETDATE(),3,'16','0',0)
insert into comments values(17,13,10,'����������',GETDATE(),3,'17','0',0)
insert into comments values(18,13,9,'����������ť',GETDATE(),0,'17','1',1)
insert into comments values(19,13,10,'�츮 ������??',GETDATE(),1,'19','0',0)
insert into comments values(20,15,9,'���� ģ���ؿ䤾����',GETDATE(),2,'20','0',0)
insert into comments values(21,15,2,'���ƿ� ��û�߾��~',GETDATE(),5,'20','1',1)
insert into comments values(22,15,15,'���� �ص� �ǳ��뤻������',GETDATE(),3,'20','2',1)
insert into comments values(23,18,3,'�츮 ���� ���� �ĤѤ�',GETDATE(),7,'23','0',0)
insert into comments values(24,18,2,'�ָ� ����',GETDATE(),3,'23','1',1)
insert into comments values(25,18,3,'�� �Ͽ��ϸ� ���ɤ�',GETDATE(),0,'23','2',1)
insert into comments values(26,18,2,'���������Ͽ� ��',GETDATE(),0,'23','3',1)
insert into comments values(27,18,3,'2�ä�?',GETDATE(),4,'23','4',1)
insert into comments values(28,19,12,'�ʺ��� �Ƿ��� �ƴѵ�???����',GETDATE(),2,'28','0',0)
insert into comments values(29,19,6,'�������� 3�����ۿ� �ȵƾ��',GETDATE(),6,'28','1',1)

---hashtag data---
insert into hashtag values(1,1,'���ƿ�')
insert into hashtag values(2,9,'��ũ��������')
insert into hashtag values(3,9,'�ڼ��Ҿ���')
insert into hashtag values(4,9,'�����ʺ�')
insert into hashtag values(5,11,'����')
insert into hashtag values(6,11,'����')
insert into hashtag values(7,11,'���ƿ�')
insert into hashtag values(8,11,'������')
insert into hashtag values(9,14,'���ΰ���')
insert into hashtag values(10,17,'����')
insert into hashtag values(11,17,'����')
insert into hashtag values(12,20,'�Ƿ�')
insert into hashtag values(13,24,'����')
insert into hashtag values(14,26,'����')
insert into hashtag values(15,29,'��ũ��������')