Feature: Create User

  Scenario: Create new user

    Given url 'https://reqres.in/api/users'

    And request read('classpath:payloads/createUser.json')

    When method POST

    Then status 201

    And match response.name == "Idris"