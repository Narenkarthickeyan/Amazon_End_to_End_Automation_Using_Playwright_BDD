Feature: Amazon Performance Testing
  As a part of performance Testing
  I want to test the performance of the Amazon website
  So that I can ensure it meets response time and load capacity requirements
  

  Background:
    Given the browser is launched
    And I navigate to the Amazon homepage

  Scenario: Measure homepage load time
    When I load the Amazon homepage
    Then the homepage should load within 2 seconds

  Scenario: Measure search functionality performance
    Given I am on the Amazon homepage
    When I search for a product with the keyword "laptop"
    Then the search results should be displayed within 1.5 seconds

 Scenario: Validate product page load time
    Given I search for a product with the keyword "smartphone"
    When I click on the first product in the search results
    Then the product details page should load within 2 seconds

  Scenario: Test the performance under peak load
    Given the system is set up for load testing
    When 1000 users access the Amazon homepage simultaneously
    Then the homepage should load for all users within 3 seconds

  Scenario: Measure the response time for adding items to the cart
    Given I am logged into my Amazon account
    And I search for a product with the keyword "headphones"
    When I add the first product to the cart
    Then the cart should update within 1 second

  Scenario: Test performance of the checkout process
    Given I have items in my cart
    When I proceed to checkout
    Then the checkout page should load within 2 seconds

  Scenario: Measure response time for account settings update
    Given I am logged into my Amazon account
    When I navigate to the account settings page
    And I update my email address to "newemail@example.com"
    Then the update should be processed within 2 seconds

  Scenario: Test the performance of the recommendation engine
    Given I am logged into my Amazon account
    When I navigate to the homepage
    Then the personalized product recommendations should load within 2 seconds

  Scenario: Validate the performance of customer service chat
    Given I am on the help and customer service page
    When I initiate a chat with customer service
    Then the chat window should open within 1 second

  Scenario: Measure performance of category navigation
    Given I am on the Amazon homepage
    When I navigate to the "Books" category
    Then the category page should load within 1.5 seconds

  Scenario: Validate response time for wishlist operations
    Given I am logged into my Amazon account
    When I add an item to my wishlist
    Then the wishlist should update within 1 second'

  Scenario: Check performance of the mobile site
    Given I am using a mobile device
    When I navigate to the Amazon mobile site
    Then the homepage should load within 3 seconds

  Scenario: Validate performance of the shopping cart with multiple items
    Given I am logged into my Amazon account
    And I have added 20 items to my cart
    When I load the cart page
    Then the cart should load within 2 seconds

  Scenario: Test performance of session handling
    Given multiple users are logged into their accounts
    When a user logs out and logs back in
    Then the login should be processed within 2 seconds

 Scenario: Measure performance of customer reviews loading
    Given I search for a product with the keyword "camera"
    When I click on the first product in the search results
    And I scroll down to the reviews section
    Then the reviews should load within 2 seconds

#The time limits defined in the performance test scenarios are generally based on industry standards,
 # user expectations, and specific requirements for web applications.