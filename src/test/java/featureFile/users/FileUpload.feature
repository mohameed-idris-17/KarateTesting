Feature: upload a file 

Background: 
    * url "https://filebin.net/"

    
Scenario: test case to upload file
    Given path '/'
    And header Content-Type = 'application/pdf'
    And header filename = 'resume_idris.pdf'
    And request karate.read("file:Resource/resume_idris.pdf")
    When method post
    Then status 201  
