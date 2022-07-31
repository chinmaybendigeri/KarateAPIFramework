Feature: To post the request body to add new job description

  Background: To  set the base url
    Given url 'http://localhost:9191'
    And print '====== base url ======'

  Scenario: To validate the full response body using Http getAll Endpoint in Json Format
    Given path "/normal/webapi/add"
    And headers {Accept : "application/json" , Content-Type : "application/json"}
    * def getRandomValue = function(){ return Math.floor((Math.random() * 10) + 1)}
    * def jobId = getRandomValue()
    And print jobId
    * def requestBody = read('../resources/jsonRequestBody.json')
    And request requestBody
    When method post
    Then status 201
    And print response
    Given path "/normal/webapi/update"
    And headers {Accept : "application/json" , Content-Type : "application/json"}
    And request
    """
    {
  "jobId": '#(jobId)',
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
    * def actualResponse = karate.jsonPath(response,"$[?(@.jobId == "+ jobId+")]")
    And print actualResponse
