# 1. Descriptive statistics #### 

#美國Motor Trend收集的1973到1974年期間總共32輛汽車的11個指標: 油耗及10個與設計及性能方面的指標
?mtcars
View(mtcars)

#關注焦點是每加侖汽油行駛英里數（mpg）、馬力（hp）和車重（wt）

#method 1
myvars <- c("mpg", "hp", "wt")
head(mtcars[myvars])

#method 2
head(mtcars[,c(1,4,6)])

#**********************************************
#1-1 summary() ####
summary(mtcars[myvars])

#***********************************************
#1-2 Hmisc describe() ####
library(pastecs)
myvars <- c("mpg", "hp", "wt")
stat.desc(mtcars[myvars])

# mean < median ->左偏 ; mean > median -> 右偏
# SE.mean:平均值的標準誤差(樣本數目n愈大，標準誤差就愈小)，可用以粗略的估算母群平均值的信賴範圍。以SE.mean乘以1.96，代表母群之樣本其平均值95%之出現範圍。
# var 變異數
# std.dev 標準差：變異數開根號。單位不同比較無意義(身高、體重)。單位相同，比較不同東西也沒意義(大象體重、貓咪體重)
# coef.var變異系數：標準差除以平均值。變異系數是一種相對差異量數，用以比較單位不同，但數據差異甚大的數據分散情形。>1時通常代表數據離散程度異常(經驗)，需注意數據正確性，如負收入、負產量

#**************************************************
#QUIZ 1-1, 1-2 ####
#請使用以下函數計算鳶尾花各變量的基本描述統計量,並試分析之
# (1)summary()
data("iris")
summary(iris)
# (2)Hmisc describe() 
library(pastecs)
stat.desc(iris[,1:4])


#*************************************************
#分組計算描述性統計量
##***********************************************
#1-3 使用aggregate()分組獲取描述性統計量 ####
#根據自排車或是手排車進行分組, 觀察每加侖汽油行駛英里數（mpg）、馬力（hp）和車重（wt）的描述性統計量
# am= 0(自排車);1(手排車)
myvars <- c("mpg", "hp", "wt")
myvars
head(mtcars)
#平均
aggregate(mtcars[myvars], 
          by=list(am=mtcars$am), 
          mean)

#標準差
aggregate(mtcars[myvars], 
          by=list(am=mtcars$am), 
          sd)

#遺憾! 一次只能返回1個統計量

#************************************************
#QUIZ 1-3 ####
#使用aggregate(),根據鳶尾花(iris)的種類(Species)進行分組, 觀察花萼(Sepal)、花瓣(Petal)長度及寬度(col 1-4)的平均數和標準差
head(iris)
myiris <- c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")
myiris
#平均
aggregate(iris[myiris], 
          by=list(Species=iris$Species), 
          mean)

aggregate(iris[,1:4], 
          by=list(Species=iris$Species), 
          sd)



#********************************************
# 1-4 使用psych包中的describeby()分組計算概述統計量 ####
library(psych)
describeBy(mtcars[myvars], mtcars$am)

# trimmed(Trimmed Mean,切尾均值):去掉兩端的極端值後所計算的算術平均數
# mad:(median absolute deviation, 平均絕對離差):離差(每一數據點到平均數的差)的絕對值，加總起來再除以n。值愈大代表資料愈分散
# skew(Skewness, 偏度):常態分布(偏度=0)、右偏分布（偏度>0）、左偏分布（偏度<0）
# kurtosis(峰度): 常態分布（峰度=3），厚尾（峰度>3），瘦尾（峰度<3）
#************************************************
#QUIZ 1-4  ####
#使用describeby(),根據鳶尾花(iris)的種類(Species)進行分組,觀察花萼(Sepal)、花瓣(Petal)長度及寬度(col 1-4)的概述統計量

library(psych)
describeBy(iris[myiris], iris$Species)



#*************************************************
#2. 頻數表和列聯表 ###
#**************************************************
library(vcd)
View(Arthritis)
#治療情況（安慰劑治療、用藥治療）、性別（男性、女性）和改善情況（無改善、一定程度的改善、顯著改善）均為類別型因子

# 2-1 一維列聯表 ####
#table()函數生成簡單的頻數統計表
mytable<- table(Arthritis$Improved)
mytable

#prop.table()將這些頻數轉化為比例值
prop.table(mytable)

#prop.table()*100轉化為百分比
prop.table(mytable)*100
round(prop.table(mytable)*100, 
      digits = 2) 

#***********************************************
#QUIZ 2-1 ####
#(1)請創建mtcars資料集裡變數am(0(自排車);1(手排車))的一維列聯表
#(2)使用prop.table()將上題(1)的頻數轉化為比例值
#(3)使用prop.table()*100將上題(2)轉化為百分比,計算至小數點第二位









#**************************************************
# 2-2 二維列聯表 ####
library(vcd)

#(1)二維列聯表
mytable2 <- xtabs(~ Treatment+Improved, 
                  data=Arthritis)#次數
mytable2

addmargins(mytable2) #次數+邊際和

prop.table(mytable2)   #比例

round(addmargins(prop.table(mytable2)),
      digits = 2)  #比例+邊際和

#(2)按row生成二維列聯表
#p.s. 1 -> row ; 2 -> col
#row次數&比例&邊際和
margin.table(mytable2, 1)  #次數

prop.table(mytable2, 1)  #比例

addmargins(prop.table(mytable2, 1), 2) #邊際和

#(3)按column生成二維列聯表
#column次數&比例&邊際和
margin.table(mytable2, 2)  #次數

prop.table(mytable2, 2)  #比例

addmargins(prop.table(mytable2, 2), 1)

#邊際和
round(addmargins(prop.table(mytable2, 2), 1), 
      digits = 2)

#**************************************************
# QUIZ 2-2 ####
#請創造數據集mtcars中變量cyl和am的二維列聯表
#p.s. cyl(汽缸數量) / am(0(自排車);1(手排車))
#(1)次數二維列聯表
#(2)次數+邊際和二維列聯表
#(3)比例二維列聯表
#(4)比例+邊際和二維列聯表










#*********************************************
# 2-3 三維列聯表 ####
mytable3 <- xtabs(~ Treatment+Sex+Improved, data=Arthritis)
mytable3

#ftable()函數以一種緊湊的方式輸出多維列聯表
ftable(mytable3)

#治療情況（Treatment）× 性別（Sex）的各類改善情況比例
ftable(prop.table(mytable3, c(1, 2)))
ftable(prop.table(mytable3, c('Treatment', 'Sex')))

#邊際和
round(ftable(addmargins(prop.table(mytable3, c(1, 2)), 3)), digits = 2) 

#百分比
round(ftable(addmargins(prop.table(mytable3, c(1, 2)), 3)) * 100, digits = 2)
