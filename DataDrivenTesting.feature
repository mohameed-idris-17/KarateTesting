Feature: Data Driven Testing


  Scenario Outline: Login multiple users

   Given url 'https://reqres.in/api/login'
    And request
    """
    {
      "email": "<email>",
      "password": "<password>"
    }
    """

    When method POST
    * def users = read('classpath: payloads/user.json')
    * print users


    Examples:
      | read('classpath: payloads/user.json') |