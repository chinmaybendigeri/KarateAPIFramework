Feature: To post the request body to add new job description

  Background: To  set the base url
    Given url 'http://localhost:9191'
    And print '====== base url ======'

  Scenario: To validate the full response body using Http getAll Endpoint in Json Format
    * def context = call read('postRequest.feature')
    And print context.jobId
    Given path "/normal/webapi/update"
    And headers {Accept : "application/json" , Content-Type : "application/json"}
    And request
    """
    {
  "jobId": '#(context.jobId)',
  "jobTitle": "Software Engg -5",
  "project": [
    {
      "technology": [
        "Kotlin",
        "SQL Lite",
        "Gradle",
        "Pega"
      ],
      "projectName": "Movie App"
    },
       {
      "technology": [
        "Node Js",
        "Html",
        "Css",
        "MongoDb"
      ],
      "projectName": "Web App"
    }
  ],
  "jobDescription": "To develop andriod application and web application",
  "experience": [
    "Google",
    "Apple",
    "Mobile Iron"
  ]
}
    """
    When method put
    Then status 200
    And print response
    * def actualResponse = karate.jsonPath(response,"$[?(@.jobId == "+ context.jobId+")]")
    And print actualResponse
