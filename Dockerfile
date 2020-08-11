# Stage 1 - Build React App inside temporary Node container
# FROM node:carbon-alpine as react-build
FROM node:12.7-alpine as builder

WORKDIR /usr/src/app
COPY . ./
COPY package.json package-lock.json ./
RUN npm install
RUN npm run ng build  --prod

# Stage 2 - Deploy with NGNIX
FROM nginx:1.15.2-alpine

COPY --from=builder /usr/src/app/dist/taskproject /var/www
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 3000

ENTRYPOINT ["nginx","-g","daemon off;"]


# FROM node:12.7-alpine as build-step
# WORKDIR /app
# COPY package.json package-lock.json ./
# RUN npm install
# COPY . .
# RUN npm run build --prod

# FROM nginx:1.16.0-alpine as prod-stage
# COPY --from=build-step /app/dist/dist/taskproject /usr/share/nginx/html
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]












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
