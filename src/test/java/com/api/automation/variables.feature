Feature: To define variable in the request and response body

  Background: To  set the base url
    Given url 'http://localhost:9191/'
    And print '====== base url ======'
    And def globalId = 200

  Scenario: To validate the full response body using Http getAll Endpoint in Json Format
    Given path "normal/webapi/all"
    And header Accept = "application/json"
    When method get
    Then status 200
    And print response
    * def expectedResponse = read('../resources/jsonResponse.json')
    And match response == expectedResponse
    And print expectedResponse
    And print "Globol id =>", globalId

  Scenario: To validate the full response body using embedded variables in response
    Given path "normal/webapi/all"
    And header Accept = "application/json"
    When method get
    Then status 200
    And print response
    * def title = 'Software Engg'
    * def expectedResponse = read('../resources/dynamicJsonResponse.json')
    And match response == expectedResponse
    And print expectedResponse


  Scenario: To create variables and print in console
    * def int_var = 100
    * def str_var = "Chinmay"
    * def int_var_2 = int_var + 100
    And print "int_var =>",int_var
    And print "str_var =>",str_var
    And print "int_var_2 =>",int_var_2
    And print "Globol id =>", globalId

 