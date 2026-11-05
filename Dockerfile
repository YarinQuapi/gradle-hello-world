# -=-=-=-=-=-=-=- BUILD -=-=-=-=-=-=-=-
FROM eclipse-temurin:17-jdk AS builder
ARG BUILD_VERSION

WORKDIR /app

COPY gradlew ./
COPY build.gradle.kts ./
COPY gradle ./gradle
COPY src/ src/

RUN sed -i 's/\r$//' gradlew # fixes windows CRLF to LF so it can actually read the file

RUN chmod +x ./gradlew # executable on windows

RUN ./gradlew build -Pversion=${BUILD_VERSION} --no-daemon


#  -=-=-=-=-=-=-=- Ship Image -=-=-=-=-=-=-=-

FROM eclipse-temurin:17-jre-alpine

RUN addgroup -g 1001 -S appgroup && adduser -u 1001 -S appuser -G appgroup

WORKDIR /app
COPY --chown=1001:1001 --from=builder /app/build/libs/*-all.jar app.jar

USER 1001:1001

ENTRYPOINT ["java", "-jar", "app.jar"]