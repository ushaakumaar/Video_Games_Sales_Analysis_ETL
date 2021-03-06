# Video Games Sales Analysis - ETL
***

[About](#about) | [Extract](#extract) | [Transform](#transform) | [Load](#load) | [Data Analysis](#data-analysis) | [Limitations](#limitations) | [Programming Language / Applications Used](#programming-languages-and-applications-used) | [Contributors](#contributors)


### About
***

This project extracts, transforms, and loads video game sales data from https://www.vgchartz.com. This dataset could be later used to analyze and answer the following questions:
-   Most popular video game console in various regions
-   Most popular video game across various consoles/regions/genre

### Extract
***
Wrote a [Jupyter notebook](Extract.ipynb) python script to scrape the video games data from www.vgchartz.com website using BeautifulSoup and Splinter to do the following:
-   Obtained the list of genres
-   Dynamically built the URL to scrape the pages of games data for each genre
-   Used Splinter, BeautifulSoup and Pandas Web Scraping to scrape multiple pages of games data for each genre
-   Wrote the extracted raw video games data into [CSV file](Output/Extracted_video_games_data.csv) to be used for Transform process

### Transform
***
Wrote a [Jupyter notebook](Transform.ipynb) python script to do the following clean up and transformation steps to the raw video games data obtained from the Extraction process:
-   Deleted games without sales data
-   Removed unwanted columns and renamed the columns
-   Added Release year column
-   Converted Release date values to date format and Sales values to float format
-   Wrote the transformed video games data into [CSV file](Output/Transformed_video_games_data.csv) to be used for the Load process

### Load
***
Performed the following steps to Load the transformed video games data into PostgreSQL Database:
-   Designed the database tables in normalized form and generated [ERD](Data_Modeling/ERD.png)
-   Created a [SQL script](Data_Engineering/schema.sql) for table creation in PostgreSQL
-   Wrote a [Jupyter notebook](Load.ipynb) python script to split the transformed video games data into multiple dataframes and loaded them into PostgreSQL Database tables

### Data Analysis
***
Performed the following [analysis](Data_Analysis/Data_Analysis_Queries.sql) after building the complete database:
1. Wrote a SQL query to determine the year in which North America had highest video games sales.
2. Wrote a SQL query to determine the year in which the global sales was highest.
3. Wrote a SQL query to determine the year in which the total shipped was highest.
3. Wrote a SQL query to determine the most popular video game console in North America.
4. Wrote a SQL query to determine the most popular video game console in PAL.
5. Wrote a SQL query to determine the most popular video game console in Japan.
6. Wrote a SQL query to determine the most popular video game console in Other regions.
7. Wrote a SQL query to determine the most popular video game console globally.
8. Wrote a SQL query to determine the most shipped video game console.
9. Wrote a SQL query to determine the most popular video game across various consoles.
10. Wrote a SQL query to determine the most popular video game across various genres.

### Limitations
***
-   Overall sales information for each game at the region/genre level only was available. Lack of sales history information for each game, limits the analysis of sales fluctuation for each game over the years.

### Programming Languages and Applications Used
***
-   Python
    *   BeautifulSoup
    *   Splinter
    *   Pandas Web Scraping
    *   Pandas
    *   SQLAlchemy
-   Jupyter Notebook
-   PostgreSQL

### Contributors
***
- Usha Saravanakumar ([ushaakumaar](https://github.com/ushaakumaar))
- Crystal Dalsania ([cdalsania](https://github.com/cdalsania))
- Jame'l Brown ([JayyMaurice2020](https://github.com/JayyMaurice2020))
