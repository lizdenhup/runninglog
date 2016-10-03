# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - I required Sinatra in my gemfile, as well as Sinatra-ActiveRecord to make this Sinatra app.
- [x] Use ActiveRecord for storing information in a database - used Rake tasks to create users and workouts migrations in ActiveRecord. Set up ActiveRecord environment in config/environment.rb
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)  - I have a Users and Workouts model. 
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts) - A user has_many workouts and a workout belongs_to a user.
- [x] Include user accounts - A user can sign up. The user's password is protected through bCrypt. Each time a user logs in a new session is initiated and their data is authenticated during log in.
- [ ] Ensure that users can't modify content created by other users - users can only see their own content.
- [x] Include user input validations - Workouts cannot be created with blank fields (except for notes, which are optional).
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new) - I use Sinatra's built in error handler to display validation failures to the user.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code - readme.md has a summary, installation guide, and invitation for contributors, as well as license information.

Confirm
- [x] You have a large number of small Git commits - I have about 50 git commits on this project.
- [x] Your commit messages are meaningful - Each commit contains a sentence about what I changed.
- [x] You made the changes in a commit that relate to the commit message - See above.
- [x] You don't include changes in a commit that aren't related to the commit message - I tried to only change one thing at a time.