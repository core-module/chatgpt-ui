# Use official Node.js 18 Alpine image as base
FROM node:18-alpine AS build

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json package-lock.json ./

# Install dependencies
RUN npm ci --only=production

# Copy the rest of the application
COPY . .

# Build the Next.js application
RUN npm run build

# Use lightweight Node.js 18 Alpine image for runtime
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy built app and dependencies from build stage
COPY --from=build /app/.next ./.next
COPY --from=build /app/public ./public
COPY --from=build /app/node_modules ./node_modules

# Expose the port
EXPOSE 3000

# Command to run Next.js in production mode
CMD ["npm", "start"]
