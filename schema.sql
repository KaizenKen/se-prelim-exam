drop table customers;
drop table orders;
drop table shippings;

create table Users (
    user_id int,
    name varchar(255),
    email varchar(255) unique,
    role varchar(255),
    password char(255),

    primary key (user_id)
);

create table Courses (
  course_id int,
  course_name varchar(255),
  teacher_id int,

  primary key (course_id),
  foreign key (educator_id) references Users(user_id)
);


create table Enrollments (
  enrollment_id int,
  student_id int,
  course_id int,
  enrollment_date date,

  primary key (enrollment_id),
  foreign key (student_id) references Users(user_id),
  foreign key (course_id) references Courses(course_id)
);

create table Assignments (
  assignment_id int,
  course_id int,
  title varchar(255),
  desc varchar(255),
  due_date date,

  primary key (assignment_id),
  foreign key (course_id) references Courses(course_id)
);

create table Submissions (
  submission_id int,
  assignment_id int,
  student_id int,
  submission_date date,
  grade decimal,

  primary key (submission_id),
  foreign key (assignment_id) references Assignments(assignment_id),
  foreign key (student_id) references Users(user_id)
);
