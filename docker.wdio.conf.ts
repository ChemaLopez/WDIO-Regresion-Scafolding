import { config as baseConfig } from "./wdio.conf.ts";

export const config: WebdriverIO.Config = {
    ...baseConfig,
    maxInstances: 1,
    port: 4444,
    capabilities: [{
        browserName: 'chrome',
        'goog:chromeOptions': {
            args: [
                '--headless',
                '--no-sandbox',
                '--disable-dev-shm-usage',
                '--disable-gpu',
                '--disable-software-rasterizer',
                '--remote-debugging-port=9222',
            ],
            binary: process.env.CHROME_BIN || '/usr/bin/chromium'
        }
    }],
}
