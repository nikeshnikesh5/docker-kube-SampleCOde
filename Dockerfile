FROM node:18
WORKDIR  /app
COPY app/app.js .
CMD ["node","app.js"]

