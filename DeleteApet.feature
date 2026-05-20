Feature: Delete Pet API

  Background:
    * def baseUrl  = 'https://petstore.swagger.io/v2/'

  Scenario: Delete pet

    Given url baseUrl
    And path 'pet', 101

    When method DELETE

    Then status 200