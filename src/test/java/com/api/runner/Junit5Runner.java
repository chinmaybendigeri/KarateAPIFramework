package com.api.runner;

import com.intuit.karate.junit5.Karate;


public class Junit5Runner {

 //   @Karate.Test
//    public Karate testrunner(){
//         return Karate.run("../automation/getDescriptions").relativeTo(getClass());
//    }

    @Karate.Test
    public Karate testRunnerusingPaths(){
        return Karate.run("classpath:com/api/automation/getResponse.feature");
    }
}
