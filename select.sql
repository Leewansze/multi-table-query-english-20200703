# 1.Query the existence of 1 course
SELECT * from course where id=1;

# 2.Query the presence of both 1 and 2 courses
SELECT * from course where id=1 or id=2;

# 3.Query the student number and student name and average score of students 
# whose average score is 60 or higher.
SELECT student.id, student.name, AVG(score) from student, student_course
where student.id=student_course.studentid
GROUP BY studentid Having AVG(score) > 60;

# 4.Query the SQL statement of student information 
# that does not have grades in the student_course table
SELECT student.* from student where student.id not in(
       SELECT student.id from course, student_course
       where student.id = student_course.studentid
       and student_course.courseId = course.id
)

# 5.Query all SQL with grades
SELECT student.* from student where student.id in(
       SELECT student.id from course, student_course
       where student.id = student_course.studentid
       and student_course.courseId = course.id
)

# 6.Inquire about the information of classmates 
# who have numbered 1 and also studied the course numbered 2
SELECT student.* from student JOIN student_course sc01
on student.id = sc01.studentid and sc01.courseId = 1 
JOIN student_course sc02
on student.id = sc02.studentid and sc02.courseId = 2;

# 7.Retrieve 1 student score with less than 60 scores in descending order
SELECT student.* from student_course
       JOIN student on student.id = student_course.studentId
       JOIN course on student_course.courseId = course.id
            and course.id = 1 where student_course.score < 60
order by score;

# 8.Query the average grade of each course. 
# The results are ranked in descending order of average grade. 
# When the average grades are the same, they are sorted in ascending order by course number.
SELECT student_course.courseId, AVG(score) from student_course 
GROUP BY courseId HAVING AVG(score)
order by AVG(score) desc, student_course.courseId;

# 9.Query the name and score of a student 
# whose course name is "Math" and whose score is less than 60
SELECT student.name, student_course.score from student_course
JOIN student on student.id = student_course.studentId
       JOIN course on student_course.courseId = course.id
            and course.name = 'Math' where student_course.score < 60;
