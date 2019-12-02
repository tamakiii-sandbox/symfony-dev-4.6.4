FROM flyway/flyway:6.0.0-alpine AS production

USER root

RUN apk add --update --no-cache make
ENV PATH /flyway:$PATH

USER flyway

# ---

FROM production AS development

# ---

FROM development AS debug
