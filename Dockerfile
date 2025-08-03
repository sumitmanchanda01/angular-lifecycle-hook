# Stage 1: Build the Angular app
FROM node:18-alpine AS build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build --prod

# Stage 2: Serve the app with Nginx
FROM nginx:alpine

COPY --from=build /app/dist/angular-lifecycle-hook/ /usr/share/nginx/html

# Copy custom nginx config if needed
# COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]


# Build the Docker image
# Replace <your-dockerhub-username>/<your-image-name>:<tag> with your values
# docker build -t <your-dockerhub-username>/<your-image-name>:<tag> .
# or, if using buildx:
# docker buildx build -t <your-dockerhub-username>/<your-image-name>:<tag> .

# Log in to Docker Hub
# docker login

# Push the image to Docker Hub
# docker push <your-dockerhub-username>/<your-image-name>:<tag>

# Run the Docker container
# Replace <your-dockerhub-username>/<your-image-name>:<tag> with your values
# docker run -d -p 80:80 <your-dockerhub-username>/<your-image-name>:<tag>
#docker run -d -p 80:80 sumitmanchanda01/angular-lifecycle-hook:latest
# Execute a command inside a running container
# docker exec -it <container_name_or_id> <command>

# Replace <container_name_or_id> and <command> with your values
# Stop a running Docker container
# Replace <container_name_or_id> with your container's name or ID
# docker stop <container_name_or_id>
