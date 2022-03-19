# README


Welcome! Please make yourself at home!



Here you will be able to send HTTP requests to this rails server once you have it up and running. 

Before you begin, please run ( bundle install ) to download any dependencies, followed up by running ( rails db:migrate ) to populate the schema. 

you can start the server locally by running the command ( rails s ).

I would recommend using a platform like Postman to test the HTTP request and view the response.


*User*

I began by creating a User model with the needed attributes, followed by the User controller to handle CRUD actions.


*Transaction*

I continued by creating a Transaction model containing attributes like payer (string), points (integer), timestamp (datetime) with a belongs_to and has_many relation with users. 


*Routes*

I proceeded with adding routes for the respective models. 



User create Route

        You can create a new user with a POST request at "/users"
        Please remember to include the following parameter
        - name:
        -(balance is automatically generated to 0)


Transaction create Route

        you can create a new transaction with a POST request to "/transactions"
        Please remember to include the following parameters
        - user_id:
        - payer:
        - points:
        -(timestamp: is automatically generated)


User update Route (spending points)

        You can update the users balance with a PATCH request to "/users/:id" 
        Please remember to include the following parameter that serves as the amount spent
        - balance:
        this action returns a list transactions the points were subtracted from and how much was subtracted for each.


User payer_balances Route (returning all payer balances)

        You can view all payer balances for a certain user with a GET request to "/balances/:id"
        This request returns a list of payers and the total amount of points the user has from each payer.


User show Route (viewing an individual user)

        You can also view one user to check all of the values of its attributes. with a GET request to "/users/:id".

User index Route (viewing all users)

        you may also view a list of all users if you would like to create and test multiple users with a GET request to "/users"



# Thank you for taking the time with reading through this Readme and testing this code.
# Please provide any feedback you believe may be helpful.