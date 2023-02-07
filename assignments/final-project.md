# SOSC 13200: Social Science Inquiry II
## Section 2
### University of Chicago
### Winter Quarter 2023



The goal of this course has been to get you to approach data, and data analysis, thinking like a social scientist. That means thinking about where your data comes from and how it's measured, and assessing and describing relationships among variables. We have used some statistical methods for quantitative analysis, and worked on coding data analysis and data visualizations in R. 

For your final project, you will apply this approach to a data set of your choosing. Each student will submit their own report and will be graded independently. Multiple students may use the same data set, and you are welcome to collaborate with other students in the class if you would like, but your grade will be based on what is represented in your own report. 

Your final project will consist of three components, submitted each week, as regular homework assignments. However, there are no solution sets, and final projects will be graded *comprehensively*; that is, all components will be graded together at the end of the quarter, as they are intended as complementary parts of a single project. 

For each component, as with regular homework assignments, submit both the R source file and the compiled pdf report. 

### Part I: Data set selection and descriptive analysis.
#### Due Monday 2/20 at 5pm

Select your data set from among those listed **below**, or propose a different data set that you would like to analyze. Your data set does not need to be directly related to social science. 

If your propose your own data set, consider that you will be asked to produce data visualizations and regression analysis on your data, so pick something with at least a couple of numeric variables. If you are using a data set that is in a different format than those used in class, it is your responsibility to convert the data set into something that is readable in R. Please also select a data set with fewer than 1 million records. If you propose your own data set, *you must also share the data set with the instructor*--either email the data file, or provide a link to where the file may be downloaded. All of your analyses must be replicable. 

Write narrative and code answering the below questions. Your compiled report for this part of the project, including narrative and compiled code, should be about 2 pages long. You do not need to answer question by question, but use the questions below to guide your description. The objective of this first project component is to demonstrate that you have a good understanding of where your data comes from, and what is going on in your data set. This will require some *exploratory* analysis-look at your data, maybe make some plots, and make sure you understand what all of the variables represent. 

1. Describe where the data comes from, and how it was generated. Is it from a survey? A census? An experiment? Was it collected by researchers for an academic project, or is it administrative data that is routinely collected by a government or other organization? What else can you say about how the data was generated?

2. What does each observation describe in the data set? I.e., what does each row represent--a measurement from an individual person? Measurement from a specific geographic location? Are there multiple measurements over different periods in time or space? Is there anything weird or interesting about how your data is formatted--.e.g, is your data [*long* or *wide*](https://stats.oarc.ucla.edu/r/faq/how-can-i-reshape-my-data-in-r/)?

3. What is the population represented in the data set? Is it from a sample from a larger population, or does the data set itself include all relevant units from the population? If you were to analyze the data set, would you expect the results to be relevant for other units or groups?

4. Provide some descriptive summary of the dataset using code. I do *not* want to see a full page that is just `head(data)`, but consider summary statistics that can help a reader understand, at a high level, what is going on in the data set. How many rows and columns are there? Is there missing data? Are variables mostly numeric, character, or are there different data types represented? Do you have categorical variables that represent different levels of something? Are these levels ordered (e.g., grade levels) or unordered (e.g., colors). Is there anything else relevant about how your data is coded?




### Part II: Multiple linear regression and data visualizations. 
#### Due Monday 2/27 at 5pm

Describe relationships among variables in your data set, demonstrating your data visualization and quantitative analysis skills. 

Write narrative and code answering the below questions. Your compiled report for this part of the project, including narrative and compiled code, should be about 2-3 pages long. You do not need to answer question by question, but use the questions below to guide your description, and please be sure to answer all parts of each question. The objective of this second project component is to demonstrate that you are able to  describe, numerically and visually, relationships among variables within your data. 

1. Select two variables whose relationship you think is interesting. Please be sure to describe what these variables represent. 

    * Report the mean and *standard error of the mean* for each variable (make sure you are reporting the standard error of the mean, and not the standard deviation). 
    
    * Provide a data visualization for the distribution of each variable separately in your data set, and jointly. Separate distributions can look like histograms or bar charts; joint distributions might look like a scatter plot or multiple boxplots--but these are not the only options. Look at the [`ggplot` cheat sheet](https://raw.githubusercontent.com/rstudio/cheatsheets/main/data-visualization.pdf) for more ideas. Use all best practices in creating these data visualizations: provide a title for the plot, label x and y axes, use colors appropriately, make sure labels are legible. These plots should be high quality and ready for presentation to a broader audience. 

2. Regress one of your two variables on the other using `lm_robust()`. 

    * Explain why you chose which variable as the dependent and independent variables. 
    
    * Interpret the intercept and the slope coefficient: say in words what the linear model represents, so that a friend who is not familiar with linear models would understand the relationship between the two variables. Is this relationship causal, or does it tell you anything meaningful about the underlying data? Report the standard errors, p-values, and confidence intervals for both the intercept and the slope. 
    
    * Can you reject the null hypothesis that the slope is equal to zero, at p = 0.05? p = 0.01? An even smaller p-value? If you cannot reject the null hypothesis, what does that tell you about the relationship between the two variables?

3. Include several alternate specifications of your model in part 2, controlling for additional variables. 

    * Be sure to describe which additional variables you are controlling for in each model. This should read like a nice replication analysis, so that when I am going through your report, I can fully understand what you are doing. 

    *  Interpret the coefficient on your independent variable of interest in these alternative models. Do these alternate specifications meaningfully change the value of the slope coefficient on your independent variable of interest? Do they change the p-value on your independent variable of interest? What does this tell you about the relationships across the variables?

### Part III: Finalize report and discussion. 
#### Due Friday 3/3 at 5pm 
**Note the short turn-around between parts II and III**

Given what you included in parts I and II of your report, provide a high-level narrative take-away about what you found in your selected data set. Include any additional analysis or visualizations that help explain this data set. Your compiled report for this part of the project, including narrative and compiled code, should be about 1 page long, or potentially longer if you have included more visualizations. If you want to correct or revise anything from parts I and II, you can do that here. 


## Data sets you can choose from: [list in progress]

- New York Times COVID data sets
    - source: [https://github.com/nytimes/covid-19-data](https://github.com/nytimes/covid-19-data)
    - files: There are a number of different files available for download at the site, including [national](https://raw.githubusercontent.com/nytimes/covid-19-data/master/us.csv), [state](https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv), and [county](https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv)-level data.  

- Replication data for Gerber, Alan S., Donald P. Green, and Christopher W. Larimer, 2008, ÒSocial Pressure and Voter Turnout: Evidence from a Large-Scale Field Experiment.Ó 
    - source: [ISPS Data Archive](http://hdl.handle.net/10079/c7507a0d-097a-4689-873a-7424564dfc82) 
    - file: **ggl_household.csv**
    
- Replication data for Fowler, Anthony and Andrew Hall, 2017, "Do Shark Attacks Influence Presidential Elections? Reassessing a Prominent Finding on Voter Competence." 
    - source: [Harvard Dataverse](https://doi.org/10.7910/DVN/AE5BPK/H8QVC8)
    - file: **SharkAttacksElectionsCleaned.csv**

- Replication data for LaLonde, Robert. 1986, "Evaluating the Econometric Evaluations of Training Programs."
    - source: [http://sekhon.berkeley.edu/matching/lalonde.html](http://sekhon.berkeley.edu/matching/lalonde.html)
    - file: **lalonde.csv**

- Popular baby names by state, as collected by the US Social Security Agency   
    - source: [https://www.ssa.gov](https://www.ssa.gov/oact/babynames/limits.html) 
    - files: **namesbystate/**; includes state-specific files

- Pokemon dataset on all 802 Pokemon from all Seven Generations of Pokemon/ 
    - source: [https://www.kaggle.com](https://www.kaggle.com/rounakbanik/pokemon)
    - file: **pokemon.csv**

-  Life Expectancy at Birth by Sex for Illinois, Chicago and Illinois Counties: 1989-1991, 1999-2001 and 2009-2011
    - source: [https://data.illinois.gov](https://data.illinois.gov/dataset/426idph_life_expectancy_at_birth_by_sex_for_illinois_chicago_and_illinois_counties_19891991_19992001)
    - file: **life.csv**


- Chicago speed camera violations, as collected by the City of Chicago
    - source: [https://data.cityofchicago.org](https://data.cityofchicago.org/Transportation/Speed-Camera-Violations/hhkd-xvj4) Chicago Data Portal
    - file: **traffic_camera.csv** 
    
   

## Other resources for data sets

- The [Data is Plural website](https://www.data-is-plural.com/) and [archive](https://docs.google.com/spreadsheets/d/1wZhPLMCHKJvwOkP4juclhjFgqIY8fQFMemwKL2c64vk/edit#gid=0) also have a number of interesting data sets. 

- [FiveThirtyEight](https://data.fivethirtyeight.com/) shares the data (and some code) used to generate some of the graphs and figures on their website. 

- [Buzz feed](https://github.com/BuzzFeedNews) shares some data sets from Buzz Feed News. 

- [ProPublica](https://www.propublica.org/datastore/datasets) hosts a number of unique and custom data sets relevant to their projects on investigative journalism for public interest. 

- [Kaggle](https://www.kaggle.com/datasets) has a vast collection of user-submitted data sets. 

