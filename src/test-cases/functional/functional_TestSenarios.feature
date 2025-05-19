Feature: Amazon Login, Sign-In, and Cart Operations
  As a registered Amazon user
  I want to log in, perform searches, and add items to the cart
  So that I can purchase items through my account

  Background:
    Given the browser is launched
    And I navigate to the Amazon homepage

  Scenario: Sign in with valid credentials
    Given I am on the Amazon sign-in page
    When I enter a valid email "user@example.com"
    And I enter a valid password "password123"
    Then I should be successfully logged into my account
    And I should see "Hello, User" on the homepage

  Scenario: Sign in with invalid credentials
    Given I am on the Amazon sign-in page
    When I enter an invalid email "invalid@example.com"
    Then I should see an error message "We cannot find an account with that email address"

  Scenario: Sign in with empty credentials
    Given I am on the Amazon sign-in page
    When I leave the email and password fields empty
    And I attempt to sign in
    Then I should see an error message "Enter your email or mobile phone number"

  Scenario: Log out from the account
    Given I am logged into my Amazon account
    When I log out of my account
    Then I should be redirected to the Amazon homepage
    And I should see the sign-in option again

  Scenario Outline: Search and add a product after signing in
    Given I am logged into my Amazon account
    When I search for a product with the keyword "<productKeyword>"
    And I add the first product to the cart
    Then the cart count should be "<expectedCartCount>"
    Examples:
      |productKeyword|expectedCartCount|
      |headphones    |1|
      |laptop        |1|
      |mobile        |1|
      |books         |1|

  Scenario: Proceed to checkout after signing in
    Given I am logged into my Amazon account
    And I have added a product to the cart
    When I proceed to checkout
    Then I should see the checkout page with my product listed
    And my shipping details should be prefilled

Scenario: Verify product details page
    Given I search for a product with the keyword "laptop"
    When I click on the first product in the search results
    Then I should see the product details page
    And the product title should be visible
    And the product price should be visible
    And the "Add to Cart" button should be present

Scenario: Add multiple products to the cart
    Given I am logged into my Amazon account
    When I search for a product with the keyword "headphones"
    And I add the first product to the cart
    When I search for a product with the keyword "charger"
    And I add the first product to the cart
    Then the cart count should be "2"

 Scenario: Remove a product from the cart
    Given I am logged into my Amazon account
    And I have added a product to the cart
    When I go to the cart page
    And I remove the product from the cart
    Then the cart should be empty

  Scenario: Verify order history
    Given I am logged into my Amazon account
    When I navigate to the order history page
    Then I should see my previous orders listed
    And the order status should be visible

  Scenario Outline: Filter products by category
    Given I am on the Amazon homepage
    When I select the category "<category>" from the navigation menu
    And I search for "<searchTerm>"
    Then I should see products belonging to the "<category>" category

  Examples:
    | category     | searchTerm   |
    | Electronics  | smartphones   |
    | Books        | novels        |
    | Home & Kitchen | cookware    |

  Scenario: Check product recommendations
    Given I am logged into my Amazon account
    When I navigate to the homepage
    Then I should see personalized product recommendations based on my browsing history

  Scenario: Verify the wishlist functionality
    Given I am logged into my Amazon account
    When I search for a product with the keyword "book"
    And I add the first product to my wishlist
    Then the product should be present in my wishlist

  Scenario: Change account settings
    Given I am logged into my Amazon account
    When I navigate to the account settings page
    And I update my email address to "newemail@example.com"
    And I save the changes
    Then I should see a confirmation message "Your account settings have been updated"

Feature: Additional Amazon Functional Testing
  As a registered Amazon user
  I want to test more functionalities of the Amazon website
  So that I can ensure the features are working as expected

  Background:
    Given the browser is launched
    And I navigate to the Amazon homepage

  Scenario: Search for a product with no results
    Given I am on the Amazon homepage
    When I search for a product with the keyword "xyzproduct123"
    Then I should see a message saying "No results found"

  Scenario: Check product reviews
    Given I search for a product with the keyword "camera"
    When I click on the first product in the search results
    Then I should see the reviews section
    And I should be able to read the reviews

  Scenario: Verify delivery options
    Given I search for a product with the keyword "laptop"
    When I click on the first product in the search results
    Then I should see delivery options available
    And I should be able to select a delivery method

  Scenario: Apply a promo code at checkout
    Given I am logged into my Amazon account
    And I have added a product to the cart
    When I proceed to checkout
    And I enter a valid promo code "DISCOUNT10"
    Then I should see the discount applied to my order total

  Scenario: Check for out-of-stock items
    Given I search for a product with the keyword "gadget"
    When I click on the first product in the search results
    Then I should see a message indicating that the product is out of stock

  Scenario: Save items for later
    Given I am logged into my Amazon account
    And I have added a product to the cart
    When I go to the cart page
    And I choose to save the item for later
    Then the item should be moved to the "Saved for later" section

  Scenario: Verify customer service contact options
    Given I am logged into my Amazon account
    When I navigate to the help and customer service page
    Then I should see multiple contact options including chat, email, and phone support

  Scenario: Check the return policy for a product
    Given I search for a product with the keyword "shoes"
    When I click on the first product in the search results
    Then I should see the return policy information on the product details page

#functional - > 27