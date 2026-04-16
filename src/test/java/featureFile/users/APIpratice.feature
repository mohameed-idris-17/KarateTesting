Feature: API testing

Background:
    * url  = "https://petstore.swagger.io/v2" 
  
Scenario: assertion the result
    Given url ""
    When method get
    Then status 200
    And match $.company == "Tech Corp"
    And match $.skills[0] == "Java";



Scenario: Send the payload
    Given path "/files/upload"
    And request 
    """
    {
         "required" : true,
         "content":{
            "multipart/form-data":
                    "schema": 
                 { 
                    "type": "#object" }
                }
    }
    """
    When method post
    Then status 201

Scenario: Get the response by id
    Given path "/files/{id}"
    And method get 
    Then status 200

Scenario: Delete the resouce
    Given path "/files/{id}"
    And method delete
    Then status 204





    