
# Setup:

 

1- copy the .example.env file then rename it to be .env

2- add database credintials into .env file:

    DB_CONNECTION=mysql
    DB_HOST=127.0.0.1
    DB_PORT=3306
    DB_DATABASE=database_name
    DB_USERNAME=name
    DB_PASSWORD=pass

3- run these commands in your terminal

    php artisan jwt:secret
    
    php artisan key:generate
    
    php artisan migrate
    
    php artisian serve

  

# API:

 
1- The register api (used for create new user) -> **POST /api/register** it takes 2 parameters required (email and pass) the name is optional in the request body

    {
    "name" : "name",
    "email" : "mail",
    "password" : "pass"
    }

  
  

2- The login api -> **POST /api/login** and it taks only 2 parameters required:

  

    {
    "email" : "email",
    "password" : "pass"
    }

  

(after login you need to take the token to use it in the next APIs by choosing Authorization tap in post-man then choose Bearer Token and paste your token there.)

  

3- Get all cities -> **GET /api/cities** (just list available cities)

  

4- Get available seats **GET /api/trip/{trip_id}**

  

5- Book available seat **POST /api/trip/{trip_id}/book** pass into body request

    {
    "depature" : 1,
    "destenation" : 5,
    "seat_id" : 3
    }
