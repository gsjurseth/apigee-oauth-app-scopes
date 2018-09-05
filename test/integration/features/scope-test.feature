@core
Feature:
	As Httpbin client I want to use variables in my feature files

	Scenario: ReadOnlyApp with read only scope while trying to read. Should be successful
    Given I perform a client_credentials grant to /oauth/client_credential/accesstoken?grant_type=client_credentials&scope=urn:scopecase:read with clientid `ScopeCaseReadOnlyApp.consumerKey` and secret `ScopeCaseReadOnlyApp.consumerSecret`
    And I set bearer token
    When I POST to /scopecase/read
    Then response code should be 200

	Scenario: ReadWriteApp but read only scope while trying to write. Should be successful
    Given I perform a client_credentials grant to /oauth/client_credential/accesstoken?grant_type=client_credentials&scope=urn:scopecase:write with clientid `ScopeCaseReadWriteApp.consumerKey` and secret `ScopeCaseReadWriteApp.consumerSecret`
    And I set bearer token
    When I POST to /scopecase/write
    Then response code should be 401

	Scenario: ReadWriteApp but read only scope while trying to write. Should be a 401
    Given I perform a client_credentials grant to /oauth/client_credential/accesstoken?grant_type=client_credentials&scope=urn:scopecase:read with clientid `ScopeCaseReadWriteApp.consumerKey` and secret `ScopeCaseReadWriteApp.consumerSecret`
    And I set bearer token
    When I POST to /scopecase/write
    Then response code should be 401

	Scenario: ReadOnlyApp with read only scope while trying to write. Should be a 401
    Given I perform a client_credentials grant to /oauth/client_credential/accesstoken?grant_type=client_credentials&scope=urn:scopecase:read with clientid `ScopeCaseReadOnlyApp.consumerKey` and secret `ScopeCaseReadOnlyApp.consumerSecret`
    And I set bearer token
    When I POST to /scopecase/write
    Then response code should be 401

