#1
https://www.youtube.com/watch?v=7o_doY0FFc8

#2
https://www.youtube.com/watch?v=g1ohIRXi2vY

#3
https://www.youtube.com/watch?v=F4HP3CXijC8

#4
https://www.youtube.com/watch?v=fy_V7TqXEn4&list=TLPQMzEwNzIwMjOvHUjc94I0SA&index=3

#5
https://www.youtube.com/watch?v=RM2azMyo9yI

#6
https://r4ds.hadley.nz/databases.html

# 7. Tutorial kako neke podatke iz R-a, spakovati u bazu i nad njima raditi operacije!
https://www.youtube.com/watch?v=XWFuwSTz8dY

library(DBI)
library(dplyr)
library(dbplyr)
library(NHSRdatasets)

data("ae_attendances")

con <- dbConnect(RSQLite::SQLite(),":memory:")
dbWriteTable(con,"ae_attends",ae_attendances, overwrite=TRUE)
