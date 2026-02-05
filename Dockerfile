# Use official Node.js Alpine image (lightweight)
FROM node:18-alpine

# Set working directory inside container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first (for dependency installation)
COPY package*.json ./

# Install dependencies (production only)
RUN npm install --production

# Copy the rest of the application source code
COPY . .

# Expose the port your Node.js app listens on (e.g., 3000)
EXPOSE 3000

# Command to start the app
CMD ["npm", "start"]