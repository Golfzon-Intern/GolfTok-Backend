use MDPRJ

------------------drop table-------------------
DROP TABLE hashtag
DROP TABLE follow
DROP TABLE nasmo
DROP TABLE comments
DROP TABLE tok_posts
DROP TABLE tok_users


----------------golf tok 테이블 생성 쿼리-----------------
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
insert into tok_users values (1,'mul1234','mul1234','mul4321','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage2.jpg?alt=media&token=1cf84666-7c3b-42e9-9050-1fee04eaf2c6','안녕하세요!',28,'독수리',5,6)
insert into tok_users values (2,'hok333','hok333','홉123','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage3.jpg?alt=media&token=c63ed6ca-b4b4-4ee5-84f7-ac61b917a8e1','홉이입니다',29,'참새',3,2)
insert into tok_users values (3,'qaz1234','qaz1234','qaz1234','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage4.jpg?alt=media&token=3128f63c-c852-4a99-a7ba-04aef0a2dd18','골프왕',36,'매',4,1)
insert into tok_users values (4,'qwer111','qwer111','qwer111','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage5.jpg?alt=media&token=feb4afed-ead7-46f4-8753-dd2d5a321f22','',33,'참새',1,0)
insert into tok_users values (5,'qsxc000','qsxc000','골프찐천재','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage6.jpg?alt=media&token=6f7d029a-8c1a-4849-8760-d697f3ef5ec2','같이 골프해요!',42,'참새',3,0)
insert into tok_users values (6,'popo333','popo333','골프왕','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage7.jpg?alt=media&token=0c36198b-64a1-4933-8ed9-ed701adc7d62','골프 같이 칠 분 구합니다',24,'매',3,7)
insert into tok_users values (7,'progolf567','progolf567','프로골퍼','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage8.jpg?alt=media&token=5e211670-712d-4517-b25f-c1e2e8ef0846','',37,'독수리',4,5)
insert into tok_users values (8,'gfdsa989','gfdsa989','골프존나이스샷','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage9.jpg?alt=media&token=8f33d1e7-8c75-49d5-9131-b643991129c7','골프 잘치는 그 날 까지!',36,'참새',1,2)
insert into tok_users values (9,'hansu310','hansu310','한수','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage10.jpg?alt=media&token=82a796be-de05-41a3-9c10-2be274285592','',31,'참새',3,1)
insert into tok_users values (10,'hany456','hany456','아응애에요','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage11.jpg?alt=media&token=4d725b28-a948-494b-a932-9ad852045afc','잘 부탁드려요',22,'독수리',3,6)
insert into tok_users values (11,'ffrrt009','ffrrt009','ffrrt009','','',36,'매',4,6)
insert into tok_users values (12,'apple123','apple123','골프병아리','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage12.jpg?alt=media&token=778c04a7-0490-4909-8a07-c8ddaaaf4ae1','아직 골프 병아리 입니다ㅎㅎ',38,'매',5,3)
insert into tok_users values (13,'banana454','banana454','골프독수리','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage13.jpg?alt=media&token=c5800a00-cfd1-4956-8ca0-6eed6c2ca23d','골프친구 신청 많이 해주세요',44,'독수리',2,3)
insert into tok_users values (14,'grayjam383','grayjam383','gray_jam','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage14.jpg?alt=media&token=8b8dc51a-2253-40e7-93cf-8cee994e0c30','',29,'참새',3,2)
insert into tok_users values (15,'hamberger5556','hamberger5556','햄버거','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/user_icon%2Fimage15.jpg?alt=media&token=2cc41728-eaf2-4d4f-a1ef-769b1d8610c7','',34,'참새',5,2)

----tok_posts data-----
insert into tok_posts values(1,1,'나이스샷 #좋아요','http://techslides.com/demos/sample-videos/small.mp4','2021-07-07 10:11:22.280',3,2,'서울특별시 강남구 도산대로 510','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail1.JPG?alt=media&token=637d6650-1b51-401c-8d81-27d59ecbc23e')
insert into tok_posts values(2,1,'나이스샷^.^','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4','2021-07-07 11:11:22.280',2,0,'서울특별시 강남구 도산대로81길 28','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail2.JPG?alt=media&token=656d194c-2c52-4349-92c9-a09bc17a74e9')
insert into tok_posts values(3,2,'골프 같이 치실 분?','https://www.dropbox.com/s/df2d2gf1dvnr5uj/Sample_1280x720_mp4','2021-07-07 17:11:22.280',1,1,'서울특별시 강남구 논현로 833 재경빌딩','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail3.JPG?alt=media&token=7f226d1c-e2b4-4ef7-bbf7-e8b30c808414')
insert into tok_posts values(4,4,'심심하당','https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4','2021-07-07 11:11:22.280',0,0,'서울특별시 서대문구 서소문로 37 충정로대우디오빌','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail4.JPG?alt=media&token=cb5a6ad1-e066-48d3-8aca-83a69713983a')
insert into tok_posts values(5,5,'','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4','2021-07-08 11:11:22.280',3,0,'서울특별시 중랑구 용마산로129나길 6 4층','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail2.JPG?alt=media&token=656d194c-2c52-4349-92c9-a09bc17a74e9')
insert into tok_posts values(6,6,'언제쯤 잘 치게 될까?ㅜㅜ','https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4','2021-07-08 11:11:22.280',4,1,'서울특별시 노원구 동일로248길 16 수락파크빌','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail5.JPG?alt=media&token=181fb399-26fa-4bc1-9dd0-1149b93dbe13')
insert into tok_posts values(7,5,'오늘은 골프 잘 쳐지는 날','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4','2021-07-09 22:10:22.280',2,4,'서울특별시 관악구 관악로15길 23-11 관악맥스텔 B1','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail6.JPG?alt=media&token=f7f59013-1654-4bed-a550-49d40250a1a0')
insert into tok_posts values(8,8,'다음 목표를 향해!!','http://techslides.com/demos/sample-videos/small.mp4','2021-07-09 01:11:22.280',24,1,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail1.JPG?alt=media&token=637d6650-1b51-401c-8d81-27d59ecbc23e')
insert into tok_posts values(9,8,'원래 #스크린골프장 갈 계획 없었는데 친구 따라 감ㅋㅋ #자세불안정 #아직초보','https://www.rmp-streaming.com/media/big-buck-bunny-360p.mp4','2021-07-10 11:11:22.280',9,0,'서울특별시 중랑구 용마산로129나길 6 4층','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail7.JPG?alt=media&token=9c7082b6-8327-431b-80ed-10c8acdf6ca7')
insert into tok_posts values(10,8,'바로 오늘 한거 ㅋㅋㅋ','https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4','2021-07-10 14:11:22.280',3,3,'서울특별시 은평구 통일로83길 6-29 유진빌딩','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail4.JPG?alt=media&token=cb5a6ad1-e066-48d3-8aca-83a69713983a')
insert into tok_posts values(11,3,'#선팔 #맞팔 #좋아요 #골프장','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4','2021-07-12 17:11:22.280',0,0,'서울특별시 영등포구 의사당대로 127 롯데캐슬엠파이어','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail2.JPG?alt=media&token=656d194c-2c52-4349-92c9-a09bc17a74e9')
insert into tok_posts values(12,4,'','https://www.dropbox.com/s/df2d2gf1dvnr5uj/Sample_1280x720_mp4','2021-07-13 17:11:22.280',3,1,'서울특별시 서대문구 충정로 36 국민연금빌딩','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail3.JPG?alt=media&token=7f226d1c-e2b4-4ef7-bbf7-e8b30c808414')
insert into tok_posts values(13,9,'심심해ㅡㅡ','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4','2021-07-12 22:37:22.280',11,3,'서울특별시 은평구 서오릉로 94 삼성타운아파트상가 지하1층','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail6.JPG?alt=media&token=f7f59013-1654-4bed-a550-49d40250a1a0')
insert into tok_posts values(14,2,'아직 멀었다ㅜㅜㅜ #프로골퍼 가 되는 그 날까지!!!','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4','2021-07-13 14:11:22.280',1,0,'서울특별시 강남구 도산대로81길 28','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail2.JPG?alt=media&token=656d194c-2c52-4349-92c9-a09bc17a74e9')
insert into tok_posts values(15,2,'자세 왜이러냐 ㅋㅋㅋㅋ','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4','2021-07-13 14:11:22.280',7,3,'서울특별시 노원구 덕릉로 688 5층','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail8.JPG?alt=media&token=2ce56ea7-9529-48fb-b808-3b5c9886918a')
insert into tok_posts values(16,10,'','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4','2021-07-14 20:11:22.280',2,0,'서울특별시 서대문구 홍은중앙로 29','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail9.JPG?alt=media&token=3c4879c5-e5e4-4698-81b9-2080c2d8accc')
insert into tok_posts values(17,3,'#골린이 1달차 #골프','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4','2021-07-14 23:11:22.280',0,0,'','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail8.JPG?alt=media&token=2ce56ea7-9529-48fb-b808-3b5c9886918a')
insert into tok_posts values(18,2,'','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4','2021-07-15 18:11:22.280',33,5,'서울특별시 은평구 증산로 315 1층.지하1층 스크린골프장','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail10.JPG?alt=media&token=e39f5576-5b11-4668-8956-8d17398c7445')
insert into tok_posts values(19,6,'너무 더웠음ㅋㅋㅋ','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4','2021-07-15 09:53:22.280',13,2,'서울특별시 중랑구 용마산로129나길 6 4층','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail10.JPG?alt=media&token=e39f5576-5b11-4668-8956-8d17398c7445')
insert into tok_posts values(20,3,'점점 #실력 이 늘어가는게 보여서 뿌듯하다ㅎㅎ','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4','2021-07-16 11:53:22.280',8,0,'서울특별시 노원구 동일로 986 노원프레미어스엠코 지하2층','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail8.JPG?alt=media&token=2ce56ea7-9529-48fb-b808-3b5c9886918a')
insert into tok_posts values(21,8,'','https://vt.tumblr.com/tumblr_o600t8hzf51qcbnq0_480.mp4','2021-07-16 13:03:22.280',3,1,'서울특별시 은평구 서오릉로 94 삼성타운아파트상가 지하1층','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail11.JPG?alt=media&token=b968e3bc-be41-466c-a9d1-003632ac1685')
insert into tok_posts values(22,3,'시원한 한방~','http://techslides.com/demos/sample-videos/small.mp4','2021-07-16 14:15:22.280',12,2,'서울특별시 영등포구 의사당대로 127 롯데캐슬엠파이어','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail1.JPG?alt=media&token=637d6650-1b51-401c-8d81-27d59ecbc23e')
insert into tok_posts values(23,4,'','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',GETDATE(),14,5,'서울특별시 노원구 동일로 986 노원프레미어스엠코 지하2층','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail9.JPG?alt=media&token=3c4879c5-e5e4-4698-81b9-2080c2d8accc')
insert into tok_posts values(24,4,'드디어 #골린이 탈출인가 ㅋㅋ','https://www.rmp-streaming.com/media/big-buck-bunny-360p.mp4',GETDATE(),8,0,'서울특별시 노원구 동일로234길 27','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail7.JPG?alt=media&token=9c7082b6-8327-431b-80ed-10c8acdf6ca7')
insert into tok_posts values(25,9,'너무 덥다ㅜㅋ','https://vt.tumblr.com/tumblr_o600t8hzf51qcbnq0_480.mp4',GETDATE(),5,1,'서울특별시 노원구 섬밭로 258 건영옴니백화점','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail11.JPG?alt=media&token=b968e3bc-be41-466c-a9d1-003632ac1685')
insert into tok_posts values(26,14,'짬내서 치러온 #골프 ^^','https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4',GETDATE(),0,0,'서울특별시 노원구 마들로 31 그랑빌아파트','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail4.JPG?alt=media&token=cb5a6ad1-e066-48d3-8aca-83a69713983a')
insert into tok_posts values(27,13,'','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',GETDATE(),3,0,'서울특별시 강남구 남부순환로370길 33','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail10.JPG?alt=media&token=e39f5576-5b11-4668-8956-8d17398c7445')
insert into tok_posts values(28,10,'','https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',GETDATE(),17,3,'서울특별시 강남구 영동대로 721 지하 1층','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail5.JPG?alt=media&token=181fb399-26fa-4bc1-9dd0-1149b93dbe13')
insert into tok_posts values(29,7,'새로 가 본 #스크린골프장 인데 쾌적하고 굿굿','https://vt.tumblr.com/tumblr_o600t8hzf51qcbnq0_480.mp4',GETDATE(),11,2,'서울특별시 노원구 동일로 986 노원프레미어스엠코 지하2층','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail11.JPG?alt=media&token=b968e3bc-be41-466c-a9d1-003632ac1685')
insert into tok_posts values(30,7,'','http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',GETDATE(),1,0,'서울특별시 강남구 영동대로106길 17 경진빌딩 지하 1층','https://firebasestorage.googleapis.com/v0/b/golftok-29f49.appspot.com/o/video_thumbnail%2Fthumbnail10.JPG?alt=media&token=e39f5576-5b11-4668-8956-8d17398c7445')


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
insert into comments values(1,1,4,'멋져요!!',GETDATE(),2,'1','0',0)
insert into comments values(2,1,1,'감사합니다ㅎㅎㅎ',GETDATE(),1,'1','1',1)
insert into comments values(3,6,2,'나중에 저랑도 같이 쳐요ㅎㅎ',GETDATE(),1,'4','0',0)
insert into comments values(4,7,8,'실력이 더 느셨네요ㅋㅋㅋ',GETDATE(),4,'5','0',0)
insert into comments values(5,7,12,'완전 프로 같아요',GETDATE(),2,'7','0',0)
insert into comments values(6,7,5,'아직 부족합니다 ㅋㅋ',GETDATE(),1,'5','1',1)
insert into comments values(7,7,5,'감사합니다 나중에 같이 쳐요~~',GETDATE(),3,'7','1',1)
insert into comments values(8,7,12,'좋죠 언제 한 번 불러주세요ㅎㅎㅎ',GETDATE(),3,'7','2',1)
insert into comments values(9,3,11,'언제가신거에요ㅋㅋㅋㅋ',GETDATE(),0,'3','0',0)
insert into comments values(10,8,1,'스윙이 시원하네요',GETDATE(),3,'10','0',0)
insert into comments values(11,7,5,'네ㅎㅎ',GETDATE(),3,'7','3',1)
insert into comments values(12,8,8,'감사합니다ㅋㅋㅋ기분이 좋네요',GETDATE(),2,'10','1',1)
insert into comments values(13,10,4,'언제인가요ㅋㅋㅋ',GETDATE(),0,'13','0',0)
insert into comments values(14,10,5,'스윙 시원하네~~',GETDATE(),2,'14','1',0)
insert into comments values(15,10,13,'완전 프로같은데요??',GETDATE(),4,'15','2',0)
insert into comments values(16,12,7,'나중에 같이 가요!!',GETDATE(),3,'16','0',0)
insert into comments values(17,13,10,'멋져ㅎㅎㅎ',GETDATE(),3,'17','0',0)
insert into comments values(18,13,9,'오옝ㅎㅎ땡큐',GETDATE(),0,'17','1',1)
insert into comments values(19,13,10,'우리 언제봐??',GETDATE(),1,'19','0',0)
insert into comments values(20,15,9,'골프 친구해요ㅎㅎㅎ',GETDATE(),2,'20','0',0)
insert into comments values(21,15,2,'좋아요 신청했어요~',GETDATE(),5,'20','1',1)
insert into comments values(22,15,15,'저두 해도 되나용ㅋㅋㅎㅎ',GETDATE(),3,'20','2',1)
insert into comments values(23,18,3,'우리 언제 같이 쳐ㅡㅡ',GETDATE(),7,'23','0',0)
insert into comments values(24,18,2,'주말 ㄱㄱ',GETDATE(),3,'23','1',1)
insert into comments values(25,18,3,'나 일요일만 가능ㅋ',GETDATE(),0,'23','2',1)
insert into comments values(26,18,2,'ㅇㅋㅇㅋ일욜 고',GETDATE(),0,'23','3',1)
insert into comments values(27,18,3,'2시ㄱ?',GETDATE(),4,'23','4',1)
insert into comments values(28,19,12,'초보의 실력이 아닌데???ㅋㅋ',GETDATE(),2,'28','0',0)
insert into comments values(29,19,6,'시작한지 3개월밖에 안됐어ㅋㅋ',GETDATE(),6,'28','1',1)

---hashtag data---
insert into hashtag values(1,1,'좋아요')
insert into hashtag values(2,9,'스크린골프장')
insert into hashtag values(3,9,'자세불안정')
insert into hashtag values(4,9,'아직초보')
insert into hashtag values(5,11,'선팔')
insert into hashtag values(6,11,'맞팔')
insert into hashtag values(7,11,'좋아요')
insert into hashtag values(8,11,'골프장')
insert into hashtag values(9,14,'프로골퍼')
insert into hashtag values(10,17,'골린이')
insert into hashtag values(11,17,'골프')
insert into hashtag values(12,20,'실력')
insert into hashtag values(13,24,'골린이')
insert into hashtag values(14,26,'골프')
insert into hashtag values(15,29,'스크린골프장')