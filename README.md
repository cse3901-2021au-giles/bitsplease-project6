# bitsplease-project6

## Database Design

Courses, Projects, Teams, Users, and Grades are the main components of the application

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
    
    5. Instructors and TAs can grade all students in the class they teach. 

    6. Instructors and TAs can create courses and then projects and teams for the courses.

    7. Instructors and TAs can enroll/delete students into the courses that they teach.

    8. Instructors and TAs can create projects for the courses they teach

    9. Instructors and TAs can view/modify projects for the courses they teach

    10. Instructors and TAs can view/modify teams for the courses they teach

    11. Instructors and TAs can grades all students in the courses they teach

    12. Instructors and TAs can view/modify all studensts's grades in the class they teach, regardless   who originally added the grades. The views will show original users who provided the grades

    13. Students can view all grades that are given to them. But they will not know who provided the grades.
    
    14. Students cannot modify or delete the grades. But they can modify/delete grades that they have created for themselves.

    15. A student can grade other students who are in the same teams he/she is a member of, and the student can modify/delete those grades that he/she has created for other students.

    

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

    1. Through "Student Grades" link on the course details page - it lists all grades added for all students who enroll into the course.

    2. Through "Student Grades" link on the project details page - it lists all grades added for all students who participate in the project.

    3. Through "Student Grades" link on the team details page - it lists all grades added for all students of the team.

    4. From the Grades menu

            For an instructor, it lists all grades the instructor has graded.

            For a TA, it lists all grades the TA has graded

            For a student, it has 2 sub-menus

                    A student can view all grades added for him/her

                    A student can view all grades he/she has added for his/her peer

## Grade Details 
Instructors and TAs can view grade, remarks, the date when grade was added, and the grader who added it

Students can view grade, remarks, and the date when the grade was added.

## Grade Modification
    An instructor or TA can modify/delete all grades

    A student can only modify/delete grades that he/she has added

## Getting started
Option 1. To run the application on heroku:

    [Launch our Heroku site](https://bits-please-team.herokuapp.com) 

Option 2, to run the application on your ubuntu system, please follow the steps below:

```
clone the repo and then install the needed gems:
```

```
$ bundle install --without production
```

```
$ bundle update --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

```
$ rails db:seed
```

Now your ready to run the app in a local server:

```
$ rails server
```

## Troubleshooting
Depending on your system, you may need to run

```
$ rails webpacker:install
```

However, the webpacker:install tends to remove the jquery from the environment.js file. Please make sure the following lines are in config/webpack/environment.js:

```
const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
  })
)
module.exports = environment

```

 If you run into any issues with our application, please contact our team. 

 ## Account to use for testing
 The password is password for all accounts below:
 Instructor accounts:
 
 ```
 pa@yahoo.com
 pb@yahoo.com
 pc@yahoo.com
 pd@yahoo.com
 pe@yahoo.com
 ```
 TA accounts:

 ```
 ta1@yahoo.com
 ta2@yahoo.com
 ta3@yahoo.com
 ta4@yahoo.com
 ta5@yahoo.com
 ```
Student accounts:

 ```
 s1@yahoo.com
 s2@yahoo.com
 s3@yahoo.com
 s4@yahoo.com
 s5@yahoo.com
 ```


## Items that have been tested
1. Make sure the database has pre-populated data. To verify that, you can try to login as professor A
    email: pa@yahoo.com
    password: password
    if the account does not exist, please run the command below to populate the database:
```
    $ rails db:seed
```
    Please contact our team if you have run into problems executing the command.

2. Login as professor A
    A. Create a course - make sure the professor is automatically selected as the instructor of the course. Select some students and a couple of TAs and create the course

    B. Create a project for the course

    C. Create 2 teams for the course with a few students in each team

    D. Add grades for each student in the team


    E. View grades that have been given to the student 
    
        a. Select Grade menu to see all grades that you have added

        b. Go to Course, then the course details page by clicking on the link on the course number, select the Student Grades link to view all grades of the students in the class

        c. Go to Project, then project details page by clicking on the link on the project name, select the Student Grades link to view all grades of the students who participate in the project

        d. Go to Team, then team details page by clicking on the link on the team name, select the Student Grades link to view all grades of the students who are members of the team.

    F. Go to Users page, verify that you can add/modify/delete users

    G. Select Account/Update my Profile, verify that you can modify your info.


## Automated Testing

After the steps above, you can run the command below to run the automated testing scripts

$ rails test 


