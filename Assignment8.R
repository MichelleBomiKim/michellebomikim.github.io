# Plotting time series data using TSstudio
install.packages(c("quantmod", "tidyverse","TSstudio"))
# lapply(c("quantmod", "tidyverse","TSstudio"), require, character.only = TRUE)

library(TSstudio)
quantmod::getSymbols("AAPL", src="yahoo")
class(AAPL)
ts_plot(AAPL$AAPL.Adjusted, 
        title = "Apple Stock prices",
        Ytitle = "")
class(AAPL) # What class is this object?

# Some sample dataset from TSstudio
ts_seasonal(USgas, type = "box") # month-year matrix data

# What class is USgas?

# Sample charts
ts_heatmap(USgas)
ts_cor(USgas) # ACF and PACF
ts_lags(USgas, margin = .01)
usgas=data.frame(USgas)


# Plotting time series data using dygraph
# install.packages(c("quantmod", "tidyverse","dygraphs"))
# lapply(c("quantmod", "tidyverse","dygraphs"), require, character.only = TRUE)
install.packages("dygraphs")
library(dygraphs)
par(family="Palatino")
quantmod::getSymbols("TWTR", src="yahoo")

class(TWTR)
m = tail(TWTR, n=30)
m =m[,1:(ncol(m)-2)] # drop last two columns 
names(m)<-c('Open', 'High', 'Low', 'Close') # rename columns for plotting
path <- getwd()
setwd("path of project") # place dygraph.css into the same directory
dygraph(m, main = "Twitter Stock Prices (Candlestick Chart)") 
  dyCandlestickGroup(c('Open', 'High', 'Low', 'Close')) |> 
  dyCandlestick()  |> 
  dyLegend(show = "always", hideOnMouseOut = T) |> #command shift m 
  dyCSS("dygraph.css")



