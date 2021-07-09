use MDPRJ

------------------drop table-------------------
DROP TABLE friend_request
DROP TABLE golf_friends
DROP TABLE nasmo
DROP TABLE comments
DROP TABLE tok_posts
DROP TABLE tok_users


----------------golf tok 테이블 생성 쿼리-----------------
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
insert into tok_users values (1,'mul1234','mul1234','mul4321','D:\golfzon\project_golftok\sample_image\image2.jpg',2,'안녕하세요!','public',28)
insert into tok_users values (2,'hok333','hok333','홉123','D:\golfzon\project_golftok\sample_image\image3.jpg',1,'홉이입니다','public',29)
insert into tok_users values (3,'qaz1234','qaz1234','qaz1234','D:\golfzon\project_golftok\sample_image\image4.jpg',0,'골프왕','private',36)
insert into tok_users values (4,'qwer111','qwer111','qwer111','D:\golfzon\project_golftok\sample_image\image5.jpg',4,'','protected',33)
insert into tok_users values (5,'qsxc000','qsxc000','골프찐천재','D:\golfzon\project_golftok\sample_image\image6.jpg',0,'같이 골프해요!','public',42)
insert into tok_users values (6,'popo333','popo333','골프왕','D:\golfzon\project_golftok\sample_image\image7.jpg',2,'골프 같이 칠 분 구합니다','public',24)
insert into tok_users values (7,'progolf567','progolf567','프로골퍼','D:\golfzon\project_golftok\sample_image\image8.jpg',1,'','protected',37)
insert into tok_users values (8,'gfdsa989','gfdsa989','골프존나이스샷','D:\golfzon\project_golftok\sample_image\image9.jpg',2,'골프 잘치는 그 날 까지!','public',36)
insert into tok_users values (9,'hansu310','hansu310','한수','D:\golfzon\project_golftok\sample_image\image10.jpg',3,'','private',31)
insert into tok_users values (10,'hany456','hany456','아응애에요','D:\golfzon\project_golftok\sample_image\image12.jpg',0,'잘 부탁드려요','public',22)
insert into tok_users values (11,'ffrrt009','ffrrt009','ffrrt009','',4,'','public',36)
insert into tok_users values (12,'apple123','apple123','골프병아리','',0,'아직 골프 병아리 입니다ㅎㅎ','protected',38)
insert into tok_users values (13,'banana454','banana454','골프독수리','D:\golfzon\project_golftok\sample_image\image13.jpg',1,'골프친구 신청 많이 해주세요','public',44)
insert into tok_users values (14,'grayjam383','grayjam383','gray_jam','D:\golfzon\project_golftok\sample_image\image14.jpg',0,'','public',29)
insert into tok_users values (15,'hamberger5556','hamberger5556','햄버거','D:\golfzon\project_golftok\sample_image\image15.jpg',2,'','private',34)

----tok_posts data-----
insert into tok_posts values(1,1,'나이스샷','http://techslides.com/demos/sample-videos/small.mp4',GETDATE(),'public',3,2,'서울특별시 강남구 도산대로 510 ')
insert into tok_posts values(2,1,'나이스샷^.^','D:\golfzon\project_golftok\sample_video\testVideo2.mp4',GETDATE(),'public',2,0,'서울특별시 강남구 도산대로81길 28')
insert into tok_posts values(3,2,'','D:\golfzon\project_golftok\sample_video\testVideo5.mp4',GETDATE(),'public',1,1,'서울특별시 강남구 논현로 833 재경빌딩')
insert into tok_posts values(4,4,'심심하당','https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4',GETDATE(),'private',0,0,'서울특별시 서대문구 서소문로 37 충정로대우디오빌')
insert into tok_posts values(5,5,'','D:\golfzon\project_golftok\sample_video\testVideo1.mp4',GETDATE(),'protected',3,0,'서울특별시 중랑구 용마산로129나길 6 4층')
insert into tok_posts values(6,6,'언제쯤 잘 치게 될까?ㅜㅜ','https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',GETDATE(),'protected',4,1,'서울특별시 노원구 동일로248길 16 수락파크빌')
insert into tok_posts values(7,5,'오늘은 골프 잘 쳐지는 날','D:\golfzon\project_golftok\sample_video\testVideo3.mp4',GETDATE(),'public',2,4,'서울특별시 관악구 관악로15길 23-11 관악맥스텔 B1')
insert into tok_posts values(8,8,'다음 목표를 향해!!','http://techslides.com/demos/sample-videos/small.mp4',GETDATE(),'private',24,1,'')
insert into tok_posts values(9,8,'골프영상!','D:\golfzon\project_golftok\sample_video\testVideo6.mp4',GETDATE(),'public',9,0,'서울특별시 중랑구 용마산로129나길 6 4층')
insert into tok_posts values(10,8,'바로 오늘 한거 ㅋㅋㅋ','D:\golfzon\project_golftok\sample_video\testVideo7.mp4',GETDATE(),'public',3,3,'서울특별시 은평구 통일로83길 6-29 유진빌딩')
insert into tok_posts values(11,3,'','D:\golfzon\project_golftok\sample_video\testVideo8.mp4',GETDATE(),'private',0,0,'서울특별시 영등포구 의사당대로 127 롯데캐슬엠파이어')
insert into tok_posts values(12,4,'','D:\golfzon\project_golftok\sample_video\testVideo9.mp4',GETDATE(),'protected',3,1,'서울특별시 서대문구 충정로 36 국민연금빌딩')
insert into tok_posts values(13,9,'심심해ㅡㅡ','D:\golfzon\project_golftok\sample_video\testVideo10.mp4',GETDATE(),'public',11,3,'서울특별시 은평구 서오릉로 94 삼성타운아파트상가 지하1층')
insert into tok_posts values(14,2,'아직 멀었다ㅜㅜㅜ 프로 골퍼가 되는 그 날까지!!!','D:\golfzon\project_golftok\sample_video\testVideo11.mp4',GETDATE(),'public',1,0,'서울특별시 강남구 도산대로81길 28')
insert into tok_posts values(15,2,'자세 왜이러냐 ㅋㅋㅋㅋ','D:\golfzon\project_golftok\sample_video\testVideo12.mp4',GETDATE(),'public',7,3,'서울특별시 노원구 덕릉로 688 5층')
insert into tok_posts values(16,10,'','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',GETDATE(),'public',2,0,'서울특별시 서대문구 홍은중앙로 29')
insert into tok_posts values(17,3,'','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',GETDATE(),'protected',0,0,'')
insert into tok_posts values(18,2,'','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',GETDATE(),'public',33,5,'서울특별시 은평구 증산로 315 1층.지하1층 스크린골프장')
insert into tok_posts values(19,6,'너무 더웠음ㅋㅋㅋ','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',GETDATE(),'public',13,2,'서울특별시 중랑구 용마산로129나길 6 4층')
insert into tok_posts values(20,8,'test!','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',GETDATE(),'public',8,0,'서울특별시 노원구 동일로 986 노원프레미어스엠코 지하2층')


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
insert into comments values(1,1,'멋져요!!',GETDATE(),2,'1','0',0)
insert into comments values(2,1,'감사합니다ㅎㅎㅎ',GETDATE(),1,'1','1',1)
insert into comments values(3,6,'나중에 저랑도 같이 쳐요ㅎㅎ',GETDATE(),1,'4','0',0)
insert into comments values(4,7,'실력이 더 느셨네요ㅋㅋㅋ',GETDATE(),4,'5','0',0)
insert into comments values(5,7,'완전 프로 같아요',GETDATE(),2,'7','0',0)
insert into comments values(6,7,'아직 부족합니다 ㅋㅋ',GETDATE(),1,'5','1',1)
insert into comments values(7,7,'감사합니다 나중에 같이 쳐요~~',GETDATE(),3,'7','1',1)
insert into comments values(8,7,'좋죠 언제 한 번 불러주세요ㅎㅎㅎ',GETDATE(),3,'7','2',1)
insert into comments values(9,3,'언제가신거에요ㅋㅋㅋㅋ',GETDATE(),0,'3','0',0)
insert into comments values(10,8,'스윙이 시원하네요',GETDATE(),3,'10','0',0)
insert into comments values(11,7,'네ㅎㅎ',GETDATE(),3,'7','3',1)
insert into comments values(12,8,'감사합니다ㅋㅋㅋ기분이 좋네요',GETDATE(),2,'10','1',1)
insert into comments values(13,10,'언제인가요ㅋㅋㅋ',GETDATE(),0,'13','0',0)
insert into comments values(14,10,'스윙 시원하네~~',GETDATE(),2,'14','1',0)
insert into comments values(15,10,'완전 프로같은데요??',GETDATE(),4,'15','2',0)
insert into comments values(16,12,'나중에 같이 가요!!',GETDATE(),3,'16','0',0)
insert into comments values(17,13,'멋져ㅎㅎㅎ',GETDATE(),3,'17','0',0)
insert into comments values(18,13,'오옝ㅎㅎ땡큐',GETDATE(),0,'17','1',1)
insert into comments values(19,13,'우리 언제봐??',GETDATE(),1,'19','0',0)
insert into comments values(20,15,'골프 친구해요ㅎㅎㅎ',GETDATE(),2,'20','0',0)
insert into comments values(21,15,'좋아요 신청했어요~',GETDATE(),5,'20','1',1)
insert into comments values(22,15,'저두 해도 되나용ㅋㅋㅎㅎ',GETDATE(),3,'20','2',1)
insert into comments values(23,18,'우리 언제 같이 쳐ㅡㅡ',GETDATE(),7,'23','0',0)
insert into comments values(24,18,'주말 ㄱㄱ',GETDATE(),3,'23','1',1)
insert into comments values(25,18,'나 일요일만 가능ㅋ',GETDATE(),0,'23','2',1)
insert into comments values(26,18,'ㅇㅋㅇㅋ일욜 고',GETDATE(),0,'23','3',1)
insert into comments values(27,18,'2시ㄱ?',GETDATE(),4,'23','4',1)
insert into comments values(28,19,'초보의 실력이 아닌데???ㅋㅋ',GETDATE(),2,'28','0',0)
insert into comments values(29,19,'시작한지 3개월밖에 안됐어ㅋㅋ',GETDATE(),6,'28','1',1)

