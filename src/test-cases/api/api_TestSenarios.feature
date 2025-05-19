Feature: Amazon API Functionality

  Scenario: Verify user registration API
    Given I have the registration details
    When I send a POST request to "/api/register" with the registration details
    Then the response status should be 201
    And the response should contain a user ID

  Scenario: Validate user login API
    Given I have valid login credentials
    When I send a POST request to "/api/login" with the login credentials
    Then the response status should be 200
    And the response should contain a JWT token

  Scenario: Search for products API
    Given I have a search term "laptop"
    When I send a GET request to "/api/search" with the search term
    Then the response status should be 200
    And the response should contain a list of products

  Scenario: Retrieve product details API
    Given I have a valid product ID "B08N5WRWNW"
    When I send a GET request to "/api/product/{productId}"
    Then the response status should be 200
    And the response should contain product details

  Scenario: Add item to cart API
    Given I have a valid JWT token
    And I have a product ID "B08N5WRWNW"
    When I send a POST request to "/api/cart/add" with the product ID
    Then the response status should be 201
    And the response should contain a success message

  Scenario: Remove item from cart API
    Given I have a valid JWT token
    And I have a product ID "B08N5WRWNW" in my cart
    When I send a DELETE request to "/api/cart/remove" with the product ID
    Then the response status should be 204
    And the cart should no longer contain the product

  Scenario: Checkout process API
    Given I have a valid JWT token
    And I have items in my cart
    When I send a POST request to "/api/checkout"
    Then the response status should be 200
    And the response should contain an order confirmation