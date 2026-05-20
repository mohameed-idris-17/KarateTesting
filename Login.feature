Feature: Login API Testing

  Scenario Outline: Validate login with multiple users

    Given url 'https://reqres.in/api/login'

    And request
    """
    {
      "email": "<email>",
      "password": "<password>"
    }
    """

    When method POST

    Then status <statusCode>

    Examples:
      | email                  | password   | statusCode |
      | eve.holt@reqres.in     | cityslicka | 200        |
      | wrong@gmail.com        | wrong123   | 400        |
      | peter@klaven           |            | 400        |