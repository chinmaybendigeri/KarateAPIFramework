package com.api.automation;

import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

public class parallelRunner {

    @Test
    public void executeParallelRunner(){
        Runner.parallel(getClass(),5);

    }
}
