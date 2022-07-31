Feature: To post the request body to add new job description using scenario outline

  Background: To  set the base url
    Given url 'http://localhost:9191/'
    And print '====== base url ======'

  Scenario Outline: To validate the full response body using Http getAll Endpoint in Json Format <jobId>
    Given path "normal/webapi/add"
    And headers {Accept : "application/json" , Content-Type : "application/json"}
    * def requestBody = read('../resources/jsonRequestBody.json')
    And request requestBody
    When method post
    Then status 201
    And print response
    Examples:
      |jobId|
      | 297 |
      | 400 |