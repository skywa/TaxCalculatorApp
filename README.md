# Tax Calculator Application

This application takes 
* Income [$0 to $10,000,000, $40,000 default],
* Pre-tax deductions (insurance premiums, some retirement contributions) [$0 to $50,000, $3,000 default],
* Exemptions (generally the number of people in the household) [2 (default) to 15], and
* Deductions (either itemized or standard) [$12,600 (standard, defalut) to $100,000]

for **married individuals filing jointly** and calculates the United States federal tax owed for 2015.

server.R contains the functions to make the calculations. The tax brackets and tax rates may be changed for future years.
ui.R contains the code that creates the interface.

Other pre-tax deductions may be possible. Itemized deductions need to be figured out from what is allowed. Other credits have not been included in this application.

