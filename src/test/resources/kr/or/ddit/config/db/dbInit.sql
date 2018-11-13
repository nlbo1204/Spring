--운영 db에는 없는 테이블 ==> 안전장치를 마련한다 생각해
-- 운영 db로 경로 설정을 잘못했다면 테이블이 없다고 에러 발생 --> 실수 방지
select * from notexistsinprd;

--테스트 코드가 실행디기전 rangers 데이터 삭제
delete from rangers;

--rangers 초기 데이터 3건 입력
 insert into rangers values('brown','브라운');
 insert into rangers values('cony','코니');
 insert into rangers values('sally','샐리');
 
--jspuser
delete from jspuser;

--jsp 스크립트 생성
insert into jspuser values ('샐리님','샐리001','pass1234','대전 중구 중앙로 76','영민빌딩2층 대덕인재개발원','34940','18/11/15','newUser@gmail.com','0422228202','/profile/sally.png');
insert into jspuser values ('1003yd','123456','123456','대전 중구 중앙로 76','영민빌딩2층 대덕인재개발원','34940','18/11/08','newUser@gmail.com','0422228202','/profile/moon.png');
insert into jspuser values ('다영','다영쓰','1234567','대전 중구 중앙로 76','영민빌딩2층 대덕인재개발원','34940','18/08/08','newUser@gmail.com','0422228202','');
insert into jspuser values ('brown002','브라운002','pass1234','대전 중구 중앙로 76','영민빌딩2층 대덕인재개발원','34940','18/11/08','newUser@gmail.com','0422228202','');
insert into jspuser values ('brown','브라운','f01471c38113db263f9a532d8b6c054af31bf653aeea92d1c284cdd022b9','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/11/08','brown@gmail.con','123123123','/profile/brown.png');
insert into jspuser values ('sally','샐리','123456','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/11/07','sally@gmail.con','123123123','');
insert into jspuser values ('cony','코니','9299a16ffb4d721536dddc82d646c9ed3f78971f5a3fcd3439ef223a35903cda','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/11/07','cony@gmail.con','123123123','');
insert into jspuser values ('moon','문','03d1c81a2397bb51dface79a897decd50e7f4d8ea7fd547c8506d80e282905e','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/10/06','moon@gmail.con','123123123','');
insert into jspuser values ('james','제임스','249bbac76e15fc9f93dba1ba0b5b7cc5a4b6f2a7d57a4a50b944dbd45ecd41','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/11/14','james@gmail.con','123123123','/profile/ryan.png');
insert into jspuser values ('brownc','브라운','f01471c38113db263f9a532d8b6c054af31bf653aeea92d1c284cdd022b9','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/11/06','brown@gmail.con','123123123','/profile/코니.png');
insert into jspuser values ('asdf','change','pass1234','대전 중구 중앙로 76','영민빌딩2층 대덕인재개발원','34940','18/11/08','newUser@gmail.com','0422228202','/profile/sally.png');
insert into jspuser values ('12345','testUserId','pass1234','대전 중구 중앙로 76','영민빌딩2층 대덕인재개발원','34940','18/08/08','newUser@gmail.com','0422228202','/profile/moon.png');




--월 단위 달력 초기화
delete from calendar where ymd like '201811%';