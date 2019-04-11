# Family_Story

<p> 
If you have trouble with your ruby install on Windows 10 because of SQLite3, try following some of the steps far down on this website to change the Gemfile and SQLite version: https://medium.com/ruby-on-rails-web-application-development/how-to-install-rubyonrails-on-windows-7-8-10-complete-tutorial-2017-fc95720ee059


bundle install


ridk exec gem uninstall sqlite3

(Select 3 for "all versions", in article it says 2 for all versions, maybe doing 3 instead works?)


ridk exec gem install sqlite3 --platform=ruby -v 1.3.13
</p>

<h1>To get Family Story working locally:</h1>
<p>
  Clone the repository
  
  Move into the directory "Family_Story\family_story
  
  Run the command "rails db:migrate"
  
  Run the command "rails server"
  
Now if you browse to the URL "localhost:3000" you will arive at the local deployment of Family Story
</p>
  
