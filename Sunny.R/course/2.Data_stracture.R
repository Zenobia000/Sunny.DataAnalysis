#********************************************
# 1. Data Character  ####
#********************************************
#   數據型態	       
#   integer	         
#   number	        
#   logic            
#   character	     
#   factor	         

#   數據結構           
#   vector       	 
#   matrix	         
#   data frame    	 
#   array            
#   list	         

# ****************************************
#1-1 數字 (integer, number) ####
#在R里宣告一个數字

a <- 3 
a
b <- 1.6   

#a和b为「變數」(或是對象)
#<-符號，會把右邊的東西，儲存到左邊的名字裡

#str() _ 確認變量的數據型態
str(a)

#想要轉換數據型態，str()變成integer()
a <- as.integer(3)
str(a)

#   數據型態	       轉換函式
#   integer	         as.integer()
#   number	         as.numeric()
#   logic            as.logic()
#   character	       as.character()
#   factor	         as.factor()

#   數據結構           轉換函式
#   vector       	   as.vector()
#   matrix	         as.matrix()
#   data frame    	 as.data.frame()
#   array            as.array()
#   list	           as.list()
#**********************************************
# 確認變數型態
is.integer(a)
is.integer(b)

#   數據型態	        轉換函式
#   integer	          is.integer()
#   number	          is.numeric()
#   logic             is.logic()
#   character	        is.character()
#   factor	          is.factor()

#   數據結構            轉換函式
#   vector        	  is.vector()
#   matrix	          is.matrix()
#   data frame  	    is.data.frame()
#   array             is.array()
#   list        	    is.list()

#*****************************************************************
# 1-2 布林代數 (logic) ####
# 布林代數(boolean)，代表的是True和False，常用於邏輯式上的判斷
a <- TRUE
b <- FALSE
str(a)        # 確認a的型態
is.integer(b) # 判斷b是不是整數，但b是logic型態，所以回傳FALSE


#*****************************************************************
# 1-3 字串 (character) ####

#定義一個character變量的话，放在右邊的值，要用雙引号(" ")括起来：
professor <- "Dr.Lee"
str(professor)     # 確認professor數據型態

# ****************************************************************
# 1-4 類別变量 (factor) ####

# "nominal variable"
# variable gender with 20 "male" entries and 30 "female" entries 
gender <- c(rep("male",20), rep("female", 30))  # c():串連多個字串(combine values into a vector or list)
gender <- factor(gender) 
gender
summary(gender)

#An ordered factor is used to represent an "ordinal variable"
status <- c("Poor", "Improved", "Excellent", "Poor")
status <- factor(status, order = T, levels = c("Poor", "Improved", "Excellent"))
levels(status)  #查看裡面存在著哪些類別，用levels()

# ********************************
# Quiz 1-4 ####
# 1.共有五位應徵者ApplyID [1-5]，性別(Sex)分別為("male", "female", "male", "male", "female")
# 學歷(degree)分別為("Bachelor", "master", "Bachelor", "doctor", "master")
# 請將應徵者的基本資料(gender及degree)列為factor
# 其中另將degree依程度列為”有序類別”

ApplyID <- c(1,2,3,4,5)
gender <- c("male", "female", "male", "male", "female")  
gender <- factor(gender)   
str(gender)                    
levels(gender)    

#Set factor variables
degree <- c("Bachelor", "master", "Bachelor", "doctor", "master")
degree <- factor(degree, order = TRUE,
                 levels = c("Bachelor", "master", "doctor"))
degree

str(degree)
levels(degree)

#********************************************
# 2. Data Structure  ####
#********************************************
#R has a wide variety of data structure including vectors , matrices, data frames, array and list
#********************************************
#2-1 向量 (vector)####
#「某一行」(row)，或「某一列」(column)，在R里被儲存成vector的形式。定義一個vector，需使用c()

a <- c(5,10,15,20,25)           # 建立一個number vector
b <- c("Tom", "Henry", "John")  # 建立一個character vector
a
b

#定義一個vector變量叫做a，裡面的數字(1~5)就被稱為元素(element)。
#vector的概念其實不難懂，就把它想象成一條長長的火車，每個車廂都存放一個貨品(element)。
#既然是車廂，那就一定有車廂編號，在vector裡面稱為index，表示方式為object[index]

#利用index，取出特定的element
a[3]      # Ans: 15           (取第3個element)
a[1:3]    # Ans: 5 10 15      (取第1~第3個element)
a[c(2,4)] # Ans: 10 20        (取第2和第4個element)

#在vector里有一個需要注意的規則：「每一個element」都會是相同的型態！

a <- c(1, "john", 3) # 若是把number和character同時放入vector里，
a                    # R會自動將所有element的型態，轉變成character 
str(a)

#vector之間進行數學運算：
a <- c(7,8,6,9,5) # 建立一個number vector
b <- c(2,4,6,0,1) # 建立一個number vector

a * b             # a和b的第一個element相乘，第二個element相乘......
b^3               # 對b之中的每一個element三次方
b > 3             # 判斷b之中的哪些值大於 3 ，然後回傳 TRUE/FALSE

#******************************************************************
# Quiz 2-1  ####
# 試寫出：
#1.
#(1)a向量包含k, j, h, a, c, m  (字符形向量)
#(2)b向量包含1, 2, 5, 3, 6, -2, 4  (數值形向量)
#(3)c向量包含True, True, True, False, True, False  (邏輯形向量)

#2.
#(1)選取a向量的第三個元素(element)
#(2)同時選取a向量的第1,3,5個元素(element)
#(3)同時選取a向量的第2-6個元素(element)

#*****************************************************************
# 2-2 Matrices (矩陣)####
# generates 5 x 4 numeric matrix 
y <- matrix(1:20, nrow=5,ncol=4)
y

# another example
cells <- c(1,26,24,68)
rnames <- c("R1", "R2")
cnames <- c("C1", "C2") 
mymatrix <- matrix(cells, nrow=2, ncol=2, byrow=TRUE,
                   dimnames=list(rnames, cnames))
mymatrix

#Identify rows, columns or elements using subscripts.
mymatrix[,2] # column 2 of matrix
mymatrix[1,] # row 1 of matrix 
mymatrix[1,2] # [rows 1,columns 2]
#*****************************************************
#Quiz 2-2 ####
#(1)建立一個3x2的矩陣，依照column分別填入1~6的值
#(2)建立矩陣
#        salary  age
#  Mary   3000   26
#  John   4000   31


#*****************************************************
# 2-3 Data Frames ####
#A data frame is more general than a matrix, in that different columns can have different modes (numeric, character, factor, etc.). This is similar to SAS and SPSS datasets.

ID <- c(1,2,3,4)
Classes <- c("C", "B", "A", "B")
Passed <- c(TRUE,TRUE,TRUE,FALSE)
mydata <- data.frame(ID,Classes,Passed)
mydata

#There are a variety of ways to identify the elements of a data frame .
mydata[,c(2:3)]   # columns 2,3 of data frame
mydata[,c("ID","Classes")]   # columns ID and Classes from data frame
mydata$Passed   # variable x1 in the data frame
mydata[mydata$ID == "3", ]  #想要特定的信息

#************************************************
#Quiz 2-3 ####
#(1)創造data frame賦值為tmp如下
#    Student_ID    name      score
#          1       Helen     80.0
#          2        Lun      36.0
#          3       Leon      88.9
#          4       Kevin     97.5
#          5       Tommy     60.0
#(2)觀察 第4個row X 第3個col   
#(3)看第一人的分數(第一列row)   
#(4)看所有人的分數(第三欄col)
#(5)查看所有人的名字   
#(6)想知道Kevin的所有信息


#**************************************************
# 2-4 Array (陣列) ####
dim1 <- c("A1", "A2")
dim2 <- c("B1", "B2", "B3")
dim3 <- c("C1", "C2", "C3", "C4")
z <- array(1:24, c(2, 3, 4), dimnames=list(dim1, dim2, dim3)) 
z   # 2X3X4 的陣列

# arrays are a natural extension of matrices.
z[1,2,3] 
z[2,3,1]

#***********************************************
# 2-5 List (列表) ####
#列表(list)能解決想要把不同數據型態的值，放到同一個變量裡面的問題
#如：一個人身上其實具備許多信息(性別，年齡，嗜好…)，可是這些信息的型態不盡相同。若我們想要儲存「一個人的所有信息」，就可使用list()

Lee_gender <- "man"
Lee_age <- 18
Lee_hobby <-c("basketball", "swimming")

Dr.Lee <- list(gender = Lee_gender, age = Lee_age, hobby = Lee_hobby)
Dr.Lee
str(Dr.Lee)   # list裡面的結構

#選取第三個元素
Dr.Lee[[3]]
Dr.Lee[["hobby"]]

#simple writting
Dr.Lee <- list(gender="man", age=18, hobby=c("basketball", "swimming"))
Dr.Lee
#*********************************************
#Quiz 2-5 ####
#(1)創建一個mylist如下
# mylist
# $title
# [1] "My First List"

# $names
# [1] "John"  "Mary"  "Sam"   "Peter"  "Susan"

# $ages
# [1] 25 26 18 39 50

# (2)請選取list中第2個元素names

