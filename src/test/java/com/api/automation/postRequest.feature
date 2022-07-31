Feature: To post the request body to add new job description

  Background: To  set the base url
    Given url 'http://localhost:9191/'
    And print '====== base url ======'

  Scenario: To validate the full response body using Http getAll Endpoint in Json Format
    Given path "normal/webapi/add"
    And headers {Accept : "application/json" , Content-Type : "application/json"}
    * def getRandomValue = function(){ return Math.floor((Math.random() * 100) + 1)}
    * def jobId = getRandomValue()
    * def jobTitle = "Software Engg -2"
    And print jobId
    * def requestBody = read('../resources/jsonRequestBody.json')
    And request requestBody
    When method post
    Then status 201
    And print response
