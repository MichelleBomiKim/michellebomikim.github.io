# final project - map of inflation across the U.S. States
library(dplyr)
# import the data
# national inflation data
usdf <- read.csv("https://raw.githubusercontent.com/kyndall-brown/homeworkcode/main/inflationdata/national-inflation-data.csv")
# metropolitan statistical area personal income data
msadf <- read.csv("https://raw.githubusercontent.com/kyndall-brown/homeworkcode/main/inflationdata/per-capita-personal-income-msa.csv")
# state personal income data
statedf <- read.csv("https://raw.githubusercontent.com/kyndall-brown/homeworkcode/main/inflationdata/per-capita-personal-income-states.csv")

# create empty dataframe for the 50 states
statesmapdf <- data.frame(
  observation_date = c(""),
  state_name = c(""),
  personal_income = c(""),
  personal_yoy = c("")
)
# fill dataframe by iterating through list of states
for (i in 1:50) {
  tempdf <- data.frame (
    observation_date = statedf$observation_date,
    state_name = state.name[i],
    personal_income = statedf[i+1],
    personal_yoy = statedf[i+51]
  )
  # rename the columns to be the same as statesmapdf
  colnames(tempdf) <- c("observation_date", "state_name", "personal_income",
                        "personal_yoy")
  # bind them onto the bottom of statesmapdf
  statesmapdf <- rbind(statesmapdf, tempdf)
}



colnames(tempdf) <- c("observation_date", "state_name", "personal_income",
                      "personal_yoy")
#usmap
library(usmap)
library(ggplot2)
st <- statedf %>% filter(observation_date >"2020-01-01")
colnames(st) <- c("observation_date","AL", "AK", "AZ", "AR", "CA", "CO", "CT","DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY")
plot_usmap(data = "observation_date", values = "state", color = "red" ) + 
  scale_fill_continuous(low = "white", high = "red", name = "personal income") + theme(legend.position = "right") 


# final project - map of inflation across the U.S. States
library(dplyr)
# import the data
# national inflation data
usdf <- read.csv("https://raw.githubusercontent.com/kyndall-brown/homeworkcode/main/inflationdata/national-inflation-data.csv")
# metropolitan statistical area personal income data
msadf <- read.csv("https://raw.githubusercontent.com/kyndall-brown/homeworkcode/main/inflationdata/per-capita-personal-income-msa.csv")
# state personal income data
statedf <- read.csv("https://raw.githubusercontent.com/kyndall-brown/homeworkcode/main/inflationdata/per-capita-personal-income-states.csv")
install.packages("ggplot2")
library(usmap)
library(ggplot2)
usdf <- read.csv
plot_usmap(regions = "states") + 
  labs(title = "US state",
       subtitle = "This is a blank map of the counties of the United States.") + 
  theme(panel.background = element_rect(color = "green", fill = "skyblue"))

plot_usmap(data =   , values = "observation_date", color = "pink") + 
  scale_fill_continuous(name = "Annual CPI", label = scales::comma) + 
  theme(legend.position = "right")

cpi <- `FPCPITOTLZGUSA.(1)`




namelist <- c("observation_date", state.name, paste0(state.name, "_yoy"))
colnames(statedf) <- namelist

#10 states per capita income 
library(ggplot2)
library(gganimate)
p = ggplot( color = "pink") +
  geom_line(data = HIPCPI, aes(x = DATE, y = HIPCPI), color = "blue") +
  geom_line(data = IAPCPI, aes(x = DATE, y = IAPCPI), color = "red") +
  geom_line(data = KYRPIPC, aes(x = DATE, y = KYRPIPC), color = "green") +
  geom_line(data = LAPCPI, aes(x = DATE, y = LAPCPI), color = "Skyblue") +
  geom_line(data = MDPCPI, aes(x = DATE, y = MDPCPI), color = "lightpink") + 
  geom_line(data = IDPCPI, aes(x = DATE, y = IDPCPI), color = "mediumpurple1") +
  geom_line(data = MEPCPI, aes(x = DATE, y = MEPCPI), color = "burlywood4") +
  geom_line(data = KSPCPI, aes(x = DATE, y = KSPCPI), color = "coral2" ) +
  scale_color_viridis_d() +
  theme(panel.grid.major = element_line(colour = "blue"), panel.grid.minor = element_line(colour = "skyblue")) +
  theme(legend.position = "top") +
  transition_reveal(DATE) +
 labs(x = "DATE", y = "Per capita income", title = "Comparing per capita income", col.main = "blue", subtitle = "Which state has highest per capita income?", col.sub = "orange") +
view_follow(fixed_y = TRUE)
p 
#us inflation
library(dplyr)
library(ggplot2)
library(gganimate)
g <- national_inflation_data_1_ %>%
  select(observation_date, CPALTT01USM657N)
library(tidyverse)



# Graph the data
R <- ggplot(g, aes(observation_date, CPALTT01USM657N, group=1)) +
  geom_point() +
  geom_line()
R

#inflation graph 
library(ggplot2)
library(gganimate)
df <- `FPCPITOTLZGUSA_2_`
G = ggplot(df, aes(x = DATE, y = FPCPITOTLZGUSA, group = 1)) +
  geom_point(color = "pink") +
  geom_line(color = "red") +
  ylab("Inflation") +
  labs(title = "Inflation 1960 ~ 2021") +
  theme(plot.title = element_text(color = "blue"))
G + theme_linedraw() + theme_dark() +
  theme(plot.background = element_rect(fill = "cadetblue4")) +
  transition_reveal(DATE)

#Graph household income and personal household income 
r <- MEHOINUSA672N_1_
t <- MEPAINUSA672N
b <- ggplot() +
  geom_line(data = MEHOINUSA672N_1_, aes(x = DATE, y = MEHOINUSA672N_1_), color = "blue") +
  geom_line(data = MEPAINUSA672N, aes(x = DATE, y = MEPAINUSA672N), color = "Red") +
  scale_color_viridis_d() +
  theme(panel.grid.major = element_line(colour = "blue"), panel.grid.minor = element_line(colour = "skyblue")) +
  theme(legend.position = "top") +
  labs(x = "DATE", y = "Dollars", title = "Comparing per capita income", col.main = "blue", subtitle = "Similar trend?", col.sub = "orange") +
  view_follow(fixed_y = TRUE)
b + transition_reveal(DATE)
#growth of inflation in percentage 
library(dplyr)
library(ggplot2)
f <- usdf %>% select(observation_date, CPALTT01USM657N)
library(grid)
myarrow = arrow(angle = 10, ends = "both", type = "closed")
f2 <- ggplot(f, aes(x = observation_date, y = CPALTT01USM657N, group = 1)) +
  geom_line(color = "blue") +
  geom_point(color = "aquamarine") +
  ylab("Inflation growth (*100)") +
  scale_color_viridis_d() +
  xlab("Year 1968~2021")
f2  
#growth of perssonal income 
library(dplyr)
p <- MEPAINUSA672N %>% +
arrange(DATE) %>% +
mutate(Diff_DATE = DATE - lag(DATE),
       diff_MEPAINUSA672N = MEPAINUSA672N - lag(MEPAINUSA672N), 
       Rate_percent = (diff_MEPAINUSA672N / Diff_DATE / DATE * 100))
#comparing texas v 3 top highest per capita income 
library(gganimate)
Ny <- NYPCPI
Tx <- TXPCPI
Ma <- MAPCPI
Ca <- CAPCPI
j <- ggplot(data = statedf, aes(Color )) +
  geom_line(data = Ny, aes(x = DATE, y = NYPCPI), color = "green") +
  geom_line(data = Tx, aes(x = DATE, y = TXPCPI), color = "firebrick") +
  geom_line(data = Ma, aes(x = DATE, y = MAPCPI), color = "blue") +
  geom_line(data = Ca, aes(x = DATE, y = CAPCPI), color = "yellow") + 
  scale_colour_viridis_d() +
  ylab("Dollars per year") +
  labs(title = "NY,MA,CA vs. TX", subtitle = "Texas almost met their capita income level in late 1970!", caption = "Source:FRED")
 
j + transition_reveal(DATE)

#retry
library(tidyverse)
install.packages("lubridate")
library(lubridate)
library(gganimate)
install.packages("transformr")
library(transformr)
library(RColorBrewer)
library(gifski)
library(usmap)
library(maps)
library(mapdata)

# import the data: it's all from FRED
# national inflation data
usdf <- read.csv("https://raw.githubusercontent.com/kyndall-brown/homeworkcode/main/inflationdata/national-inflation-data.csv")
# metropolitan statistical area personal income data
msadf <- read.csv("https://raw.githubusercontent.com/kyndall-brown/homeworkcode/main/inflationdata/per-capita-personal-income-msa.csv")
# state personal income data
statedf <- read.csv("https://raw.githubusercontent.com/kyndall-brown/homeworkcode/main/inflationdata/per-capita-personal-income-states.csv")
library(tidyverse)
library(dplyr)
# data cleaning
msadf[msadf == "#DIV/0!"] <- NA
statedf[statedf == "#DIV/0!"] <- NA
usdf$observation_date <- as_date(dmy(usdf$observation_date))
statedf$observation_date <- as_date(ymd(statedf$observation_date))
Sys.setenv(TZ = 'GMT')
usdf$observation_date <- as.POSIXct(usdf$observation_date, tz="")
statedf$observation_date <- as.POSIXct(statedf$observation_date, tz="")
# drop states observations with no matching national inflation #s
statedf <- statedf %>%
  filter(observation_date >= usdf$observation_date[[1]])
usdf <- usdf %>%
  filter(observation_date <= statedf$observation_date[[74]])
statedf <- inner_join(statedf, usdf)

# rename columns to states and inflation names
# columns 2-51 are state data
# columns 52-101 are state wage growth
# columns 102-106 are national inflation
# i renamed the inflation columns as follows
# cpi_total_gr = Consumer Price Index: Total All Items for the United 
#     States, Growth rate previous period, Annual, Not Seasonally 
#     Adjusted (CPALTT01USM657N)
# cpi_sticky_fe = Sticky Price Consumer Price Index less Food and Energy,
#     Percent Change from Year Ago, Annual, Seasonally Adjusted
#     (CORESTICKM159SFRBATL)
# cpi_urban_fe = Consumer Price Index for All Urban Consumers: All Items 
#     Less Food and Energy in U.S. City Average, Percent Change, Annual, 
#     Seasonally Adjusted (CPILFESL_PCH)
# personal_con_exp = Personal Consumption Expenditures: Chain-type Price 
#     Index, Percent Change, Annual, Seasonally Adjusted
#     (PCEPI_PCH)
# cpi_urban = Consumer Price Index for All Urban Consumers: All Items in 
#     U.S. City Average, Percent Change, Annual, Seasonally Adjusted
#     (CPIAUCSL_PCH)
namelist <- c("observation_date", state.name, 
              paste0(state.name, "_yoy"),
              "cpi_total_gr", "cpi_sticky_fe", "cpi_urban_fe",
              "personal_con_exp", "cpi_urban")
colnames(statedf) <- namelist
names(statedf) <- tolower(names(statedf))

# create empty dataframe for the 50 states
statesmapdf <- data.frame(
  observation_date = Date(),
  state_name = character(),
  personal_income = character(),
  personal_yoy = character(),
  cpi_total_gr = integer(),
  cpi_sticky_fe = integer(),
  cpi_urban_fe = integer(),
  personal_con_exp = integer(),
  cpi_urban = integer()
)
# fill dataframe by iterating through list of states
for (i in 1:50) {
  tempdf <- data.frame (
    observation_date = statedf$observation_date,
    state_name = tolower(state.name[i]),
    personal_income = statedf[i+1],
    personal_yoy = statedf[i+51],
    cpi_total_gr = statedf$cpi_total_gr,
    cpi_sticky_fe = statedf$cpi_sticky_fe,
    cpi_urban_fe = statedf$cpi_urban_fe,
    personal_con_exp = statedf$personal_con_exp,
    cpi_urban = statedf$cpi_urban
  )
  # rename the columns to be the same as statesmapdf
  colnames(tempdf) <- c("observation_date", 
                        "state_name", 
                        "personal_income",
                        "personal_yoy", 
                        "cpi_total_gr",
                        "cpi_sticky_fe",
                        "cpi_urban_fe",
                        "personal_con_exp",
                        "cpi_urban")
  # bind them onto the bottom of statesmapdf
  statesmapdf <- rbind(statesmapdf, tempdf)
}

p = ggplot()
for (i in 30:39) { # 1:10 plots the first 10 states
  p = p + geom_line(data = subset(statesmapdf, 
                                  state_name == tolower(state.name)[i], 
                                  select = c("observation_date", 
                                             "state_name", 
                                             "personal_income")), 
                    aes(x = observation_date, 
                        y = personal_income,
                        color = state_name)) 
}
p <- p + scale_color_brewer(name="State", 
                            palette = "Paired") +
  xlab("Year") +
  ylab("Per Capita Personal Income") +
  ggtitle("Income Growth by State, 1948 to 2021") + theme_bw() +
  transition_reveal(observation_date) +
  labs(subtitle = "Source:FRED", caption = "Similar trend through years") +
  theme(plot.background = element_rect(fill = "green3")) 
p

#fonts
# install.packages("extrafont")
library(extrafont)

# Import all the .ttf files from your system
# You will only need to run this once, but it will take a few minutes to finish
font_import()


