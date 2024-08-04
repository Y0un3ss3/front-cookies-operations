# Use the official Node.js 21 image.
FROM node:21-slim

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install --only=production

# Copy the rest of the application code
COPY . .

# Expose port 80 for the application
EXPOSE 80

# Run the application when the container starts
CMD ["npm", "start"]
