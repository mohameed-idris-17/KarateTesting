Feature: Karate Questions

Background: 
    * url "https://jsonplaceholder.typicode.com"
    * def json = read('file:Resource/dummytest.json')

Scenario: Get the user 
    Given path "/users"
    And method get
    Then status 200


Scenario: PUT the new user
    Given path "/users"
    And request
    """
    {
    "id": 11,
    "name": "Glenna ",
    "username": "Delphine",
    "email": "Chaim_McDermott@dana.io",
    "address": {
      "street": "Dayna Park",
      "suite": "Suite 449",
      "city": "Bartholomebury",
      "zipcode": "76495-3109",
      "geo": {
        "lat": "24.6463",
        "lng": "-168.8889"
      }
    },
    "phone": "(775)976-6794 x41206",
    "website": "conrad.com",
    "company": {
      "name": "Yost and Sons",
      "catchPhrase": "Switchable contextually-based project",
      "bs": "aggregate real-time technologies"
    }
  }
    """
    When method post
    Then status 201


Scenario: Delete the existing resource
  Given path "/users/1"
  When method delete
  Then assert responseStatus == 204 || responseStatus ==  200

 
Scenario: print the particular field from the Json
  * set json.username = "idris"
  * match json.username == "idris"
  * print json


Scenario: Nested JSON Extraction
  * def address = json.address
  * print address.city
  

 @debug
Scenario Outline: Create posts with dynamic titles
  Given url 'https://jsonplaceholder.typicode.com/posts'
  And request
  """
  {
    "title": "<title>",
    "body": "<body>",
    "userId": 1
  }
  """
  When method POST
  Then status 201

Examples:
  | title | body |
  | Tyson | Hot  |
  | Box   | fit  |
  | Tom   | sexy |

Scenario Outline: geting the input from the csv file
  Given path "/post"
  And request 
  """
  {
    "title" : "<title>",
    "body" : "<body>",
    "status" : "<status>"
  }
  """
  When method post
  Then status 201

  Examples:
    | read('Resource\input.csv') |

