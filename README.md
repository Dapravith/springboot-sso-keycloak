# 🌟 Spring Boot (Single Sign-On) SSO with Keycloak 

Welcome to the **Spring Boot SSO with Keycloak** project! This guide will help you integrate **Spring Boot** with **Keycloak** for **Single Sign-On (SSO)** authentication using **Docker Compose**. This setup allows seamless, secure login flows and provides a robust foundation for modern applications.

---
## 🛠️ Prerequisites

Ensure you have the following tools installed to run the project smoothly:

- **Docker** 🐋: [Install Docker](https://docs.docker.com/get-docker/)
- **Docker Compose** 🛠️: [Install Docker Compose](https://docs.docker.com/compose/install/)
- **Java 21** ☕: [Install Java](https://www.oracle.com/java/technologies/javase-jdk21-downloads.html)
- **Maven** 📦 (or **Gradle** if preferred): [Install Maven](https://maven.apache.org/install.html) / [Install Gradle](https://gradle.org/install/)

---

## 📂 Project Setup

Follow these steps to get the project up and running.

### Step 1: Clone the Repository

First, clone the project from GitHub to your local machine:

```bash
git clone https://github.com/Dapravith/springboot-sso-keycloak.git
cd springboot-sso-keycloak
```

# .env file
```
KEYCLOAK_USER=admin
KEYCLOAK_PASSWORD=admin
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres
```

## Step 3: Run Docker Compose 🐳
Now let's run Docker Compose to spin up the Keycloak and PostgreSQL services:
```
docker-compose up -d
```
This will start Keycloak at http://localhost:8080.
Set up a PostgreSQL database (if applicable).

## Step 4: Import Keycloak Realm and Clients 🔐
Navigate to http://localhost:8080/auth.
Login with the admin credentials (from .env).
In the Administration Console, create a new Realm or import one from the file located at /keycloak/realm-export.json.
Set up clients and users for your application.
## Step 5: Configure Spring Boot Application ⚙️
Update your Spring Boot application settings to connect with the Keycloak server. Modify the application.yml to include Keycloak OAuth2 properties:
```
spring:
  security:
    oauth2:
      client:
        registration:
          keycloak:
            client-id: your-client-id
            client-secret: your-client-secret
            scope: openid
        provider:
          keycloak:
            issuer-uri: http://localhost:8080/auth/realms/{realm}/.well-known/openid-configuration
```
Replace your-client-id, your-client-secret, and {realm} with your actual Keycloak configurations.

## Step 6: Build and Run the Application 🏗️
You can now build and run the Spring Boot application using Gradle.
```
./gradlew build
./gradlew bootRun
```
## Step 7: Access the Application 🌐
Access your Spring Boot application at http://localhost:8090. You will be redirected to Keycloak for authentication.


