FROM node:latest
RUN echo " Try to build my application"
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
EXPOSE 3000
ENTRYPOINT ["npm","start"]
