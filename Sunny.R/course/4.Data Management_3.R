# 5. Sorting Data ####

# 5-1 Example ####
manager <- 1:5
date <- c("02/24/18", "03/28/18", "01/01/18", "03/12/18", "01/01/18")
country <- c("US","US","UK","UK","UK")
gender <- c("M", "F", "F", "M", "F")
age <- c(32,45,25,39,99)
q1 <- c(5,3,3,3,2)
q2 <- c(4,5,5,3,2)
q3 <- c(5,2,5,4,1)
q4 <- c(5,5,5,NA,2)
q5 <- c(5,5,2,NA,2)
leadership <- data.frame(manager, date, country, gender, age, 
                         q1, q2, q3, q4, q5)
leadership

#Order by age
attach(leadership)

lead_order1 <- leadership[order(age),] #由小至大排列
lead_order1


lead_order1 <- leadership[order(-age),] #由大至大排列
lead_order1

#Order by gendr & age
lead_order2 <- leadership[order(gender, age),]
lead_order2

#Order by gender & -age
lead_order3 <- leadership[order(gender,-age),]
lead_order3

#*******************************************************
# 5-2 Quiz ####

#(1)請匯入檔案hsb
#(2)請依變量read進行排序, 由小至大, 賦值為order_hsb, 並列出前15筆數據進行確認
#(3)請依變量read由小至大進行排序 再依prog由小至大進行排序, 賦值為order2_hsb, 並列出前15筆數據進行確認
#(4)請依變量prog由小至大進行排序 再依read由大至小進行排序, 賦值為order3_hsb,, 並列出前15筆數據進行確認



#******************************************************
# 6.Merging Data ####
first <- data.frame(x0=1:5,
                    x1=rnorm(5),
                    x2=c("M","F","M","F","F"))
first

second <- data.frame(x0=10:14,
                     x1=rnorm(5),
                     x2=c("M","F","M","F","F"))
second

third <- data.frame(x4=c(3,3,1,3,2),
                    x5=c("e","g","v","b","z"))
third

#****************************************************
# 6-1 rbind() ####
# 縱向合併（by row）兩個數據框，使用rbind()函數

#Here we stack the first then the second:
Stocks_r <- rbind(first, second)
Stocks_r

class(Stocks_r) # still a data frame

#*******************************************************
# 6-2 cbind() ####
#cbind() 把矩陣橫向合併(by column)成一個矩陣
# Use the cbind function to combine data frames first and third:
Stocks_c <- cbind(first,third)
Stocks_c
class(Stocks_c)
names(Stocks_c)

#*****************************************************
# 6-3 rbind() & cbind() ####
# WARNING: cbind does not require matching heights; if one data frame is shorter
# it will recycle it. Notice below the third data frame is recycled.
cbind(rbind(first, second), third)
#*******************************************
# 6-4 merge() ####
#橫向合併兩個數據框（數據集）。在多數情況下，兩個數據框是通過一個或多個共有變量進行聯結
# Let's create some more fake data to illustrate:
left <- data.frame(ID=c(2:7),
                   y2=rnorm(6,mean=100,sd=5)) # 產生6個服從正態分布的隨機數
left
right <- data.frame(ID=rep(1:4,each=2),
                    z2=sample(letters,8, replace=TRUE))
right

#*********************************************************
# (1)merge two data frames by ID                                  
# merge(dataframe_A, dataframe_B, by="ID")                                   
# (2)merge two data frames by ID and Country 

# merge(dataframe_A,dataframe_B,by=c("ID","Country"))                        
#*****************************************************
#Inner join
# Data frames left and right have columns "id" in common. Let's merge them together based on id:
merge(left, right, by="ID", all=FALSE)

#*****************************************************
#Full join
# If we wanted to merge all rows regardless of match, we use the argument all=TRUE. It is FALSE by default. This creates an FULL JOIN.
merge(left, right, by="ID", all=TRUE)

#*************************************************
# LEFT JOIN
# If we want to retain everything in the left data frame and merge only what matches in the right data frame, we specify all.x=TRUE. This is known as a LEFT JOIN.
merge(left, right, all.x=TRUE, by="ID")

#*************************************************
# RIGHT JOIN
# If we want to retain everything in the right data frame and merge only what matches in the left data frame, we specify all.y=TRUE. This is known as a RIGHT JOIN.
merge(left, right, all.y=TRUE, by="ID")

#**************************************************
# 6-5 Quiz ####
#Q1.請創建下列運動賽事獲獎名單的data frame,並判斷使用rbind()或是cbind()進行合併, 合併後賦值為trophies

# make two vectors and combine them as columns in a data.frame
library(dplyr)
sport <- c("Hockey", "Baseball", "Football")
league <- c("NHL", "MLB", "NFL")
trophy <- c("Stanley Cup", "Commissioner's Trophy","Vince Lombardi Trophy")
trophies1 <- cbind(sport, league, trophy) %>% as.data.frame()
trophies1

# make another data.frame using data.frame()
trophies2 <- data.frame(sport=c("Basketball", "Golf"),
                        league=c("NBA", "PGA"),
                        trophy=c("Larry O'Brien Championship Trophy","Wanamaker Trophy"),
                        stringsAsFactors=FALSE)
trophies2
#Q1.請創建下列運動賽事獲獎名單的data frame,並判斷使用rbind()或是cbind()進行合併, 合併後賦值為trophies




#***********************************************
# Q2. 1. 請創建下列電商顧客基本數據的data frame, 並使用merge()進行各種聯結(Inner join、Full join、Left join、Right join)
# 2. 我想知道所有地區的購買狀況，請問你要用哪種merge方法？
df1 <- data.frame(CustomerId = seq(1, 40, by = 2),  
                  state = c(rep("Taipei", 7), rep("Taichung", 8),
                            rep ("Tainan", 5)))

df2 <- data.frame(CustomerId = c(1:20), 
                  Product = c(rep("Toaster", 8), rep("Radio", 2), 
                              rep("TV",6), rep("vacuum",4)))
df2

# Q2. 請創建下列電商顧客基本數據的data frame, 並使用merge()進行各種聯結(Inner join、Full join、Left join、Right join)
#Inner join

#Full join

#Left join

#Right join
