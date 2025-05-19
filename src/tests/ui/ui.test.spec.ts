import { test, expect, chromium } from '@playwright/test';
import { AmazonHomePage } from '../../pages/AmazonHomePage';

test.describe('Amazon UI Tests in Chrome', () => {
    let page: any;
    let homePage: AmazonHomePage;
    test.beforeAll(async () => {
        const browser = await chromium.launch({ headless: false });
        page = await browser.newPage();
        homePage = new AmazonHomePage(page);
    });
    test.afterAll(async () => {
        await page.close();
    });

    test('Search for a product', async () => {
        await homePage.navigate();
        await homePage.searchForProduct('Laptop');
        await expect(page.getByText('"laptop"')).toBeVisible();
        await homePage.searchForProduct('headphones');
        //await expect(page.getByText('"headphones"')).toBeVisible();

    });
    test('Amazon DashBoard Verification', async () => {
        await homePage.navigate();
        await homePage.DashBoardVerification();

    });

    test('Go to cart', async () => {
        await homePage.goToCart();
        expect(await page.url()).toContain('/cart');
    });

});
