FROM node:20
RUN echo " Try to build my application"
WORKDIR /app
COPY package.json package-lock.json ./
COPY . .
RUN npm install
# Use nginx image as base for serving Angular application
FROM nginx:latest

# Copy build output from previous stage to nginx html directory
COPY --from=builder /app/dist /usr/share/nginx/html

# Expose port 80 to the outside world
EXPOSE 80

# Start nginx server
CMD ["nginx", "-g", "daemon off;"]

