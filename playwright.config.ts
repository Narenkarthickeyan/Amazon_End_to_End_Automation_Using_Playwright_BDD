import { PlaywrightTestConfig } from '@playwright/test';

const config: PlaywrightTestConfig = {
  reporter: [['html', { outputFolder: 'html-report' }]],
  workers: 1,
  use: {
    headless: false,  // This runs the tests in a visible browser. Set true if you want headless mode.
    video: 'on',
  },
  
};

export default config;
