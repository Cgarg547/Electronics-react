# Garg Electronics

Welcome to **Garg Electronics**, a **MERN-Stack E-commerce Application**! This project is a working demo of a full-stack web application that was built using the MERN stack (MongoDB, Express.js, React.js, Node.js). It aims to provide a comprehensive example of building a modern e-commerce platform, covering frontend user interface, backend server logic, database management, and integration with third-party libraries.

## Table of Contents

1. [Introduction](#introduction)
2. [Live Deployment](#live-deployment)
3. [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
4. [Running the Application](#running-the-application)
5. [Testing the APIs](#testing-the-apis)
6. [Swagger API Documentation](#swagger-api-documentation)
7.  [Using the `openapi.yaml` File](#using-the-openapiyaml-file)
8.   [Deployment](#deployment)
9.  [Containerization](#containerization)
10.[Contributing](#contributing)
11. [License](#license)
12. [Creator](#creator)

## Introduction

This project is a demonstration of building an e-commerce application using the MERN stack, which consists of MongoDB (database), Express.js (server), React.js (frontend), and Node.js (runtime environment). The application allows users to browse products, add them to a shopping cart, proceed to checkout, and simulate the order processing. It includes basic validations for user inputs and simulates the checkout process on the backend.

## Live Deployment

The application is deployed live on Vercel. You can access it at the following URL: **[Garg Electronics App](https://garg-electronics-app.vercel.app).**


## Getting Started

### Prerequisites

Before running this project, ensure you have the following installed:

- Node.js (with npm)
- MongoDB (with either local or remote instance)
- Git

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/cgarg547/MERN-Stack-Ecommerce-App.git
   cd MERN-Stack-Ecommerce-App  # Fix the path if necessary
   ```

2. Install project dependencies:
   ```bash
   # Install server (backend) dependencies
   cd backend
   npm install

   # Install client (frontend) dependencies
   cd ..
   npm install
   ```
   
3. Set up the backend:

   - Create a `.env` file in the `backend/` directory and add the following environment variable (replace the URI with your MongoDB connection string):
     ```
     MONGO_URI=mongodb://localhost:27017/Ecommerce-Products
     JWT_SECRET=your_secret_key
     ```
     
     For your information, I am using MongoDB Atlas for this project. You can create a free account and get your connection string from there if you want to deploy the application to the cloud.
 
    - Ensure that your MongoDB server is running. If you're using Mac, you can start the MongoDB server with the following command:
     ```bash
     brew services start mongodb-community
     ``` 

   - Seed the database with sample data:
     ```bash
     cd backend/seed
     node productSeeds.js dev
     ```
     
   - Run the backend server: (first `cd` into the backend directory)
     ```bash
     cd ..
     npm start
     ``` 
     
4. Set up the frontend:
   - First, `cd` into the `root` directory if you are not already there:
     ```bash
     cd ..
     ```
     Or
        ```bash
        cd fullstack-ecommerce
        ```
   - Start the frontend development server:
     ```bash
     npm start
     ```
> [!TIP]
> The frontend server will run on `http://localhost:3000` by default. If you encounter any errors when starting related to the `react-credit-cards-2` package, it is OK to just ignore them as the application will still run correctly.

## Running the Application

- Open your browser and navigate to `http://localhost:3000` to view the application.

## Testing the APIs

- Simply open your browser and navigate to `http://localhost:5000/api/products` to view the list of products.
- You can also change the sample data by navigating to `backend/seed/productSeeds.js` and modifying the data there.

## Swagger API Documentation

- The backend server includes Swagger API documentation that can be accessed at `http://localhost:5000/api-docs`.
- Before accessing the above URL, ensure that the backend server is running.
- The Swagger UI provides a detailed overview of the API endpoints, request/response schemas, and example requests.

### Using the `openapi.yaml` File

1. **View the API Documentation**
- Open [Swagger Editor](https://editor.swagger.io/).
- Upload the `openapi.yaml` file or paste its content.
- Visualize and interact with the API documentation.

2. **Test the API**
- Import `openapi.yaml` into [Postman](https://www.postman.com/):
  - Open Postman → Import → Select `openapi.yaml`.
  - Test the API endpoints directly from Postman.
- Or use [Swagger UI](https://swagger.io/tools/swagger-ui/):
  - Provide the file URL or upload it to view and test endpoints.

3. **Generate Client Libraries**
- Install OpenAPI Generator:
  ```bash
  npm install @openapitools/openapi-generator-cli -g
  ```
- Generate a client library:
  ```bash
  openapi-generator-cli generate -i openapi.yaml -g <language> -o ./client
  ```
- Replace `<language>` with the desired programming language.

4. **Generate Server Stubs**
- Generate a server stub:
  ```bash
  openapi-generator-cli generate -i openapi.yaml -g <framework> -o ./server
  ```
- Replace `<framework>` with the desired framework.

5. **Run a Mock Server**
- Install Prism:
  ```bash
  npm install -g @stoplight/prism-cli
  ```
- Start the mock server:
  ```bash
  prism mock openapi.yaml
  ```

6. **Validate the OpenAPI File**
- Use [Swagger Validator](https://validator.swagger.io/):
  - Upload `openapi.yaml` or paste its content to check for errors.

This guide enables you to view, test, and utilize the API. You can generate client libraries, server stubs, and run a mock server using the OpenAPI Specification.

## Deployment

To deploy the application:

- Configure deployment settings for both frontend (React) and backend (Node.js) according to your chosen hosting provider (e.g., AWS, Heroku, Netlify).

## Containerization

This project can be containerized using Docker. First, ensure that Docker Desktop is running on your system. Then, to create a Docker image, run the following command:
```bash
docker compose up --build
```

This command will create a Docker image for the frontend and backend, and run the application in a containerized environment.

## Contributing

Contributions to this project are welcome! Here are some ways you can contribute:

- Report bugs and request features by opening issues.
- Implement new features or enhancements and submit pull requests.
- Improve documentation and README files.

## License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

## Creator

- **Chirag Garg** - [Cgarg547](https://github.com/cgarg547)
- **Email:** [chiraggargkkp@gmail.com](mailto:chiraggargkkp@gmail.com).

---

Thank you for exploring **Garg Electronics - a MERN Stack E-commerce Application**! If you have any questions or feedback, feel free to reach out or open an issue.

**Happy coding! 🚀**
