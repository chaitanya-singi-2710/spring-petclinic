FROM maven:4.0.0-rc-5-eclipse-temurin-17-alpine AS build
ADD . /app
WORKDIR /app
RUN mvn package

FROM eclipse-temurin:25-jdk-noble AS runtime
COPY --from=build /app/target/*.jar dockerfile.jar
EXPOSE 8080

CMD ["java","-jar","dockerfile.jar"]    
