# 1 Repetition and looping ####

#兩種循環           for()  &  while() 
#兩種改變循環狀態   break  &  next 

#***************************************************
# 1-1 for() ####
# The syntax is :
# for (n in x) ｛statement}

#R中最基本的是for循環，其中n為循環變量，x通常是一個序列。n在每次循環時從x中順序取值，代入到後面的statement語句中進行運算

#Example 1
for (i in c(1:10)) {
    print("Hello")}

#Example 2
# 計算 1+2+3+4...+135 的值是多少？

result_2 <- 0

for(i in c(1:135)){            # for-loop里，i會依序帶入1~135的值，重復進行括號內的程序代碼
    result_2 <- result_2 + i   # 循環內重復進行的動作
}

result_2

#Example 3
colors <- c("red", "blue", "yellow")

for (i in colors) {
    result_3<- paste("The color is ", i, sep=" ")
    print(result_3)
}

#**************************************************
# 1-2 for() Quiz ####
# Output :
# [1] "1 is sample"
# [1] "2 is sample"
# [1] "3 is sample"
# [1] "4 is sample"
# [1] "5 is sample"
# [1] "6 is sample"
# [1] "7 is sample"
# [1] "8 is sample"
# [1] "9 is sample"
# [1] "10 is sample"

for (i in c(1:10)) {
  result <- paste(i, "is a sample", sep=" ")
  print(result)  
}



#Go through the samples one by one and print them out:
#for (i in sample){
#                 print(i)
#                 }



#*****************************************************
# 1-3 while() ####

# The syntax is :
#while (condition) {statement}
#當不能確定循環次數時，需要用while循環語句。在condition條件為真時，執行大括號內的statement語句

#Example 1
i <- 10
while (i > 0) { 
    i <- i - 1
    print("Hello")
}

#Example 2
# 計算 1+2+3+4...+135 的值是多少？
i <- 0
result <- 0

while(i < 135){   # while-loop當符合裡面的條件時，就會一直重復括號內的程序代碼，直到不符合為止
    i <- i + 1             # loop內重復進行的動作
    result <- result + i
}

result

#**************************************************
# 1-4 break & next ####
# break 主要用來跳出循環
for(i in c(1:5)){
    if(i == 3) break # 當i等於3的時候，跳出循環
    print(i)  # loop內重復進行的動作 
}


# next 主要用來省略此次迴圈的行為，直接進入下一次迴圈

for(i in c(1:5)){
    if(i == 3) next  # 當i等於3的時候，省略此次迴圈(skip)的動作，從下一個i=4開始
    print(i)        # 迴圈內重複進行的動作
}

#*************************************************
# 1-5 break & next Quiz ####
#data 1~1000
## (1)當i等於20的時候，跳出循環
## (2)當i等於20的時候，省略此次迴圈(skip)的動作
for(i in 1:1000){
  if(i == 20)
    break
    print(i)
}

for(i in 1:30){
  if(i == 20)
    next
    print(i)
    
}



#(1)
for(i in 1:1000) {
    if(i == 20) break  ## Stop loop after 20 iterations
    print(i)      
}

#(2)
for(i in 1:1000) {
    if(i == 20) next ## Skip the first 20 iterations
    print(i)                          
}

#**********************************************
# 2 Conditional execution ####
# 2-1 if-else ####
#用在邏輯判斷，若需依條件改變執行的程序代碼，就會使用if-else，若if後所接邏輯判斷為真(TRUE)，就會執行if下方之程序代碼，若為偽(FALSE)，則執行else下方之程序代碼，若程序中沒有else片段，則不執行任何程序代碼

# The syntax is :

# if (cond) {statement}
# if (cond) {statement1} else {statement2}

#若考試分數大於等於60分，則印出及格，小於60分則印出不及格

score<-59
if(score>=60){
    print("及格")
}else{
    print("不及格")
}

score<-80
if(score>=60){
    print("及格")
}else{
    print("不及格")
}

#*****************************************************
# 2-2 if - else if - else ####

# The syntax is :
# if(<condition1>) {
#    do something
#    } else if(<condition2>)  {
#    do something different
#    } else {
#    do something different
#    }

#多重邏輯判斷，若考試分數大於等於90分，印出"優良"，介於60到90分間，印出"及格"，小於60分則印出"不及格"，此時就會用到多重邏輯，使用多重邏輯時，會在if和else間新增邏輯區段else if

# Which is CORRECT
# (1)
score<-95
if(score>=90){
    print("優秀")
}else if(score>=60){
    print("及格")
}else{
    print("不及格")
}

# (2)
if(score>=60){
    print("及格")
}else if(score>=90){
    print("優秀")
}else{
    print("不及格")
}


#if - else if - else 敘述是有順序的，若在if敘述判斷為真，就算後方else if判斷也為真，也只會執行if區段的程序代碼

#***********************************************
# 2-3 巢狀if ####
#巢狀if是指在if區段程序代碼內包含其他if-else判斷
#國文分數與英文分數皆大於等於60分，印出全部及格
#國文分數大於等於60分，英文小於60分，則印國文及格，英文不及格，以此類推

CHscore<-95 ##國文成績
ENscore<-55 ##英文成績

if(CHscore>=60){           #在中文及格的情況下
    if(ENscore>=60){
        print("全部及格")
    }else{
        print("國文及格，英文不及格")
    }
}else{                     #在中文不及格的情況下
    if(ENscore>=60){        
        print("英文及格，國文不及格")
    }else{
        print("全部不及格")
    }
}

#**********************************************
# 2-4 ifelse() ####
#可用最短的方式取代if-else()
#The syntax is :
#ifelse(邏輯判斷,判斷為真要執行的程序代碼,判斷為偽要執行的程序代碼)

score<-80
ifelse(score>=60,"及格","不及格")

#ifelse()可一次判斷多個元素

scoreVector<-c(30,90,50,60,80)
ifelse(scoreVector>=60,"及格", "不及格")

ifelse(scoreVector>=90,"優良",
       ifelse(scoreVector >=60, "及格","不及格"))

# supplementary information : use ifelse() on Recoding
data(iris)
head(iris)

#(1)將類別變量重新編碼為尺度型數據
#將3種鳶尾花重新編碼為1,2,3
levels(iris$Species)
iris$Species_N <- ifelse(iris$Species == "setosa",1,
                         ifelse(iris$Species == "versicolor",2,3))
View(iris)

#(2)將連續變量重新編碼為尺度型數據
#Sepal.Length(花萼長度) <= 5 轉變為1 ; <= 6, 轉變為2 ; 其餘為3
iris$Sepal.Length_N <- ifelse(iris$Sepal.Length <= 5, 1,
                              ifelse(iris$Sepal.Length <= 6 ,2, 3))

#****************************************************
# 2-5 Quiz
#(1)一個喜愛運動的人早上起床會看天氣決定當天的行程，在兩種天氣"sunny"& "rainy"條件下，使用sample()隨機抽選當日天氣，並使用 if 跟 else 建立兩種行程"Running outdoors!" & "Working out in the gym!"：
# set.seed(1)
weather <- sample(x=c("sunny","rainy"),size=1,replace=T)
weather

ifelse(weather == "sunny", "running outdoor", "working out in the gym")


#(2)在三種天氣"sunny"&"rainy"&"cloudy"條件下，使用 if、else if 與 else 可以建立出一個三種行程："Running outdoors!" & "Working out in the gym!" & "Cycling!"

weather <- sample(c("sunny", "rainy", "cloudy"), size = 1)
weather
if(weather == "sunny"){
  print("running outdoor!")
}else if(weather == "cloudy"){
  print("cycling!")
}else{
  print("working out in the gym ")
}

# hint: use sample() & if-else()/ifelse



