# Covid-20_25

Tableau Public Link: https://public.tableau.com/app/profile/rishabh.salian/viz/CovidDatabase_17513967971760/Dashboard1?publish=yes

Project Overview :
This project is the first two parts of a four-part series designed to help aspiring Data Analysts build a comprehensive portfolio. It focuses on SQL data exploration and cleaning, followed by Tableau visualization of global COVID-19 data. The objective is to demonstrate proficiency in data manipulation, analysis, and dashboard creation for potential employers.

Data Source:
The primary data source for this project is a MetaData of COVID-19 records from the World Health Organization (WHO). This comprehensive dataset, initially containing a significant volume of information (over 4.5 Lakh rows according to one source, or around 89,000 rows as mentioned in another context), covers various metrics such as total cases, new cases, total deaths, new deaths, total vaccinations, people vaccinated, and population, dating back to early 2020.


From this main dataset, two primary datasets were extracted and prepared for analysis:
  1. COVID-19 Death Data
  2. COVID-19 Vaccination Data


Tools Used :
  • MYSQL Server 2025: Utilised for importing, exploring, learning, and cleaning the raw COVID-19 data from early 2020till current Time. This involved complex queries, joins, Common Table Expressions (CTEs), and temporary tables. Views were created to store pre-processed data for later visualization.

  • Microsoft Excel: Used for initial data formatting and preparing the extracted SQL query results for import into Tableau Public. Crucially, Excel was used to handle NULL values by converting them to zeros to ensure correct data type assignment in Tableau.

  • Tableau Public: Employed for creating interactive data visualizations and building a comprehensive dashboard. Data from SQL was exported to Excel as Tableau Public cannot directly connect to SQL databases.


Key Analysis & Insights :

This project addresses several core questions to extract meaningful insights from the COVID-19 data:
  • Death Percentage by Country:
    ◦ Question: What is the percentage likelihood of dying if one contracts COVID-19 in a particular country?
    ◦ Analysis: This was calculated by dividing the total_deaths by total_cases and multiplying by 100. The data showed varying death rates across countries; for instance, Afghanistan had a roughly 4% death rate, while the United States saw its death rate fluctuate, ending around 1.78% by the end of the year in the dataset. This analysis highlighted the severe impact of the pandemic on different populations.
  
  • Population Infection Percentage:
    ◦ Question: What percentage of a country's population has been infected with COVID-19?
    ◦ Analysis: This was determined by dividing total_cases by the population and multiplying by 100. For example, the United States reached 1% of its population infected by August of the previous year, increasing to approximately 10% by the end of the year, with over 32 million confirmed cases. This metric provides insight into the spread of the virus relative to population size.


Additional analyses included:
• Identifying countries with the highest infection rates.
• Determining countries with the highest death counts.
• Breaking down data by continent to understand continental trends.
• Calculating global COVID-19 numbers, including total cases, deaths, and overall death percentages (around 2% globally).
• Analysing vaccination progress by calculating a rolling count of vaccinated individuals against the total population.


Visualizations :
The processed data was then used to create four key visualizations in Tableau, combined into an interactive dashboard:
  1. Global Numbers Text Table: Displays key overall statistics such as total cases, total deaths, and the average global death percentage.
  2. Total Deaths per Continent Bar Graph: Illustrates the current global death count broken down by continent, ordered from highest to lowest.
  3. World Map of Percent Population Infected: A geographical representation showcasing the percentage of the population infected in various countries.
  4. Time Series Chart for Percent Population Infected: A line graph illustrating the progression of infection rates over time for selected countries (e.g., USA, UK, India, China, Mexico), including a forecasting element to predict future trends.
Tableau Public Dashboard Link: https://public.tableau.com/app/profile/rishabh.salian/viz/CovidDatabase_17513967971760/Dashboard1?publish=yes


**This project highlights the end-to-end process of a data analysis workflow, from raw data to actionable insights and shareable **visualizations.
