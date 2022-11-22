# 1 apply() ####
# apply函數是最常用的代替for循環的函數
# 能不要用for loop就不要用，請用apply函數(apply family)取代

#apply(X, MARGIN, FUN, ...)
#參數列表：
#X:array, matrix, dataframe
#MARGIN: 按行計算或按按列計算，1表示按row，2表示按column
#FUN: 自定義的調用函數

head(airquality)

apply(airquality, 2, mean)

apply(airquality, 2, mean, na.rm = T)

# create a matrix of 10 rows x 2 columns
m <- matrix(c(1:10, 11:20), nrow = 10, ncol = 2)
m
# 計算每rows的均值 (mean of the rows) 
apply(m, 1, mean)  

# 計算每columns的均值 (mean of the columns)
apply(m, 2, mean)

# 將所有數據除以2 (divide all values by 2)
apply(m, 2, function(x) x/2)

# 將所有數據進行標準化 (standardization)
apply(m, 2, function(x) ((x-min(x)) / (max(x)-min(x))))

#*****************************************************
# 2 apply() Quiz ####
# 使用iris數據集column 1~4進行以下操作("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")
data(iris)
head(iris[,1:4])
# var of the columns 1~4
apply(iris[,1:4], 2, var)
# sd of the columns 1~4
apply(iris[,1:4], 2, sd)
# rang of the columns 1~4
apply(iris[,1:4], 2, range)
# full range of the columns 1~4
apply(iris[,1:4], 2, function(x) diff(range(x)))
# summary of the columns 1~4
apply(iris[,1:4], 2, summary)







#***************************************************
# 3 colSums()、rowSums()、colMeans()、rowMeans() ####
head(iris)
head(iris[,1:4])

#colSums()
colSums(iris[,1:4])

#same as apply()
apply(iris[,1:4], 2, sum)

#計算各變量之遺漏值
colSums(is.na(iris))

#******************************
#colMeans()
colMeans(iris[,1:4])

#same as apply()
apply(iris[,1:4], 2, mean)

#****************************************************
# 4 by() ####
# Compute grouped data
#Calculate the various measurements of the species of the iris data set using by()

#根據iris的種類，計算第一個變量的平均
by(iris[, 1], iris$Species, mean)

#根據iris的種類，計算第一至第四個的變量平均
by(iris[, 1:4], iris$Species, colMeans)

#根據iris的種類，計算第一至第四個的變量總和
by(iris[, 1:4], iris$Species, colSums)

#根據iris的種類，計算第一至第四個的變量之基本統計量
by(iris[, 1:4], iris$Species, summary, na.rm=T)

#*************************************
# 5 by() Quiz ####
#使用airquality數據集計算以下數值
#(1)計算各變量之遺漏值 
#(2)根據每個月份計算第三個變量(wind)的平均
#(3)根據每個月份計算前四個變量(wind)的平均, 並排除遺漏值
#(4)根據每個月份計算前四個變量(wind)的基礎統計量, 並排除遺漏值。 hint:use "summary"
head(airquality)


#(1)計算各變量之遺漏值 
#hint:使用colSums() & is.na(), or use apply()
colSums(is.na(airquality))
apply(airquality, 2, function(x) sum(is.na(x)))


#(2)根據每個月份計算第三個變量(wind)的平均

by(airquality[, 3], airquality$Month, mean)


#(3)根據每個月份計算前四個變量(wind)的平均, 並排除遺漏值

by(airquality[, 1:4], airquality$Month, colMeans, na.rm=T)


#(4)根據每個月份計算前四個變量(wind)的基礎統計量, 並排除遺漏值
by(airquality[, 1:4], airquality$Month, summary, na.rm=T)


# **************************************************
# 6. Function ####

# 函數的優點包括：
# 1. 使程式碼更好理解
# 2. 若需修改程式碼，若有搭配function的使用，只需要修改函數中的程式碼，其他部分則維持原有叫用函數方式即可
# 3. 程式碼可以重複使用

# 自訂函數的架構
# 1. 函數名稱（function name）
# 2. 輸入與參數（inputs and parameters）
# 3. 主體（body）
# 4. 輸出（outputs）
# 5. 保留字（ function 、 return() ）

#首先要給函數取個名字（function name），利用function 告訴 R 語言這是一個函數，接著在小括號中放入想好的輸入（inputs）與參數（parameters），然後在大括號內縮排撰寫我們主要的程式（body），最後是將輸出（outputs）放在保留字 return() 裡頭。

# 語法：
# function_name <- function(輸入1, 輸入2, ..., 輸入 n, 參數1, 參數2, ..., 參數 n){
#   # 呼叫函數後執行的程式
#   return(輸出)
# }

#************************
# example 1 將輸入的數字平方的函數
my_squared <- function(x) {
  y <- x ^ 2
  return(y)
}

my_squared(2)

# ************************
# example 2 計算平均值的函數
myMean<-function(vec){
  m <- sum(vec) / length(vec)
  return(m)
}
myMean(1:6)

# ***********************
# example 3 clean_data() 函數
df <- data.frame(X = c(1, 2, 3, 4, NA), 
                 Y = c(1, 2, 3, NA, 5), 
                 Z = c(1, 2, NA, 4, 5))
df
nrow(df)
# 自訂函數
clean_data <- function(df, value){
  n_rows <- nrow(df)
  for (i in 1:n_rows){
    df[i, ][is.na(df[i, ])] <- value # 把 NA 用某個數值取代
  }
  return(df)
}

clean_data(df, 999)

#**********************
# 7. Function QUIZ
# 請創造一個bmi的函數，並計算出你的BMI是多少
# BMI計算公式: BMI = 體重(公斤) / 身高(公尺)的平方
# 且定義出你的bmiLabel(如果bmi < 18.5代表"過輕", 如果> 30代表"肥胖"，如果>= 18.5 & < 25代表"正常"，剩下的都是"過重")
# 以上兩個條件請寫在同一個function()裡
# hint : 
bmi_calculator <- function(height, weight) {
  # 請計算出BMI
  BMI <- weight / (height^2)
  
  # 請定義出bmiLabel
  if(BMI < 18.5){
    #print("過輕")
    bmi_label <- "過輕"
  }else if(BMI > 30){
    #print("肥胖")
    bmi_label <- "肥胖"
  }else if(BMI >= 18.5 & BMI < 25){
    #print("正常")
    bmi_label <- "正常"
  }else{
    #print("過重")
    bmi_label <- "過重"
  }
  
  bmi <- BMI
  
  bmi_list <- list(
    bmi = bmi,
    bmiLabel = bmi_label
  )
  return(bmi_list)
}

bmi_calculator(123,3532)

