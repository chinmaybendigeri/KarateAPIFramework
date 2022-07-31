Feature: To validate the responses using  Json Path

  Background: To  set the base url
    Given url 'http://localhost:9191/'
    And print '====== base url ======'

  Scenario: To validate the responses using  Json Path
    Given path "normal/webapi/all"
    And header Accept = "application/json"
    When method get
    Then status 200
    And print response
    * def filteredResponse = karate.jsonPath(response,"$[?(@.jobId == 1)]")
    And print filteredResponse