import { Locator, Page } from 'playwright';
import { expect } from 'playwright/test';

export class AmazonHomePage {
    private page: Page;
    private readonly searchproduct: Locator;
    private readonly searchsubmit: Locator;
    private readonly cardpageContent: Locator;
    //amazon home page
    private readonly headerSlider: Locator;
    private readonly homepageSignin: Locator;
    private readonly selectlaptop: Locator;



    constructor(page: Page) {
        this.page = page;
        this.searchproduct = this.page.getByPlaceholder('Search Amazon');
        this.searchsubmit = this.page.getByRole('button', { name: 'Go', exact: true });
        this.cardpageContent = this.page.getByRole('heading', { name: 'Your Amazon Cart is empty' });
        //amazon home page
        this.headerSlider = this.page.getByRole('link', { name: 'Next slide' });
        this.homepageSignin = this.page.getByRole('link', { name: 'Hello, sign in Account & Lists' });
        this.selectlaptop = this.page.locator('#a-autoid-8-announce');
    }

    async navigate() {
        await this.page.goto('https://www.amazon.com');
    }
    async sigin() {
        await this.homepageSignin.click();
    }
   
    async getFirstProductTitle() {
        return await this.page.innerText('.s-title');
    }
    async searchForProduct(product: string) {
        await this.searchproduct.click();
        await this.searchproduct.fill(product);
        await this.searchsubmit.isEnabled();
        await this.searchsubmit.click();
    }
    async goToCart() {
        await this.page.click('#nav-cart');
        await this.cardpageContent.isVisible();

    }
    async DashBoardVerification() {
        const clickCount = 4; // Number of times each click should occur

        for (let i = 0; i < clickCount; i++) {
            await this.headerSlider.click();
        }
        await this.page.getByText('Top picks for India').isVisible();
        await this.page.getByText('Best Sellers in Kitchen &').isVisible();
        await this.page.getByText('Most wished for in Video Games').isVisible();
        await this.page.getByText('Best Sellers in Sports &').isVisible();
        // await expect(this.page.getByText('Best Sellers in Clothing,')).isVisible();
        await expect(this.page.getByText('Best Sellers in Clothing,')).toBeVisible();
        await this.page.getByText('Best Sellers in Home & Kitchen').isVisible();
        await this.page.getByText('Best Sellers in Beauty &').isVisible();
    }
}