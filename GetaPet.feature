Feature: Get Pet API

  Background:
    * def baseUrl  = 'https://petstore.swagger.io/v2/'

  Scenario: Get pet details

    Given url baseUrl
    And path 'pet', 101

    When method GET

    Then status 200

    And match response.name == "Tommy"