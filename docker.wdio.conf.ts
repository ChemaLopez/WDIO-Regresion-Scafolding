import { config as baseConfig } from "./wdio.conf.ts";

export const config: WebdriverIO.Config = {
    ...baseConfig,
    maxInstances: 1,
    capabilities: [{
        browserName: 'chrome',
        'goog:chromeOptions': {
            binary: '/usr/bin/chromium',
            args: [
                '--headless',
                '--no-sandbox',
                '--disable-dev-shm-usage',
                '--disable-gpu',
                '--disable-setuid-sandbox',
                '--disable-extensions',
            ],
        }
    }],
};
