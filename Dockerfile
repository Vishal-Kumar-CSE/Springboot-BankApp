# ------------- Stage-1 -----------------

FROM maven:3.8.3-openjdk-17 AS builder

WORKDIR /app

COPY . /app

RUN mvn clean install -DskipTests=true

# ------------ Stage-2 -----------------

FROM openjdk:17-alpine

EXPOSE 8080

COPY --from=builder /app/target/*.jar /app/target/bankapp.jar

ENTRYPOINT ["java","-jar","/app/target/bankapp.jar"]



