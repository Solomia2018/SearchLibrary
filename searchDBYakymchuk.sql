CREATE SCHEMA `library` ;

CREATE TABLE `library`.`scientific_publish` (
  `id` int(11) NOT NULL,
  `dateOfPublish` date NOT NULL,
  `eCopy` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
);

CREATE TABLE `library`.`tema` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
);
CREATE TABLE `library`.`tema_scientific_publish` (
  `id_tema` int(11) NOT NULL,
  `id_scientific_publish` int(11) NOT NULL,
  PRIMARY KEY (`id_tema`,`id_scientific_publish`),
  KEY `id_scientific_publish_idx` (`id_scientific_publish`),
  CONSTRAINT `id_scientific_publish` FOREIGN KEY (`id_scientific_publish`) REFERENCES `library`.`scientific_publish` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_tema` FOREIGN KEY (`id_tema`) REFERENCES `library`.`tema` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `library`.`book` (
  `id` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  `volume` int(11) NOT NULL,
  `id_scientific_publish` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  CONSTRAINT `id_book_scientific_publish` FOREIGN KEY (`id`) REFERENCES `library`.`scientific_publish` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `library`.`zbirnik` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `number` int(11) NOT NULL,
  `id_scientific_publish` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  CONSTRAINT `id_zbirnik_scientific_publish` FOREIGN KEY (`id`) REFERENCES `library`.`scientific_publish` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `library`.`publish` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
);
CREATE TABLE `library`.`book_publish` (
  `id_book` int(11) NOT NULL,
  `id_publish` int(11) NOT NULL,
  PRIMARY KEY (`id_book`,`id_publish`),
  KEY `id_kp_publish_idx` (`id_publish`),
  CONSTRAINT `id_kp_book` FOREIGN KEY (`id_book`) REFERENCES `library`.`book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_kp_publish` FOREIGN KEY (`id_publish`) REFERENCES `library`.`publish` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `library`.`zbirnik_publish` (
  `id_zbirnik` int(11) NOT NULL,
  `id_publish` int(11) NOT NULL,
  PRIMARY KEY (`id_zbirnik`,`id_publish`),
  KEY `id_zp_publish_idx` (`id_publish`),
  CONSTRAINT `id_zp_zbirnik` FOREIGN KEY (`id_zbirnik`) REFERENCES `library`.`zbirnik` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_zp_publish` FOREIGN KEY (`id_publish`) REFERENCES `library`.`publish` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `library`.`auther` (
  `id` int(11) NOT NULL,
  `surname` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
);

CREATE TABLE `library`.`auther_publish` (
  `id_auther` int(11) NOT NULL,
  `id_publish` int(11) NOT NULL,
  PRIMARY KEY (`id_auther`,`id_publish`),
  KEY `id_publish_idx` (`id_publish`),
  CONSTRAINT `id_auther` FOREIGN KEY (`id_auther`) REFERENCES `library`.`auther` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_publish` FOREIGN KEY (`id_publish`) REFERENCES `library`.`publish` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `library`.`keyword` (
  `id` int(11) NOT NULL,
  `word` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
);

CREATE TABLE `library`.`publish_keyword` (
  `id_publish` int(11) NOT NULL,
  `id_keyword` int(11) NOT NULL,
  PRIMARY KEY (`id_publish`,`id_keyword`),
  KEY `id_keyword_idx` (`id_keyword`),
  CONSTRAINT `id_pks_keyword` FOREIGN KEY (`id_keyword`) REFERENCES `library`.`keyword` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_pks_publish` FOREIGN KEY (`id_publish`) REFERENCES `library`.`publish` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE `library`.`identity` (
  `id` int(11) NOT NULL,
  `number` int(15) NOT NULL,
   `id_scientific_publish` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  CONSTRAINT `id_ident_scientific_publish` FOREIGN KEY (`id`) REFERENCES `library`.`scientific_publish` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
 );
CREATE TABLE `library`.`reader` (
  `id` int(11) NOT NULL,
  `surname` varchar(15) NOT NULL,
	`phone` varchar(15) NOT NULL,
`bonus` int(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
 );
CREATE TABLE `library`.`in_work` (
  `id_reader` int(11) NOT NULL,
  `id_identity` int(11) NOT NULL,
	`give` date NOT NULL,
`giveBack` date NOT NULL,
  PRIMARY KEY (`id_reader`,`id_identity`),
  KEY `id_identity_word_idx` (`id_identity`),
  CONSTRAINT `id_pks_identity` FOREIGN KEY (`id_identity`) REFERENCES `library`.`identity` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_pks_reader` FOREIGN KEY (`id_reader`) REFERENCES `library`.`reader` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT into  `library`.`auther`(id,surname)
value(0,'Eshli Vens');
INSERT into  `library`.`auther`(id,surname)
value(1,'Jein Ostin');
INSERT into  `library`.`auther`(id,surname)
value(2,'Suesen Kein');
INSERT into  `library`.`auther`(id,surname)
value(3,'Sheril Senberg');
INSERT into  `library`.`auther`(id,surname)
value(4,'Jaison Fraid');
INSERT into  `library`.`auther`(id,surname)
value(5,'Adam Grant');
INSERT into  `library`.`auther`(id,surname)
value(6,'Joan Roaling');
INSERT into  `library`.`auther`(id,surname)
value(7,'Richard Dokinz');
INSERT into  `library`.`auther`(id,surname)
value(8,'Jon Grey');
INSERT into  `library`.`auther`(id,surname)
value(9,'Patrik King');
INSERT into  `library`.`keyword`(id,word)
value(0,'SpaceX');
INSERT into  `library`.`keyword`(id,word)
value(1,'Ilon Mask');
INSERT into  `library`.`keyword`(id,word)
value(2,'Gordist');
INSERT into  `library`.`keyword`(id,word)
value(3,'Uperedgenia');
INSERT into  `library`.`keyword`(id,word)
value(4,'man');
INSERT into  `library`.`keyword`(id,word)
value(5,'woman');
INSERT into  `library`.`keyword`(id,word)
value(6,'introvert');
INSERT into  `library`.`keyword`(id,word)
value(7,'game');
INSERT into  `library`.`keyword`(id,word)
value(8,'Rework');
INSERT into  `library`.`keyword`(id,word)
value(9,'power');
INSERT into  `library`.`keyword`(id,word)
value(10,'names');
INSERT into  `library`.`keyword`(id,word)
value(11,'book');
INSERT into  `library`.`keyword`(id,word)
value(12,'java');
INSERT into  `library`.`keyword`(id,word)
value(13,'home');
INSERT into  `library`.`keyword`(id,word)
value(14,'Harry');
INSERT into  `library`.`keyword`(id,word)
value(15,'Potter');
INSERT into  `library`.`keyword`(id,word)
value(16,'hi');
INSERT into  `library`.`keyword`(id,word)
value(17,'honey');
INSERT into  `library`.`keyword`(id,word)
value(18,'moon');
INSERT into  `library`.`keyword`(id,word)
value(19,'son');
INSERT into  `library`.`publish`(id,name)
value(0,'Tesla.SpaceX');
INSERT into  `library`.`publish`(id,name)
value(1,'Gordist and Uperedgenia');
INSERT into  `library`.`publish`(id,name)
value(2,'Power of introverts');
INSERT into  `library`.`publish`(id,name)
value(3,'Woman,work and liders');
INSERT into  `library`.`publish`(id,name)
value(4,'Rework');
INSERT into  `library`.`publish`(id,name)
value(5,'Tesla.SpaceX');
INSERT into  `library`.`publish`(id,name)
value(6,'Originals');
INSERT into  `library`.`publish`(id,name)
value(7,'Harry Potter');
INSERT into  `library`.`publish`(id,name)
value(8,'Egoistic gen');
INSERT into  `library`.`publish`(id,name)
value(9,'man from Mars, woman from Venera');
INSERT into  `library`.`publish`(id,name)
value(10,'Strategy of comunications');
INSERT into  `library`.`auther`(id,surname)
value(10,'Popenko');
INSERT into  `library`.`keyword`(id,word)
value(20,'Maidan');
INSERT into  `library`.`publish`(id,name)
value(11,'Maidan');
INSERT into  `library`.`auther`(id,surname)
value(11,'Kateryna Yakivlenko');
INSERT into  `library`.`keyword`(id,word)
value(21,'Revolution');
INSERT into  `library`.`publish`(id,name)
value(12,'Revolution and Life');
INSERT into  `library`.`auther`(id,surname)
value(12,'Tamara Gundorova');
INSERT into  `library`.`keyword`(id,word)
value(22,'Pravo to interpretation');
INSERT into  `library`.`auther_publish`(id_auther,id_publish)
value(0,0);
INSERT into  `library`.`auther_publish`(id_auther,id_publish)
value(1,1);
INSERT into  `library`.`auther_publish`(id_auther,id_publish)
value(2,2);
INSERT into  `library`.`auther_publish`(id_auther,id_publish)
value(3,3);
INSERT into  `library`.`auther_publish`(id_auther,id_publish)
value(4,4);
INSERT into  `library`.`auther_publish`(id_auther,id_publish)
value(5,5);
INSERT into  `library`.`auther_publish`(id_auther,id_publish)
value(6,6);
INSERT into  `library`.`auther_publish`(id_auther,id_publish)
value(7,7);
INSERT into  `library`.`auther_publish`(id_auther,id_publish)
value(8,8);
INSERT into  `library`.`auther_publish`(id_auther,id_publish)
value(9,9);
INSERT into  `library`.`auther_publish`(id_auther,id_publish)
value(10,10);
INSERT into  `library`.`auther_publish`(id_auther,id_publish)
value(11,11);
INSERT into  `library`.`auther_publish`(id_auther,id_publish)
value(12,12);
INSERT into  `library`.`reader`(id, surname,phone,bonus)
value(0,'Yakymchuk','0638801301',0);
INSERT into  `library`.`reader`(id, surname,phone,bonus)
value(1,'Romaniuk','0936297170',10);
INSERT into  `library`.`reader`(id, surname,phone,bonus)
value(2,'Bukovska','0673711759',0);
INSERT into  `library`.`reader`(id, surname,phone,bonus)
value(3,'Noga','0673747888',29);
INSERT into  `library`.`reader`(id, surname,phone,bonus)
value(4,'Lepysoenko','0633427136',0);
INSERT into  `library`.`scientific_publish`(id, dateOfPublish,eCopy)
value(0,'2002-01-11',true);
INSERT into  `library`.`scientific_publish`(id, dateOfPublish,eCopy)
value(1,'2012-11-12',true);
INSERT into  `library`.`scientific_publish`(id, dateOfPublish,eCopy)
value(2,'2000-09-02',false);
INSERT into  `library`.`scientific_publish`(id, dateOfPublish,eCopy)
value(3,'2005-05-05',true);
INSERT into  `library`.`scientific_publish`(id, dateOfPublish,eCopy)
value(4,'2015-05-05',true);
INSERT into  `library`.`scientific_publish`(id, dateOfPublish,eCopy)
value(5,'2000-01-01',false);
INSERT into  `library`.`scientific_publish`(id, dateOfPublish,eCopy)
value(6,'2002-10-10',true);
INSERT into  `library`.`scientific_publish`(id, dateOfPublish,eCopy)
value(7,'2005-05-06',true);
INSERT into  `library`.`scientific_publish`(id, dateOfPublish,eCopy)
value(8,'2007-08-15',false);
INSERT into  `library`.`scientific_publish`(id, dateOfPublish,eCopy)
value(9,'2008-11-04',true);
INSERT into  `library`.`scientific_publish`(id, dateOfPublish,eCopy)
value(10,'2011-12-30',true);
INSERT into  `library`.`scientific_publish`(id,dateOfPublish,eCopy)
value(11,'2009-09-25',true);
INSERT into  `library`.`scientific_publish`(id, dateOfPublish,eCopy)
value(12,'2004-11-20',false);
INSERT into  `library`.`zbirnik`(id,name,number,id_scientific_publish)
value(0,'Krytyka',3,10);
INSERT into  `library`.`zbirnik_publish`(id_zbirnik,id_publish)
value(0,10);
INSERT into  `library`.`zbirnik_publish`(id_zbirnik,id_publish)
value(0,11);
INSERT into  `library`.`zbirnik_publish`(id_zbirnik,id_publish)
value(0,12);
INSERT into  `library`.`book`(id,type,volume,id_scientific_publish)
value(0,'roman',300,0);
INSERT into  `library`.`book`(id,type,volume,id_scientific_publish)
value(1,'roman',290,1);
INSERT into  `library`.`book`(id,type,volume,id_scientific_publish)
value(2,'opovidania',100,2);
INSERT into  `library`.`book`(id,type,volume,id_scientific_publish)
value(3,'roman',50,3);
INSERT into  `library`.`book`(id,type,volume,id_scientific_publish)
value(4,'opovidania',25,4);
INSERT into  `library`.`book`(id,type,volume,id_scientific_publish)
value(5,'opovidania',150,5);
INSERT into  `library`.`book`(id,type,volume,id_scientific_publish)
value(6,'roman',490,6);
INSERT into  `library`.`book`(id,type,volume,id_scientific_publish)
value(7,'roman',11,7);
INSERT into  `library`.`book`(id,type,volume,id_scientific_publish)
value(8,'roman',487,8);
INSERT into  `library`.`book`(id,type,volume,id_scientific_publish)
value(9,'opovidania',30,9);
INSERT into  `library`.`book_publish`(id_book,id_publish)
value(0,0);
INSERT into  `library`.`book_publish`(id_book,id_publish)
value(1,1);
INSERT into  `library`.`book_publish`(id_book,id_publish)
value(2,2);
INSERT into  `library`.`book_publish`(id_book,id_publish)
value(3,3);
INSERT into  `library`.`book_publish`(id_book,id_publish)
value(4,4);
INSERT into  `library`.`book_publish`(id_book,id_publish)
value(5,5);
INSERT into  `library`.`book_publish`(id_book,id_publish)
value(6,6);
INSERT into  `library`.`book_publish`(id_book,id_publish)
value(7,7);
INSERT into  `library`.`book_publish`(id_book,id_publish)
value(8,8);
INSERT into  `library`.`book_publish`(id_book,id_publish)
value(9,9);
INSERT into  `library`.`publish_keyword`(id_publish,id_keyword)
value(0,0);
INSERT into  `library`.`publish_keyword`(id_publish,id_keyword)
value(0,1);
INSERT into  `library`.`publish_keyword`(id_publish,id_keyword)
value(1,2);
INSERT into  `library`.`publish_keyword`(id_publish,id_keyword)
value(1,3);
INSERT into  `library`.`publish_keyword`(id_publish,id_keyword)
value(2,4);
INSERT into  `library`.`publish_keyword`(id_publish,id_keyword)
value(2,5);
INSERT into  `library`.`publish_keyword`(id_publish,id_keyword)
value(3,6);
INSERT into  `library`.`publish_keyword`(id_publish,id_keyword)
value(3,7);
INSERT into  `library`.`publish_keyword`(id_publish,id_keyword)
value(4,8);
INSERT into  `library`.`publish_keyword`(id_publish,id_keyword)
value(4,9);
INSERT into  `library`.`publish_keyword`(id_publish,id_keyword)
value(5,10);
INSERT into  `library`.`publish_keyword`(id_publish,id_keyword)
value(5,11);
INSERT into  `library`.`publish_keyword`(id_publish,id_keyword)
value(6,12);
INSERT into  `library`.`publish_keyword`(id_publish,id_keyword)
value(6,13);
INSERT into  `library`.`publish_keyword`(id_publish,id_keyword)
value(7,14);
INSERT into  `library`.`publish_keyword`(id_publish,id_keyword)
value(7,15);
INSERT into  `library`.`publish_keyword`(id_publish,id_keyword)
value(8,16);
INSERT into  `library`.`publish_keyword`(id_publish,id_keyword)
value(8,17);
INSERT into  `library`.`publish_keyword`(id_publish,id_keyword)
value(9,18);
INSERT into  `library`.`publish_keyword`(id_publish,id_keyword)
value(9,19);
INSERT into  `library`.`publish_keyword`(id_publish,id_keyword)
value(10,20);
INSERT into  `library`.`publish_keyword`(id_publish,id_keyword)
value(11,21);
INSERT into  `library`.`publish_keyword`(id_publish,id_keyword)
value(12,22);
INSERT into  `library`.`tema`(id,name)
value(0,'space');
INSERT into  `library`.`tema`(id,name)
value(1,'love');
INSERT into  `library`.`tema`(id,name)
value(2,'war');
INSERT into  `library`.`tema`(id,name)
value(3,'science');
INSERT into  `library`.`tema`(id,name)
value(4,'magic');
INSERT into  `library`.`tema`(id,name)
value(5,'peace');
INSERT into  `library`.`tema`(id,name)
value(6,'life');
INSERT into  `library`.`tema_scientific_publish`(id_tema,id_scientific_publish)
value(2,0);
INSERT into  `library`.`tema_scientific_publish`(id_tema,id_scientific_publish)
value(0,0);
INSERT into  `library`.`tema_scientific_publish`(id_tema,id_scientific_publish)
value(1,1);
INSERT into  `library`.`tema_scientific_publish`(id_tema,id_scientific_publish)
value(3,2);
INSERT into  `library`.`tema_scientific_publish`(id_tema,id_scientific_publish)
value(4,3);
INSERT into  `library`.`tema_scientific_publish`(id_tema,id_scientific_publish)
value(5,4);
INSERT into  `library`.`tema_scientific_publish`(id_tema,id_scientific_publish)
value(6,5);
INSERT into  `library`.`tema_scientific_publish`(id_tema,id_scientific_publish)
value(3,6);
INSERT into  `library`.`tema_scientific_publish`(id_tema,id_scientific_publish)
value(4,7);
INSERT into  `library`.`tema_scientific_publish`(id_tema,id_scientific_publish)
value(1,8);
INSERT into  `library`.`tema_scientific_publish`(id_tema,id_scientific_publish)
value(3,9);
INSERT into  `library`.`tema_scientific_publish`(id_tema,id_scientific_publish)
value(1,10);
INSERT into  `library`.`tema_scientific_publish`(id_tema,id_scientific_publish)
value(0,11);
INSERT into  `library`.`tema_scientific_publish`(id_tema,id_scientific_publish)
value(0,12);
INSERT into  `library`.`identity`(id,number,id_scientific_publish)
value(0,111,0);
INSERT into  `library`.`identity`(id,number,id_scientific_publish)
value(1,222,1);
INSERT into  `library`.`identity`(id,number,id_scientific_publish)
value(2,333,2);
INSERT into  `library`.`identity`(id,number,id_scientific_publish)
value(3,444,3);
INSERT into  `library`.`identity`(id,number,id_scientific_publish)
value(4,555,4);
INSERT into  `library`.`identity`(id,number,id_scientific_publish)
value(5,666,5);
INSERT into  `library`.`identity`(id,number,id_scientific_publish)
value(6,777,6);
INSERT into  `library`.`identity`(id,number,id_scientific_publish)
value(7,888,7);
INSERT into  `library`.`identity`(id,number,id_scientific_publish)
value(8,999,8);
INSERT into  `library`.`identity`(id,number,id_scientific_publish)
value(9,101010,9);
INSERT into  `library`.`identity`(id,number,id_scientific_publish)
value(10,111111,10);
INSERT into  `library`.`identity`(id,number,id_scientific_publish)
value(11,121212,11);
INSERT into  `library`.`identity`(id,number,id_scientific_publish)
value(12,131313,12);
INSERT into  `library`.`in_work`(id_reader,id_identity,give, giveBack)
value(0,0,'2018-02-03','2018-02-13');
INSERT into  `library`.`in_work`(id_reader,id_identity,give, giveBack)
value(1,0,'2018-02-13','2018-02-23');
INSERT into  `library`.`in_work`(id_reader,id_identity,give, giveBack)
value(2,0,'2018-02-23','2018-03-03');
INSERT into  `library`.`in_work`(id_reader,id_identity,give, giveBack)
value(3,0,'2018-03-03','2018-03-13');
INSERT into  `library`.`in_work`(id_reader,id_identity,give, giveBack)
value(4,1,'2018-03-13','2018-03-13');
INSERT into  `library`.`in_work`(id_reader,id_identity,give, giveBack)
value(1,1,'2018-02-13','2018-02-23');
INSERT into  `library`.`in_work`(id_reader,id_identity,give, giveBack)
value(0,2,'2018-05-13','2018-05-23');
INSERT into  `library`.`in_work`(id_reader,id_identity,give, giveBack)
value(1,3,'2018-07-23','2018-08-03');
INSERT into  `library`.`in_work`(id_reader,id_identity,give, giveBack)
value(1,4,'2018-07-23','2018-08-03');
INSERT into  `library`.`in_work`(id_reader,id_identity,give, giveBack)
value(1,5,'2018-07-23','2018-08-03');
INSERT into  `library`.`in_work`(id_reader,id_identity,give, giveBack)
value(1,6,'2018-07-23','2018-08-03');
INSERT into  `library`.`in_work`(id_reader,id_identity,give, giveBack)
value(1,7,'2018-07-23','2018-08-03');
INSERT into  `library`.`in_work`(id_reader,id_identity,give, giveBack)
value(1,8,'2018-07-23','2018-08-03');
INSERT into  `library`.`in_work`(id_reader,id_identity,give, giveBack)
value(1,9,'2018-07-23','2018-08-03');
INSERT into  `library`.`in_work`(id_reader,id_identity,give, giveBack)
value(1,10,'2018-07-23','2018-08-03');
INSERT into  `library`.`in_work`(id_reader,id_identity,give, giveBack)
value(1,11,'2018-07-23','2018-08-03');