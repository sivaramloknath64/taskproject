FROM node:12.7-alpine as build-step
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build --prod

FROM nginx:1.16.0-alpine as prod-stage
COPY --from=build-step /app/dist/dist/taskproject /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]












# ### STAGE 1: Build ###
# FROM node:12.7-alpine AS build
# WORKDIR /app
# COPY package.json package-lock.json ./

# RUN npm install
# COPY . .
# RUN npm run build
# EXPOSE 8080
# # start app
# CMD ["npm", "start"]
