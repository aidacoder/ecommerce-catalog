# ------------------------------
# Stage 1: Build Vue app
# ------------------------------
    FROM node:22 AS build

    WORKDIR /app
    
    # Copy dependencies
    COPY package*.json ./
    RUN npm install
    
    # Copy source code
    COPY . .
    
    # Build project (Vite)
    RUN npm run build
    
    # ------------------------------
    # Stage 2: Nginx serve hasil build
    # ------------------------------
    FROM nginx:alpine
    
    # Copy build result
    COPY --from=build /app/dist /usr/share/nginx/html
    
    EXPOSE 80
    CMD ["nginx", "-g", "daemon off;"]
    