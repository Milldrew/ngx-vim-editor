
import {test, expect} from '@playwright/test';

test('check responsiveness and check if the svg is drawn', async ({page}, testInfo) => {
  await page.goto('http://localhost:3000/');
  const screenshot = await page.screenshot();
  //default window
  await testInfo.attach('screenshot', {
    body: screenshot,
    contentType: 'image/png',
  });

  //mobile window
  await page.setViewportSize({width: 375, height: 667});
  await page.goto('http://localhost:3000/');
  const mobileScreenshot = await page.screenshot();
  await testInfo.attach('mobileScreenshot', {
    body: mobileScreenshot,
    contentType: 'image/png',
  });

  // check div with id pie-chart has svg element inside of it
  const pieChart = await page.$('#pie-chart');
  expect(pieChart).not.toBeNull();
  const pieChartSVG = await pieChart?.$('svg');
  expect(pieChartSVG).not.toBeNull();

});

