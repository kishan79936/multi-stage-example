FROM openjdk:8-jdk-alpine

# Install required dependencies (like bash & permissions)
RUN apk add --no-cache bash

# Create app directory
WORKDIR /app

# Copy all files (including .mvn, mvnw, pom.xml, src/)
COPY . /app

# Build the app using the Maven wrapper
RUN chmod +x mvnw && ./mvnw clean package -DskipTests

# Expose app port
EXPOSE 8080

# Run the JAR (adjust the JAR name if different)
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/app/target/app.jar"]
