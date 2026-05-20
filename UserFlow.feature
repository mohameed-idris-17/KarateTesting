Feature: End to End Flow

  Background:
    * def baseUrl  = 'https://petstore.swagger.io/v2/'

    # End - To -End flow


  Scenario: Create Update Delete Flow

    # Create Pet

    Given url baseUrl
    And path 'pet'

    And request
    """
    {
      "id": 500,
      "name": "Tiger",
      "status": "available"
    }
    """

    When method POST
    Then status 200

    * def petId = response.id

    # Get Pet

    Given url baseUrl
    And path 'pet', petId

    When method GET

    Then status 200

    # Update Pet

    Given url baseUrl
    And path 'pet'

    And request
    """
    {
      "id": #(petId),
      "name": "Rocky",
      "status": "sold"
    }
    """

    When method PUT

    Then status 200

    # Delete Pet

    Given url baseUrl
    And path 'pet', petId

    When method DELETE

    Then status 200