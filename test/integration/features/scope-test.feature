Feature: Book API (V1) Tests

    Scenario: Get oauth credential

      When I GET /snarf?key=`ReadWriteconsumerKey`
        Then response code should be 200
        And response body should be valid json
        And response body path $.[0].id should be (.+)
