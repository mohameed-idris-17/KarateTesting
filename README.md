

A Maven-based Karate automation project with examples for API, GraphQL, file upload, and UI testing.

## Overview

- Project name: `karateTesting`
- Build tool: Maven
- Language: Java 17
- Test framework: Karate 1.5.0 + JUnit 5

## Project Structure

```text
karateTestingdemo/
  pom.xml
  README.md
  Resource/                      # Static test files
  src/
    test/
      java/
        featureFile/
          users/
            users.feature
            GraphQL.feature
            FileUpload.feature
          UI/
            MakeAppointmentValidation.feature
          TestRunner.java      # Runner class
  target/                        # Build output and test reports
```

## Test Coverage

- REST API testing against JSONPlaceholder (`users.feature`)
- GraphQL testing against Rick and Morty API (`GraphQL.feature`)
- File upload testing (`FileUpload.feature`)
- UI automation flow on Cura demo site (`MakeAppointmentValidation.feature`)

## Prerequisites

1. Java 17 installed
2. Maven 3.8+ installed
3. Verify installation:

```bash
java -version
mvn -version
```

## How To Run

Run all tests:

```bash
mvn test
```

Run tests by tag (example `@debug`):

```bash
mvn test "-Dkarate.options=--tags @debug"
```

Run one feature file:

```bash
mvn test "-Dkarate.options=classpath:featureFile/users/GraphQL.feature"
```

Run one scenario by line number:

```bash
mvn test "-Dkarate.options=classpath:featureFile/users/users.feature:6"
```

Run with environment:

```bash
mvn test -Dkarate.env=dev
```

## Reports

Karate HTML reports are generated in:

- `target/karate-reports/`

Depending on execution settings, timestamped report folders may also appear under `target/`.

## Project Notes

- `pom.xml` is configured to load test resources from `src/test/java` excluding `.java` files.
- `FileUpload.feature` expects `Resource/resume_idris.pdf` to be available.
- UI tests require browser/driver support configured for Karate.

## Karate Quick Reference

### 1. What Is Karate

Karate is a JVM-based framework for:

- API testing
- UI testing
- Performance testing (via Gatling integration)

Key benefit: one framework for request building, assertions, test data handling, and BDD-style scenarios.

### 2. Basic Feature Structure

```gherkin
Feature: Sample API Test

Background:
  * url 'https://api.example.com'

Scenario: Get users
  Given path 'users'
  When method get
  Then status 200
```

Keyword meaning:

- `Feature`: test suite
- `Background`: executed before each scenario
- `Scenario`: test case

### 3. Core API Building Blocks

- `url`: base URL
- `path`: endpoint path
- `param`: query parameter
- `header`: request header
- `request`: body payload

Example:

```gherkin
Given url baseUrl
And path 'users'
And param page = 2
When method get
Then status 200
```

### 4. HTTP Methods Used

- GET
- POST
- PATCH

### 5. Assertions

Status assertion:

```gherkin
Then status 200
```

Field assertion:

```gherkin
And match response.name == 'John'
```

Schema assertion:

```gherkin
And match response ==
"""
{
  id: '#number',
  name: '#string'
}
"""
```

`match` supports value, schema, deep, and partial validation.

### 6. Variables And Reuse

```gherkin
* def userId = 10
Given path 'users', userId
```

### 7. File Reading With karate.read

```gherkin
* def payload = karate.read('data.json')
```

Used for payloads, test data, and static file content.

### 8. GraphQL Pattern

```gherkin
Given request { query: '{ users { id name } }' }
When method post
Then status 200
```

GraphQL commonly uses one endpoint; query decides response shape.

### 9. File Upload Pattern

```gherkin
* def file = karate.read('file.txt')
Given request file
When method post
```

For production-like APIs, multipart upload is often the preferred approach.

### 10. UI Automation With Karate Driver

```gherkin
* driver 'https://example.com'
* input('#username', 'admin')
* click('#login')
* match text('#welcome') contains 'Welcome'
```

Common functions: `driver`, `click()`, `input()`, `waitFor()`, `screenshot()`, `close()`.

### 11. Config Example

`karate-config.js`

```javascript
function fn() {
  var env = karate.env;
  return {
    baseUrl: 'https://api.dev.com'
  };
}
```

Used for environment switching and centralized config.

### 12. Parallel Execution

```java
Runner.path("classpath:features").parallel(5);
```

Benefits: faster execution and better CI/CD efficiency.

### 13. Most Used Keywords

`url`, `path`, `param`, `request`, `method`, `status`, `match`, `def`, `header`, `configure`
