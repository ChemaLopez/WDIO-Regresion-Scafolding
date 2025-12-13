const { expect } = require('chai');

describe('Página de ejemplo', () => {
  it('debe abrir webdriver.io y comprobar el título', async () => {
    await browser.url('https://webdriver.io');
    const title = await browser.getTitle();
    expect(title.toLowerCase()).to.include('webdriver');
  });
});
