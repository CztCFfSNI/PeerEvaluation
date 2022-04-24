# Presentation Materials
- [Presentation Slides](https://docs.google.com/presentation/d/1CxEjYkrvY5vLyQvEOWeyerpJmUNsR-_vojjTn90u0-I/edit#slide=id.gc6fa3c898_0_0)
- [Database ERD](https://lucid.app/lucidchart/bb169a01-6c08-4bfd-a07b-7a78dbe80c18/edit?invitationId=inv_2ff39713-72f6-491c-aef2-0f1377bc3cc1&page=0_0#)

# Ruby on Rails Project - GoodPET (Good Peer Evaluation Tool)

## Setup and Use

Built on ruby version 3.0.1 and rails version 6.1.5 (More information on versions can be found in the Gemfile)

To run this application, clone this repo and make sure you are in the root directory: "Project6_RubyOnRailsProject_Group-9".
Follow the following steps:
```
bundle install
rails db:migrate
rails server
```
Next, open GoodPET in your browser by navigating to the link shown in the terminal or opening up your browser at URL: "localhost:3000".

### Admin Use
If the admin already has an account, they can log in using their Email and Password. To make a new account the admin can click on Sign Up button, which will redirect to the Sign up page. The admin has to make sure to select the role as admin from the Role drop down.
 
Once the admin is logged in, the admin can go to any of the following pages:
* See the students
   - the admin will be able to see all the students
* Manage Teams
   - under manage team, the admin can look at students in the team by clicking on the Show button, or edit by adding or removing from a specific team by clicking on the Edit button, or delete a team by clicking the Destroy button.
   - the admin can also make a new team by clicking on the New Team button at the bottom.
* View Reviews
   - under view reviews, the admin can look at all the reviews written by students to other students
* Manage Projects
   - under manage projects, the admin can view all the projects, make a new project, edit a project, and delete a project.
   - when editing a project, the admin can add or remove teams from a specific project.
 
### Student Use
If the student already has an account, they can log in using their Email and Password. To make a new account the student can click on Sign Up button, which will redirect to the Sign up page. The student has to make sure to select the role as student from the Role drop down.
 
Once the student is logged in, the student can go to any of the following pages:
* Profile
   - under profile, the student can view information like their name, email and the teams that they are in.
* Check Teammates
   - the student can view all teams that they are part of, and the team members in the team
* View Reviews
   - under reviews, the student can view reviews that have been give to them and write a new review to other students in the team.
* Check Projects
   - under check projects, the student can view all the projects that have been assigned to them by the admin.
 
## More Info
 
Information about the ERD, Database Tables, logic format, etc. can be found at the presentation link above.
 
## Testing
 
Controllers and Models are tested.

## Controller Code Contributions
Michael- Wrote review_controller.rb and application_controller.rb code for getting all reviews written for a specific student, based on current_user.email. This uses a select statement to find the student entity matching the user, and then another select statement to get the reviews with written_for_id equal to the id of this student.

Zitao:
application_controller.rb: wrote configure_permitted_parameters to get role when signing up a new student account.
projects_controller.rb: wrote functions to add project to a team and remove teams from a project.
reviews_controller.rb: wrote create functions to make sure
students_controller.rb:
teams_controller.rb:

Sparsh - Wrote some code in teams_controller.rb to add and remove students from a team. The function iterates through user input (list of student emails) and pushes them to @team.students. Wrote some code to validate email addresses using regex. Also wrote some code to check if the person currently logged in is a student or not. Wrote code to destroy teams/projects/students in their respective controllers. 

Mohith- Wrote the test cases to test Models and the Controllers. Wrote some validations in the Models. Collaborated with Sparsh to implement removing students from a team in the teams controller. Collaborated with Zitao to implement the student controller.
