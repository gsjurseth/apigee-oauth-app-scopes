@core
Feature:
	As Httpbin client I want to use variables in my feature files

	Scenario: Sending fetch a read token and try to read
		  Given I have basic authentication credentials `ScopeCaseReadWriteApp.consumerKey` and `ScopeCaseReadWriteApp.consumerSecret`
      And I store the raw value $.access_token as myTokenPath in scenario scope
      When I POST to /oauth/client_credential/accesstoken?grant_type=client_credentials 
      Then I store the value of body path `myTokenPath` as access token
    Given I remove Authorization header
    And I set bearer token
    When I GET /scopecase/read
    Then response body path $.message should be You have hit /read

	Scenario: Sending fetch a read token and try to write
		  Given I have basic authentication credentials `ScopeCaseReadWriteApp.consumerKey` and `ScopeCaseReadWriteApp.consumerSecret`
      And I store the raw value $.access_token as myTokenPath in scenario scope
      When I POST to /oauth/client_credential/accesstoken?grant_type=client_credentials&scope=urn:scopecase:read
      Then I store the value of body path `myTokenPath` as access token
    Given I remove Authorization header
    And I set bearer token
    When I POST to /scopecase/write
    Then response code should be 401

	Scenario: Sending fetch a read token and try to write
		  Given I have basic authentication credentials `ScopeCaseReadWriteApp.consumerKey` and `ScopeCaseReadWriteApp.consumerSecret`
      And I store the raw value $.access_token as myTokenPath in scenario scope
      When I POST to /oauth/client_credential/accesstoken?grant_type=client_credentials&scope=urn:scopecase:read,urn:scopecase:write
      Then I store the value of body path `myTokenPath` as access token
    Given I remove Authorization header
    And I set bearer token
    When I POST to /scopecase/write
    Then response body path $.message should be You have hit /write

	Scenario: Sending fetch a read only token with the read only app and try to read
		  Given I have basic authentication credentials `ScopeCaseReadOnlyApp.consumerKey` and `ScopeCaseReadOnlyApp.consumerSecret`
      And I store the raw value $.access_token as myTokenPath in scenario scope
      When I POST to /oauth/client_credential/accesstoken?grant_type=client_credentials&scope=urn:scopecase:read
      Then I store the value of body path `myTokenPath` as access token
    Given I remove Authorization header
    And I set bearer token
    When I GET /scopecase/read
    Then response body path $.message should be You have hit /read

	Scenario: Sending fetch a read token and try to write
		  Given I have basic authentication credentials `ScopeCaseReadOnlyApp.consumerKey` and `ScopeCaseReadOnlyApp.consumerSecret`
      And I store the raw value $.access_token as myTokenPath in scenario scope
      When I POST to /oauth/client_credential/accesstoken?grant_type=client_credentials&scope=urn:scopecase:read
      Then I store the value of body path `myTokenPath` as access token
    Given I remove Authorization header
    And I set bearer token
    When I POST to /scopecase/write
    Then response code should be 401
