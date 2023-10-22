package org.example.runner;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        features = "src/test/java/org/example/features",
        glue = "org.example.steps",
        tags = "@cliente_elegivel",
        stepNotifications = true,
        plugin = {"pretty", "html:target/cucumber.html"},
        monochrome = true
)

public class ElegibilidadeRunner {

}