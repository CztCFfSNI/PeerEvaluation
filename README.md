# README

## Presentation Materials
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

## More Info

Information about the ERD,Database Tables, logic format, etc. can be found at the presentation link above. 

## Testing

Testing is currently still in development (beta dev)


## Controller Code Contributions
Michael- Wrote review_controller.rb and application_controller.rb code for getting all reviews written for a specific student, based on current_user.email. This uses a select statement to find the student entity matching the user, and then another select statement to get the reviews with written_for_id equal to the id of this student.

Zitao- Wrote application_controller.rb code for setting two different roles(students and admin) and asking users to sign up with a specific role before doing any other actions. Wrote students_controller.rb code for preventing students from entering pages without authority. Wrote some codes in views and now users' roles will determine the authority and the views you see.

Sparsh - Wrote some code in teams_controller.rb to add and remove students from a team. The function iterates through user input (list of student emails) and pushes them to @team.students. Also wrote some code to validate email addresses using regex. Also wrote some code to check if the person currently logged in is a student or not.

Mohith- Wrote the Integration test for the Controllers. Worked on the Models and the Controller tests to test the objects. Working on finishing up validations and testing.
