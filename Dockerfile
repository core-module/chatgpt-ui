# Use official Node.js image as base
FROM node:latest as builder

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json to work directory
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install --frozen-lockfile

# Copy the rest of the application code
COPY . .

# Build the Next.js application
RUN yarn build

# Start a new stage from smaller base image
FROM node:alpine

# Set working directory
WORKDIR /app

# Copy built application from previous stage
COPY --from=builder /app/package.json /app/yarn.lock ./
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public

# Install production dependencies
RUN yarn install --production --frozen-lockfile

# Expose the port Next.js runs on
EXPOSE 3000

# Command to run the Next.js application
CMD ["yarn", "start"]
