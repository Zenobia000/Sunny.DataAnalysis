#1 Statistical functions ####

# mean()：平均值
# var()：變異數
# sd()：標準差
# median()：中位數
# max()：最大值
# min()：最小值
# sum()：相加
# quantile()：分位數
# range()：極值
data(iris)

#Use iris data
head(iris, n=10)

# select "Sepal.Length"(花萼長度)
iris$Sepal.Length  

mean(iris$Sepal.Length)         #「花萼長度」的平均值

sd(iris$Sepal.Length)           #「花萼長度」的標準差
var(iris$Sepal.Length)          #「花萼長度」的變異數

sd(iris$Sepal.Width)
var(iris$Sepal.Width)


median(iris$Sepal.Length)       #「花萼長度」的中位數

max(iris$Sepal.Length)          #「花萼長度」中的最大值
min(iris$Sepal.Length)          #「花萼長度」中的最小值

sum(iris$Sepal.Length)          #「花萼長度」加總
range(iris$Sepal.Length)        #「花萼長度」最小值和最大值
diff(range(iris$Sepal.Length))  # 極值

quantile(iris$Sepal.Length, probs=0.25)  # 第一四分位數 
quantile(iris$Sepal.Length, probs=0.75)  # 第三四分位數
quantile(iris$Sepal.Length, c(.25, .75)) 
hist(iris$Sepal.Length)
#*****************************************************
# 2 Probability functions ####

#(1)unif	均勻分布
#(2)norm	正態分布(高斯分布)
#(3)binom	二項式分布
#(4)pois	Poisson 分布
#(5)chisq	卡方分布

#********************************************************
# 正態分布隨機數rnorm（）####
# rnorm（n,mean=0,sd=1）  
# n表示生成的隨機數數量；mean是正態分布的均值，默認為0；sd是正態分布的標準差，默認時為1

x <- rnorm(100, 10, 2)
x
hist(x,prob=T,main="normal mu=0,sigma=1") 

# 正態分佈的前題假設 -> 變數轉換