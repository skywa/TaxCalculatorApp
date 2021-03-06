---
title       : US Federal Tax Calculator (simple)
subtitle    : Married Filing Jointly
author      : skywa
job         : Developing Data Products Project
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : zenburn      # tomorrow
url:
#  lib: ../../libraries
  lib: ../../librariesNew
  assets: ../../assets
widgets     : [mathjax, quiz, bootstrap]
mode        : selfcontained # {standalone, draft}
---

## Why would you even want to use this app?

- You have no idea how much taxes you are going to owe

- You want to know how much federal tax to withhold during the year from you paycheck

- You want to get a better idea of how putting more money into a traditional 401k or IRA will decrease your taxes

- You want to know how having a kid (another exemption!) will save you money in taxes

- You are a big nerd like me and like reading through the tax code to find more deductions and credits

> There are two things you can count on in life: death and taxes!

---

## What does this app even do?

- The app has been deployed to shinyapps.io [here](https://skywa.shinyapps.io/TaxCalculator/)

- The server.R and ui.R files are found on GitHub [here](https://github.com/skywa/TaxCalculatorApp)

- **It takes your income (between 0 and 10,000,000), pre-tax deductions (0 to 50,000), exemptions (2 to 15), and deductions (12,600 to 100,000) to figure out how much tax you will owe**

- Keep in mind that this is a simple calculator and there are more credits and ways to reduce your tax burden

- This presentation is on [GitHub](https://github.com/skywa/TaxCalculatorApp)

---

## How is the federal tax amount calculated?

- The pre-tax deductions are subtracted from the income to get the Adjusted Gross Income (AGI)

- The exemptions are worth $4,000 each (for 2015). The total exemption amount and deductions are subtracted from the AGI to get the federal taxable income

- U.S. tax is progressive, so there are tax brackets with different tax rates. The amount is calculated based on the federal taxable income

|  **If Taxable Income Is Between:**  |  **The   Tax Due Is:**               |
|-------------------------------------|--------------------------------------|
|  0   - 18,450                      |  10% of taxable income               |
|  18,451 - 74,900                  |  1,845 + 15% over 18,451           |
|  74,901 - 151-200                 |  10,312.50 + 25% over 74,901       |
|  151,201 - 230,450                |  29,387.50 + 28% over 151,201      |
|  230,451 - 411,500                |  51,577.50 + 33% over 230,451      |
|  411,501 - 464,850                |  111,324 + 35% over 411,501        |
|  464,850+                          |  129,996.50 + 39.6% over 464,850+  |

---

## Have fun!

Here's an example. Say you make 100,000 and pay 4,000 for insurance premiums and put away 5,000 in a 401k for retirement. You have a wife and 3 kids, so there are 5 exemptions. You own a home and give money to charity, so you have itemized deductions of 30,000

```r
100000 - (4000 + 5000) #AGI
```

```
## [1] 91000
```

```r
100000 - (4000 + 5000) - 5*4000 - 30000 #Federal Taxable Income
```

```
## [1] 41000
```
Federal Tax

```
## [1] 5227.5
```


