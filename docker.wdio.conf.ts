import { config as baseConfig } from "./wdio.conf.ts";

export const config: WebdriverIO.Config = {
    ...baseConfig,
    maxInstances: 1,
    capabilities: [{
        browserName: 'chrome',
        'goog:chromeOptions': {
            args: [
                '--no-sandbox',
                '--disable-infobars',
                '--headless',
                '--disable-gpu',
                '--window-size=1440,735'
            ],
        }
    }],
}
