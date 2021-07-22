FROM node:14.16.1-buster

# Create and change to the app directory.
WORKDIR D:/Code/dockerTest

# Copy application dependency manifests to the container image.
# A wildcard is used to ensure both package.json AND package-lock.json are copied.
# Copying this separately prevents re-running npm install on every code change.
COPY package*.json ./

COPY index.js ./

# Install production dependencies.
RUN npm install --only=production

EXPOSE 3000

# Run the web service on container startup.
CMD [ "node", "index.js" ]