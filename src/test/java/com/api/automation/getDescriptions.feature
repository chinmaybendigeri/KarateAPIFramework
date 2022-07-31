@regression @smoke
Feature: To get the all the job descriptions using get End point

  Background: To  set the base url
    Given url 'http://localhost:9191/'
    And print '====== base url ======'

  Scenario: To fetch all the job decriptions using Http getAll Endpoint in Json Format
    Given path "normal/webapi/all"
    And header Accept = "application/json"
    When method get
    Then status 200

  Scenario: To fetch all the job decriptions using Http getAll Endpoint in Xml Format
    Given path "normal/webapi/all"
    And header Accept = "application/xml"
    When method get
    Then status 200

