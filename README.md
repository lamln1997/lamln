Nodejs with docker
****

# Service:
    - Postgresql
    - Rabbitmq
    - Elasticsearch

# Run project
    - Clone project: git clone https://gitlab.com/nhatlam10091997/lamln
    - docker-compose up
    - docker-compose exec server sh
        + npm restart

# Errors
    - Service srever: 
        + error with package bcrypt:
            * step 1 : docker-compose exec server sh
            * step 2: npm install --save bcrypt
    - Service elastichsearch:
        + error: AccessDeniedException:
            sudo chown -R 1000:1000 .docker
