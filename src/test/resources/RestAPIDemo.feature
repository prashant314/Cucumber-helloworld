Feature: Login Functionality
@validLogin
Scenario: User Should Login With Valid Credentials 
   Given Post Login API
   When Provide Valid Credential
   Then Status_code equals 200    
   And  response contains IsLogin equals "true"
@invalidLogin    
Scenario Outline: Email and Password Validation in Login API 
   Given Post Login API
   When Provide different combinations to "<email>""<password>"
   Then Status_code equals <statuscode>    
   And  response contains message equals "<message>"
   Examples:
   |email     		|password    | statuscode |  message
   |          		|            |   401      | Required email and password
   | abc	  	|            |   401      | Email format is incorrect
   | abc@mail7.io  	|	     |   401      | Required password
   | abc@mail7.io   	| password   |   401      | Email and Password combination Incorrect
