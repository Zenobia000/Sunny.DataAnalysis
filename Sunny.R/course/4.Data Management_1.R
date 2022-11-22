#1. Creat New Variables   ####
mydata <- data.frame(x1 = c(2,2,6,4),
                     x2 = c(3,4,2,8))
mydata

# Method 1
mydata$sumx <- mydata$x1 + mydata$x2
mydata$meanx <- (mydata$x1 + mydata$x2)/2
mydata

#Method 2
attach(mydata)
mydata$sumx <- x1 + x2
mydata$meanx <- (x1+x2)/2
detach(mydata)
mydata

#Method 3
mydata <- transform(mydata,
                    sumx = x1 + x2,
                    meanx = (x1 + x2)/2)
mydata
#********************************************************
#2. Recoding  ####

#2-1 Example ####
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

View(leadership)

#2-2 Recoding Variables ####

#variable[condition] <- expression

#2-2-1 Recoding a categorical variable
leadership$gender_N[leadership$gender=="M"] <- "1"
leadership$gender_N[leadership$gender=="F"] <- "2"


#2-2-2  Recoding a continuous variable into categorical variable
#Method 1
leadership$age_N [leadership$age > 75] <- "Elder"
leadership$age_N [leadership$age >= 55 & leadership$age <=75] <- "Middle Aged"
leadership$age_N [leadership$age < 55] <- "Young"


#Method 2
leadership <- within(leadership,{
                                 age_N <- NA
                                 age_N[age > 75]              <- "Elder"      
                                 age_N[age >= 55 & age <= 75] <- "Middle Aged"
                                 age_N[age<=55]               <- "Young"
                                 })

#2-3 Renaming Variables  ####

#Method 1
names(leadership)

names(leadership)[2] <- "testDate"
names(leadership)

names(leadership)[6:10] <- c("item1", "item2", "item3","item4", "item5")
names(leadership)

#Method 2 _ plyr package (較常用)
library(plyr)

#rename(dataframe, c(oldnam = "newname", oldnam = "newname",...))

leadership2 <- rename(leadership,
                      c(manager = "managerID", testDate = "Date"))

View(leadership2)
#**********************************************************
# 1 & 2 Quiz ####

#(1)創建data.frame,並命名為data
   #以下為4位同學的100公尺賽跑紀錄
   #NO為序號，sex為性別，goal為賽跑目標之秒數
   #round_1、round_2、round_3為三次練習比賽之秒數

#  No      sex    goal     round_1    round_2   round_3
#  1        F     12.1       12.3      10.7     11.3
#  2        M     10.3       10.6      11.1     12.5
#  3        M     11.5       11.1      12.3     10.7
#  4        F     11.7       13.4      12.9     11.3

No <- 1:4
sex <- c("F", "M", "M", "F")
goal <- c(12.1,10.3,11.5,11.7)
round1 <- c(12.3, 10.6, 11.1, 13.4)
round2 <- c(10.7, 11.1, 12.3, 12.9)
round3 <- c(11.3, 12.5, 10.7, 11.3)

data <- data.frame(No, sex, goal, round1, round2, round3)

data


#(2) 為比較目標與實際練習之差距
    #首先，請創建新變量-三次練習比賽之"平均秒數(ave_round)"
    #其次，將賽跑目標(goal)之秒數與平均秒數相減，創造新變數achieve

data <- transform(data,
                    ave_round = (round1 + round2 + round3)/3,
                    achieve = (goal - ave_round))
data

#(3) 首先，重新將變量achieve編碼成新變量"achieve_yn"
     #achieve >= 0，代表有達到目標，編碼成"yes"
     #achieve < 0，代表未達到目標，編碼成"no"
     #其次，將achieve_yn"轉為factor形式

data <- within(data,{
  achieve_yn <- NA
  achieve_yn[achieve >= 0] <- "yes"    
  achieve_yn[achieve < 0] <- "no"
})



#(4)首先，將變量sex編碼成新變量"sexnew"
     #男性(M)編碼為1，女(F)性編碼為2
     #其次，將sexnew"轉為factor形式
data <- within(data,{
  sexnew <- NA
  sexnew[sex == "M"] <- "1"    
  sexnew[sex == "F"] <- "2"
})

data


#(5)更改變量名稱
     #將第2個變數Sex改為gender
     #第4-6個變數改為"performance_1", "performance_2", "performance_3"

names(data)

names(data)[2] <- "gender"
names(data)

names(data)[4:6] <- c("performance_1", "performance_2", "performance_3")
names(data)


#*************************************************************
#(1)創建data.frame





#*************************************************************
##(2) 為比較目標與實際練習之差距
#首先，請創建新變量-三次練習比賽之"平均秒數(ave_round)"
#其次，將賽跑目標之秒數與平均秒數相減，創造新變數achieve


#************************************************************
#(3) 1. 首先，重新將變量achieve編碼成新變量"achieve_yn"
    #achieve >= 0，代表有達到目標，編碼成"yes"
    #achieve < 0，代表未達到目標，編碼成"no"
    #2. 其次，將achieve_yn"轉為factor形式
# 1. 


# 2.


#***********************************************************
#(4) 1. 首先，將變量sex編碼成新變量"sexnew"
       #男性(M)編碼為1，女(F)性編碼為2         
   # 2. 其次，將sexnew"轉為factor形式

# 1.

 
# 2.

#****************************************************************
#(5)更改變量名稱
   #將第2個變數Sex改為gender
   #第4-6個變數改為 "performance_1", "performance_2", "performance_3"

