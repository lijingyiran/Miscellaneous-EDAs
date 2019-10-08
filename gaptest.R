library(gapminder)
library(tidyverse)
write_csv(gapminder, "./gapminder.csv")
view(gapminder)

gapsum <- gapminder %>%
  group_by(continent) %>% 
  summarize(ave_life = mean(lifeExp))
view(gapsum)
write_csv(gapsum, "./gapsum.csv")

gapsum %>% 
  ggplot(aes(x = continent, y = ave_life)) +
  geom_point()


###########
gapcsv <- read_csv('./gapsum.csv') #dot means current directory

view(gapcsv)
ls() #outputs all files in environment

install.packages("here")
library(here) 

# anther way to use here
# platform agnostic:
here::here("test", "tes", "te", "t", "gapsum.csv")
write_csv(gapsum, here::here("test", "tes", "te", "t", "gapsum.csv")
)
set_here()

###############
data_url <-  "http://gattonweb.uky.edu/sheather/book/docs/datasets/GreatestGivers.xls"

# read.csv can directly import urls but read_excel requires you to download first

#old way
download.file(url = data_url, destfile = paste('./datasets/', file.name))
#using here::here
download.file(url = data_url, destfile = here::here("test", "greatestGiverrs.xls"))

file_name <- basename(data_url) #gets file name from the url so don't have to type in, prevents typo errors

download.file(url = data_url, destfile = here::here("test", basename(data_url)))

library(readxl)
phi <- read_excel(here::here("test", file_name), trim_ws = T) #trim whitespace before and after
view(phi)
# still exists leading whitespace for numbers in column 

mri_file = here("test", "Firas-MRI.xlsx")
mri <- read_excel(mri_file, range = "A1:L12")
view(mri)
mri <- mri[,-10]
mri <- mri %>% 
  pivot_longer(cols = 'Slice 1':'Slice 8', 
               names_to = 'slicenum',
               values_to = 'value')
