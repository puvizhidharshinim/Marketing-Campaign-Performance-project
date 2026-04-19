-- Marketing Campaign Performance -- Data Analysis 
-- BEGINNER LEVEL 

select * from marketing_campaigns

-- Reports & Data Analysis

--Query 1: Total campaigns by campaign type
--Business Question: Which campaign type is used most frequently?

select campaign_type, count (campaign_id) as total_campaigns 
from marketing_campaigns
group by campaign_type
ORDER BY Total_Campaigns DESC;

--Query 2: Average ROI by campaign type
--Business Question: Which campaign type gives the best return?

select campaign_type, round(avg(roi),4) as  Average_ROI
from marketing_campaigns
group by campaign_type
ORDER BY Average_ROI DESC;

-- Query 3: Average conversion rate by channel
--Business Question: Which platform drives the most conversions?

select channel_used, round(avg(conversion_rate)* 100,4) as  Average_conversionrate
from marketing_campaigns
group by channel_used
ORDER BY Average_conversionrate DESC;

-- Query 4: Total and average acquisition cost by company
--Business Question: Which company is most cost-efficient in acquiring customers?

SELECT Company,
       COUNT(*) AS Campaigns,
       ROUND(AVG(Acquisition_Cost), 0) AS Avg_Cost,
      ROUND( SUM(Acquisition_Cost) ,0)AS Total_Spend
FROM marketing_campaigns
GROUP BY Company
ORDER BY Avg_Cost ASC;

--Query 5: Engagement score distribution
--Business Question: Are most campaigns highly engaging or mediocre?

SELECT Engagement_Score,
       COUNT(*) AS Campaign_Count,
       ROUND(AVG(Conversion_Rate)*100, 2) AS Avg_Conv_Pct
FROM marketing_campaigns
GROUP BY Engagement_Score
ORDER BY Engagement_Score DESC;

--Query 6: Conversion Rate and Cost Efficiency by Channel
--Business Question: Which advertising channel converts best and at the lowest cost?

SELECT Channel_Used,
       COUNT(*)                                   AS Campaigns,
       ROUND(AVG(Conversion_Rate) * 100, 2)      AS Avg_Conv_Pct,
       ROUND(AVG(Acquisition_Cost), 0)           AS Avg_Cost
FROM   marketing_campaigns
GROUP  BY Channel_Used
ORDER  BY Avg_Conv_Pct DESC;

--Query 7: Performance by Target Audience
--Business Question: Which demographic segment converts best and generates highest ROI?

SELECT Target_Audience,
       COUNT(*)                              AS Campaigns,
       ROUND(AVG(Conversion_Rate)*100, 2)   AS Avg_Conv_Pct,
       ROUND(AVG(ROI), 2)                   AS Avg_ROI,
       ROUND(AVG(Acquisition_Cost), 0)      AS Avg_Cost
FROM   marketing_campaigns
GROUP  BY Target_Audience
ORDER  BY Avg_ROI DESC;

--Query 8: Company Competitive Benchmarking
--Business Question: Which company runs the most cost-efficient and high-return campaigns?

SELECT Company,
       COUNT(*)                              AS Total_Campaigns,
       ROUND(AVG(ROI), 2)                   AS Avg_ROI,
       ROUND(AVG(Conversion_Rate)*100, 2)   AS Avg_Conv_Pct,
       ROUND(AVG(Acquisition_Cost), 0)      AS Avg_Cost
FROM   marketing_campaigns
GROUP  BY Company
ORDER  BY Avg_ROI DESC;

 -- END of BEGINNER LEVEL 