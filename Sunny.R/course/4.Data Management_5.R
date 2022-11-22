#8. Sampling ####
sample(x=1:10)

#8-1 For numeric ####
sample(x=1:10) # random
sample(x=1:10, size=5, replace=T) # sampling repeating
sample(x=1:10, size=5, replace=F) # sampling without repeating

#8-2 For factor ####

#Example 1
#擲硬幣，拋10次，其中正面（A）與反面（B）出現的次數
set.seed(1)
coin <- sample(x=c("A","B"),size=10,replace=T)
coin
table(coin)
sum(coin=="A")/10
sum(coin=="B")
#Example 2
#有時抽取元素的機率未必相等，需添加一個參數prob，也就是「probability」（機率）的縮寫。假設一名醫生給患者做某手術成功的機率是80%，給20例病人做手術，可能有哪幾次是成功的呢?
##另請問成功的機率是多少？
set.seed(1)
doctor<-sample(x=c("S","F"),
               size=20,
               replace=T,
               prob=c(0.8,0.2))  # 「S」代表成功，「F」代表失敗

table(doctor)
sum(doctor=="S")/20

#Example 3
#每一個元素都可以給定一個機率，且每個機率是獨立的，即在參數prob中，不一定所有元素的機率加起來等於1，它只代表某元素被抽取的機率而已
radom <- sample(x=c(1,3,5,7), size=20, replace=T, prob=c(0.1,0.2,0.3,0.9))
radom
table(radom)

#8-3 For data.frame ####
set.seed(1)
index <- sample(1:nrow(iris), 5)  #在1-150個樣本里隨機抽取五個樣本
index
iris[index, ]

# generalization (sample & models & times & area)
#***************************************************
#穩定性測試by 時間 地域 不同模型間

#8-4 Quiz #### 
#(1) 隨機重復丟擲一骰子60次，將結果存入dice變量，並求出每一個點數所出現的機率，最後驗證總體機率是否為1


#(2) 股票分析師每月預測漲跌有55%會成功，45%會失敗，請問一年間預測可能有幾次成功?成功機率為多少?


#(3) 使用mtcars data，並從中隨機選取10種車
mtcars <- read.csv("C:/sunny.workstation/Sunny.R/3.Data_IO-20221029T010757Z-001/3.Data_IO/mtcars.csv", header=T, sep=",",stringsAsFactors=F)

names(mtcars)

set.seed(1)
index <- sample(1:nrow(mtcars), 5)  #在1-150個樣本里隨機抽取五個樣本
index
mtcars[index, ]









