
-- 카페정보
drop table if exists tb_cafe_cafeinfo;
CREATE TABLE `tb_cafe_cafeinfo` (
	`cafeno` INT(11) NOT NULL AUTO_INCREMENT,
	`brand` VARCHAR(50) NOT NULL,
	`cafename` VARCHAR(30) NOT NULL,
	`cafeaddr` VARCHAR(30) NOT NULL,
	`cafephone` VARCHAR(30) NULL DEFAULT NULL,
	`avg_grade` DOUBLE NULL DEFAULT '0',
	`review_count` INT(11) NULL DEFAULT '0',
	`like_count` INT(11) NULL DEFAULT '0',
	`cafebigtype` VARCHAR(50) NOT NULL DEFAULT '카페',
	`cafesmalltype` VARCHAR(50) NOT NULL DEFAULT '프렌차이즈',
	`businessnum` VARCHAR(50) DEFAULT '사업자번호 없음',
	`deliveryloc` VARCHAR(50) DEFAULT '배달 불가',
	`opentime`    VARCHAR(50) DEFAULT '12시~24시',
	
	PRIMARY KEY (`cafeno`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=498
;

-- 카페유저 정보
drop table if exists tb_cafe_user;
CREATE TABLE `tb_cafe_user` (
	`userno` INT(11) NOT NULL AUTO_INCREMENT,
	`userlevel` INT(11) NULL DEFAULT '1',
	`email` VARCHAR(40) NOT NULL,
	`passwd` VARCHAR(30) NOT NULL,
	`userphone` VARCHAR(30) NOT NULL,
	`useraddr` VARCHAR(100) NULL DEFAULT NULL,
	`sex` VARCHAR(30) NULL DEFAULT NULL,
	`emailselect` INT(11) NULL DEFAULT '0',
	`usernickname` VARCHAR(30) NOT NULL,
	PRIMARY KEY (`userno`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

-- 카페 댓글 정보
drop table if exists tb_cafe_review;
CREATE TABLE `tb_cafe_review` (
	`commentno` INT(11) NOT NULL AUTO_INCREMENT,
	`usernickname` VARCHAR(30) NOT NULL,
	`cafeno` INT(11) NULL DEFAULT NULL,
	`content` VARCHAR(9999) NOT NULL,
	`grade` DOUBLE NOT NULL,
	`regdate` DATETIME NULL DEFAULT NULL,
	`updateDate` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`commentno`),
	INDEX `cafereview_cafeinfo_fk` (`cafeno`),
	CONSTRAINT `cafereview_cafeinfo_fk` FOREIGN KEY (`cafeno`) REFERENCES `tb_cafe_cafeinfo` (`cafeno`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=25
;

-- 파일 업로드 테이블
CREATE TABLE `tb_upload_file` (
	`uploadFileNo` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`fileName` VARCHAR(50) NOT NULL,
	`fileSize` INT(10) UNSIGNED NOT NULL,
	`contentType` VARCHAR(30) NOT NULL,
	PRIMARY KEY (`uploadFileNo`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

-- 파일 이미지 업로드 테이블
CREATE TABLE `tb_upload_image` (
	`uploadImageNo` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`fileName` VARCHAR(50) NOT NULL,
	`fileSize` INT(10) UNSIGNED NOT NULL,
	`contentType` VARCHAR(30) NOT NULL,
	`imageBytes` LONGBLOB NULL,
	`imageBase64` LONGTEXT NULL,
	PRIMARY KEY (`uploadImageNo`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=2
;

-- 카페 메뉴 
drop table if exists tb_cafe_menu;
CREATE TABLE `tb_cafe_menu` (
	`brand` VARCHAR(50) NULL DEFAULT NULL,
	`menu_id` INT(11) NOT NULL AUTO_INCREMENT,
	`menucd` VARCHAR(50) NULL DEFAULT NULL,
	`menu_name` VARCHAR(50) NULL DEFAULT NULL,
	`price` INT(11) NULL DEFAULT NULL,
	`description` VARCHAR(50) NULL DEFAULT NULL,
	PRIMARY KEY (`menu_id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=166
;

-- 카페 즐겨찾기
drop table if exists tb_cafe_like;
CREATE TABLE `tb_cafe_like` (
	`cafeno` INT(11) NOT NULL,
	`userno` INT(11) NOT NULL,
	INDEX `FK_tb_cafe_like_tb_cafe_cafeinfo` (`cafeno`),
	INDEX `FK_tb_cafe_like_tb_cafe_user` (`userno`),
	CONSTRAINT `FK_tb_cafe_like_tb_cafe_cafeinfo` FOREIGN KEY (`cafeno`) REFERENCES `tb_cafe_cafeinfo` (`cafeno`),
	CONSTRAINT `FK_tb_cafe_like_tb_cafe_user` FOREIGN KEY (`userno`) REFERENCES `tb_cafe_user` (`userno`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


--     카페 insert
    INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('스타벅스', '스타벅스 노원점', '서울특별시 노원구', '01010101','카페','프렌차이즈','546-32-00200','하계동,상계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('할리스', '할리스 노원점', '서울특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','하계동,상계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('카페베네', '카페베네 노원점', '노원특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','하계동,상계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('이디야', '이디야 노원점', '노원특별시 지산구', '01010101','카페','프렌차이즈','546-32-00200','하계동,상계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('탐탐', '탐탐 노원점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','하계동,상계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('커피빈', '커피빈 노원점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','하계동,상계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('스타벅스', '스타벅스 창동점', '서울특별시 노원구', '01010101','카페','프렌차이즈','546-32-00200','하계동,상계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('할리스', '할리스 창동점', '서울특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','하계동,상계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('카페베네', '카페베네 창동점', '노원특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','하계동,상계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('이디야', '이디야 창동점', '노원특별시 지산구', '01010101','카페','프렌차이즈','546-32-00200','하계동,상계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('탐탐', '탐탐 창동점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','하계동,상계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('커피빈', '커피빈 창동점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','하계동,상계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('스타벅스', '스타벅스 저기점', '서울특별시 노원구', '01010101','카페','프렌차이즈','546-32-00200','하계동,상계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('할리스', '할리스 저기점', '서울특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','하계동,상계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('카페베네', '카페베네 저기점', '노원특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','하계동,상계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('이디야', '이디야 저기점', '노원특별시 지산구', '01010101','카페','프렌차이즈','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('탐탐', '탐탐 저기점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('커피빈', '커피빈 저기점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('스타벅스', '스타벅스 저기점', '서울특별시 노원구', '01010101','카페','프렌차이즈','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('할리스', '할리스 저기점', '서울특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('카페베네', '카페베네 저기점', '노원특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('이디야', '이디야 저기점', '노원특별시 지산구', '01010101','카페','프렌차이즈','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('탐탐', '탐탐 저기점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('커피빈', '커피빈 저기점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','삼성동,논현동','10시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('스타벅스', '스타벅스 요기점', '서울특별시 노원구', '01010101','카페','프렌차이즈','546-32-00200','삼성동,논현동','10시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('할리스', '할리스 요기점', '서울특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','삼성동,논현동','10시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('카페베네', '카페베네 요기점', '노원특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','삼성동,논현동','10시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('이디야', '이디야 요기점', '노원특별시 지산구', '01010101','카페','프렌차이즈','546-32-00200','삼성동,논현동','10시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('탐탐', '탐탐 저기점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','삼성동,논현동','10시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('커피빈', '커피빈 요기점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','삼성동,논현동','10시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('스타벅스', '스타벅스 노원점', '서울특별시 노원구', '01010101','카페','프렌차이즈','546-32-00200','삼성동,논현동','10시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('할리스', '할리스 노원점', '서울특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','삼성동,논현동','10시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('카페베네', '카페베네 노원점', '노원특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','삼성동,논현동','10시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('이디야', '이디야 노원점', '노원특별시 지산구', '01010101','카페','프렌차이즈','546-32-00200','삼성동,논현동','10시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('탐탐', '탐탐 노원점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','삼성동,논현동','10시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('커피빈', '커피빈 노원점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','삼성동,논현동','10시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('스타벅스', '스타벅스 창동점', '서울특별시 노원구', '01010101','카페','프렌차이즈','546-32-00200','삼성동,논현동','10시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('할리스', '할리스 창동점', '서울특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','삼성동,논현동','10시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('카페베네', '카페베네 창동점', '노원특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','삼성동,논현동','10시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('이디야', '이디야 창동점', '노원특별시 지산구', '01010101','카페','프렌차이즈','546-32-00200','삼성동,논현동','10시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('탐탐', '탐탐 창동점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','삼성동,논현동','10시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('커피빈', '커피빈 창동점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','삼성동,논현동','10시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('스타벅스', '스타벅스 저기점', '서울특별시 노원구', '01010101','카페','프렌차이즈','546-32-00200','삼성동,논현동','10시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('할리스', '할리스 저기점', '서울특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','삼성동,논현동','9시30분~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('카페베네', '카페베네 저기점', '노원특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','삼성동,논현동','9시30분~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('이디야', '이디야 저기점', '노원특별시 지산구', '01010101','카페','프렌차이즈','546-32-00200','삼성동,논현동','9시30분~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('탐탐', '탐탐 저기점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','삼성동,논현동','9시30분~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('커피빈', '커피빈 저기점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','9시30분~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('스타벅스', '스타벅스 저기점', '서울특별시 노원구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','9시30분~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('할리스', '할리스 저기점', '서울특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','9시30분~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('카페베네', '카페베네 저기점', '노원특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','9시30분~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('이디야', '이디야 저기점', '노원특별시 지산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','9시30분~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('탐탐', '탐탐 저기점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','9시30분~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('커피빈', '커피빈 저기점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','9시30분~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('스타벅스', '스타벅스 요기점', '서울특별시 노원구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','9시30분~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('할리스', '할리스 요기점', '서울특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','9시30분~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('카페베네', '카페베네 요기점', '노원특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','9시30분~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('이디야', '이디야 요기점', '노원특별시 지산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','9시30분~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('탐탐', '탐탐 저기점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','9시30분~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('커피빈', '커피빈 요기점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','9시30분~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('스타벅스', '스타벅스 노원점', '서울특별시 노원구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','9시30분~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('할리스', '할리스 노원점', '서울특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','9시30분~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('카페베네', '카페베네 노원점', '노원특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','9시30분~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('이디야', '이디야 노원점', '노원특별시 지산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','9시30분~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('탐탐', '탐탐 노원점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','9시30분~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('커피빈', '커피빈 노원점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','9시30분~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('스타벅스', '스타벅스 창동점', '서울특별시 노원구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','9시30분~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('할리스', '할리스 창동점', '서울특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','9시30분~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('카페베네', '카페베네 창동점', '노원특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','9시30분~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('이디야', '이디야 창동점', '노원특별시 지산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','9시30분~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('탐탐', '탐탐 창동점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('커피빈', '커피빈 창동점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('스타벅스', '스타벅스 저기점', '서울특별시 노원구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('할리스', '할리스 저기점', '서울특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('카페베네', '카페베네 저기점', '노원특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('이디야', '이디야 저기점', '노원특별시 지산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('탐탐', '탐탐 저기점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('커피빈', '커피빈 저기점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('스타벅스', '스타벅스 저기점', '서울특별시 노원구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('할리스', '할리스 저기점', '서울특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('카페베네', '카페베네 저기점', '노원특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('이디야', '이디야 저기점', '노원특별시 지산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('탐탐', '탐탐 저기점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('커피빈', '커피빈 저기점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('스타벅스', '스타벅스 요기점', '서울특별시 노원구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('할리스', '할리스 요기점', '서울특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('카페베네', '카페베네 요기점', '노원특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('이디야', '이디야 요기점', '노원특별시 지산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('탐탐', '탐탐 저기점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('커피빈', '커피빈 요기점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('스타벅스', '스타벅스 노원점', '서울특별시 노원구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('할리스', '할리스 노원점', '서울특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('카페베네', '카페베네 노원점', '노원특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('이디야', '이디야 노원점', '노원특별시 지산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('탐탐', '탐탐 노원점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~23시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('커피빈', '커피빈 노원점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('스타벅스', '스타벅스 창동점', '서울특별시 노원구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('할리스', '할리스 창동점', '서울특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('카페베네', '카페베네 창동점', '노원특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('이디야', '이디야 창동점', '노원특별시 지산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('탐탐', '탐탐 창동점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('커피빈', '커피빈 창동점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('스타벅스', '스타벅스 저기점', '서울특별시 노원구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('할리스', '할리스 저기점', '서울특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('카페베네', '카페베네 저기점', '노원특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('이디야', '이디야 저기점', '노원특별시 지산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('탐탐', '탐탐 저기점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('커피빈', '커피빈 저기점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('스타벅스', '스타벅스 저기점', '서울특별시 노원구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('할리스', '할리스 저기점', '서울특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('카페베네', '카페베네 저기점', '노원특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('이디야', '이디야 저기점', '노원특별시 지산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('탐탐', '탐탐 저기점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('커피빈', '커피빈 저기점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('스타벅스', '스타벅스 요기점', '서울특별시 노원구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('할리스', '할리스 요기점', '서울특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('카페베네', '카페베네 요기점', '노원특별시 용산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('이디야', '이디야 요기점', '노원특별시 지산구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('탐탐', '탐탐 저기점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('커피빈', '커피빈 요기점', '저기특별시 요기구', '01010101','카페','프렌차이즈','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인카페', '병성이네', '게이ㅁ특별시 요기구', '01010101','카페','개인카페','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인카페', '지안이네', '게이ㅁ특별시 요기구', '01010101','카페','개인카페','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인카페', '성현이네', '게이ㅁ특별시 요기구', '01010101','카페','개인카페','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인카페', '정석이네', '게이ㅁ특별시 요기구', '01010101','카페','개인카페','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인카페', '영기네', '게이ㅁ특별시 요기구', '01010101','카페','개인카페','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인카페', '근욱이네', '게이ㅁ특별시 요기구', '01010101','카페','개인카페','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인카페', '수영이네', '게이ㅁ특별시 요기구', '01010101','카페','개인카페','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인카페', '종원이네', '게이ㅁ특별시 요기구', '01010101','카페','개인카페','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인카페', '재국이네', '게이ㅁ특별시 요기구', '01010101','카페','개인카페','546-32-00200','배달불가','8시~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인카페', '성영이네', '게이ㅁ특별시 요기구', '01010101','카페','개인카페','546-32-00200','배달불가','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인카페', '병성이네', '게이ㅁ특별시 저기구', '01010101','카페','개인카페','546-32-00200','배달불가','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인카페', '지안이네', '게이ㅁ특별시 저기구', '01010101','카페','개인카페','546-32-00200','배달불가','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인카페', '성현이네', '게이ㅁ특별시 저기구', '01010101','카페','개인카페','546-32-00200','배달불가','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인카페', '정석이네', '게이ㅁ특별시 저기구', '01010101','카페','개인카페','546-32-00200','배달불가','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인카페', '영기네', '게이ㅁ특별시 저기구', '01010101','카페','개인카페','546-32-00200','배달불가','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인카페', '근욱이네', '게이ㅁ특별시 저기구', '01010101','카페','개인카페','546-32-00200','배달불가','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인카페', '수영이네', '게이ㅁ특별시 저기구', '01010101','카페','개인카페','546-32-00200','배달불가','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인카페', '종원이네', '게이ㅁ특별시 저기구', '01010101','카페','개인카페','546-32-00200','배달불가','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인카페', '재국이네', '게이ㅁ특별시 저기구', '01010101','카페','개인카페','546-32-00200','배달불가','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인카페', '성영이네', '게이ㅁ특별시 저기구', '01010101','카페','개인카페','546-32-00200','배달불가','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인카페', '성영이네', '게이ㅁ특별시 저기구', '01010101','카페','개인카페','546-32-00200','배달불가','8시30분~22시');


        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('호미빙', '호미빙 노원', '갱상도 노원구', '01010101','빙수','프렌차이즈','546-32-00200','배달불가','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('설빙', '설빙 노원', '전라도 중랑구', '01010101','빙수','프렌차이즈','546-32-00200','배달불가','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('눈꽃빙수', '눈꽃빙수 노원', '충청도 송파구', '01010101','빙수','프렌차이즈','546-32-00200','배달불가','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('밀탑빙수', '밀탑빙수 노원', '경기도 아이구', '01010101','빙수','프렌차이즈','546-32-00200','배달불가','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('옥루몽', '옥루몽 노원', '강원도 얼씨구', '01010101','빙수','프렌차이즈','546-32-00200','배달불가','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('호미빙', '호미빙 창동', '갱상도 노원구', '01010101','빙수','프렌차이즈','546-32-00200','배달불가','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('설빙', '설빙 창동', '전라도 중랑구', '01010101','빙수','프렌차이즈','546-32-00200','배달불가','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('눈꽃빙수', '눈꽃빙수 창동', '충청도 송파구', '01010101','빙수','프렌차이즈','546-32-00200','배달불가','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('밀탑빙수', '밀탑빙수 창동', '경기도 아이구', '01010101','빙수','프렌차이즈','546-32-00200','배달불가','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('옥루몽', '옥루몽 창동', '강원도 얼씨구', '01010101','빙수','프렌차이즈','546-32-00200','배달불가','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('호미빙', '호미빙 명동', '갱상도 노원구', '01010101','빙수','프렌차이즈','546-32-00200','배달불가','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('설빙', '설빙 명동', '전라도 중랑구', '01010101','빙수','프렌차이즈','546-32-00200','배달불가','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('눈꽃빙수', '눈꽃빙수 명동', '충청도 송파구', '01010101','빙수','프렌차이즈','546-32-00200','배달불가','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('밀탑빙수', '밀탑빙수 노원', '경기도 아이구', '01010101','빙수','프렌차이즈','546-32-00200','배달불가','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('옥루몽', '옥루몽 노원', '강원도 얼씨구', '01010101','빙수','프렌차이즈','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('옥루몽', '옥루몽 강남 ', '경기도 얼씨구', '01010163','빙수','프렌차이즈','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('설빙', '설빙 종로', '서울 절씨구', '01052101','빙수','프렌차이즈','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('눈꽃빙수', '눈꽃빙수 종로', '서울 종로구', '01052301','빙수','프렌차이즈','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('호미빙', '호미빙 종로', '서울 종로구', '01052122','빙수','프렌차이즈','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('호미빙', '호미빙 대전', '갱상도 노원구', '01010101','빙수','프렌차이즈','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('설빙', '설빙 대전', '전라도 중랑구', '01010101','빙수','프렌차이즈','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('눈꽃빙수', '눈꽃빙수 대전', '충청도 송파구', '01010101','빙수','프렌차이즈','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('밀탑빙수', '밀탑빙수 대전', '경기도 아이구', '01010101','빙수','프렌차이즈','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('옥루몽', '옥루몽 대전', '강원도 얼씨구', '01010101','빙수','프렌차이즈','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인빙수', '지안이네 종로', '서울 종로구', '01052122','빙수','개인','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인빙수', '병성이네', '게이ㅁ특별시 요기구', '01010101','빙수','개인빙수','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인빙수', '지안이네', '게이ㅁ특별시 요기구', '01010101','빙수','개인빙수','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인빙수', '성현이네', '게이ㅁ특별시 요기구', '01010101','빙수','개인빙수','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인빙수', '정석이네', '게이ㅁ특별시 요기구', '01010101','빙수','개인빙수','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인빙수', '영기네', '게이ㅁ특별시 요기구', '01010101','빙수','개인빙수','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인빙수', '근욱이네', '게이ㅁ특별시 요기구', '01010101','빙수','개인빙수','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인빙수', '수영이네', '게이ㅁ특별시 요기구', '01010101','빙수','개인빙수','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인빙수', '종원이네', '게이ㅁ특별시 요기구', '01010101','빙수','개인빙수','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인빙수', '재국이네', '게이ㅁ특별시 요기구', '01010101','빙수','개인빙수','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인빙수', '성영이네', '게이ㅁ특별시 요기구', '01010101','빙수','개인빙수','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인빙수', '병성이네', '게이ㅁ특별시 저기구', '01010101','빙수','개인빙수','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인빙수', '지안이네', '게이ㅁ특별시 저기구', '01010101','빙수','개인빙수','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인빙수', '성현이네', '게이ㅁ특별시 저기구', '01010101','빙수','개인빙수','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인빙수', '정석이네', '게이ㅁ특별시 저기구', '01010101','빙수','개인빙수','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인빙수', '영기네', '게이ㅁ특별시 저기구', '01010101','빙수','개인빙수','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인빙수', '근욱이네', '게이ㅁ특별시 저기구', '01010101','빙수','개인빙수','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인빙수', '수영이네', '게이ㅁ특별시 저기구', '01010101','빙수','개인빙수','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인빙수', '종원이네', '게이ㅁ특별시 저기구', '01010101','빙수','개인빙수','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인빙수', '재국이네', '게이ㅁ특별시 저기구', '01010101','빙수','개인빙수','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인빙수', '성영이네', '게이ㅁ특별시 저기구', '01010101','빙수','개인빙수','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('개인빙수', '성영이네', '게이ㅁ특별시 저기구', '01010101','빙수','개인빙수','546-32-00200','하계동,중계동','8시30분~22시');


        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('강아지', '강아지카페', '게이ㅁ특별시 자기구', '01010101','펫','강아지','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('고양이', '고양이카페', '게이ㅁ특별시 자기구', '01010101','펫','고양이','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('새', '새카페', '게이ㅁ특별시 자기구', '01010101','펫','새','546-32-00200','하계동,중계동','8시30분~22시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('기타', '너구리카페', '게이ㅁ특별시 자기구', '01010101','펫','기타','546-32-00200','하계동,중계동','8시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('강아지', '강아지냥이카페', '게이ㅁ특별시 자기구', '01010101','펫','강아지','546-32-00200','하계동,중계동','8시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('고양이', '고병신카페', '게이ㅁ특별시 자기구', '01010101','펫','고양이','546-32-00200','하계동,중계동','8시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('새', '앵무새카페', '게이ㅁ특별시 자기구', '01010101','펫','새','546-32-00200','하계동,중계동','8시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('기타', '너굴카페', '게이ㅁ특별시 자기구', '01010101','펫','기타','546-32-00200','하계동,중계동','8시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('강아지', '멍멍카페', '게이ㅁ특별시 자기구', '01010101','펫','강아지','546-32-00200','하계동,중계동','8시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('고양이', '야옹카페', '게이ㅁ특별시 자기구', '01010101','펫','고양이','546-32-00200','하계동,중계동','8시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('새', '짹짹카페', '게이ㅁ특별시 자기구', '01010101','펫','새','546-32-00200','하계동,중계동','8시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('기타', '도롱뇽카페', '게이ㅁ특별시 자기구', '01010101','펫','기타','546-32-00200','하계동,중계동','8시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('강아지', '강아지카페', '게이ㅁ특별시 자기구', '01010101','펫','강아지','546-32-00200','하계동,중계동','8시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('고양이', '고양이카페', '게이ㅁ특별시 자기구', '01010101','펫','고양이','546-32-00200','하계동,중계동','8시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('새', '새카페', '게이ㅁ특별시 자기구', '01010101','펫','새','546-32-00200','하계동,중계동','8시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('기타', '너구리카페', '게이ㅁ특별시 자기구', '01010101','펫','기타','546-32-00200','하계동,중계동','8시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('강아지', '강아지냥이카페', '게이ㅁ특별시 자기구', '01010101','펫','강아지','546-32-00200','하계동,중계동','8시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('고양이', '고병신카페', '게이ㅁ특별시 자기구', '01010101','펫','고양이','546-32-00200','하계동,중계동','8시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('새', '앵무새카페', '게이ㅁ특별시 자기구', '01010101','펫','새','546-32-00200','하계동,중계동','8시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('기타', '너굴카페', '게이ㅁ특별시 자기구', '01010101','펫','기타','546-32-00200','하계동,중계동','8시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('강아지', '멍멍카페', '게이ㅁ특별시 자기구', '01010101','펫','강아지','546-32-00200','하계동,중계동','8시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('고양이', '야옹카페', '게이ㅁ특별시 자기구', '01010101','펫','고양이','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('새', '짹짹카페', '게이ㅁ특별시 자기구', '01010101','펫','새','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('기타', '도롱뇽카페', '게이ㅁ특별시 자기구', '01010101','펫','기타','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('강아지', '강아지카페', '게이ㅁ특별시 자기구', '01010101','펫','강아지','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('고양이', '고양이카페', '게이ㅁ특별시 자기구', '01010101','펫','고양이','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('새', '새카페', '게이ㅁ특별시 자기구', '01010101','펫','새','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('기타', '너구리카페', '게이ㅁ특별시 자기구', '01010101','펫','기타','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('강아지', '강아지냥이카페', '게이ㅁ특별시 자기구', '01010101','펫','강아지','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('고양이', '고병신카페', '게이ㅁ특별시 자기구', '01010101','펫','고양이','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('새', '앵무새카페', '게이ㅁ특별시 자기구', '01010101','펫','새','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('기타', '너굴카페', '게이ㅁ특별시 자기구', '01010101','펫','기타','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('강아지', '멍멍카페', '게이ㅁ특별시 자기구', '01010101','펫','강아지','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('고양이', '야옹카페', '게이ㅁ특별시 자기구', '01010101','펫','고양이','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('새', '짹짹카페', '게이ㅁ특별시 자기구', '01010101','펫','새','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('기타', '도롱뇽카페', '게이ㅁ특별시 자기구', '01010101','펫','기타','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('강아지', '강아지카페', '게이ㅁ특별시 자기구', '01010101','펫','강아지','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('고양이', '고양이카페', '게이ㅁ특별시 자기구', '01010101','펫','고양이','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('새', '새카페', '게이ㅁ특별시 자기구', '01010101','펫','새','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('기타', '너구리카페', '게이ㅁ특별시 자기구', '01010101','펫','기타','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('강아지', '강아지냥이카페', '게이ㅁ특별시 자기구', '01010101','펫','강아지','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('고양이', '고병신카페', '게이ㅁ특별시 자기구', '01010101','펫','고양이','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('새', '앵무새카페', '게이ㅁ특별시 자기구', '01010101','펫','새','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('기타', '너굴카페', '게이ㅁ특별시 자기구', '01010101','펫','기타','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('강아지', '멍멍카페', '게이ㅁ특별시 자기구', '01010101','펫','강아지','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('고양이', '야옹카페', '게이ㅁ특별시 자기구', '01010101','펫','고양이','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('새', '짹짹카페', '게이ㅁ특별시 자기구', '01010101','펫','새','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('기타', '도롱뇽카페', '게이ㅁ특별시 자기구', '01010101','펫','기타','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('강아지', '강아지카페', '게이ㅁ특별시 자기구', '01010101','펫','강아지','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('고양이', '고양이카페', '게이ㅁ특별시 자기구', '01010101','펫','고양이','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('새', '새카페', '게이ㅁ특별시 자기구', '01010101','펫','새','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('기타', '너구리카페', '게이ㅁ특별시 자기구', '01010101','펫','기타','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('강아지', '강아지냥이카페', '게이ㅁ특별시 자기구', '01010101','펫','강아지','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('고양이', '고병신카페', '게이ㅁ특별시 자기구', '01010101','펫','고양이','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('새', '앵무새카페', '게이ㅁ특별시 자기구', '01010101','펫','새','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('기타', '너굴카페', '게이ㅁ특별시 자기구', '01010101','펫','기타','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('강아지', '멍멍카페', '게이ㅁ특별시 자기구', '01010101','펫','강아지','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('고양이', '야옹카페', '게이ㅁ특별시 자기구', '01010101','펫','고양이','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('새', '짹짹카페', '게이ㅁ특별시 자기구', '01010101','펫','새','546-32-00200','하계동,중계동','12시~24시');
        INSERT INTO `tb_cafe_cafeinfo` (`brand`, `cafename`, `cafeaddr`, `cafephone`,`cafebigtype`,`cafesmalltype`,`businessnum`,`deliveryloc`,`opentime`)
        VALUES ('기타', '도롱뇽카페', '게이ㅁ특별시 자기구', '01010101','펫','기타','546-32-00200','하계동,중계동','12시~24시'); 

-- 카페 메뉴insert
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('스타벅스', '커피',  '아메리카노', '4444', '맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('스타벅스', '커피',  '라떼', '4444', '맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('스타벅스', '커피',  '콜드브루', '5555', '완전쨩임ㅎㅎ');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('스타벅스',  '스무디', '딸기스무디', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('스타벅스',  '스무디', '바나나스무디', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('스타벅스',  '스무디', '딸바스무디', '4444', '진짜맛꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('스타벅스', '티', '아이스티', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('스타벅스', '티', '녹차', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('스타벅스', '티', '홍차', '4444', '진짜맛꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('스타벅스', '디저트', '티라미슈', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('스타벅스', '디저트', '치즈케잌', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('스타벅스', '디저트', '베이글', '4444', '진짜맛꿀맛');

INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('할리스',  '커피', '아메리카노', '4444', '맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('할리스',  '커피', '라떼', '4444', '맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('할리스',  '커피', '콜드브루', '5555', '완전쨩임ㅎㅎ');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('할리스',  '스무디', '딸기스무디', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('할리스',  '스무디', '바나나스무디', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('할리스',  '스무디', '딸바스무디', '4444', '진짜맛꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('할리스', '티', '아이스티', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('할리스', '티', '녹차', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('할리스', '티', '홍차', '4444', '진짜맛꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('할리스', '디저트', '티라미슈', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('할리스', '디저트', '치즈케잌', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('할리스', '디저트', '베이글', '4444', '진짜맛꿀맛');

INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('이디야', '커피', '아메리카노', '4444', '맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('이디야', '커피', '라떼', '4444', '맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('이디야', '커피', '콜드브루', '5555', '완전쨩임ㅎㅎ');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('이디야',  '스무디', '딸기스무디', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('이디야',  '스무디', '바나나스무디', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('이디야',  '스무디', '딸바스무디', '4444', '진짜맛꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('이디야', '티', '아이스티', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('이디야', '티', '녹차', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('이디야', '티', '홍차', '4444', '진짜맛꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('이디야', '디저트', '티라미슈', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('이디야', '디저트', '치즈케잌', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('이디야', '디저트', '베이글', '4444', '진짜맛꿀맛');

INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('탐탐',  '커피', '아메리카노', '4444', '맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('탐탐',  '커피', '라떼', '4444', '맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('탐탐',  '커피', '콜드브루', '5555', '완전쨩임ㅎㅎ');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('탐탐',  '스무디', '딸기스무디', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('탐탐',  '스무디', '바나나스무디', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('탐탐',  '스무디', '딸바스무디', '4444', '진짜맛꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('탐탐', '티', '아이스티', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('탐탐', '티', '녹차', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('탐탐', '티', '홍차', '4444', '진짜맛꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('탐탐', '디저트', '티라미슈', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('탐탐', '디저트', '치즈케잌', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('탐탐',  '디저트','베이글', '4444', '진짜맛꿀맛');

INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('커피빈',  '커피', '아메리카노', '4444', '맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('커피빈',  '커피', '라떼', '4444', '맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('커피빈',  '커피', '콜드브루', '5555', '완전쨩임ㅎㅎ');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('커피빈',  '스무디', '딸기스무디', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('커피빈',  '스무디', '바나나스무디', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('커피빈',  '스무디', '딸바스무디', '4444', '진짜맛꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('커피빈', '티', '아이스티', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('커피빈', '티', '녹차', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('커피빈', '티', '홍차', '4444', '진짜맛꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('커피빈', '디저트', '티라미슈', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('커피빈',  '디저트','치즈케잌', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('커피빈', '디저트', '베이글', '4444', '진짜맛꿀맛');

INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('개인카페',  '커피', '아메리카노', '4444', '맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('개인카페',  '커피', '라떼', '4444', '맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('개인카페',  '커피', '콜드브루', '5555', '완전쨩임ㅎㅎ');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('개인카페',  '스무디', '딸기스무디', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('개인카페',  '스무디', '바나나스무디', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('개인카페',  '스무디', '딸바스무디', '4444', '진짜맛꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('개인카페', '티', '아이스티', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('개인카페', '티', '녹차', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('개인카페', '티', '홍차', '4444', '진짜맛꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('개인카페', '디저트', '티라미슈', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('개인카페', '디저트', '치즈케잌', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('개인카페', '디저트', '베이글', '4444', '진짜맛꿀맛');

INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('호미빙', '빙수', '녹차빙수', '4444', '맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('호미빙', '빙수', '타로빙', '4444', '맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('호미빙', '빙수', '메론빙', '5555', '완전쨩임ㅎㅎ');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('호미빙', '티', '아이스 로얄 밀크티', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('호미빙', '티', '그린티 라떼', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('호미빙', '티', '우롱차', '4444', '진짜맛꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('호미빙', '디저트', '샌드위치', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('호미빙', '디저트', '베이글', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('호미빙',  '디저트','조각케잌', '4444', '진짜맛꿀맛');

INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('설빙', '빙수', '녹차빙수', '4444', '맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('설빙', '빙수', '타로빙수', '4444', '맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('설빙', '빙수', '메론빙', '5555', '완전쨩임ㅎㅎ');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('설빙', '티', '아이스 로얄 밀크티', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('설빙', '티', '그린티 라떼', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('설빙', '티', '우롱차', '4444', '진짜맛꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('설빙', '디저트', '샌드위치', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('설빙', '디저트', '베이글', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('설빙',  '디저트','조각케잌', '4444', '진짜맛꿀맛');

INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('눈꽃빙수', '빙수', '녹차빙수', '4444', '맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('눈꽃빙수', '빙수', '타로빙수', '4444', '맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('눈꽃빙수', '빙수', '메론빙', '5555', '완전쨩임ㅎㅎ');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('눈꽃빙수', '티', '아이스 로얄 밀크티', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('눈꽃빙수', '티', '그린티 라떼', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('눈꽃빙수', '티', '우롱차', '4444', '진짜맛꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('눈꽃빙수', '디저트', '샌드위치', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('눈꽃빙수', '디저트', '베이글', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('눈꽃빙수',  '디저트','조각케잌', '4444', '진짜맛꿀맛');

INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('밀탑빙수', '빙수', '녹차빙수', '4444', '맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('밀탑빙수', '빙수', '타로빙수', '4444', '맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('밀탑빙수', '빙수', '메론빙', '5555', '완전쨩임ㅎㅎ');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('밀탑빙수', '티', '아이스 로얄 밀크티', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('밀탑빙수', '티', '그린티 라떼', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('밀탑빙수', '티', '우롱차', '4444', '진짜맛꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('밀탑빙수', '디저트', '샌드위치', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('밀탑빙수', '디저트', '베이글', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('밀탑빙수',  '디저트','조각케잌', '4444', '진짜맛꿀맛');

INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('옥루몽', '빙수', '녹차빙수', '4444', '맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('옥루몽', '빙수', '타로빙수', '4444', '맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('옥루몽', '빙수', '메론빙', '5555', '완전쨩임ㅎㅎ');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('옥루몽', '티', '아이스 로얄 밀크티', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('옥루몽', '티', '그린티 라떼', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('옥루몽', '티', '우롱차', '4444', '진짜맛꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('옥루몽', '디저트', '샌드위치', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('옥루몽', '디저트', '베이글', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('옥루몽',  '디저트','조각케잌', '4444', '진짜맛꿀맛');

INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('개인빙수', '빙수', '녹차빙수', '4444', '맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('개인빙수', '빙수', '타로빙수', '4444', '맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('개인빙수', '빙수', '메론빙', '5555', '완전쨩임ㅎㅎ');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('개인빙수', '티', '아이스 로얄 밀크티', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('개인빙수', '티', '그린티 라떼', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('개인빙수', '티', '우롱차', '4444', '진짜맛꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('개인빙수', '디저트', '샌드위치', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('개인빙수', '디저트', '베이글', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('개인빙수',  '디저트','조각케잌', '4444', '진짜맛꿀맛');

INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('강아지', '애완용품', '애완식품', '4444', '맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('강아지', '애완용품', '의상', '4444', '멋있엉');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('강아지', '애완용품', '장난감', '5555', '어썸함');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('강아지', '커피', '아메리카노', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('강아지', '커피', '카푸치노', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('강아지',  '커피','카페라떼', '4444', '진짜맛꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('강아지', '디저트', '티라미슈', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('강아지', '디저트', '치즈케잌', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('강아지', '디저트', '베이글', '4444', '진짜맛꿀맛');

INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('고양이', '애완용품', '애완식품', '4444', '맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('고양이', '애완용품', '의상', '4444', '멋있엉');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('고양이', '애완용품', '장난감', '5555', '어썸함');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('고양이', '커피', '아메리카노', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('고양이', '커피', '카푸치노', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('고양이',  '커피','카페라떼', '4444', '진짜맛꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('고양이', '디저트', '티라미슈', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('고양이', '디저트', '치즈케잌', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('고양이', '디저트', '베이글', '4444', '진짜맛꿀맛');

INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('새', '애완용품', '애완식품', '4444', '맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('새', '애완용품', '의상', '4444', '멋있엉');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('새', '애완용품', '장난감', '5555', '어썸함');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('새', '커피', '아메리카노', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('새', '커피', '카푸치노', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('새',  '커피','카페라떼', '4444', '진짜맛꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('새', '디저트', '티라미슈', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('새', '디저트', '치즈케잌', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('새', '디저트', '베이글', '4444', '진짜맛꿀맛');

INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('기타', '애완용품', '애완식품', '4444', '맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('기타', '애완용품', '의상', '4444', '멋있엉');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('기타', '애완용품', '장난감', '5555', '어썸함');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('기타', '커피', '아메리카노', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('기타', '커피', '카푸치노', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('기타',  '커피','카페라떼', '4444', '진짜맛꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('기타', '디저트', '티라미슈', '2222', '진짜맛잇쪙');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('기타', '디저트', '치즈케잌', '3333', '완전꿀맛');
INSERT INTO `tb_cafe_menu` (`brand`, `menucd`, `menu_name`, `price`, `description`) VALUES ('기타', '디저트', '베이글', '4444', '진짜맛꿀맛');


-- 카페 유저 추가
INSERT INTO `tb_cafe_user` (`email`, `passwd`, `userphone`, `usernickname`) VALUES ('aaa', 'aaa', 'aaa', 'aaa');
INSERT INTO `tb_cafe_user` (`email`, `passwd`, `userphone`, `usernickname`) VALUES ('bbb', 'bbb', 'bbb', 'bbb');
INSERT INTO `tb_cafe_user` (`email`, `passwd`, `userphone`, `usernickname`) VALUES ('ccc', 'ccc', 'ccc', 'ccc');
INSERT INTO `tb_cafe_user` (`email`, `passwd`, `userphone`, `usernickname`) VALUES ('ddd', 'ddd', 'ddd', 'ddd');
INSERT INTO `tb_cafe_user` (`email`, `passwd`, `userphone`, `usernickname`) VALUES ('eee', 'eee', 'eee', 'eee');
INSERT INTO `tb_cafe_user` (`email`, `passwd`, `userphone`, `usernickname`) VALUES ('fff', 'fff', 'fff', 'fff');

-- 카페 리뷰 추가
INSERT INTO `tb_cafe_review` (`usernickname`, `cafeno`, `content`, `grade`) VALUES ('ddd', '100', 'aaa', '4.5');
INSERT INTO `tb_cafe_review` (`usernickname`, `cafeno`, `content`, `grade`) VALUES ('ccc', '120', 'bbb', '3.5');
INSERT INTO `tb_cafe_review` (`usernickname`, `cafeno`, `content`, `grade`) VALUES ('bbb', '100', 'ccc', '2.5');
INSERT INTO `tb_cafe_review` (`usernickname`, `cafeno`, `content`, `grade`) VALUES ('aaa', '120', 'ddd', '1.5');
INSERT INTO `tb_cafe_review` (`usernickname`, `cafeno`, `content`, `grade`) VALUES ('ddd', '120', 'aaa', '4.5');
INSERT INTO `tb_cafe_review` (`usernickname`, `cafeno`, `content`, `grade`) VALUES ('ccc', '22', 'bbb', '3.5');
INSERT INTO `tb_cafe_review` (`usernickname`, `cafeno`, `content`, `grade`) VALUES ('bbb', '22', 'ccc', '3.5');
INSERT INTO `tb_cafe_review` (`usernickname`, `cafeno`, `content`, `grade`) VALUES ('aaa', '22', 'ddd', '3.5');
INSERT INTO `tb_cafe_review` (`usernickname`, `cafeno`, `content`, `grade`) VALUES ('ddd', '22', 'aaa', '4.5');
INSERT INTO `tb_cafe_review` (`usernickname`, `cafeno`, `content`, `grade`) VALUES ('ccc', '1', 'bbb', '4.5');
INSERT INTO `tb_cafe_review` (`usernickname`, `cafeno`, `content`, `grade`) VALUES ('bbb', '1', 'ccc', '4.5');
INSERT INTO `tb_cafe_review` (`usernickname`, `cafeno`, `content`, `grade`) VALUES ('aaa', '1', 'ddd', '4.5');

-- 카페 즐찾 추가
INSERT INTO `tb_cafe_like` (`cafeno`, `userno`) VALUES ('100', '1');
INSERT INTO `tb_cafe_like` (`cafeno`, `userno`) VALUES ('120', '1');
INSERT INTO `tb_cafe_like` (`cafeno`, `userno`) VALUES ('100', '2');
INSERT INTO `tb_cafe_like` (`cafeno`, `userno`) VALUES ('120', '2');
INSERT INTO `tb_cafe_like` (`cafeno`, `userno`) VALUES ('120', '3');
INSERT INTO `tb_cafe_like` (`cafeno`, `userno`) VALUES ('22', '4');
INSERT INTO `tb_cafe_like` (`cafeno`, `userno`) VALUES ('22', '5');
INSERT INTO `tb_cafe_like` (`cafeno`, `userno`) VALUES ('1', '6');
INSERT INTO `tb_cafe_like` (`cafeno`, `userno`) VALUES ('1', '1');
INSERT INTO `tb_cafe_like` (`cafeno`, `userno`) VALUES ('1', '2');

--무조건 한번 실행 리뷰수 라이크수 평점 한번에 업데이트하는거라 무조건하셈
--실행후 해당 데이터베이스 새로고침하면 update_loop라는 프로시져가 생김
--그 프로시저 누른수 프로시저:update_loop라는 탭 누르고 밑에 루틴실행하면 됨
delimiter $
create procedure update_loop()
begin
select @minno := (select min(cafeno) from tb_cafe_cafeinfo)$
select @maxno := (select max(cafeno) from tb_cafe_cafeinfo)$
		while (@minno <= @maxno) DO
	UPDATE tb_cafe_cafeinfo 
   SET like_count = (select count(cafeno) from tb_cafe_like where cafeno = @minno)
       ,review_count= (select count(cafeno) from tb_cafe_review where cafeno = @minno)
       ,avg_grade = (select avg(grade) from tb_cafe_review where cafeno = @minno)
		WHERE cafeno = @minno $
		set @minno = @minno+1 $
		end while$
end $
delimiter ;