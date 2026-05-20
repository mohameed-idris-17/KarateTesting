Feature: Update Pet API

  Background:
    * def baseUrl  = 'https://petstore.swagger.io/v2/'

  Scenario: Update pet details

    Given url baseUrl
    And path 'pet'

    And request
    """
    {
      "id": 101,
      "name": "Bruno",
      "status": "sold"
    }
    """

    When method PUT

    Then status 200

    And match response.name == "Bruno"
    And match response.status == "sold"