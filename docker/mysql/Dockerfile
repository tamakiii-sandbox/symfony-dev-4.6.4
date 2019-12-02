FROM mysql:8.0.17 AS production

COPY mysql.cnf /etc/mysql/conf.d/mysql.cnf

# ---

FROM production AS development

# ---

FROM development AS debug
