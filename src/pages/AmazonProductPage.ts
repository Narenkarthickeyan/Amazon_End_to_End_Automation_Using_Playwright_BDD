import { Locator, Page } from 'playwright';

export class AmazonProductPage {
    private page: Page;
    private readonly selectlaptop: Locator;
    //private addToCartButton: string;

    constructor(page: Page) {
        this.page = page;
        this.selectlaptop = this.page.locator('#a-autoid-8-announce');
       // this.addToCartButton = '#add-to-cart-button';
    }

    async selectLaptop() {
        //await this.page.waitForTimeout(1000);
        await this.selectlaptop.click();
    }
}
