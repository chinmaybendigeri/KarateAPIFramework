Feature: To upload a file using post end point

  Background: To get the base url
    Given url 'http://localhost:9191'

  Scenario: To upload the file present locally
    Given path "/normal/webapi/upload"
    And multipart file file = { read : "../resources/dynamicJsonResponse.json", filename : "dynamicJsonResponse.json", Content-type : "multipart/form"}
    When method post
    Then status 200
    And print response
    And match response.message contains "dynamicJsonResponse.json"