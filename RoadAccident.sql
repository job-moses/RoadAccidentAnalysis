/* ROAD ACCIDENT ANALYSIS IN SQL */


SELECT TOP 100  [Index]
      ,[Accident_Severity]
      ,[Accident_Date]
      ,[Latitude]
      ,[Light_Conditions]
      ,[District_Area]
      ,[Longitude]
      ,[Number_of_Casualties]
      ,[Number_of_Vehicles]
      ,[Road_Surface_Conditions]
      ,[Road_Type]
      ,[Urban_or_Rural_Area]
      ,[Weather_Conditions]
      ,[Vehicle_Type]
  FROM [RoadAccidentDB].[dbo].[accident data];
-------------------------------------------------------------------------------------------
  /* 1. Year of Accident Record*/

SELECT DISTINCT(YEAR([Accident_Date])) as Accident_Year
FROM  [RoadAccidentDB].[dbo].[accident data]
ORDER BY 1;
/* Accident  Year Span between 2019 -2022*/
-------------------------------------------------------------------------------------------
/* Current Year Casualties */
SELECT SUM([Number_of_Casualties]) Current_Year_Casualties
FROM  [RoadAccidentDB].[dbo].[accident data]
WHERE YEAR([Accident_Date]) = 2022;
/* Current_Year_Casualties
      195737                   */
---------------------------------------------------------------------------------------------
/* Current Year Accident */

SELECT COUNT([Index]) Current_Year_Accident
FROM  [RoadAccidentDB].[dbo].[accident data]
WHERE YEAR([Accident_Date]) = 2022;
/* Current_Year_Accident 
      144419              */
----------------------------------------------------------------------------------------------
/* Accident Severity */

SELECT DISTINCT([Accident_Severity])
FROM  [RoadAccidentDB].[dbo].[accident data]

--There are Three Accident Severity Type 
--Serious
--Fatal
--Slight

/* Current Year Fatal Casualties  */

SELECT SUM([Number_of_Casualties]) Fatal_Casualties
FROM  [RoadAccidentDB].[dbo].[accident data]
WHERE [Accident_Severity] = 'Fatal' and YEAR([Accident_Date]) = 2022;

-- Current year Fatal casualties is 2855-------


/* Current Year Serious Casualties  */

SELECT SUM([Number_of_Casualties]) Serious_Casualties
FROM  [RoadAccidentDB].[dbo].[accident data]
WHERE [Accident_Severity] = 'Serious' and YEAR([Accident_Date]) = 2022;

-- Current year Serious casualties is 27045-----


SELECT SUM([Number_of_Casualties]) Slight_Casualties
FROM  [RoadAccidentDB].[dbo].[accident data]
WHERE [Accident_Severity] = 'Slight' and YEAR([Accident_Date]) = 2022;

-- Current year Slight casualties is 165837------

----------------------------------------------------------------------------------------------

/*Current Year Casualties by Vehicle Type  */

SELECT [Vehicle_Type],SUM([Number_of_Casualties]) Veh_casualties
FROM  [RoadAccidentDB].[dbo].[accident data]
WHERE YEAR([Accident_Date]) = 2022
GROUP BY [Vehicle_Type] ORDER BY 2 DESC;

----Casualties by car top causes of casualties----

------------------------------------------------------------------------------------------------

/*Current Year Casualties by [Urban_or_Rural_Area]  */

SELECT [Urban_or_Rural_Area],SUM([Number_of_Casualties]) casualties_urban_rural
FROM  [RoadAccidentDB].[dbo].[accident data]
WHERE YEAR([Accident_Date]) = 2022

/*
Urban_or_Rural_Area   	casualties_urban_rural
Urban	                121251
Rural	                74486
									*/
----Casualties by car top causes of casualties----


--------------------------------------------------------------------------------------------------
/*Current Year Casualties by Road_Type  */

SELECT [Road_Type],SUM([Number_of_Casualties]) casualties_by_road
FROM  [RoadAccidentDB].[dbo].[accident data]
WHERE YEAR([Accident_Date]) = 2022
GROUP BY [Road_Type] ORDER BY 2 DESC;

/*
Road_Type	             casualties_by_road
Single carriageway	     144653
Dual carriageway	     31912
Roundabout	             12683
One way street	         3499
Slip road	             2221
NULL	                 769
									*/
----Casualties by Single carriageway top causes of Accidents ----

----------------------------------------------------------------------------------------------------

/*Current Year Casualties by Month  */

SELECT Month([Accident_Date]) Accident_Month,SUM([Number_of_Casualties]) casualties_by_road
FROM  [RoadAccidentDB].[dbo].[accident data]
WHERE YEAR([Accident_Date]) = 2022
GROUP BY Month([Accident_Date])  ORDER BY 2 DESC;

/*
Accident_Month	casualties_by_road
11	                    18439
10	                    18287
9	                    17500
								*/

--- Analysis shows that November top the list of month with casualties followed by october and september--
------------------------------------------------------------------------------------------------------------

/*Current Year Casualties by Light_Conditions  */
SELECT [Light_Conditions],SUM([Number_of_Casualties]) casualties_by_road
FROM  [RoadAccidentDB].[dbo].[accident data]
WHERE YEAR([Accident_Date]) = 2022
GROUP BY [Light_Conditions]  ORDER BY 2 DESC;

----- Casualties are highest during Daylight------
------------------------------------------------------------------------------------------------------------
/*Current Year Casualties by [District_Area]  */
SELECT [District_Area],COUNT(*) Number_of_Accidents
FROM  [RoadAccidentDB].[dbo].[accident data]
WHERE YEAR([Accident_Date]) = 2022
GROUP BY [District_Area]  ORDER BY 2 DESC;

/* Top 3 district by number of Accident 
District_Area	Number_of_Accidents
Birmingham	     2876
Leeds	        1954
Bradford	    1439
						*/
----------------------------------------------------------------------------------------------------------------