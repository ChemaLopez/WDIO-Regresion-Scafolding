exports.config = {
    runner: 'local',
    specs: [
        './test/specs/**/*.js'
    ],
    maxInstances: 1,
    capabilities: [{
        browserName: 'chrome',
        'goog:chromeOptions': {
            args: ['--headless=new', '--no-sandbox', '--disable-dev-shm-usage']
        }
    }],
    logLevel: 'info',
    framework: 'mocha',
    reporters: ['spec'],
    services: ['devtools'],
    mochaOpts: {
        ui: 'bdd',
        timeout: 60000
    }
};
