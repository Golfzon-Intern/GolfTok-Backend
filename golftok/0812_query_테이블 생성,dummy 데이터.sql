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
insert into tok_users values (1,'mul1234','mul1234','mul4321','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage2.jpg?alt=media&token=1cf84666-7c3b-42e9-9050-1fee04eaf2c6','안녕하세요!',28,'까치',25,40)
insert into tok_users values (2,'hok333','hok333','오늘도골프','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage3.jpg?alt=media&token=c63ed6ca-b4b4-4ee5-84f7-ac61b917a8e1','홉이입니다',29,'참새',3,2)
insert into tok_users values (3,'qaz1234','qaz1234','qaz1234','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage4.jpg?alt=media&token=3128f63c-c852-4a99-a7ba-04aef0a2dd18','골프왕',36,'매',8,10)
insert into tok_users values (4,'qwer111','qwer111','qwer111','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage5.jpg?alt=media&token=feb4afed-ead7-46f4-8753-dd2d5a321f22','',33,'참새',33,10)
insert into tok_users values (5,'qsxc000','qsxc000','골프찐천재','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage6.jpg?alt=media&token=6f7d029a-8c1a-4849-8760-d697f3ef5ec2','같이 골프해요!',42,'참새',3,0)
insert into tok_users values (6,'popo333','popo333','골프왕','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage7.jpg?alt=media&token=0c36198b-64a1-4933-8ed9-ed701adc7d62','골프 같이 칠 분 구합니다',24,'매',3,7)
insert into tok_users values (7,'progolf567','progolf567','프로골퍼','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage8.jpg?alt=media&token=5e211670-712d-4517-b25f-c1e2e8ef0846','',37,'독수리',42,56)
insert into tok_users values (8,'gfdsa989','gfdsa989','골프존나이스샷','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage9.jpg?alt=media&token=8f33d1e7-8c75-49d5-9131-b643991129c7','골프 잘치는 그 날 까지!',36,'참새',1,2)
insert into tok_users values (9,'hansu310','hansu310','한수','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage10.jpg?alt=media&token=82a796be-de05-41a3-9c10-2be274285592','',31,'참새',3,1)
insert into tok_users values (10,'hany456','hany456','아응애에요','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage11.jpg?alt=media&token=4d725b28-a948-494b-a932-9ad852045afc','잘 부탁드려요',37,'학',13,6)
insert into tok_users values (11,'flyfly99','flyfly99','flyfly99','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage25.jpg?alt=media&token=82923318-8878-4987-afe8-730c08648af1','',36,'매',4,6)
insert into tok_users values (12,'apple123','apple123','골프병아리','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage12.jpg?alt=media&token=778c04a7-0490-4909-8a07-c8ddaaaf4ae1','아직 골프 병아리 입니다ㅎㅎ',38,'까치',5,3)
insert into tok_users values (13,'banana454','banana454','골프독수리','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage13.jpg?alt=media&token=c5800a00-cfd1-4956-8ca0-6eed6c2ca23d','골프친구 신청 많이 해주세요',44,'독수리',2,3)
insert into tok_users values (14,'grayjam383','grayjam383','gray_jam','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage14.jpg?alt=media&token=8b8dc51a-2253-40e7-93cf-8cee994e0c30','',29,'참새',3,2)
insert into tok_users values (15,'hamberger5556','hamberger5556','햄버거','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage15.jpg?alt=media&token=2cc41728-eaf2-4d4f-a1ef-769b1d8610c7','',34,'참새',5,2)
insert into tok_users values (16,'hhk455','hhk455','hhk455','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage16.jpg?alt=media&token=82af733b-08bd-4f4f-86ea-a8e5637a5c8a','맞팔 받아용ㅎㅎ',28,'참새',10,8)
insert into tok_users values (17,'qwerqq8989','qwerqq8989','qwerqq8989','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage17.jpg?alt=media&token=90fdac83-fe04-439b-8cba-670abaea6b9d','',34,'참새',0,2)
insert into tok_users values (18,'jeayoung123','jeayoung123','재영','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage18.jpg?alt=media&token=eed70f1b-001a-4776-b76b-dc0d5acb65b4','',38,'참새',28,33)
insert into tok_users values (19,'folwer999','folwer999','팔로팔로미','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage19.jpg?alt=media&token=29e70d89-1356-4740-a9b1-25de7bfd538d','',31,'독수리',17,7)
insert into tok_users values (20,'golf584','golf584','골프천재','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage20.png?alt=media&token=4e26d1ab-0272-4bca-b87a-81c0cfc340a2','',44,'학',3,9)
insert into tok_users values (21,'catttt1','catttt1','고양이집사','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage21.jpg?alt=media&token=cff5463e-d0e4-43fc-9a40-b5d9c9d810d3','',36,'참새',2,2)
insert into tok_users values (22,'party333','party333','골프p','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage22.jpg?alt=media&token=949ead3d-b39d-41ef-a318-4cf38534c573','골프 독수리까지~',34,'까치',13,17)
insert into tok_users values (23,'maybe232','maybe232','메이비베이비','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage24.jpg?alt=media&token=22c49727-dece-45f3-8f9b-131667b75188','팔로우 많이 부탁해요~',27,'참새',8,11)
insert into tok_users values (24,'minz387','minz387','minz_387','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage23.jpg?alt=media&token=30fafb52-a27a-4569-8eb6-0bd44899306e','골프 독수리까지~',32,'참새',6,4)
insert into tok_users values (25,'varzar000','varzar000','골프인','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage28.jpg?alt=media&token=40b87865-fb90-4a1a-9c7b-c85e3c5e2503','골프를 사랑하는 사람',38,'독수리',3,7)
insert into tok_users values (26,'moon1221','moon1221','m_o_o_n','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage29.jpg?alt=media&token=6758143a-4a25-4153-bc43-57828035c818','골프 독수리까지~',43,'학',5,2)
insert into tok_users values (27,'gogogolf','gogogolf00','gogogolf','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage26.jpg?alt=media&token=8ec50b7f-ed8e-4747-a0ef-e935fdd361e4','',36,'까치',0,3)
insert into tok_users values (28,'dogcat367','dogcat367','흰둥이','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage27.jpg?alt=media&token=c9a19774-8024-4b32-b7fd-81d7072bb632','',38,'참새',11,7)
insert into tok_users values (29,'sincer881','sincer881','sinser','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage30.jpg?alt=media&token=1cf3f95f-b62c-4a04-8476-a9db77cd8ba7','',31,'매',2,0)
insert into tok_users values (30,'525angel','525angel','angel','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage31.jpg?alt=media&token=f9a39c25-7895-4a6d-a4b4-181b0ab2f666','골프 잘 치고 싶어요!',22,'까치',7,14)

----tok_posts data----
insert into tok_posts values(1,1,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo1.mp4?alt=media&token=7e802ee5-88b7-475d-85d1-8bc7afafd840',DATEADD(dd,-10,getdate()),21,2,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail1.JPG?alt=media&token=f7404741-4888-44d7-b3fc-9b735cb74839')
insert into tok_posts values(2,1,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo2.mp4?alt=media&token=636c149d-5aa2-4270-a9ea-4455b8dff3a8',DATEADD(dd,-10,getdate()),12,0,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail2.JPG?alt=media&token=07a4a97e-ecfa-40b2-bc4c-cfe5eb81a652')
insert into tok_posts values(3,2,'폼 잡는거 힘들다','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo3.mp4?alt=media&token=81aa829b-e33f-4f8c-b409-898c1451cb57',DATEADD(dd,-8,getdate()),4,1,'서울특별시 강남구 논현로 833 재경빌딩','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail3.JPG?alt=media&token=8edd989d-8021-46be-9c2d-06bff5b6f3c5')
insert into tok_posts values(4,4,'심심하당','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo4.mp4?alt=media&token=e3f9581b-7b87-4b4a-9633-91520a86fa96',DATEADD(dd,-8,getdate()),6,0,'서울특별시 서대문구 서소문로 37 충정로대우디오빌','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail4.JPG?alt=media&token=d5d815a8-7330-4431-9d81-8aaee92c2a07')
insert into tok_posts values(5,5,'#시원한한방 #골프 #나이스샷','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo5.mp4?alt=media&token=0deb2132-760f-4fb1-8d2b-d0505af43cbf',DATEADD(dd,-8,getdate()),3,0,'서울특별시 중랑구 용마산로129나길 6 4층','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail5.JPG?alt=media&token=2ca149c3-5d90-40c1-aa27-c3b81dfc4320')
insert into tok_posts values(6,6,'덥다 더워 #오늘날씨왜이래','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo7.mp4?alt=media&token=8680bf05-eb81-4b81-8af3-6efb1f11b4c4',DATEADD(dd,-7,getdate()),14,1,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail6.JPG?alt=media&token=58155043-fdbb-4cc4-87e9-9638397d567b')
insert into tok_posts values(7,5,'오늘은 골프 잘 쳐지는 날','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo8.mp4?alt=media&token=5fff0fc8-00e1-4d3e-800c-807daa62af4e',DATEADD(dd,-7,getdate()),22,4,'서울특별시 관악구 관악로15길 23-11 관악맥스텔 B1','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail7.JPG?alt=media&token=aaeeed41-2255-467c-9a30-9c7267f3d2d6')
insert into tok_posts values(8,8,'다음 목표를 향해!!','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo9.mp4?alt=media&token=51bc1e0e-1171-4fe9-828a-6d7e95643602',DATEADD(dd,-6,getdate()),28,1,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail8.JPG?alt=media&token=a445a15b-8190-4ee0-8916-f2400c044073')
insert into tok_posts values(9,8,'원래 #스크린골프장 갈 계획 없었는데 친구 따라 감ㅋㅋ #자세불안정 #아직초보','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo11.mp4?alt=media&token=dbef66c8-21d9-4c7a-8d83-9cebd8e20a88',DATEADD(dd,-6,getdate()),42,0,'서울특별시 중랑구 용마산로129나길 6 4층','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail9.JPG?alt=media&token=0441516d-27d4-4b4a-958c-2f1e25db9b9d')
insert into tok_posts values(10,8,'fire','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo12.mp4?alt=media&token=d31fae88-c636-479a-8cbc-f0c3f2fb8b5e',DATEADD(dd,-6,getdate()),39,3,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail10.JPG?alt=media&token=0272314d-0cc6-4a1f-a95f-2f20064108e1')
insert into tok_posts values(11,3,'#선팔 #맞팔 #좋아요 #골프장','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo13.mp4?alt=media&token=cb2ec5f6-9119-4171-be01-fe5529b80a9c',DATEADD(dd,-6,getdate()),20,0,'서울특별시 영등포구 의사당대로 127 롯데캐슬엠파이어','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail11.JPG?alt=media&token=9be497db-e2a0-42b1-aba0-24012e16ca52')
insert into tok_posts values(12,4,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo14.mp4?alt=media&token=14e45cc3-42a2-4ef0-aa46-c33d9d1f09ff',DATEADD(dd,-5,getdate()),13,1,'서울특별시 서대문구 충정로 36 국민연금빌딩','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail12.JPG?alt=media&token=c393a39e-5dfb-4cf3-8b2d-b4500a20b6fc')
insert into tok_posts values(13,9,'심심해ㅡㅡ','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo15.mp4?alt=media&token=1adedcc4-b027-49a3-8206-dd909cf36172',DATEADD(dd,-5,getdate()),11,3,'서울특별시 은평구 서오릉로 94 삼성타운아파트상가 지하1층','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail13.JPG?alt=media&token=969168c6-224f-45d5-87e4-15c46493ba4a')
insert into tok_posts values(14,2,'아직 멀었다ㅜㅜㅜ #프로골퍼 가 되는 그 날까지!!!','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo16.mp4?alt=media&token=65d67d36-a452-43d1-9b45-5824b77645f8',DATEADD(dd,-5,getdate()),1,0,'서울특별시 강남구 도산대로81길 28','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail14.JPG?alt=media&token=db595da3-2ff2-4bef-9fa5-5ed5203b0a2e')
insert into tok_posts values(15,2,'자세 왜이러냐 ㅋㅋㅋㅋ','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo17.mp4?alt=media&token=e365f36a-f05b-4f86-8bd9-c23039fc7797',DATEADD(dd,-5,getdate()),7,3,'서울특별시 노원구 덕릉로 688 5층','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail15.JPG?alt=media&token=cfed2105-0b76-425c-ab67-1874b7c3716f')
insert into tok_posts values(16,10,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo18.mp4?alt=media&token=21dad949-244a-4987-8581-e6581aa6a4e2',DATEADD(dd,-4,getdate()),2,0,'서울특별시 서대문구 홍은중앙로 29','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail16.JPG?alt=media&token=3d891aa4-c60f-4742-af0f-c6e820a1ba32')
insert into tok_posts values(17,3,'#골린이 1달차 #골프','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo20.mp4?alt=media&token=dc8dad6c-007b-461a-90eb-79a99dfb649e',DATEADD(dd,-4,getdate()),0,0,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail17.JPG?alt=media&token=40382f64-bb64-40b2-9fa7-b87e143b97e2')
insert into tok_posts values(18,2,'자세 어정쩡..','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo21.mp4?alt=media&token=a12a8a6a-723e-4c86-a9d3-af7bd322e4c8',DATEADD(dd,-4,getdate()),33,7,'서울특별시 은평구 증산로 315 1층','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail18.JPG?alt=media&token=80c7b2ac-71c7-4e57-85c0-2c48d33974c1')
insert into tok_posts values(19,6,'너무 더웠음ㅋㅋㅋ','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo22.mp4?alt=media&token=339c41c4-d6bc-41cd-9c9e-76ed5262111c',DATEADD(dd,-4,getdate()),13,2,'서울특별시 중랑구 용마산로129나길 6','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail19.JPG?alt=media&token=1ff0da42-f875-43e0-acf7-c92062f713ec')
insert into tok_posts values(20,3,'점점 #실력 이 늘어가는게 보여서 뿌듯하다ㅎㅎ','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo23.mp4?alt=media&token=622670f6-ca84-403e-a39b-b9ce83956da8',DATEADD(dd,-4,getdate()),8,0,'서울특별시 노원구 동일로 986 노원프레미어스엠코','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail20.JPG?alt=media&token=5d58248f-9bc4-4557-b0ae-3e5db40ebb4e')
insert into tok_posts values(21,8,'오랜만에 주말에 골프장~','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo24.mp4?alt=media&token=db2033e1-0e44-4926-8f9f-6a831f527359',DATEADD(dd,-3,getdate()),17,1,'서울특별시 은평구 서오릉로 94 삼성타운아파트상가 지하1층','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail21.JPG?alt=media&token=5b399576-6150-4ffc-be44-d3f5a30700b7')
insert into tok_posts values(22,3,'시원한 한방~','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo25.mp4?alt=media&token=d52b9099-603c-4c3e-b6bc-854594d4994c',DATEADD(dd,-3,getdate()),12,2,'서울특별시 영등포구 의사당대로 127 롯데캐슬엠파이어','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail22.JPG?alt=media&token=e6863d0a-a8de-43a1-a70d-58a4be6454ba')
insert into tok_posts values(23,4,'눈 좋아하는 #댕댕이','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo26.mp4?alt=media&token=37d68704-7788-40d5-8f16-112959c41c88',DATEADD(dd,-3,getdate()),18,5,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail23.JPG?alt=media&token=3d036dfe-58be-4cb9-8996-9cc232750461')
insert into tok_posts values(24,4,'#멍스타그램 #강아지 #댕댕이 #졸귀','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo27.mp4?alt=media&token=cc6a5163-f87f-49ca-a14e-12894fce9a48',DATEADD(dd,-3,getdate()),55,0,'서울특별시 노원구 동일로234길 27','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail24.JPG?alt=media&token=e4097f35-8cc1-4b6d-b35b-6e814db19281')
insert into tok_posts values(25,9,'#멍스타그램','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo28.mp4?alt=media&token=ce40953c-df98-4b6f-9510-1d8da32786b7',DATEADD(dd,-3,getdate()),25,1,'서울특별시 노원구 섬밭로 258 건영옴니백화점','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail25.JPG?alt=media&token=15fc2919-c7fd-467f-8a0b-401f74439d96')
insert into tok_posts values(26,14,'졸려요','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo29.mp4?alt=media&token=8c594b3d-6bd1-4a26-8b5f-662dcc93b718',DATEADD(dd,-2,getdate()),30,0,'서울특별시 노원구 마들로 31 그랑빌아파트','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail26.JPG?alt=media&token=fa3ca0bd-ff90-4c47-ae21-e6189e037aa9')
insert into tok_posts values(27,13,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo30.mp4?alt=media&token=23bee688-66f3-4514-b3ea-113b668c2776',DATEADD(dd,-2,getdate()),3,0,'서울특별시 강남구 남부순환로370길 33','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail27.JPG?alt=media&token=bb92ac90-aeb5-4058-ab9a-2f51591d8df9')
insert into tok_posts values(28,10,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo31.mp4?alt=media&token=c1b86b1f-2d85-45a8-a079-211f57cf4eaf',DATEADD(dd,-2,getdate()),17,1,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail28.JPG?alt=media&token=98a9cde8-3d8f-44db-824f-12e41776fb3e')
insert into tok_posts values(29,7,'#선팔 #맞팔','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo32.mp4?alt=media&token=d0e3df54-3646-4521-b25e-c837c28602a2',DATEADD(dd,-2,getdate()),8,2,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail29.JPG?alt=media&token=af8d399f-5f18-49fe-afa5-aedefddbb056')
insert into tok_posts values(30,7,'오랜만에 쳐서 잘 안되는 느낌^^','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo33.mp4?alt=media&token=9b37468f-17d9-4ba2-87fc-64b4c9d2ed67',DATEADD(dd,-2,getdate()),8,0,'서울특별시 강남구 영동대로106길 17 경진빌딩','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail30.JPG?alt=media&token=bc159c2f-022d-4423-b907-a0a6c5f19d2f')
insert into tok_posts values(31,17,'나이스샷 #좋아요','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo34.mp4?alt=media&token=5d837b66-8148-4ae7-9ff8-94fb6064c6b4',DATEADD(dd,-2,getdate()),1,0,'서울 송파구 올림픽로 25 서울종합운동장','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail31.JPG?alt=media&token=7c6216a4-f499-43f3-a348-68b01dd83391')
insert into tok_posts values(32,22,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo35.mp4?alt=media&token=9b6daa11-bfeb-4287-854c-67bea1d6ff69',DATEADD(dd,-1,getdate()),42,2,'서울특별시 강남구 영동대로106길 17 경진빌딩 지하 1층','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail32.JPG?alt=media&token=251ea696-46e5-4abb-8c2a-ba26ebca5176')
insert into tok_posts values(33,23,'드디어 #골린이탈출 이제 나도 #골어른','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo36.mp4?alt=media&token=43924a5f-a1a6-4907-8f41-cc7032cebfd4',DATEADD(dd,-1,getdate()),41,2,'서울 서초구 강남대로2길 92 성지빌딩','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail33.JPG?alt=media&token=6e4ec90d-9309-4f47-bd38-5140d21eb587')
insert into tok_posts values(34,25,'노력하면 더 늘겠지..?','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo37.mp4?alt=media&token=54429bf8-e7ec-46d1-8b5e-9cf889c55d9e',DATEADD(dd,-1,getdate()),58,1,'서울특별시 강남구 영동대로106길 17 경진빌딩 지하 1층','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail34.JPG?alt=media&token=87761d5d-d684-46bb-a2aa-64e5a6369875')
insert into tok_posts values(35,25,'새로운 #골프채 자랑ㅋㅋ 이거 완전 #추천 #필수템','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo38.mp4?alt=media&token=e129344f-b1d6-4b98-9606-f6c8a322cbcb',DATEADD(dd,-1,getdate()),14,0,'경기 하남시 감이로 317','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail35.JPG?alt=media&token=b3f2bc27-382d-412c-8b63-32b83300e34a')
insert into tok_posts values(36,25,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo39.mp4?alt=media&token=2300e42a-2426-48f6-b717-1548b6cb96a5',GETDATE(),15,0,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail36.JPG?alt=media&token=3bc18198-588c-437f-8298-987d500fda06')
insert into tok_posts values(37,26,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo40.mp4?alt=media&token=cec2f160-8094-45c6-8fd9-0869adfaf756',GETDATE(),19,1,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail37.JPG?alt=media&token=678cafbd-3b28-4fe2-b1e3-ecb2b1a86028')
insert into tok_posts values(38,26,'#길거리버스킹 #버스킹 많이보러오세요^^','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo41.mp4?alt=media&token=3e22c648-ad57-49e8-929c-c78a6bff5b21',GETDATE(),21,0,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail38.JPG?alt=media&token=216d40fc-8a24-40e8-af8e-e1382a1947fb')
insert into tok_posts values(39,28,'오랜만에 악기 연주','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo42.mp4?alt=media&token=45b64d4d-d474-43ba-81e2-fced8cbd4b5c',GETDATE(),27,0,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail39.JPG?alt=media&token=b8701ca7-2dd4-4698-a595-1639f9258a1b')
insert into tok_posts values(40,29,'#드럼 연주','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/sample_video%2FtestVideo43.mp4?alt=media&token=c9643439-c48e-4e06-b08c-22dce79a1492',GETDATE(),38,4,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail40.JPG?alt=media&token=84c056f1-a2a8-4ec7-80d1-3aeebbf6f6ed')

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
insert into comments values(1,1,4,'멋져요!!',DATEADD(dd,-4,getdate()),2,'1','0',0)
insert into comments values(2,1,1,'감사합니다ㅎㅎㅎ',DATEADD(dd,-4,getdate()),1,'1','1',1)
insert into comments values(3,6,2,'나중에 저랑도 같이 쳐요ㅎㅎ',DATEADD(dd,-4,getdate()),1,'4','0',0)
insert into comments values(4,7,8,'실력이 더 느셨네요ㅋㅋㅋ',DATEADD(dd,-3,getdate()),4,'5','0',0)
insert into comments values(5,7,12,'완전 프로 같아요',DATEADD(dd,-3,getdate()),2,'7','0',0)
insert into comments values(6,7,5,'아직 부족합니다 ㅋㅋ',DATEADD(dd,-3,getdate()),1,'5','1',1)
insert into comments values(7,7,5,'감사합니다 나중에 같이 쳐요~~',DATEADD(dd,-3,getdate()),3,'7','1',1)
insert into comments values(8,7,12,'좋죠 언제 한 번 불러주세요ㅎㅎㅎ',DATEADD(dd,-2,getdate()),3,'7','2',1)
insert into comments values(9,3,11,'언제가신거에요ㅋㅋㅋㅋ',DATEADD(dd,-2,getdate()),0,'3','0',0)
insert into comments values(10,8,1,'스윙이 시원하네요',DATEADD(dd,-2,getdate()),3,'10','0',0)
insert into comments values(11,7,5,'네ㅎㅎ',DATEADD(dd,-2,getdate()),3,'7','3',1)
insert into comments values(12,8,8,'감사합니다ㅋㅋㅋ기분이 좋네요',DATEADD(dd,-2,getdate()),2,'10','1',1)
insert into comments values(13,10,4,'언제인가요ㅋㅋㅋ',DATEADD(dd,-1,getdate()),0,'13','0',0)
insert into comments values(14,10,5,'스윙 시원하네~~',DATEADD(dd,-1,getdate()),2,'14','1',0)
insert into comments values(15,10,13,'완전 프로같은데요??',DATEADD(dd,-1,getdate()),4,'15','2',0)
insert into comments values(16,12,7,'나중에 같이 가요!!',DATEADD(dd,-1,getdate()),3,'16','0',0)
insert into comments values(17,13,10,'멋져ㅎㅎㅎ',DATEADD(dd,-1,getdate()),3,'17','0',0)
insert into comments values(18,13,9,'오옝ㅎㅎ땡큐',DATEADD(dd,-1,getdate()),0,'17','1',1)
insert into comments values(19,13,10,'우리 언제봐??',DATEADD(dd,-1,getdate()),1,'19','0',0)
insert into comments values(20,15,9,'골프 친구해요ㅎㅎㅎ',DATEADD(dd,-1,getdate()),2,'20','0',0)
insert into comments values(21,15,2,'좋아요 신청했어요~',GETDATE(),5,'20','1',1)
insert into comments values(22,15,15,'저두 해도 되나용ㅋㅋㅎㅎ',GETDATE(),3,'20','2',1)
insert into comments values(23,18,3,'우리 언제 같이 쳐?','2021-07-21 22:10:22.280',7,'23','0',0)
insert into comments values(24,18,2,'주말 ㄱㄱ',GETDATE(),3,'23','1',1)
insert into comments values(25,18,3,'일요일에 갈래?',GETDATE(),0,'23','2',1)
insert into comments values(26,18,2,'ㅇㅋㅇㅋ일욜 고',GETDATE(),0,'23','3',1)
insert into comments values(27,18,3,'2시?',GETDATE(),4,'23','4',1)
insert into comments values(28,19,12,'초보의 실력이 아닌데???ㅋㅋ',GETDATE(),2,'28','0',0)
insert into comments values(29,19,6,'시작한지 3개월밖에 안됐어ㅋㅋ',GETDATE(),6,'28','1',1)
insert into comments values(30,18,6,'ㅋㅋㅋㅋㅋ',GETDATE(),6,'30','0',0)
insert into comments values(31,18,6,'재밌어 보인다ㅋㅋㅋ',GETDATE(),6,'31','0',0)
insert into comments values(32,24,16,'ㅜㅜㅜㅜ',GETDATE(),2,'32','0',0)
insert into comments values(33,24,8,'헐너무귀여운데',GETDATE(),11,'33','0',0)
insert into comments values(34,24,19,'여긴 어딘가요??',GETDATE(),1,'34','0',0)
insert into comments values(35,24,25,'복실복실!!',GETDATE(),4,'33','1',1)
insert into comments values(36,30,2,'잘 치시네요! 스윙이 시원합니다~',GETDATE(),22,'36','0',0)
insert into comments values(37,30,7,'감사합니다ㅋㅋ부끄럽네요',GETDATE(),3,'36','1',1)
insert into comments values(38,35,29,'어디서 사셨나요? 정보좀 주세요',GETDATE(),10,'38','0',0)
insert into comments values(39,35,17,'쪽지주세요~',GETDATE(),1,'38','1',1)
insert into comments values(40,35,11,'역시 장비가 좋아야 합니다ㅋㅋㅋ',GETDATE(),25,'40','0',0)
insert into comments values(41,36,6,'맞팔해요~',GETDATE(),8,'41','0',0)
insert into comments values(42,36,6,'실력이 더 늘었네ㅋㅋㅋㅋㅋ',GETDATE(),31,'42','0',0)
insert into comments values(43,39,6,'버스킹 어디서 하세요??',GETDATE(),5,'43','0',0)
insert into comments values(44,39,6,'팬 입니다!!!',GETDATE(),11,'44','0',0)

----hashtag data----
insert into hashtag values(1,5,'시원한한방')
insert into hashtag values(2,5,'골프')
insert into hashtag values(3,5,'나이스샷')
insert into hashtag values(4,6,'오늘날씨왜이래')
insert into hashtag values(5,9,'스크린골프장')
insert into hashtag values(6,9,'자세불안정')
insert into hashtag values(7,9,'아직초보')
insert into hashtag values(8,11,'선팔')
insert into hashtag values(9,11,'맞팔')
insert into hashtag values(10,11,'좋아요')
insert into hashtag values(11,11,'골프장')
insert into hashtag values(12,17,'골린이')
insert into hashtag values(13,17,'골프')
insert into hashtag values(14,20,'실력')
insert into hashtag values(15,23,'댕댕이')
insert into hashtag values(16,24,'멍스타그램')
insert into hashtag values(17,24,'강아지')
insert into hashtag values(18,24,'댕댕이')
insert into hashtag values(19,24,'졸귀')
insert into hashtag values(20,25,'멍스타그램')
insert into hashtag values(21,29,'선팔')
insert into hashtag values(22,29,'맞팔')
insert into hashtag values(23,31,'나이스샷')
insert into hashtag values(24,31,'좋아요')
insert into hashtag values(25,33,'골린이탈출')
insert into hashtag values(26,33,'골어른')
insert into hashtag values(27,35,'골프채')
insert into hashtag values(28,35,'추천')
insert into hashtag values(29,35,'필수템')
insert into hashtag values(30,38,'길거리버스킹')
insert into hashtag values(31,38,'버스킹')
insert into hashtag values(32,40,'드럼')

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

