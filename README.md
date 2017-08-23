# README
This is a simple CRUD application to keep track of the albums and their associated metadata. For now there are only five fields stored which are atrist, album, title, year and record_condition.

On the landing page of the application, there are two options to record the album details. You can either create a new redord manually entering data into a web form or you can prepare a CSV and upload all the data in bulk.

Once the records are created there is a listing page where you can sort the records per field. Also there is a global search which can filter based on the search criteria. You can type values of any fields, it will search on those results and filter out the specific record.

Enhancements that can be done:

1. Filter can be kept on the listing page. The filter can be applied to filter all the records with certain record_condition or year. However that can be achieved via search now.

2. We can add certain other fields like genre, catagory or make these fields taggable.

3. We can make this application usable to a lot of users by adding a user registration and login module. There will be an association between user and album. User has many albums.

4. The video links can also be uploaded if we have any (youtube). So that one can directly open the link from the application itself.

To run the application:

1. Go to application folder
2. Run bundle install
3. Run rails s
4. open localhost:3000
5. Enjoy the features

OR

You can look over the deployed application in heroku.

url: https://fathomless-brook-96852.herokuapp.com/