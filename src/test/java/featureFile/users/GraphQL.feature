Feature: GraphQL 

Background: 
    * url 'https://rickandmortyapi.com/graphql'

Scenario: GraphQL TestCase
    Given request
    """
    {
      "query": "
      query 
      { 
      characters(page: 1) {
       results { 
       id name status species 
       } 
       } 
       }
       "
    }
    """
    When method post
    Then status 200

