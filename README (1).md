
# Marketing Campaign Performance SQL Project




![Logo](https://www.image2url.com/r2/default/images/1776634838358-62ebeab0-ef9d-4700-ab26-360bcdf116d9.png)


## Project Objectives
This project is designed to analyze marketing campaign data and generate actionable insights that align with real-world business decision-making. The objectives focus on evaluating performance, understanding customer behavior, and providing strategic recommendations.


## Objective 1 — Campaign Performance Analysis
• Identify which campaign types and channels deliver the highest ROI

• Determine which combinations of channel + campaign type perform best

•	Compare acquisition cost efficiency across all channels

## Objective 2 — Audience & Segmentation Analysis
•	Understand which target demographic converts best per campaign type

•	Identify high-value customer segments by engagement and ROI

•	Analyse gender and age group response rates across channels


## Objective 3 — Strategic Business Recommendations
•	Identify over-spending campaigns with low returns (budget waste)

•	Recommend optimal campaign duration for each type

•	Support budget allocation decisions using SQL-derived insights

## Business Questions 

## Query 1: Total campaigns by campaign type
Business Question: Which campaign type is used most frequently?
## Query 2: Average ROI by campaign type
Business Question: Which campaign type gives the best return?
## Query 3: Average conversion rate by channel
Business Question: Which platform drives the most conversions?
## Query 4: Total and average acquisition cost by company
Business Question: Which company is most cost-efficient in acquiring customers?
## Query 5: Engagement score distribution
Business Question: Are most campaigns highly engaging or mediocre?
## Query 6: Conversion Rate and Cost Efficiency by Channel
Business Question: Which advertising channel converts best and at the lowest cost?
## Query 7: Performance by Target Audience
Business Question: Which demographic segment converts best and generates highest ROI?
## Query 8: Company Competitive Benchmarking
Business Question: Which company runs the most cost-efficient and high-return campaigns?
## Query 9 ROI Performance Tier Classification (CASE)
Business Question: How do we categorise all campaigns into performance tiers for a management report?
## Query 10: Best Channel and Campaign Type Combination (HAVING)
Business Question: Which specific pairing of channel and campaign type consistently delivers the highest ROI?
## Query 11: Wasted Budget Detection — High Cost, Low Conversion (Subquery)
Business Question: Which campaigns are spending the most money while delivering the fewest conversions?
## Query 12: Full Conversion Funnel — Impressions to Conversions
Business Question: How does each campaign type perform across the full marketing funnel?
## Query 13: Optimal Campaign Duration Analysis
Business Question: Should we run campaigns for 15, 30, 45, or 60 days to maximise ROI?
## Query 14: Rank Channels Within Each Campaign Type (RANK + PARTITION BY)
Business Question: For each campaign type, which channel ranks highest in ROI?
## Query 15: Company Market Share of Total Impressions (CTE)
Business Question: What percentage of total ad impressions does each company control?
## Query 16: Month-over-Month ROI Trend (LAG Window Function)
Business Question: Is marketing ROI improving or declining month by month?
## Query 17: Pivot — Customer Segment ROI Across All Channels
Business Question: Which channel works best for each customer segment — shown in a single pivot table?
## Query 18: Pivot — target_audience ROI Across Customer Segment 
Business Question:How does ROI vary across different customer segments for each target audience?
## Query 19: Composite Campaign Score — Custom KPI (CTE + Multi-Metric Normalisation)
Business Question: Which campaigns are truly the best when we combine ROI, conversion, engagement, and cost into one score?


## Recommendations and Reasons

 ## 1. Eliminate Poor Performer Campaigns
33,268 campaigns (16.6%) fall under the "Poor Performer" category.
These campaigns generate very low returns and waste budget.
Pause or stop these campaigns immediately.
Reallocate at least 50% of their budget to high-performing campaigns.
This can potentially recover $150M+ in wasted spend.
## 2. Focus on Facebook + Search Channel Combination
This combination has the highest ROI (5.03) and conversion rate (8.03%).
It outperforms all other channel combinations.
Shift 5–8% of budget from weaker channels to this pairing.
This will improve performance with low risk and quick results.
## 3. Prioritize Influencer Campaigns
Influencer campaigns have the highest volume (40,170 campaigns) and strong ROI (5.0110).
Social Media campaigns show the lowest ROI (4.9918).
Shift 10–15% of budget from Social Media to Influencer campaigns.
This is a simple way to boost overall ROI without major changes.
## 4. Standardize Campaign Duration to 30 Days
30-day campaigns deliver the best ROI (5.0088).
15-day campaigns have the lowest ROI (4.9967).
Make 30 days the default campaign duration.
Applying this across ~50,000 campaigns creates consistent performance gains
## 5. Use Segment-Specific Channel Strategy
Different audience segments perform best on different channels:
o Fashionistas → Google Ads (ROI 5.03)
o Tech Enthusiasts → Facebook (ROI 5.05)
o Health & Wellness → Website (ROI 5.01)
Avoid a one-size-fits-all approach.
Route each segment to its best-performing channel.
This improves targeting efficiency and increases ROI.

## Recommendations and Reasons

 ## 1. Eliminate Poor Performer Campaigns
33,268 campaigns (16.6%) fall under the "Poor Performer" category.
These campaigns generate very low returns and waste budget.
Pause or stop these campaigns immediately.
Reallocate at least 50% of their budget to high-performing campaigns.
This can potentially recover $150M+ in wasted spend.
## 2. Focus on Facebook + Search Channel Combination
This combination has the highest ROI (5.03) and conversion rate (8.03%).
It outperforms all other channel combinations.
Shift 5–8% of budget from weaker channels to this pairing.
This will improve performance with low risk and quick results.
## 3. Prioritize Influencer Campaigns
Influencer campaigns have the highest volume (40,170 campaigns) and strong ROI (5.0110).
Social Media campaigns show the lowest ROI (4.9918).
Shift 10–15% of budget from Social Media to Influencer campaigns.
This is a simple way to boost overall ROI without major changes.
## 4. Standardize Campaign Duration to 30 Days
30-day campaigns deliver the best ROI (5.0088).
15-day campaigns have the lowest ROI (4.9967).
Make 30 days the default campaign duration.
Applying this across ~50,000 campaigns creates consistent performance gains
## 5. Use Segment-Specific Channel Strategy
Different audience segments perform best on different channels:
o Fashionistas → Google Ads (ROI 5.03)
o Tech Enthusiasts → Facebook (ROI 5.05)
o Health & Wellness → Website (ROI 5.01)
Avoid a one-size-fits-all approach.
Route each segment to its best-performing channel.
This improves targeting efficiency and increases ROI.
