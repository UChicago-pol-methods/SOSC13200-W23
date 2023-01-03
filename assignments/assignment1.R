#' ---
#' title: "Assignment 1, Social Science Inquiry II (SOSC13200-W23-2)"
#' author: "<your name here>"
#' date: "Friday 1/6/23 at 5pm"
#' ---
#' 
#' For the first assignment, I want you to update this file with your name, and 
#' to set up a working directory for this class on your computer. Then, compile 
#' this .R file to generate a .pdf report. Submit *both* this .R file and the 
#' compiled .pdf file on Canvas. 
#' 
#' To get started in R: 
#' 
#' - download the latest version of R here: https://www.r-project.org/
#' - download the free Rstudio desktop here: https://www.rstudio.com/
#'
#' To generate pdf reports, you need to have a version of LaTeX installed; LaTeX 
#' is a typesetting software, and we won't use it directly in this class, but R 
#' will call it under the hood to generate reports. 
#' If you don't already use LaTeX, you can install TinyTeX, which is a 
#' lightweight, flexible LaTeX installation. 
#' 
#' To install TinyTex, you can run the code below in R, but remove the hashtag 
#' from in front. 
# install.packages('tinytex', repos = "http://cran.us.r-project.org")
# tinytex::install_tinytex()  # install TinyTeX
#'
#' In this class, we will generate pdf reports based on R scripts with a method 
#' called "spinning" in R.
#' When spinning, we differentiate between regular R comments,
# --which are formatted like this, with just the hashtag before them--
#' and roxygen comments, which have #' before them. Roxygen comments can use 
#' more advanced formatting, like making things **bold** or *italicized*, but 
#' that's not necessary to do for class.  
#' 
#' What *is* very useful is that you can make a heading for your report, like at 
#' the top of this script. 
#' 
#' ## 1. Fill in your own name  at the top of the .R file for this report, where it says `<your name here>`.
#' 
#' ## 2. Set up a working directory for this class. 
#' 
#' a. Make a folder for this class somewhere on your own computer. Preferably 
#' not on your desktop. Mine is here: 
#' `~Users/mollyofferwestort/Documents/Git/SOSC13200-W23`. 
#'
#' b. Inside that folder, make one folder called `assignments`, and one folder 
#' called `data`. 
#' 
#' c. Save *this* file inside your `assignments` folder. Starting 
#' with your class folder, your directory structure should look like this:
#' 
#' ```
#' | -class-folder 
#' | |- assignments
#' | | |-assignment1.R
#' | |- data
#' ```
#' 
#' You should save every homework assignment inside your `assignments` folder. 
#' 
#' d. Print your working directory: 
getwd()
#' 
#' ## 3. Compile this report. 
#' To do this, click on the notebook at the top of the source pane, where you 
#' edit this script. Choose "PDF" for report output format. (If you have any
#' problems, search "Compile report" in the help menu.)


