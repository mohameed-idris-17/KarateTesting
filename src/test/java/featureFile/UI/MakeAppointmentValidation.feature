Feature: make a Appointment for Doctor

@debug
Scenario: Login scenario
    Given driver 'https://katalon-demo-cura.herokuapp.com/'
    * configure retry = { count: 10, interval: 2000 }
    * maximize()
    And click('#btn-make-appointment')
    And input('#txt-username','John Doe')
    And input('#txt-password','ThisIsNotAPassword')
    When click('#btn-login')
    * waitFor('#combo_facility')
    * screenshot()
    * def urldriver = driver.url
    * print urldriver
    Then select('#combo_facility', 'Seoul CURA Healthcare Center')
    Then click('#chk_hospotal_readmission')
    Then click('#radio_program_medicaid')
    Then input('#txt_visit_date' ,"04/30/2026")
    Then input('#txt_comment',"Pain in Eye")
    Then click('#btn-book-appointment')
    * waitFor('#comment')
    And match text('#comment') contains 'Pain in Eye'
    * close()
    
