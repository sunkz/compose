FROM openjdk:11-slim
ARG JAR_FILE=sentinel-dashboard-1.8.8.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-Dserver.port=8080","-Dcsp.sentinel.dashboard.server=localhost:8080","-Dproject.name=sentinel-dashboard","-jar","/app.jar"]