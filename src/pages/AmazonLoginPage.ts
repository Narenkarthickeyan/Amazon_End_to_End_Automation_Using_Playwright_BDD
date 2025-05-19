import { Locator, Page } from 'playwright';
import { expect } from 'playwright/test';

export class AmazonLoginPage {
    private page: Page;
    private readonly EnteremailorSigintextbox:Locator;
    private readonly continueButton:Locator;
    private readonly passwordtextbox:Locator;
    private readonly signinButton:Locator;
    private readonly Incorrecttext:Locator;
    private readonly Errormsg:Locator;

  

    constructor(page: Page) {
        this.page = page;
        this.EnteremailorSigintextbox = this.page.getByLabel('Email or mobile phone number');
        this.continueButton = this.page.getByLabel('Continue');
        this.passwordtextbox = this.page.getByLabel('Password');
        this.signinButton = this.page.getByLabel('Sign in', { exact: true }); 
        this.Incorrecttext = this.page.getByRole('heading', { name: 'Incorrect phone number' });
        this.Errormsg = this.page.getByText('We cannot find an account');   
    }

    async validLogin({emilorphone,Password}:{emilorphone:string,Password:string}) {
        await this.EnteremailorSigintextbox.fill(emilorphone);
        await this.continueButton.click();
        await this.passwordtextbox.fill(Password);
        await this.signinButton.click();
        await this.page.getByRole('link', { name: 'Hello, Naresh Account & Lists' }).click();
    }
    async invalidLogin({emilorphone}:{emilorphone:string}) {
        await this.EnteremailorSigintextbox.fill(emilorphone);
        await this.continueButton.click();
        await expect(this.Incorrecttext).toBeVisible();
        await expect(this.Errormsg).toBeVisible();
    }

}
