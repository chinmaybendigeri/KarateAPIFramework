@regression1
Feature: To get the responses of the all the job descriptions using get End point

  Background: To  set the base url
    Given url 'http://localhost:9191/'
    And print '====== base url ======'

  Scenario: To fetch the response of all the job decriptions using Http getAll Endpoint in Json Format
    Given path "normal/webapi/all"
    And header Accept = "application/json"
    When method get
    Then status 200
    And print response

  @ignore
  Scenario: To fetch the response of all the job decriptions using Http getAll Endpoint in Xml Format
    Given path "normal/webapi/all"
    And header Accept = "application/xml"
    When method get
    Then status 200
    And print response

  Scenario: To validate the schema for the response returned by the get api
    Given path "normal/webapi/all"
    And header Accept = "application/json"
    When method get
    Then status 200
    * def innerSchema = {"projectName": '#string',"technology": '#[] #string'}
    * def outerSchema = {"jobId": '#number',"jobTitle": '#string',"jobDescription": '#string',"experience": '#[] #string',"project": '#[] ##(innerSchema)'}
    * def mainSchema = '#[] ##(outerSchema)'
    And match response == mainSchema





