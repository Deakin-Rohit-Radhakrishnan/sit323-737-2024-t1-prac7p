FROM node:18
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3040
CMD ["node", "calculator.js"]
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
 CMD curl -f http://localhost:3040/health || exit 1
