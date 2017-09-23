library(RPostgreSQL)
library(sf)
library(ggplot2)

conn = dbConnect(PostgreSQL(), dbname='nycgis', user='postgres', host='mlt_host') #[PW not needed b/c that's stored in local config files]

sb.tree =st_read_db(conn, c('dj311','dead_damaged_street_borocd'))

cor(sb.tree$damagedtrees, sb.tree$streetree_count)


plot(sb.tree[,2])

