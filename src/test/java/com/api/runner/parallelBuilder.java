package com.api.runner;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.*;

public class parallelBuilder {

    public static final String DELIMITER = ",";

    @Test
    public void runTestsParallelly(){

        Runner.Builder builder = new Runner.Builder();
        builder.path("classpath:com/api/automation");
        builder.tags(getTags());
        Results results = builder.parallel(5);
        generateCucumberReports(results.getReportDir());
        System.out.println("Total feature count => "+ results.getFeatureCount());
        System.out.println("Total scenarios count => "+ results.getScenarioCount());
        System.out.println("Total passed count => "+ results.getPassCount());

        Assertions.assertEquals(0,results.getFailCount(),"There are test scenarios failing!!");
    }

    private void generateCucumberReports(String reportPath) {
        File reportDir = new File(reportPath);
        Collection<File> fileCollections = FileUtils.listFiles(reportDir,new String[]{"json"},true);
        List<String> jsonFile = new ArrayList();
        fileCollections.forEach(file -> jsonFile.add(file.getAbsolutePath()));

        Configuration configuration = new Configuration(reportDir,"My Reports");
        ReportBuilder reportBuilder = new ReportBuilder(jsonFile,configuration);
        reportBuilder.generateReports();
    }

    private List<String> getTags() {
        String  tags = System.getProperty("tags","@regression");
        List<String> tagsList = Collections.emptyList();
        if(tags.contains(DELIMITER)){
            String[] tagsArray =  tags.split(DELIMITER);
            tagsList = Arrays.asList(tagsArray);
        }
        tagsList = Arrays.asList(tags);
        return tagsList;
    }

    // /Users/chibendi/NASA/KarateTutorials/karateApiAutomation/target/surefire-reports




}
