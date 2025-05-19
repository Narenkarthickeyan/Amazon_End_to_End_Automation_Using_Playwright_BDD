import { Locator, Page } from 'playwright';

export class AmazonCartPage {
    private page: Page;
   // private cartCount: string;
    private readonly cardSectionLink: Locator;
    private readonly Qty:Locator;
    private readonly count :Locator;


    constructor(page: Page) {
        this.page = page;
       // this.cartCount = '#nav-cart-count';
       this.cardSectionLink = this.page.getByRole('link', { name: 'Go to Cart' });
       this.Qty = this.page.getByText('Qty:1');
       this.count = this.page.getByLabel('1', { exact: true });
       
    }

    async gotocardpage() {
        await this.cardSectionLink.click();
        await this.Qty.click();
        await this.count.click();
        await this.page.getByLabel('Proceed to checkout Check out').click();
    }

}
