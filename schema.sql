--Marketing Campaign Performance SCHEMAS

DROP TABLE IF EXISTS marketing_campaigns;

-- Import Marketing Campaign Performance dataset

CREATE TABLE marketing_campaigns (
    Campaign_ID INT PRIMARY KEY,
    Company VARCHAR(100),
    Campaign_Type VARCHAR(50),
    Target_Audience VARCHAR(50),
    Duration INT,
    Channel_Used VARCHAR(50),
    Conversion_Rate DECIMAL(6,4),
    Acquisition_Cost DECIMAL(10,2),
    ROI DECIMAL(10,2),
    Location VARCHAR(50),
    Date DATE,
    Clicks INT,
    Impressions INT,
    Engagement_Score INT,
    Customer_Segment VARCHAR(50)
);
 
 -- END of SCHEMAS