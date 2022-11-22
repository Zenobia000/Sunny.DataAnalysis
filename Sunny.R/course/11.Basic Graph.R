# 1. Bar Plot 長條圖####  
library(vcd)
count <- table(Arthritis$Improved)
count
# 在關節炎研究中，變量Improved記錄了對每位接受了安慰劑或藥物治療的病人的治療結果 
# 28位病人有了明顯改善，14人有部分改善，而42人沒有改善

# 1.1 simple bar plot
barplot(count,
        main="Simple Bar Plot",
        xlab="Improvement", 
        ylab="Frequency")

# Horizontal bar plot
barplot(count,
        main="Horizontal Bar Plot",
        xlab="Frequency", 
        ylab="Improvement",
        horiz=TRUE)

# 1-2 Stacked and grouped bar plots
counts <- table(Arthritis$Improved, Arthritis$Treatment)
counts

# 堆疊長條圖
barplot(counts,
        main="Stacked Bar Plot",
        xlab="Treatment", 
        ylab="Frequency",
        col=c('#99CCCC', '#FFCC99', '#FFCCCC'),
        xlim = c(0, 3.8)
        )

legend("topright",        # Add legend to plot
       legend = c("Marked", "Some", "None"),
       col=c('#99CCCC', '#FFCC99', '#FFCCCC'),
       pch = 16,
       cex = 0.8  # Decrease legend size
       )

# 並列長條圖
barplot(counts,
        main="Grouped Bar Plot",
        xlab="Treatment", ylab="Frequency",
        col=c('#99CCCC', '#FFCC99', '#FFCCCC'),
        legend=TRUE,
        xlim = c(0, 15),
        beside=TRUE)    # FALSE：堆疊長條圖；TRUE：並列長條圖

# *****************************************************
# 2. Pie Charts 餅圖####
# Combine four graphs into one
# par(mfrow=c(2, 2))
slices <- c(10, 12, 4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")

# 2.1 Basic pie charts
pie(slices, 
    labels = lbls,
    main="Simple Pie Chart")

# 2.2 Add percentages to pie chart
pct <- round(slices/sum(slices)*100)
lbls2 <- paste(lbls, " ", pct, "%", sep="")

pie(slices, 
    labels=lbls2, 
    col=rainbow(length(lbls2)),
    main="Pie Chart with Percentages")

# 2.3 3D pie charts
library(plotrix)
pie3D(slices, 
      labels=lbls,
      explode=0.1,
      main="3D Pie Chart ")

# 2.4 Create chart from table
# 計算美國不同地區的州數，並在繪圖之前將此信息附加到了標籤上
mytable <- table(state.region)
lbls3 <- paste(names(mytable), "\n", mytable, sep="")
pie(mytable, 
    labels = lbls3,
    main="Pie Chart from a Table\n (with sample sizes)"
    )

# *****************************************************
# 3. Histograms 直方圖 ####
par(mfrow=c(2,2))

# Simple histogram
hist(mtcars$mpg)  # 每加侖汽油行駛英里數（mpg）

# With specified w bins and color
hist(mtcars$mpg,
     breaks=20,  # 指定組數
     col="red",  # 指定顏色
     xlab="Miles Per Gallon",
     main="Colored histogram")

box()   # 添加外框

# *****************************************************
# 4. Kernel density plot 核密度圖 ####
d <- density(mtcars$mpg)
plot(d, 
     main="Kernel Density of \nMiles Per Gallon")
polygon(d, 
        col="darkred", 
        border="blue")

# *****************************************************
# 5. Box plots 箱形圖 ####
# 使用並列箱線圖研究四缸、六缸、八缸發動機(cyl)對每加侖汽油行駛的英里數(mpg)的影響
# 汽缸數越多越耗油
boxplot(mpg ~ cyl, data=mtcars,
        # col="darkred",
        main="Car Mileage Data",
        xlab="Number of Cylinders",
        ylab="Miles Per Gallon")

# 不同組間油耗的區別非常明顯。同時也可以發現，六缸車型的每加侖汽 油行駛的英里數分布較其他兩類車型更為均勻。與六缸和八缸車型相比，四缸車型的每加侖汽油 行駛的英里數散布最廣(且正偏)。在八缸組還有一個離群點
# *****************************************************
# 6. Dot plots 點圖 ####
par(mfrow=c(1,1))
dotchart(mtcars$mpg, 
         labels=row.names(mtcars), 
         cex=.7,
         main="Gas Mileage for Car Models",
         xlab="Miles Per Gallon")

# 觀察每種車型的每加侖汽油行駛英里數
x <- mtcars[order(mtcars$mpg),]
x$cyl <- factor(x$cyl)
x$color[x$cyl==4] <- "darkred"
x$color[x$cyl==6] <- "darkblue"
x$color[x$cyl==8] <- "darkgreen"
dotchart(x$mpg,
         labels = row.names(x),
         cex=.7,
         groups = x$cyl,
         gcolor = "black",
         color = x$color,
         pch=19,
         main = "Gas Mileage for Car Models\ngrouped by cylinder",
         xlab = "Miles Per Gallon")

# 隨著汽缸數的減少，每加侖汽油行駛的英里數增加。但同時也看到了例外。例如，Pontiac Firebird有8個汽缸，但較六缸的Mercury 280C和Valiant的行駛英里數更多。六缸的Hornet 4 Drive與四缸的Volvo 142E的每加侖汽油行駛英里數相同。同樣明顯的是，Toyota Corolla的油耗最低，而Lincoln Continental和Cadillac Fleetwood 是英里數較低的離群點
