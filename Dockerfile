FROM node:latest as build

WORKDIR /usr/local/app

# Add the source code to app
COPY ./ /usr/local/app/

# Install all the dependencies
RUN npm install -g npm@8.10.0

# Generate the build of the application
RUN npm run build



FROM nginx:latest
RUN apk add nginx

# Copy the build output to replace the default nginx contents.
COPY --from=build /usr/local/app/dist/employeemanagerapp /usr/share/nginx/html

EXPOSE 80
