# IDO Launchpad

![GitHub last commit](https://img.shields.io/github/last-commit/thecaptainfalcon/ido-launchpad)
![Investor Dashboard](/images/p2_investor_dashboard.png "Investor Dashboard - IDO Launchpad")
[Interactive Tableau Dashboard](https://public.tableau.com/app/profile/joseph708/viz/DraftP2/InvestorDashboard) 

## What is this project

This is a project aimed towards analyzing the many characteristics that make up IDOs within launchpads to determine whether or not they are profitable due to their highly speculative nature. 

Characteristics revolve on how a project is considered to be successful, their current TGE ROI, their ATH ROI, funds raised per IDO, total funds raised, their marketcap, trading volume, etc.


## Domain Key terms & definitions:

- **IDO:** Initial Decentralized Offering.
- **Launchpads:** Centralized platforms for fundraising token-based projects typically in the form of vested tokens at discounted rates. Launchpads can come in the form of two different setups of a lottery system or guaranteed allocation by utilizing their own tokens as requirements for pre-determined tiers granting increased chances or allocation opportunities.
- **TGE:** Token Generation Event, or when the tokens of a project became public/listed; available for trade.
- **Mcap:** Market cap
- **ATH:** All time high, typically referred to their price/volume/mcap at their peak.

## Tech Stack:

Data analyis:
- Tableau
- Excel
- MySQL (as an afterthought)

## What is the extent of this project?

This project is only aimed at the data associated with the IDOs within the launchpad. While there may be some analysis grouped by blockchains and project categories, there is no deep dive calculations on launchpad participation mechanisms.

To explain further, launchpads are businesses themselves and in order to maintain a level of value and liquidity for their tokens, they are one of the sole requirements to participate in the launchpads. 

Each launchpad has their own distinct set of requirements (ie. # of tokens needed) and tier systems, which are all different because of the minimum token amounts set by the launchpad and fluctuating valuations of each token.

If one were to calculate the profitability metric based also on launchpad token requirements with volatile pricing, it would require a 1min/5min chart of the token prices to gauge a ranged buy-in and sell-off based on time horizons of the user/investor.

Even then, to further support the data revolving around the initial token buy-in in combination with a launchpad's lottery system that would require extensive research in the blockchain as participation data is sometimes not readily available on all launchpads.

## Who is the end user and what do they care about the most?

**Investors.**

Every type has their own investing methodologies, but at their core, they care about how to make more money while reducing uncertainties and minimizing risks.

Therefore, dashboard KPIs come in the form of success rates, ROIs, funding amounts.

## How are the chosen KPIs determined and why are they important? 

(Success rates, TGE ROI, funding amounts)

Success rates are determined by whether or not a project is still active and maintains a TGE ROI of at least a 2x multiple of the principal amount.

This bare minimum amount is to account for swap fees, slippage, and gas fees in mind, because investing capital just to get back the same amount is already at a loss due to inflation.

The TGE ROI is to see whether or not they are still holding some level of value after the initial hype period of the project. Granted, while it's expected to fall under bear market conditions, holding a value above its initial launch price is a sign to consider.

Funding amounts are in relation to the IDO fundraising for that project. Projects can have multiple IDOs in the same launchpad or spread across different launchpads. 

These are important figures to look at to gauge public interest levels and helps to determine the success of a project. 

Projects are only ideas on paper, and need funds to pay for development and business expenses, but if there is little funding and lack of interest, the growth period becomes exponentially difficult even after a definitive proof of concept is shown. 

## Where did the data come from?

Manual extraction from:
https://cryptorank.io

## Challenges faced during the project?

Initially attempted to connect multi-measure icons as an interactable filter mechanism into the dashboard. 

Normally this is feasible when utilizing a set with multi-dimensions, but this is not possible with measures.

In addition, pivotting would not have been feasible due to the numerous amount of dimensions. (there would have been too many icons crowding the chart sectional)

Eventually had to use normal filtering tabs to tackle this issue.

Another issue was how overlays work for instructionals, they had to be removed as a feature because the text boxes need to be placed in a layer where they dont block interactable filters from charts.

The instructions would require too much text and given the amount of bars taking up the dashboard, it would be difficult to squeeze them together in a way that doesn't look awkward.

## How do you use the dashboard?
Reference the KPIs at the top of the dashboard as a simple answer to whether you should invest into IDOs.

If the answer is satisfactory to you, continue from a left to right, top to bottom pattern from the highest overview level to the lowest. Essentially, think of the tier system of the dashboard based on this: 

launchpad > blockchain > project categories > projects.
(There is a subcategory but its not utilized for this dashboard)

You can filter by the success rate (read how this is deteremined above) by launchpads.
Then, you can explore using the multi-dimension and multi-measure filtering tabs to explore data that interests you. 

You can also click on the bars or table cells to drilldown on a specific dimension filter.

You can view the historical performances of projects by category to understand potential in current or upcoming projects ROIs.

Lastly, by utilizing every filter, you can take a look at the specific projects that meet your criteria. In this manner, you can explore these projects in your own way to see if other projects are similar and if they are worth looking into.

## What other data would help to make this existing dataset more effective in drawing conclusions?

Number of participants of each project's IDO.

This would help to reinforce evidence in the interest levels of a project and to see the average investment amount by person. This can be amplified by the blockchain type and project category to give another endpoint for a chart.

Timestamps on token prices of the IDO projects and the launchpad-related tokens. 

This would give a true analysis on the ATH to TGE ROI as well as the set minimum requirements needed to participate in a launchpad.

This could also give an understanding on the expenses side when executing a token buy-in and sell-out period to gauge a true profit ROI.

The % chance data based on the launchpad lottery system.

Given each tier system predetermined by a launchpad, as well as the number of participants actively engaging a project, we could see the likely chances of receiving an allocation and to see what percentage people are investing into or not, even if they were to receive an allocation.

## What actions do you recommend for end users based on the data?

From my own perspective, based on the risk-off environment and ongoing market conditions of hiking federal interest rates, CPI, and uncertainty in the coming months, I wouldn't recommend participating in IDOs at the moment.

## EER Diagram

![MySQL EER Diagram](/images/p2_eer_diagram.jpg "EER Diagram")

## SQL Stored Procedures
Samples queries:

insert proc
insert call
ROI by launchpad

insert proc
insert call
Success by launchpad

insert prov
insert call
Top performing projects

### Author notes:

- R-Click to import data on SQL without the usual interface of export/import popping up with tables containing a primary key.
- When forward engineering from an EER diagram to the queries, check the "Skip creation of foreign keys", this is essential for troubleshooting import errors using the wizard.
- The foreign key can be added after the fact. This is a small workaround solely for the purposes of the small projects (can't speak for projects beyond that).
- When using Excel to house manual extraction data and making edits, (ie. exporting to csv or moving tables around) be sure to select all the empty cells around the data and press delete.
- SQL will sometimes import the data cells as "unknown column" using the import wizard, and this can help to clean unnecessary data. (not required, but helpful)