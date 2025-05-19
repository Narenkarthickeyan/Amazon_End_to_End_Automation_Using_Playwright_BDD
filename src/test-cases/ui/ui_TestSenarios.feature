Feature: Verify Amazon UI Elements

  # Scenario 1: Verify Amazon logo
  Scenario: Click and Verify Amazon logo
    Given I am on the Amazon home page
    When I reach the dashboard and wait until the page loads
    Then I click the Amazon logo on the top-right side
    And I verify the logo is displayed properly

  # Scenario 2: Verify the Dashboard header and footer
  Scenario: Verifying the Amazon dashboard header and footer
    Given I am on the Amazon home page
    When I check the header and footer
    Then I verify the alignment and content of the header navbar
    And I verify the alignment and content of the footer

  # Scenario 3: Verify search dropdown
  Scenario: Verify search dropdown in product category
    Given I am on the Amazon home page
    When I click the dropdown icon on the search box
    Then I scroll down
    And I verify the dropdown options are displayed properly

  # Scenario 4: Verify Amazon dashboard navbar options
  Scenario Outline: Verify navbar options in dashboard
    Given I am on the Amazon home page
    When I navigate to the "<options>" section in the navbar
    Then I am redirected to the expected page
    And I verify the page details
    Examples:
      | Options              |
      | Today's Deals        |
      | Coupons              |
      | Renewed Deals        |
      | Outlet               |
      | Amazon Resale        |
      | Grocery Deals        |

  # Scenario 5: Verify Amazon footer options
  Scenario Outline: Verify footer options in dashboard
    Given I am on the Amazon home page
    When I scroll to the footer section
    Then I click on the "<sections>" and "<options>"
    And I am redirected to the expected page
    And I verify the page details
    Examples:
      | Sections          | Options         |
      | Get to Know Us    | About Amazon    |
      | Get to Know Us    | Careers         |
      | Get to Know Us    | Blog            |
      | Get to Know Us    | Amazon Science  |

  # Scenario 6: Verify the Sign-in page from home page
  Scenario: Verify the Sign-in page
    Given I am on the Amazon home page
    When I click the Sign-in link in the header
    Then I am redirected to the Sign-in page
    And I verify the Sign-in page details

  # Scenario 7: Verify the Sign-in page
  Scenario: Verify the Sign-in page details
    Given I am on the Amazon Sign-in page
    Then I verify the Sign-in page content

  # Scenario 8: Verify the cart page details
  Scenario: Verify the cart page
    Given I am on the Amazon home page
    When I click the cart icon
    Then I am redirected to the cart page
    And I verify the cart page details

  # Scenario 9: Verify the 'Back to top' button in footer
  Scenario: Verify 'Back to top' functionality
    Given I am on the Amazon home page
    When I scroll down to the bottom of the page
    Then I click the "Back to top" button
    And I am scrolled to the top of the page

  # Scenario 10: Verify scroll options on the home page
  Scenario Outline: Verify left and right scroll buttons in sections
    Given I am on the Amazon home page
    When I scroll to the "<sections>"
    Then I click the left and right scroll buttons
    And I verify the remaining items are displayed
    Examples:
      | Sections                             |
      | Best Sellers in Sports & Outdoors    |
      | Best Sellers in Beauty & Personal Care |
      | Best Sellers in Books                |

  # Scenario 11: Searching for a product
  Scenario: Searching for a laptop on the Amazon home page
    Given I am on the Amazon home page
    When I search for "Laptop"
    Then I should see search results for "Laptop"

  # Scenario 12: Viewing a product’s details
  Scenario: Viewing the details of a product from search results
    Given I have searched for "Laptop" on the Amazon home page
    When I click on the first product in the search results
    Then I should be on the product details page
    And I should see the product title containing "Laptop"
    And the price should be displayed

  # Scenario 13: Adding a product to the cart
  Scenario: Adding a laptop to the cart
    Given I have searched for "Laptop" on the Amazon home page
    And I am on the product details page of a selected laptop
    When I click "Add to Cart"
    Then the product should be added to the cart
    And I should see a confirmation message that the product has been added to the cart

  # Scenario 14: Navigating to the cart after adding a product
  Scenario: Navigating to the cart
    Given I have added a product to the cart
    When I click the cart icon
    Then I should be taken to the cart page
    And I should see the product in the cart

  # Scenario 15: Checking the product availability
  Scenario: Checking the availability of a laptop
    Given I have searched for "Laptop" on the Amazon home page
    When I view the details of a product
    Then I should see the product's availability status
    And it should either show "In Stock" or an estimated delivery date

#UI - > 25 test senarios