create database QUANLYDIEMTHI;
use QUANLYDIEMTHI;

create table STUDENT(
    studentId varchar(4) primary key,
    studentName varchar(100) not null,
    birthday date,
    gender int,
    address text,
    phoneNumber varchar(45) unique
);

create table SUBJECT (
    subjectID varchar(4) primary key,
    subjectName varchar(45),
    priority int(11)
);

create table MARK(
    subjectID varchar(4),
    studentID varchar(4),
    point int,
    primary key (subjectID, studentID),
    foreign key (subjectID) references SUBJECT(subjectID),
    foreign key (studentID) references STUDENT(studentID)
);

INSERT INTO STUDENT (studentId, studentName, birthday, gender, address, phoneNumber)
VALUES
('S001', 'nguyễn thế anh', '1999-11-11', 1, 'hà nội', '984678082'),
('S002', 'đặng bảo trâm', '1998-12-22', 0, 'lào cai', '904982654'),
('S003', 'trần hà phương ', '2000-05-05', 0, 'nghệ an', '947645363'),
('S004', 'đỗ tiến mạnh', '1999-03-26', 1, 'hà nội', '983665353'),
('S005', 'phạm duy nhất', '1998-10-04', 1, 'tuyên quang', '987242678'),
('S006', 'mai văn thái', '2002-06-22', 1, 'nam định', '982654268'),
('S007', 'giang gia hân', '1996-11-10', 0, 'phú thọ', '982364753'),
('S008', 'nguyễn ngọc bảo my', '1999-01-21', 0, 'hà nam', '927867453'),
('S009', 'nguyễn tiến đạt', '1998-08-07', 1, 'tuên quang', '989274637'),
('S010', 'nguyễn thiều quang', '2000-09-18', 1, 'hà nội', '984378291');

INSERT INTO SUBJECT (subjectID, subjectName, priority)
VALUES
('MH01', 'toán', 2),
('MH02', 'vật lí', 2),
('MH03', 'hóa học', 1),
('MH04', 'ngữ văn ', 1),
('MH05', 'tiếng anh', 2)
;
-- Mathematics
INSERT INTO MARK (subjectID, studentID, point)
VALUES
 ('MH01', 'S001', 8.5),
 ('MH01', 'S002', 9),
 ('MH01', 'S003', 7.5),
 ('MH01', 'S004', 6),
 ('MH01', 'S005', 5.5),
 ('MH01', 'S006', 8),
 ('MH01', 'S007', 9.5),
 ('MH01', 'S008', 10),
 ('MH01', 'S009', 7.5),
 ('MH01', 'S010', 6.5);

-- Physics
INSERT INTO MARK (subjectID, studentID, point)
VALUES 
('MH02', 'S001', 7),
('MH02', 'S002', 8),
('MH02', 'S003', 6.5),
('MH02', 'S004', 7),
('MH02', 'S005', 8),
('MH02', 'S006', 10),
('MH02', 'S007', 9),
('MH02', 'S008', 8.5),
('MH02', 'S009', 7),
('MH02', 'S010', 8);

-- Chemistry
INSERT INTO MARK (subjectID, studentID, point)
VALUES
 ('MH03', 'S001', 9),
 ('MH03', 'S002', 6.5),
 ('MH03', 'S003', 8),
 ('MH03', 'S004', 5),
 ('MH03', 'S005', 7.5),
 ('MH03', 'S006', 9),
 ('MH03', 'S007', 6),
 ('MH03', 'S008', 8.5),
 ('MH03', 'S009', 9),
 ('MH03', 'S010', 5.5);

-- Literature
INSERT INTO MARK (subjectID, studentID, point)
VALUES
 ('MH04', 'S001', 9),
 ('MH04', 'S002', 8),
 ('MH04', 'S003', 7),
 ('MH04', 'S004', 6.5),
 ('MH04', 'S005', 8.5),
 ('MH04', 'S006', 7.5),
 ('MH04', 'S007', 9),
 ('MH04', 'S008', 6),
 ('MH04', 'S009', 5),
 ('MH04', 'S010', 4);

-- Tiếng Anh
INSERT INTO MARK (subjectID, studentID, point)
VALUES
 ('MH05', 'S001', 5),
 ('MH05', 'S002', 6),
 ('MH05', 'S003', 7),
 ('MH05', 'S004', 8),
 ('MH05', 'S005', 9),
 ('MH05', 'S006', 6.5),
 ('MH05', 'S007', 4),
 ('MH05', 'S008', 9.5),
 ('MH05', 'S009', 10),
 ('MH05', 'S010', 7);
 
 #2. Cập nhật dữ liệu [10 điểm]:- Sửa tên sinh viên có mã `S004` thành “Đỗ Đức Mạnh”.
 UPDATE STUDENT
SET studentName = 'Đỗ Đức Mạnh'
WHERE studentID = 'S004';

 #- Sửa tên và hệ số môn học có mã `MH05` thành “Ngoại Ngữ” và hệ số là 1.
 UPDATE SUBJECT
SET subjectName = 'Ngoại Ngữ', priority = 1
WHERE subjectID = 'MH05';

 #- Cập nhật lại điểm của học sinh có mã `S009` thành (MH01 : 8.5, MH02 : 7,MH03 : 5.5, MH04 : 6, MH05 : 9)
 UPDATE MARK
SET point = 
    CASE 
        WHEN subjectID = 'MH01' THEN 8.5
        WHEN subjectID = 'MH02' THEN 7
        WHEN subjectID = 'MH03' THEN 5.5
        WHEN subjectID = 'MH04' THEN 6
        WHEN subjectID = 'MH05' THEN 9
    END
WHERE studentID = 'S009';

 #.3. Xoá dữ liệu[10 điểm]:- Xoá toàn bộ thông tin của học sinh có mã `S010`
 #bao gồm điểm thi ở bảng MARK và thông tin học sinh này ở bảng STUDENT.
 DELETE FROM MARK
WHERE( studentID = 'S010');

DELETE FROM `quanlydiemthi`.`STUDENT` WHERE (`studentId` = 'S010');

#Bài 3: Truy vấn dữ liệu [25 điểm]:
#1. Lấy ra tất cả thông tin của sinh viên trong bảng Student .
select* FROM STUDENT;
# [4 điểm]2. Hiển thị tên và mã môn học của những môn có hệ số bằng 1
select subjectName,priority
from SUBJECT where priority=1;
# [4 điểm]3. Hiển thị thông tin học sinh bào gồm: mã học sinh, tên học sinh,
# tuổi (bằng năm hiện tại trừ năm sinh) , giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh.
SELECT 
    studentID,
    studentName,
    YEAR(CURRENT_DATE()) - YEAR(birthday) AS TUỔI,
    CASE 
        WHEN gender = 1 THEN 'Nam'
        ELSE 'Nữ'
    END AS gender,
    address
FROM 
    STUDENT;

# [4 điểm]4. Hiển thị thông tin bao gồm: tên học sinh, tên môn học , 
#điểm thi của tất cả học sinh của môn Toán và sắp xếp theo điểm giảm dần.
SELECT 
    STUDENT.studentName AS studentName,
    SUBJECT.subjectName AS subjectName,
    MARK.point AS point
FROM 
    MARK
INNER JOIN 
    STUDENT ON MARK.studentID = STUDENT.studentID
INNER JOIN 
    SUBJECT ON MARK.subjectID = SUBJECT.subjectID
WHERE 
    SUBJECT.subjectID = 'MH01' 
ORDER BY 
    MARK.point DESC; 


# [4 điểm]5. Thống kê số lượng học sinh theo giới tính ở trong bảng (Gồm 2 cột: giới tính và số lượng).
SELECT 
    CASE 
        WHEN gender = 1 THEN 'Nam'
        ELSE 'Nữ'
    END AS 'GIỚI TÍNH',
    COUNT(*) AS 'SỐ LƯỢNG'
FROM 
    STUDENT
GROUP BY 
    gender;

# [4 điểm]6. Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh (yêu cầu sử dụng hàm để tính toán) 
#, bảng gồm mã học sinh, tên hoc sinh, tổng điểm và điểm trung bình. [5 điểm]
SELECT 
    STUDENT.studentID AS studentID,
    STUDENT.studentName AS studentName,
    SUM(MARK.point) AS 'TỔNG ĐIỂM' ,
    AVG(MARK.point) AS 'ĐIỂM TRUNG BÌNH'
FROM 
    STUDENT
INNER JOIN 
    MARK ON STUDENT.studentID = MARK.studentID
GROUP BY 
    STUDENT.studentID, STUDENT.studentName;

#Bài 4: Tạo View, Index, Procedure [20 điểm]:
#1. Tạo VIEW có tên STUDENT_VIEW lấy thông tin sinh viên bao gồm :
# mã học sinh, tên học sinh, giới tính , quê quán . [3 điểm]

create view STUDENT_VIEW AS 
select studentID ,studentName,
case when gender=1 then 'nam' 
			else 'nữ' 
            end as 'giới tính'
,address
from student;
#2. Tạo VIEW có tên AVERAGE_MARK_VIEW lấy thông tin gồm:
#mã học sinh, tên học sinh, điểm trung bình các môn học . [3 điểm]

CREATE VIEW AVERAGE_MARK_VIEW AS
SELECT 
    STUDENT.studentID AS studentID,
    STUDENT.studentName AS studentName,
    AVG(MARK.point) AS averageMark
FROM 
    STUDENT
INNER JOIN 
    MARK ON STUDENT.studentID = MARK.studentID
GROUP BY 
    STUDENT.studentID, STUDENT.studentName;

#3. Đánh Index cho trường `phoneNumber` của bảng STUDENT. [2 điểm]
ALTER TABLE STUDENT
ADD INDEX idx_phoneNumber (phoneNumber);

 -- Xóa chỉ mục tồn tại có tên 'idx_phoneNumber'
ALTER TABLE STUDENT
DROP INDEX idx_phoneNumber;


#4. Tạo các PROCEDURE sau:

#- Tạo PROC_INSERTSTUDENT dùng để thêm mới 1 học sinh bao gồm tất cả thông tin học sinh đó. [3 điểm]
DELIMITER //
CREATE PROCEDURE PROC_INSERTSTUDENT (
    IN p_studentId VARCHAR(4),
    IN p_studentName VARCHAR(100),
    IN p_birthday DATE,
    IN p_gender BIT(1),
    IN p_address TEXT,
    IN p_phoneNumber VARCHAR(45)
)
BEGIN
    INSERT INTO STUDENT (studentId, studentName, birthday, gender, address, phoneNumber)
    VALUES (p_studentId, p_studentName, p_birthday, p_gender, p_address, p_phoneNumber);
END //
DELIMITER ;

#- Tạo PROC_UPDATESUBJECT dùng để cập nhật tên môn học theo mã môn học. [3 điểm]
DELIMITER //
CREATE PROCEDURE PROC_UPDATESUBJECT (
    IN p_subjectID VARCHAR(4),
    IN p_newSubjectName VARCHAR(45)
)
BEGIN
    UPDATE SUBJECT
    SET subjectName = p_newSubjectName
    WHERE subjectID = p_subjectID;
END //
DELIMITER ;

#- Tạo PROC_DELETEMARK dùng để xoá toàn bộ điểm các môn học theo mã học sinh. [3 điểm]

DELIMITER //
CREATE PROCEDURE PROC_DELETEMARK (
    IN p_studentID VARCHAR(4)
)
BEGIN
    DELETE FROM MARK
    WHERE studentID = p_studentID;
END //
DELIMITER ;

