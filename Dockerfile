FROM node:8-alpine as build-machine
ADD . app/
WORKDIR app/
RUN sed -i~ "s/Compute/App/g" routes/index.js
RUN sed -i~ "s/Compute/App/g" views/index.pug
RUN sed -i~ "s/Your deployment work!/\
Your deployment is working on App Engine!/g" views/index.pug
RUN npm install

FROM node:8-alpine
WORKDIR app/
COPY --from=build-machine /app /app
ENV PORT=8080
EXPOSE 8080
CMD npm start
