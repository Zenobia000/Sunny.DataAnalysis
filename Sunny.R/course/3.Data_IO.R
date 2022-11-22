
#************************************************
# 1. Importing Data ####
#************************************************
#1-1 From csv ####
# WINDOWS
data <- read.csv("C:/sunny.workstation/Sunny.R/3.Data_IO-20221029T010757Z-001/3.Data_IO/customer.csv", header=T, sep=",",stringsAsFactors=F)
#header=T表示csv第一列包含變數名稱，sep=","表示資料以逗號分隔
# stringsAsFactors=F,表示保留為字串

# MAC 
data <-read.csv("/Users/yunmo/Documents/iii/teach/3.Data_IO/customer.csv",
                header=T, sep=",",stringsAsFactors=F)

# 設定路徑直接讀

setwd("C:/sunny.workstation/Sunny.R/3.Data_IO-20221029T010757Z-001/3.Data_IO")
data <- read.csv("customer.csv", header = T, sep=",", stringsAsFactors = F)


View(data)
dim(data)  #100筆個案、18筆變數
#********************************************
#1-2 From table ####
#1-2-1
# WINDOWS
data2 <- read.table("C:/sunny.workstation/Sunny.R/3.Data_IO-20221029T010757Z-001/3.Data_IO/customer.csv", header = T, sep = ",") 
# 檔案路徑是相對於目前的工作目錄，header 是指資料是否有包含欄位名稱，sep 是指資料的分隔符號。
View(data2)
# MAC
data2 <- read.table("/Users/yunmo/Documents/iii/teach/3.Data_IO/customer.csv", header = T, sep = ",")

#*******************************************
# 1-2-2
# WINDOWS
data3 <- read.table("C:/sunny.workstation/Sunny.R/3.Data_IO-20221029T010757Z-001/3.Data_IO/customer_short.csv", header = TRUE, sep = ",")
View(data3)
# col.names 設定 column 欄位名稱。
data3 <- read.table("C:/sunny.workstation/Sunny.R/3.Data_IO-20221029T010757Z-001/3.Data_IO/customer_short.csv", header = TRUE, sep = ",", col.names = c("地區", "性別")) 


# MAC
data3 <- read.table("/Users/yunmo/Documents/iii/teach/3.Data_IO/customer_short.csv", header = TRUE, sep = ',')
View(data3)
# col.names 設定 column 欄位名稱。
data3 <- read.table("/Users/yunmo/Documents/iii/teach/3.Data_IO/customer_short.csv", header = TRUE, sep = ',',col.names = c("地區", "性別"))


#*******************************************
# 1-2-3
# WINDOWS
data4 <- read.table("C:/sunny.workstation/Sunny.R/3.Data_IO-20221029T010757Z-001/3.Data_IO/customer_short.csv", header = TRUE, sep = ",",encoding = "UTF-8", col.names = c("地區", "性別")) 
View(data4)
# encoding 是指定檔案的文字編碼

# MAC
data4 <- read.table("/Users/yunmo/Documents/iii/teach/3.Data_IO/customer_short.csv", header = TRUE, sep = ",",encoding = "UTF-8")

#*******************************************
# 1-2-4
# WINDOWS
data5 <- read.table("C:/customer_NA.csv", header = TRUE, sep = ",", na.strings = NA) 
# na.strings 指定發生 NA 要用什麼符號代替。

View(data5)

# MAC
data5 <- read.table("C:/sunny.workstation/Sunny.R/3.Data_IO-20221029T010757Z-001/3.Data_IO/customer_NA.csv", header = TRUE, sep = ',', na.strings = NA)


# na.string  補充
# '1'的話用NA代替
tmp <- read.csv("C:/sunny.workstation/Sunny.R/3.Data_IO-20221029T010757Z-001/3.Data_IO/customer_NA.csv", 
                header = TRUE, sep = ',', 
                na.strings = '1')

tmp2 <- read.csv("C:/sunny.workstation/Sunny.R/3.Data_IO-20221029T010757Z-001/3.Data_IO/customer_NA.csv", 
                 header = TRUE, sep = ',', na.strings = c("NA", "NAN", " "))

View(tmp2)


#*********************************************
# 1-3 From Excel  ####
library(readxl)

# WINDOWS
#read.xlsx(file,n)     File是Excel工作簿所在路徑, n為要導入的工作表序號
mydata <- read_excel("C:/sunny.workstation/Sunny.R/3.Data_IO-20221029T010757Z-001/3.Data_IO/customer.xlsx", 1)  
mydata

mydata2 <- read_excel("C:/sunny.workstation/Sunny.R/3.Data_IO-20221029T010757Z-001/3.Data_IO/customer.xlsx", 
                      sheet = "mysheet_2")
mydata2

# MAC
setwd("~/Documents/iii/teach")
mydata <- read_excel("./3.Data_IO/customer.xlsx", 1)

mydata2 <- read_excel("/Users/yunmo/Documents/iii/teach/3.Data_IO/customer.xlsx", sheet = "mysheet_2")

#*******************************************
# 1-4 Frome file.choose() ####
myfile <- read.csv(file.choose())  #please choose C:/customer.csv
View(myfile)

#********************************************
# QUIZ 1 ####
# Input "iris" data

mydata_iris <- read.csv("C:/sunny.workstation/Sunny.R/3.Data_IO-20221029T010757Z-001/3.Data_IO/iris.csv", 1)  
View(mydata_iris)
dim(mydata_iris)

#********************************************************
# 2. Output Data  ####
#************************************************
data(iris)
View(iris)
?iris
#*********************************************************
# 2-1 Write in CSV ####
# WINDOWS
write.csv(iris, "C:/sunny.workstation/Sunny.R/3.Data_IO-20221029T010757Z-001/3.Data_IO/iris_output.csv")

# MAC
write.csv(iris, "/Users/yunmo/Documents/iii/teach/3.Data_IO/iris.csv")

#********************************************************
# 2-2 Write CSV (Delect row names) ####
getwd()
write.csv(iris, file = "iris_output.csv", row.names = FALSE)

#********************************************
# 2-3 Write in table ####
# WINDOWS
write.table(iris, "C:/sunny.workstation/Sunny.R/3.Data_IO-20221029T010757Z-001/3.Data_IO/iris_output.csv", sep = ",", row.names = FALSE)

# MAC
write.table(iris, "/Users/yunmo/Desktop/table.csv", sep = ",", row.names = FALSE)

#********************************************
# 2-4 Write in Excel ####
library(xlsx)
# WINDOWS
write.xlsx(iris,"C:/sunny.workstation/Sunny.R/3.Data_IO-20221029T010757Z-001/3.Data_IO/iris_output_excel.xlsx", row.names = FALSE)

# MAC
write.xlsx(iris,"/Users/yunmo/Desktop/table.xlsx", row.names = FALSE)

#**********************************************************
#Quiz 2 Output Data ####

# output customer.csv
write.table(data, "C:/sunny.workstation/Sunny.R/3.Data_IO-20221029T010757Z-001/3.Data_IO/customer1.csv", sep = ",", row.names = FALSE)




#*********************************************
# 3. Viewing Data   ####
#*********************************************
# (1) 请列出iris中的變數 
names(iris)

# (2) 请列出iris的數據結構 
str(iris)

# (3) 请列出iris中因素的級別 
levels(iris$Species)

# (4) 请列出iris的構面
dim(iris)

# (5) 请列出iris數據集的結構 
class(iris)

# (6) 请印出iris數據集
iris

# (7) 请印出iris的前10行 
head(iris, n=10)

# (8) 请印出iris的後5行 
tail(iris, n=5)


#**********************************************************
# Quiz 3  Viewing Data ####
data(mtcars)
#(1) 請列出mtcars中的變量
names(mtcars)
#(2) 請列出mtcars的數據結構
str(mtcars)
#(3) 請列出mtcars的構面
dim(mtcars)
#(4) 請列出mtcars數據集的結構 
class(mtcars)
#(5) 請打印出mtcars數據集
mtcars
#(6) 請打印出mtcars的前10行 
head(mtcars, n=10)
#(7) 請打印出mtcars的後5行
tail(mtcars, n=10)


