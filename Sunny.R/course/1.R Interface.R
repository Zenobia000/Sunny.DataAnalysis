# 1. Getting Help  ####
help.start() # general help
help("iris")          # help about function iris
?iris                 # same thing 

apropos("iris")       # 尋找函數list all functions containing string iris
RSiteSearch("iris")   # search for iris in help manuals and archived mailing lists
data()                #列出可用數據

#******************************************************
#Quiz 1 ####
#find "mtcars"




#*******************************************************
# 2. The Workspace ####
ls() # list the objects in the current workspace
data("iris")
ls()

getwd() # print the current working directory

# WINDOWS
setwd("C:/")  # note / instead of \ in windows 
# MAC
setwd("/Users/yunmo/Desktop")


# Choose Session -> Set Working Directory 

getwd()

q() # quit R. You will be prompted to save the workspace.


##################################################
#Quiz 2 ####
#change your working dirctory





#*************************************************
# 3. Packages ####
# Installing and removing package

install.packages("psych")
library(psych)
remove.packages("psych")

.libPaths() # get library location 
library()   # see all packages installed 
search()    # see packages currently loaded

#####################################################
#Quiz 3 ####

#Installing and removing "ggplot2" package

install.packages("ggplot2")
install.packages("languageserver")

