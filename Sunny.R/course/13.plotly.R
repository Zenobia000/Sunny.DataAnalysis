# 1. plotly  ####
library(plotly)
library(ggplot2)

# Method 1 plot_ly
# diamonds 資料集中包含約五萬多顆鑽石的資料，其中包含鑽石的 4C 品質指標，亦即顏色（color）、淨度（clarity）、切磨（Cut）與克拉（carat），另外包含鑽石的尺寸資訊
head(diamonds)

set.seed(13)
d <- diamonds[sample(nrow(diamonds), 10000), ]

plot_ly(d, 
        x = ~carat, 
        y = ~price, 
        color = ~carat,
        size = ~carat, 
        text = ~paste("Clarity: ", clarity))


# Method 2 ggplot() --> ggplotly()
# step1. 以ggplot() 繪圖
# step2. 將ggplot物件透過ggplotly() 轉成plotly圖形物件

p <- ggplot(data = d, aes(x = carat, y = price)) +
    geom_point(aes(text = paste("Clarity:", clarity))) +
    geom_smooth(aes(colour = cut, fill = cut)) + 
    facet_wrap(~ cut)

ggplotly(p)




