# README

## Presentation Materials
- [Presentation](https://docs.google.com/presentation/d/1CxEjYkrvY5vLyQvEOWeyerpJmUNsR-_vojjTn90u0-I/edit#slide=id.gc6fa3c898_0_0)
- [Database ERD](https://lucid.app/lucidchart/bb169a01-6c08-4bfd-a07b-7a78dbe80c18/edit?invitationId=inv_2ff39713-72f6-491c-aef2-0f1377bc3cc1&page=0_0#)

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Controller Code Contributions
Michael- Wrote review_controller.rb and application_controller.rb code for getting all reviews written for a specific student, based on current_user.email. This uses a select statement to find the student entity matching the user, and then another select statement to get the reviews with written_for_id equal to the id of this student.

Zitao- Set up the devise in the Gemfile and created users in the app and the db folder. Wrote application_controller.rb code for setting two different roles for users(students and admin) and asking users to sign up with a specific role before doing any other actions. Wrote students_controller.rb code for preventing students from entering pages without authority. Wrote some codes in views and now users' roles will determine the authority and the views you see.
