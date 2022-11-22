# 1大小寫轉換 toupper() tolower() ####
#toupper(x)  Uppercase
toupper("abc")

#tolower(x)  Lowercase
tolower("ABC")  

#*************************************************************
# 2 取出或取代子字串 substr() ####
x <- "abcdef"

#取出一部分子字串
substr(x, 2, 4)

#取代一部分子字串
substr(x, 2, 4) <- "123456"
x

#*************************************************************
# 3 分割字串 strsplit() ####
#第一個參數是輸入的字串，而第二個參數則是分隔字串
strsplit("foo,bar,Foo,BAR", ",")

#使用逗號、句點或空白作為分隔字元
strsplit("foo,bar.Foo BAR", "[,. ]")

#****************************************
# 4 連接字串 past()  ####
c("Hello", 'World')
paste("Hello", "World")

#paste 預設一個空白字元當作分隔符號，將所有的字串連接起來，另可使用 sep 參數自行指定分隔字元
paste("Hello", "World", sep = "-") 

#如不想要有任何分隔符號，可以使用 paste0 
paste0("Hello", "World")

#遇到不同長度的字元向量時，較短的字元向量會被重複使用
paste(c("red", "green"), "apple")

#指定 collapse 參數，paste 就會使用這個參數所指定的內容當作分隔符號，將字元向量中所有的字串全部串接成一個字串
paste(c("red", "green"), "apple", collapse = ", ")

paste(c("red", "green"), "apple", sep = "-", collapse = ", ")

#*************************************************************
# 5 返回pattern的匹配項 grep() ####
#grep(pattern, x) 在字符串向量x中查找一個正則表達式pattern
text <- c("Company", "Coworker", "Cooperation", "Can")

grep("a", text)

#添加一個value參數，賦值為T，則返回匹配項的值
grep("a", text, value = T)

#*************************************************************
# 6 字串取代 sub(), gsub() ####
#sub()只替換向量中每個元素的第一個匹配值，gsub()替換所有匹配值。
text <- c("Company", "Coworker", "Cooperation", "Can")

sub("o", "xx", text)
gsub("o", "xx", text)
