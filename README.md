# Final Project Docker Setup

This Docker Compose configuration is designed to set up the backend services needed for Web APP開發 final project. It includes a PostgreSQL database, a FastAPI backend, a Node.js file server, and nginx for reverse proxy. This setup aims to streamline the deployment process for easy deploying purposes.

## Getting Started

To get started, make sure you have Docker installed on your system. You can download and install Docker from the [official Docker website](https://www.docker.com/get-started).

## Installation

1. Clone this repository to your local machine:

   ```
   git clone https://github.com/Dereto/wap-final.git
   ```

2. Navigate to the project directory:

   ```
   cd wap-final
   ```

3. Run Docker Compose to build and start the services:

   ```
   docker-compose up --build
   ```

   This command will download the necessary Docker images, build the custom services, and start the containers.

4. Once the services are up and running, you can access the backend services at the following ports:

   - **FastAPI Backend:** http://localhost:8080/api/
   - **Node.js File Server:** http://localhost:8080/image/

## Configuration

The `.env` file contains environment variables required for the FastAPI service. You can adjust these variables as needed for your environment.

## Usage

With the backend services running, you can now test your frontend deployment against these services. Make sure to configure your frontend application to communicate with the appropriate backend endpoints.

## Testing

For backend api detail, please refer to http://localhost:8080/api/docs, if you can, make sure the api you tried to implement on front end works by Postman or /docs or other debugging tools.

## Cleanup

To stop and remove the Docker containers, you can use the following command:

```
docker-compose down
```

This will stop the running containers and remove them, along with any associated volumes.

## Contributing

If you encounter any issues or have suggestions for improvements, feel free to open an issue or submit a pull request on GitHub.