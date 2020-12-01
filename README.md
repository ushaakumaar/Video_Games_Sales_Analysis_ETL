# Video Games Sales Analysis
## ETL Project
***

[About](#about) | [Extract](#extract) | [Trasform](#transform) | [Load](#load) | [Limitations](#limitations) | [Programming Language / Applications Used](#programming-language-/-applications-used) | [Contributors](#contributors)


## About
***

This project extracts, transforms, and loads video game sales data from https://www.vgchartz.com. This dataset could be later used to analyze and answer the following questions:
-   Most popular video game console in various regions
-   Most popular video game across various consoles/regions/genre

## Extract
***
Wrote a [Jupyter notebook](Extract.ipynb) python script to scrape the video games data from www.vgchartz.com website using BeautifulSoup and Splinter to do the following:
-   Obtained the list of genres
-   Dynamically built the URL to scrape the pages of games data for each genre
-   Wrote the extracted raw video games data into [CSV file](Output/Extracted_video_games_data.csv) to be used for Transform process


