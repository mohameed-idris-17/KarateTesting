Feature: Create Pet API

  Background:
    * def baseurl  = 'https://petstore.swagger.io/v2/'

  Scenario: Create new user

    Given url 'https://reqres.in/api/users'

    And request read('classpath:payloads/createUser.json')

    When method POST

    Then status 201

    And match response.name == "Idris"

  Scenario: Create a new pet

    Given url baseurl
    And path 'pet'
    And request
    """
    {
      "id": 101,
      "name": "Tommy",
      "status": "available"
    }
    """
    When method POST
    Then status 200
    And match response.name == "Tommy"
    And match response.id == 101