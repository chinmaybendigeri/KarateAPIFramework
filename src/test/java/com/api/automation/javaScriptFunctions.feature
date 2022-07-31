@regression
Feature: To create javascripts functions using ghekin and karate  framework
    
  Scenario: To create JS functions and print the data returned by JS functions
    * def addTwoNum = function(x,y){ return x + y }
    Then print 'Result of 2 numbers => ', addTwoNum(12,12)
    * def aNumber = function(){ return 100 }
    Then print 'Result of 2 numbers => ', aNumber()
