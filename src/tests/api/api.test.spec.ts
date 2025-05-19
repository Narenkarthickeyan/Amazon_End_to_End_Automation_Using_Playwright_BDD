import { test, expect } from '@playwright/test';

test.describe('Amazon Web Testing', () => {


  test('Search for a product', async ({ page }) => {
    await page.goto('https://www.amazon.com');

    // Search for a product
    await page.fill('#twotabsearchtextbox', 'laptop');
    await page.click('input[type="submit"]');

    // Verify search results
    await expect(page).toHaveURL(/.*k=laptop/);
    const results = await page.locator('.s-main-slot .s-result-item');
    expect(await results.count()).toBeGreaterThan(0);
  }),

  test('Check product details', async ({ page }) => {
    await page.goto('https://www.amazon.com');

    await page.fill('#twotabsearchtextbox', 'laptop');
    await page.click('input[type="submit"]');
    await page.click('.s-main-slot .s-result-item:first-child a');

    // Verify product details
    await expect(page).toHaveURL(/.*dp/);
    await expect(page.locator('#productTitle')).toBeVisible();
  });
});
