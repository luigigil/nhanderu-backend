/opt/wait-for-it.sh postgres:5432 -- yarn migration:run && yarn seed:run
yarn start:prod > /dev/null 2>&1 &
/opt/wait-for-it.sh maildev:1080
/opt/wait-for-it.sh localhost:3000 -- yarn lint && yarn test && yarn test:e2e -- --runInBand
