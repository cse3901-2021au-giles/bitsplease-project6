# bitsplease-project6

## Database Design

Courses, Project, Teams, Users, and Grades are the main components of the application

Courses and projects have a parent-child relationship. A course can have many projects but a project 
can only belong to one and only one course.

Courses and Users have a many-to-many relationship. A course can have many students, instructors, and TAs. A student can enroll in many courses.

Projects and Teams have a parent-child relationship. A project can have many teams, but a team must belong to one and only one project.

Teams and Users have a many-to-many relationship. A team can have many team students, and a student can belong to many teams for different projects.

Users and grades have a parent-child relationship. A student can have many grades, but a grade must belong to one and only one student.

## User Role
There are 4 types of users in the application - Super User, Instructor, Teaching Assistants, and Student
    1. The super-user is a built-in user who can create/modify the other types of users.
    2. An instructor can create/modify TAs and students.
    3. A TA can create/modify students
    4. A student can only modify his/her own information.

## User Password
Including all types of users in the application, correct password should be used.  
If the user forgot their password, they can reset by sending an email from our application.    
MAKE SURE TO CHECK THE SPAM BOX    
Since it is not a secured email, it could be in the spam box.  

## Work Flows
    1. An instructor or TA creates a course and enroll students into the course
    2. An instructor or TA creates one or more projects for the course
    3. An instructor or TA creates one or more teams for each projects and assigns the students to the
       team. You can only select students who enroll into the course of the project that you are creating the team for.
    4. An instructor or TA can grade students from the team details page where students of the team are listed.
    5. A student can grade his/her peers on the teams they belong to.

## Viewing Grades
There are 5 different ways you can view the student's grades.
    1. From the course details page - it lists all grades added for all students who enroll into the course.
    2. From the project details page - it lists all grades added for all students who participate in project.
    3. From the team details page - it lists all grades added for all students on the team.
    4. From the Grades menu
            For an instructor, it lists all grades the instructor has graded.
            For a TA, it lists all grades the TA has graded
            For a student, it has 2 sub-menus
                    A student can view all grades added for him/her
                    A student can view all grades he/she has added for his peer

## Grade Details 
Instructors and TAs can view grade, remarks, date when grade was added, and the grader who added it

## Grade Modification
    An instructor or TA can modify/delete all grades
    A student can only modify/delete grades that they added

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

## Troubleshooting
If you run into any issues with viewing a page on the site or buttons not working as intended, open the webpage by running rails server. 

Then run the F12 command to see if there are any error messages. If it turns out there are, run the foilowing command:

```
$ rails webpacker:install
```
