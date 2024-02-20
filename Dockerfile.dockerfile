# Use Node.js image as base
FROM node:latest AS builder

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the Angular app
RUN npm run build --prod

# Use nginx image as base for serving Angular application
FROM nginx:latest

# Copy build output from previous stage to nginx html directory
COPY --from=builder /app/dist /usr/share/nginx/html

# Expose port 80 to the outside world
EXPOSE 80

# Start nginx server
CMD ["nginx", "-g", "daemon off;"]
