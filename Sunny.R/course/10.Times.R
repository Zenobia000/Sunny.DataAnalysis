# 1. 純日期(Date)
# 2. 日期+時間(Date+time)
# 3. 日期+時間+時區(Date+time+ timezone)

# Object Attributes
# Date()存年、月、日、星期等信息
# POSIX()則可以儲存年、月、日、時、分、秒、時區、星期等訊息

#****************************************************
# 1. Date() ####
# 1.1 as.Date()  ####
as.Date('2021/02/04')
as.Date('2021/2/4')

as.Date('2/14/2021',format='%m/%d/%Y')
as.Date('02/14/2021',format='%m/%d/%Y')

as.Date('2-14-2021',format='%m-%d-%Y')
as.Date('02-14-2021',format='%m-%d-%Y')

# 1.2 Sys.time() & Sys.Date()  ####
# 1.2.1 取現在的時間
Sys.time()           
as.Date(Sys.time())

Sys.Date()   # 取現在的日期

format(Sys.time() , format = "%d-%m-%Y")
format(Sys.time() , format = "%d-%m-%Y %H:%M:%S")

# 1.2.2 取兩個日期的差
Sys.Date() - as.Date('2021/01/01')

difftime('2020-01-05 17:58:03' , '2019-02-04 02:15:11' , units = "days")
difftime('2020-01-05 17:58:03' , '2019-02-04 02:15:11' , units = "secs")

# 1.2.3 時間的加減 
as.Date(Sys.time()) + 30
as.Date('02-14-2021', format='%m-%d-%Y') + 30

# 1.2.4 取出時間的星期
weekdays(as.Date('2021/02/14'))

#**************************************************
# 2. POSIX ####
# POSIXct, POSIXlt 是R系統中DataTimeClasses兩個物件
# 1. POSIXct是總秒數從1970/1/1開始算起
# 2. POSIXlt是列表，裡面有跟時間相關的數值（秒、分、時、日、月、年等）

# Definition : Date Class
class(Sys.time())
# “POSIXct” “POSIXt” 格式會顯示出現在的年、月、日、時間與時區，CST就是時區

# as.POSIXct():字串--> 時間格式
a<- as.POSIXct("2014-05-01", format="%Y-%m-%d")
b <- as.POSIXlt("2014-05-01", format="%Y-%m-%d")
c <- as.POSIXlt(as.character(Sys.time()), format="%Y-%m-%d ")

str(a)
str(b)
str(c)

as.POSIXct("2014-05-01", tz = "UTC")
# ************************************************
# 3. 萃取時間參數 ####
a <- as.POSIXct("2014-05-01", format="%Y-%m-%d")
# 3.1 select year
format(a,format = '%Y')

# 3.2 select week
format(a, format = '%w')

# 3.3 select AM/PM
format(a, format = '%p')
