# CH 15 dplyr ####

#   函數	                    用途
# filter()	          篩選符合條件的觀測值
# select()	          選擇變數
# mutate()	          新增衍生變數
# arrange()	          依照變數排序觀測值
# group_by()	        依照類別變數分組，常搭配 summarise() 函數
# summarise()	        聚合變數

library(tidyverse)  #  can see lots of conflict func. names
# magrittr：使用 %>% 運算子
# dplyr：更有效率地作資料處理

# x %>% 運算子稱作 Pipe operator

# df: mpg-百公里油耗；cyl-氣缸數；disp-排量；hp-馬力；drat-軸距；wt-重量； qsec-百公里時間 ；vs-發動機類型

# 1. filter ####
mtcars %>% filter(cyl < 6)

# Multiple criteria
mtcars %>% filter(cyl < 6 | vs == 1)   #OR
mtcars %>% filter(cyl < 6 & wt >= 2.5)   #AND

# Multiple arguments are equivalent to and
filter(mtcars, cyl < 6, wt >= 2.5)

# 2. mutate ####
mtcars %>% mutate(kg = wt * 1000 / 453.59)

# 3. arrange ####
mtcars %>% arrange(-mpg)

# 4. select
mtcars %>% select(mpg , cyl , wt )  #  positive list
mtcars %>% select(-c(mpg , cyl , wt))  #  negative list

# practice
mtcars %>% 
  select(mpg , cyl , wt) %>% 
  filter(cyl < 8 & wt >= 2.5) %>%
  mutate(kg = wt * 1000 / 453.59) %>%  
  arrange(-mpg, cyl)

# 5. group_by + summarise ####
mtcars %>% 
  group_by(vs , gear) %>% 
  summarise(Counts = n() , 
            Grades = sum(vs+gear)) %>% 
  as.data.frame()

# Noted that it will return tibble class data

# 6. dplyr + ggplot ####
library(ggplot2)
library(ggrepel)
# df: mpg-百公里油耗；cyl-氣缸數；disp-排量；hp-馬力；drat-軸距；wt-重量； qsec-百公里時間 ；vs-發動機類型
str(mtcars)
mtcars %>%
  select(hp , cyl , wt) %>%
  filter(wt >= 1.5) %>%
  mutate(kg = wt * 1000 / 453.59) %>%
  ggplot(aes(kg, hp, color = factor(cyl), label= rownames(mtcars))) +
  geom_point(size=4, shape=16, alpha=0.6) +
  geom_text_repel(size = 2.5)+
  labs(title="mtcarts scatter plot", x="kg", y="hp", color="cyl")
  # +theme_classic() +
  # theme(legend.position="top")  # "none"


# https://ggplot2.tidyverse.org/reference/ggtheme.html
# 主題名稱	                     
# theme_gray()
# theme_bw()
# theme_linedraw()
# theme_light()
# theme_dark()
# theme_minimal()
# theme_classic()
# theme_void()
# theme_test()

  
#**************************************************************
library(nycflights13)
flights <- flights

# year、month、day：起飛日期
# dep_time、arr_time：起飛（departure）時間和到達時間。格式：HHMM，當地時間。
# sched_dep_time、sched_arr_time：計劃起飛時間、計劃到達時間
# dep_delay、arr_delay：起飛延誤、到達延誤
# hour、minute：計劃起飛時間拆分為 hour 和 minute
# carrier：承運商縮寫
# tailnum：飛機尾號
# origin、dest：始發地、目的地
# airtime：空中時間
# distance：機場間距

#1. Had an arrival delay of one or more hours but didn’t leave late
#   Were operated by United(UA), American(AA), or Delta(DL)
#   Departed between midnight and 6am (inclusive)
#   Use desc() to re-order by "dep_delay" in descending order
df <- flights %>% 
  filter(arr_delay >= 60, dep_delay < 0, 
         carrier %in% c("UA","AA","DL"), 
         between(hour,0,6)) %>%
  arrange(desc(dep_delay))

# 2.有多少飛機取消航班 (missing dep_time) ? 占該年總航班數多少百分比
flights %>% filter(is.na(dep_time)) %>% nrow() / flights %>% nrow()

# 3. 請選擇Top10 最會遲到的飛機，並給新變數rank做排名
top10_delay_flight  <- flights %>% 
  arrange(-dep_delay) %>%
  mutate(rank = min_rank(-dep_delay)) %>%
  filter(rank<=10) 

# 4. 請觀察何種時間點(hour)的飛機，到達時間最容易遲到(arr_delay)，並同時觀察各時間點的班機數量
flights %>%
  group_by(hour) %>%
  summarise(count = n(),
            delay = mean(arr_delay, na.rm = TRUE)) %>%
  ggplot(aes(hour, delay)) +
  geom_point(aes(size = count), alpha = 0.3) +
  geom_smooth()

