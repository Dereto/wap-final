# Final Project Docker Setup

This Docker Compose configuration is designed to set up the backend services needed for your final project. It includes a PostgreSQL database, a FastAPI backend, and a Node.js file server. This setup aims to streamline the deployment process for testing purposes.

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
```
SECRET_KEY="09d25e094faa6ca2556c818166b7a9563b93f7099f6f0f4caa6cf63b88e8d3e7"
ALGORITHM="HS256"
ACCESS_TOKEN_EXPIRE_MINUTES="30"

PG_HOST="db"
PG_PORT="5432"
PG_USERNAME="test"
PG_PASSWORD="123"
PG_DBNAME="test"

FS_HOST="node"
FS_PORT="3000"
```

## Usage

With the backend services running, you can now test your frontend deployment against these services. Make sure to configure your frontend application to communicate with the appropriate backend endpoints.

## Testing

The example directory contains my take of login flow, so you can get ideas of how things work. I have tested it on my computer
, if it doesn't work on yours, contact me asap.

The books related api are set up, and every thing should be work now, I hope. Currently, when you tried to fetch pages, you'll receive uuid of the images.
The uuids can be used to get image from fileserver, via url `http://localhost:8080/image/<uuid>`. Note that this url should be able to work inside html <img> tag.
The first book contains preload images, so the uuid you fetch should work. The second and third book only contain dummy uuids,
the fourth book are left blank for you to test add page api.

For backend api detail, please refer to http://localhost:8080/api/docs, if you can, make sure the api you tried to implement on front end works by Postman or /docs or other debugging tools.

## Cleanup

To stop and remove the Docker containers, you can use the following command:

```
docker-compose down
```

This will stop the running containers and remove them, along with any associated volumes.

## Contributing

If you encounter any issues or have suggestions for improvements, feel free to open an issue or submit a pull request on GitHub.

## License

This project is licensed under the [MIT License](LICENSE).
