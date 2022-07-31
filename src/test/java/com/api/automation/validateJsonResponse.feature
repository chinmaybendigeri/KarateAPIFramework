Feature: To get the responses of the all the job descriptions using get End point

  Background: To  set the base url
    Given url 'http://localhost:9191/'
    And print '====== base url ======'

  Scenario: To validate the full response body using Http getAll Endpoint in Json Format
    Given path "normal/webapi/all"
    And header Accept = "application/json"
    When method get
    Then status 200
    And print response
    And match response ==
    """
    [
  {
    "jobId": 1,
    "jobTitle": "Software Engg",
    "project": [
      {
        "technology": [
          "Kotlin",
          "SQL Lite",
          "Gradle"
        ],
        "projectName": "Movie App"
      }
    ],
    "jobDescription": "To develop andriod application",
    "experience": [
      "Google",
      "Apple",
      "Mobile Iron"
    ]
  }
]
    """

  Scenario: To validate key/value pairs present in the response body in json format
    Given path "normal/webapi/all"
    And header Accept = "application/json"
    When method get
    Then status 200
    And print response
    And match response.[0].jobId  == 1
    And match response.[0].project[0].projectName == 'Movie App'
    And match response.[0].project[0].technology[1] == 'SQL Lite'
    And match response.[0].experience[0] == 'Google'


  Scenario: To validate subset of json object present in the response body in json format
    Given path "normal/webapi/all"
    And header Accept = "application/json"
    When method get
    Then status 200
    And print response
    And match response.[0].jobId  == 1
    And match response.[0].project[0].projectName == 'Movie App'
    And match response contains deep {"jobDescription": "To develop andriod application"}


  Scenario: To validate subset of json object present in the response body in json format using wild card
    Given path "normal/webapi/all"
    And header Accept = "application/json"
    When method get
    Then status 200
    And print response
    And match response.[0].jobId  == 1
    And match response.[0].project[0].projectName == 'Movie App'
    And match response.[0].project[0].technology[*] contains 'SQL Lite'
    And match response contains deep {"jobDescription": "To develop andriod application"}
    And match response contains deep { "jobTitle": "Software Engg"}



  Scenario: To validate subset of json object present in the response body in json format using fuzzy matchers
    Given path "normal/webapi/all"
    And header Accept = "application/json"
    When method get
    Then status 200
    And print response
    And match response.[0].jobId  == '#present'
    And match response.[0].project[0].projectName == '#notnull'
    And match response.[0].project[0].technology[*] contains 'SQL Lite'
    And match response contains deep {"jobDescription": "To develop andriod application"}
    And match response contains deep { "jobTitle": "Software Engg"}


















