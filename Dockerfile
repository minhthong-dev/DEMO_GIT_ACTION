FROM maven:3.9.11-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . .

RUN mvn  package -DskipTests

FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar

EXPOSE 3636
ENTRYPOINT ["java", "-jar", "app.jar"]5173/