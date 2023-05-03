library(RPostgres)
library(pool)

pool <- dbPool(
  drv = Postgres(),
  dbname = "Mydatabase",
  host = "127.0.0.1",
  port = 5432,
  user = "postgres",
  password = "0823"
)


