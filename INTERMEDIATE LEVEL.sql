-- Marketing Campaign Performance -- Data Analysis 
--INTERMEDIATE LEVEL 

select * from marketing_campaigns

-- Reports & Data Analysis

--Query 9: ROI Performance Tier Classification (CASE)
--Business Question: How do we categorise all campaigns into performance tiers for a management report?

SELECT 
       Campaign_ID,
       Company,
       Campaign_Type,
       Channel_Used,
       ROI,
       CASE
         WHEN ROI >= 7  THEN 'High Performer'
         WHEN ROI >= 5  THEN 'Average Performer'
         WHEN ROI >= 3  THEN 'Below Average'
         ELSE               'Poor Performer'
       END AS ROI_Tier
FROM   marketing_campaigns
ORDER  BY ROI DESC;
-- Summarise how many campaigns fall into each tier
SELECT ROI_Tier, COUNT(*) AS Campaign_Count
FROM (
  SELECT CASE
           WHEN ROI >= 7 THEN 'High Performer'
           WHEN ROI >= 5 THEN 'Average Performer'
           WHEN ROI >= 3 THEN 'Below Average'
           ELSE              'Poor Performer'
         END AS ROI_Tier
  FROM marketing_campaigns
) t
GROUP BY ROI_Tier;

--Query 10: Best Channel and Campaign Type Combination (HAVING)
--Business Question: Which specific pairing of channel and campaign type consistently delivers the highest ROI?

SELECT Channel_Used,Campaign_Type,
       COUNT(*) AS Campaigns,
       ROUND(AVG(ROI), 2) AS Avg_ROI,
       ROUND(AVG(Conversion_Rate)*100, 2) AS Avg_Conv_Pct
FROM   marketing_campaigns
GROUP  BY Channel_Used, Campaign_Type
HAVING COUNT(*) >= 10
ORDER  BY Avg_ROI DESC
LIMIT  10;

--Query 11: Wasted Budget Detection — High Cost, Low Conversion (Subquery)
--usiness Question: Which campaigns are spending the most money while delivering the fewest conversions?

SELECT Campaign_ID,Company,Campaign_Type,Channel_Used,Acquisition_Cost,Conversion_Rate
FROM   marketing_campaigns
WHERE  Acquisition_Cost > (SELECT AVG(Acquisition_Cost) FROM marketing_campaigns)
  AND  Conversion_Rate  < (SELECT AVG(Conversion_Rate)  FROM marketing_campaigns)
ORDER  BY Acquisition_Cost DESC
LIMIT  20;

--Query 12: Full Conversion Funnel — Impressions to Conversions
--Business Question: How does each campaign type perform across the full marketing funnel?

SELECT 
    Campaign_Type,
    SUM(Impressions) AS Total_Impressions,
    SUM(Clicks) AS Total_Clicks,
	ROUND(SUM(Clicks) * 100.0 / SUM(Impressions), 2) AS CTR,
	ROUND(AVG(Conversion_Rate)*100, 2)               AS Avg_Conv_Pct,
    ROUND(SUM(Clicks) * AVG(Conversion_Rate), 0)     AS Est_Conversions
	FROM marketing_campaigns
	GROUP  BY Campaign_Type
    ORDER BY Est_Conversions DESC;

--Query 13: Optimal Campaign Duration Analysis
--Business Question: Should we run campaigns for 15, 30, 45, or 60 days to maximise ROI?

SELECT Duration                              as days ,
       COUNT(*)                              AS Campaigns,
       ROUND(AVG(ROI), 4)                   AS Avg_ROI,
       ROUND(AVG(Conversion_Rate)*100, 2)   AS Avg_Conv_Pct,
       ROUND(AVG(Acquisition_Cost), 0)      AS Avg_Cost
FROM   marketing_campaigns
GROUP  BY Duration
ORDER  BY Avg_ROI DESC;

-- END of INTERMEDIATE LEVEL  