import { test, expect } from '@playwright/test';

test('Amazon homepage load time should be under 9 seconds', async ({ page }) => {
  const startTime = Date.now();
  // Navigate to Amazon homepage
  await page.goto('https://www.amazon.com');

  const endTime = Date.now();
  const loadTime = endTime - startTime;

  console.log(`Page load time: ${loadTime} ms`);

  // Threshold of 9 seconds (9000 ms)
  const acceptableLoadTime = 9000;

  // Assert that the load time is under 9 seconds
  expect(loadTime).toBeLessThanOrEqual(acceptableLoadTime);

  if (loadTime > acceptableLoadTime) {
    console.warn(`Warning: Page load time exceeded ${acceptableLoadTime} ms`);
  } else {
    console.log(`Success: Page loaded in ${loadTime} ms, under the threshold of ${acceptableLoadTime} ms`);
  }
});
