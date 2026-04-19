-- Marketing Campaign Performance -- Data Analysis 
--ADVANCED LEVEL 

select * from marketing_campaigns

-- Reports & Data Analysis

--Query 14: Rank Channels Within Each Campaign Type (RANK + PARTITION BY)
--Business Question: For each campaign type, which channel ranks highest in ROI?

select campaign_type,
channel_used,
ROUND(AVG(ROI), 2)  AS Avg_ROI,
rank() over (partition by Campaign_Type order by AVG(ROI) DESC ) AS Rank_In_Type

from marketing_campaigns
group by campaign_type,channel_used
order by Campaign_Type, Rank_In_Type;

--Query 15: Company Market Share of Total Impressions (CTE)
--Business Question: What percentage of total ad impressions does each company control?

WITH company_impr AS (
select Company, 
sum(Impressions) as Company_Impressions 
from marketing_campaigns
group by Company 
),

grand_total AS (
    SELECT SUM(Impressions) AS Total_Impressions
    FROM   marketing_campaigns
)

SELECT c.Company,
       c.Company_Impressions,
       ROUND(c.Company_Impressions * 100.0 / g.Total_Impressions, 2) AS Market_Share_Pct
FROM   company_impr c, grand_total g
ORDER  BY Market_Share_Pct DESC;

--Query 16: Month-over-Month ROI Trend (LAG Window Function)
--Business Question: Is marketing ROI improving or declining month by month?

WITH monthly_roi AS (
select 
EXTRACT(MONTH FROM date) as month,
ROUND(AVG(ROI), 2) AS Avg_ROI
from marketing_campaigns
GROUP BY month
)
SELECT Month,
       Avg_ROI,
       LAG(Avg_ROI) OVER (ORDER BY Month)                        AS Prev_Month_ROI,
       ROUND(Avg_ROI - LAG(Avg_ROI) OVER (ORDER BY Month), 2)   AS MoM_Change
FROM   monthly_roi
ORDER  BY Month;

--Query 17: Pivot — Customer Segment ROI Across All Channels
--Business Question: Which channel works best for each customer segment — shown in a single pivot table?

SELECT Customer_Segment,
       ROUND(AVG(CASE WHEN Channel_Used = 'Google Ads' THEN ROI END), 2) AS Google_ROI,
       ROUND(AVG(CASE WHEN Channel_Used = 'YouTube'    THEN ROI END), 2) AS YouTube_ROI,
       ROUND(AVG(CASE WHEN Channel_Used = 'Facebook'   THEN ROI END), 2) AS Facebook_ROI,
       ROUND(AVG(CASE WHEN Channel_Used = 'Instagram'  THEN ROI END), 2) AS Instagram_ROI,
       ROUND(AVG(CASE WHEN Channel_Used = 'Email'      THEN ROI END), 2) AS Email_ROI,
       ROUND(AVG(CASE WHEN Channel_Used = 'Website'    THEN ROI END), 2) AS Website_ROI
FROM   marketing_campaigns
GROUP  BY Customer_Segment;

--Query 18: Pivot — target_audience ROI Across Customer Segment 
--Business Question:How does ROI vary across different customer segments for each target audience?

SELECT 
    target_audience,
ROUND(AVG(CASE WHEN Customer_Segment = 'Fashionistas' THEN ROI END), 2) AS Fashionistas_ROI,
ROUND(AVG(CASE WHEN Customer_Segment = 'Foodies' THEN ROI  END), 2) AS Foodies_ROI,
ROUND(AVG(CASE WHEN Customer_Segment LIKE '%Health%Wellness%' THEN ROI END), 2) AS Health_Wellness_ROI,   
ROUND(AVG(CASE WHEN Customer_Segment LIKE '%Outdoor%Adventurers%'THEN ROI  END), 2) AS Outdoor_Adventurers_ROI,
ROUND(AVG(CASE WHEN Customer_Segment LIKE '%Tech%Enthusiasts%' THEN ROI END), 2) AS Tech_Enthusiasts_ROI
FROM marketing_campaigns
GROUP BY target_audience;

--Query 19: Composite Campaign Score — Custom KPI (CTE + Multi-Metric Normalisation)
--Business Question: Which campaigns are truly the best when we combine ROI, conversion, engagement, and cost into one score?

WITH scored AS (
    SELECT Campaign_ID,
           Company,
           Campaign_Type,
           Channel_Used,
           -- Normalise each metric to a 0-10 scale
           ROUND((ROI / 8.0) * 10,                   2) AS ROI_Score,
           ROUND(Conversion_Rate / 0.15 * 10,        2) AS Conv_Score,
           Engagement_Score                               AS Eng_Score,
           ROUND((1 - Acquisition_Cost/20000.0) * 10, 2) AS Cost_Score
    FROM   marketing_campaigns
)
SELECT Campaign_ID,
       Company,
       Campaign_Type,
       Channel_Used,
       ROUND((ROI_Score + Conv_Score + Eng_Score + Cost_Score) / 4, 2) AS Composite_Score
FROM   scored
ORDER  BY Composite_Score DESC
LIMIT  20;

-- END of ADVANCED LEVEL 