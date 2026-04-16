package runner;

import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.Test;

public class TestRunner {
    
    @Karate.Test
    Karate runTests() {
        return Karate.run().relativeTo(getClass());
    }
}
