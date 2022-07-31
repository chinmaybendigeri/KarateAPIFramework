Feature: To get the response to find job description

  Scenario: To find the jobDescription using query parameters
    * def createJob = call read('postRequest.feature')
    * def createJobId = createJob.jobId
    * def createJobTitle = createJob.jobTitle
    Given url 'http://localhost:9191'
    And path '/normal/webapi/find'
    And header Content-type = 'application/json'
    And param id = '#(createJobId)'
    And param jobTitle = '#(createJobTitle)'
    #And params {id : '#(createJobId)',jobTitle: '#(createJobTitle)'}
    When method get
    Then status 200
    And print response
    And match response.jobId == newId