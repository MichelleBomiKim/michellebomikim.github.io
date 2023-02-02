Horizontal graphs 
data("S")

print (df)
remove.packages("ggplot2")
install.packages("ggplot2") 
library(ggplot2) 
p <- ggplot(df, aes(x = year, y = Subscribers,))+
  geom_col(aes(fill = "mm"), width = 0.7) + labs(title = "Number of Netflix subscribers")
p + coord_flip()




