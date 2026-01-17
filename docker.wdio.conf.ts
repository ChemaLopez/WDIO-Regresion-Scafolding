import { config as baseConfig } from "./wdio.conf.ts";

export const config: WebdriverIO.Config = {
    ...baseConfig,

    capabilities: [{
        maxInstances: 1,
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
