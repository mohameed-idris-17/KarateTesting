Feature: pratice using pet API
Background: 
  * url  'https://jsonplaceholder.typicode.com/'   
  
@debug
Scenario: Get id and name
    Given path "users/1"
    When method get
    Then match $ == '#object'
    * def JsonExpectedJSON = 
    """
      {
  "id": '#number',
  "name": "#string",
  "username": "#string",
  "email": "#string",
  "address": {
    "street": "#string",
    "suite": "#string",
    "city": "#string",
    "zipcode": "#string",
    "geo": {
      "lat": "#string",
      "lng": "#string"
    }
  },
  "phone": "#string",
  "website": "#string",
  "company": {
    "name": "#string",
    "catchPhrase": "#string",
    "bs": "#string"
  }
  }
  """
  Then match $ == JsonExpectedJSON
Scenario: create a new user
  Given path "users"
  When request
  """
    {
      "id": 786,
      "name": "Leanne ",
      "username": "Bret",
      "email": "Sincere@april.in",
      "address": {
        "street": "Kulas Light",
        "suite": "Apt. 556",
        "city": "Gwenborough",
        "zipcode": "92998-3874",
        "geo": {
          "lat": "-37.3159",
          "lng": "81.1496"
        }
      },
      "phone": "1-770-736-8031 x56442",
      "website": "hildegard.org",
      "company": {
        "name": "Romaguera-Crona",
        "catchPhrase": "Multi-layered client-server neural-net",
        "bs": "harness real-time e-markets"
      }
    }
    """
  And method post
  Then status 201
  And match response.id == '#number'


Scenario: get the created user using id
  Given path "users/"
  And param id = 1
  When method get
  Then status 200




Scenario: update the created resource using patch
  Given path "users"
  And param "id" = 1
  And request
  """
  {
    "email" : "XXX@gmail.com"
  }
  """
  When method patch 
  
  