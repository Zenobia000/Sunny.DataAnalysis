# 安裝 ggplot2, gapminder, magrittr
# install.packages(c("ggplot2", "gapminder", "magrittr"))
# 載入 ggplot2, gapminder, magrittr
library(ggplot2)
library(gapminder)
library(magrittr)

# geom_histogram() ：直方圖
# geom_boxplot() ：盒鬚圖
# geom_line() ：線圖
# geom_bar() ：長條圖
# geom_point() ：散佈圖

# 1. geom_histogram() ####
# 繪製 gapminder 資料中人均 GDP（gdpPercap 變數）之分佈
                   # 資料來源（data）
p1 <- ggplot(gapminder, aes(x = gdpPercap)) +    # 美學對應（aesthetic）
         geom_histogram(binwidth = 10000)       # 幾何圖案（geometry）
# binwidth 分箱

# 2. geom_boxplot() ####
# 探索不同洲別（ continent 變數）的人均 GDP（ gdpPercap 變數）分布差異
p2 <- gapminder %>%
        ggplot(aes(x = continent, y = gdpPercap)) + 
        geom_boxplot() 

# 1. 最貧富不均的州別
# 2. 平均而言最富有的州別
# 3. 最窮的州


# 3. geom_line() ####
# 探索台灣的人均 GDP 與年份之變化趨勢
p3 <- subset(gapminder, country=='Taiwan') %>%
        ggplot(aes(x = year, y = gdpPercap)) +
        geom_line()

# 4. geom_bar() ####
# 探索各大洲的資料筆數
p4 <- gapminder[,1:2] %>% 
         unique() %>%
         ggplot(aes(x = continent)) + 
         geom_bar() 

# 5. geom_point() ####
# 探索人均 GDP 與預期壽命之相關
gapminder %>%
    ggplot(aes(x = gdpPercap, y = lifeExp)) + 
    geom_point()

# 調整資料點為深紅色的空心圓形
gapminder %>%
    ggplot(aes(x = gdpPercap, y = lifeExp)) + 
    geom_point(shape = 21, colour = "darkred")

# 以洲別區分資料點形狀顏色
gapminder %>%
    ggplot(aes(x = gdpPercap, y = lifeExp)) + 
    geom_point(aes(shape = continent, 
                   colour = continent)) +  
    theme(axis.title=element_text(size=12),
          text=element_text(family="STKaiti", size=15),
          axis.text.x = element_text(angle = 90))+
    labs(x="GDP",y="Lifetime",title="GDP & Lifetime")


# 6. 繪畫多個圖形於一個畫布上 ####
library(gridExtra)
all_p <- grid.arrange(p1, p2, p3, p4, nrow = 2, ncol = 2)

# 7. save plot ####
setwd("~/Desktop")
ggsave("plot.png",all_p)


#********************************************
# Quiz 12

# 1. 直方圖
q1 <- iris %>% ggplot(aes(x=Sepal.Length)) + 
    geom_histogram(binwidth=1)+
    labs(x="Sepal Length",title="Sepal Length-Width") 

# 2. 箱形圖
q2 <- iris %>% ggplot(aes(x = Species, y = Sepal.Length, color=Species)) + 
    geom_boxplot() +
    scale_color_manual(values=c("red", "blue", "darkgreen")) +
    # scale_color_brewer(palette="Set1") +
    labs(x="Sepal Length",y="Sepal Width",title="Sepal Length-Width") + 
    coord_flip()

# 3. 散點圖
q3 <- iris %>% ggplot(aes(x = Sepal.Length, y = Sepal.Width)) +
    geom_point(aes(color=Species, shape=Species)) +
    labs(x="Sepal Length",y="Sepal Width",title="Sepal Length-Width")

# 4. 整合以上三張圖
grid.arrange(q1, q2, q3, nrow = 1, ncol = 3)
