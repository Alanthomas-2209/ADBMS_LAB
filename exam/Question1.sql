create table library (bookno int primary key, bookname varchar(10));
create table librarybackup (bookno int primary key, bookname varchar(10));

INSERT INTO `exam`.`library`
(`bookno`,
`bookname`)
VALUES
(1,'sapiens'),
(2,'12 reasons'),
(3,'Aplle');

INSERT INTO `exam`.`library`
(`bookno`,
`bookname`)
VALUES
(4,'alan'),
(2,'12 reasons'),
(5,'amjad');

SELECT * FROM exam.library;
select * from  librarybackup;

UPDATE `exam`.`library` SET `bookname` = 'Alan' WHERE `bookno` = 4;

delimiter //
CREATE DEFINER=`root`@`localhost` TRIGGER `exam`.`library_BEFORE_UPDATE` BEFORE UPDATE ON `library` FOR EACH ROW
BEGIN
	insert into librarybackup values(old.bookno, old.bookname);
END //
delimiter ;

delimiter //
CREATE DEFINER=`root`@`localhost` TRIGGER `exam`.`library_BEFORE_DELETE` BEFORE DELETE ON `library` FOR EACH ROW
BEGIN
	insert into librarybackup values(old.bookno, old.bookname);
END //
delimiter ;

truncate librarybackup;

UPDATE `exam`.`library` SET `bookname` = 'Alan' WHERE `bookno` = 4;
delete from library where bookno = 5;
