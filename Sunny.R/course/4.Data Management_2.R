#3. Not Available ####

#3-1 Example ####
manager <- 1:5
date <- c("02/24/18", "03/28/18", "01/1/18", "03/12/18", "01/01/18")
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
dim(leadership)

#3-2 use is.ns() 
is.na(leadership[,6:10])
#函數is.na()檢測缺失值是否存在
#某個元素是缺失值，相應的位置將被改寫為TRUE，不是缺失值的位置則為FALSE

sum(is.na(leadership[,6:10]))
colSums(is.na(leadership[,6:10]))
#計算遺漏值個數 


#3-3 recode NA
# NA年齡值被編碼為99
 leadership$age[leadership$age==99]<-NA
leadership

#3-4 Remove rows with missing data

#Point !!!
#刪除所有含有缺失數據的觀測（稱為delete row）是處理不完整數據集的若干手段之一。如果只有少數缺失值或者缺失值僅集中於一小部分觀測中，delete row不失為解決缺失值問題的一種優秀方法
#但如果缺失值遍布於數據之中，或者一小部分變量中包含大量的缺失數據，delete row可能會剔除相當比例的數據 
# ! point delete columns (考慮變量重要性)

# 1. rows NA
# 樣本數很大 --> 可以考慮直接刪除樣本
# 樣本數很小 --> 處理NA

# 2. columns NA
# 變數重要 --> 要處理NA
# 變數不重要-- > 直接刪除變數
# 品質>數量


#Method 1
#函數na.omit()移除所有含有缺失值的觀測
leadership_N <- na.omit(leadership)
leadership_N
#有包含缺失數據的row均已從leadership中刪除

#Method 2
leaderhip_N2 <- leadership[complete.cases(leadership), ]
leaderhip_N2

#************************************************
#4. Convert Variables ####
a <- c(1,2,3,4,5)
a

is.numeric(a)
a <- as.character(a)
a

is.numeric(a)
is.character(a)

#************************************************
# 3 & 4 Quiz ####
#請使用airquality進行下列數據處理
#(1)在數據處理之前，請先檢視數據格式及變量意義
?airquality
data(airquality)
View(airquality)
dim(airquality)
str(airquality)
is.na(airquality)
colSums(is.na(airquality[,1:6]))
airquality_N <- na.omit(airquality)
airquality
#(2)請使用函數is.na()檢測缺失值是否存在, 並計算遺漏值個數 
is.na(airquality)
sum(is.na(airquality[,1:6]))
colSums(is.na(airquality[,1:6]))
#(3)移除所有含有缺失值的觀測，進行行刪除，產生新數據集airquality_N
airquality_N <- na.omit(airquality)
sum(is.na(airquality_N))
colSums(is.na(airquality_N[,1:6]))
dim(airquality_N)
#(4)將數據集airquality_N內的變數Ozone、Solar.R、Temp轉為numeric的形式
str(airquality_N)

is.numeric(airquality_N$Ozone)
airquality_N$Ozone <- as.numeric(airquality_N$Ozone)

is.numeric(airquality_N$Solar.R)
airquality_N$Solar.R <- as.numeric(airquality_N$Solar.R)

is.numeric(airquality_N$Temp)
airquality_N$Temp <- as.numeric(airquality_N$Temp)

is.integer(airquality_N$Temp)


lst <- c("Ozone", "Solar.R", "Temp")
lst <- c(1, 2, 4)

for (i in lst){
  airquality[,i] <- as.numeric(airquality[,i])
}







