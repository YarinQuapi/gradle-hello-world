[![Release](https://img.shields.io/github/v/release/yarinquapi/gradle-hello-world)](https://github.com/yarinquapi/gradle-hello-world/releases)
[![Docker Hub](https://img.shields.io/docker/v/yarinquapi/gradle-hello-world?label=docker%20hub&sort=semver)](https://hub.docker.com/r/yarinquapi/gradle-hello-world)

# gradle-hello-world

# Overview
This project is a Java app, built using Gradle. This project is a showcase of an example CI/CD pipeline using Azure DevOps. All the way from automatic version bumping, to Gradle building, making a GitHub release and finally pushing to DockerHub.

## A more technical overview
A few bullet points about the project
* Multi-stage Docker build
* Azure DevOps pipeline
* Built using Gradle

## Questions

### What is Gradle?
Gradle is an open-source build tool for most major JVM languages, used to compile, test and package code efficiently

### How does Gradle work?
Gradle uses scripts like "build.gradle.kts" (or simply build.gradle on projects that aren't Kotlin-dsl-based, but Groovy-dsl-based) that contains "instructions" (may also call them "steps"), on how to build and test the project.
It downloads the specified dependencies from their respective specified repositories (So it is not limited to for example, MavenCentral) and has support for third-party repositories.

### What is the Gradle wrapper?
The Gradle wrapper is a script that allows users that do not have Gradle natively installed still build projects that use Gradle. (Unlike maven for example which has to be natively installed on the user's computer)
This allows for consistency, reliability and easier on users (And systems) that do not have it installed. 
It does it by actually downloading Gradle for you when ran. You can see that in-action in the pipeline logs on Azure Pipelines.


## Basic Setup
Make sure you have **Java 17**, **Docker** and **git** installed.

From there, it's pretty straight-forward. 

### Cloning the repository
```
git clone https://github.com/YarinQuapi/gradle-hello-world && cd gradle-hello-world
```

### Local build using Gradle
```
./gradlew build
```
Then you can run it using:
```
java -jar build/libs/gradle-hello-world-local-build-all.jar
```
#### Or by using Docker locally (Make sure Docker Engine is running)
```
docker build --build-arg BUILD_VERSION=1.0-test -t gradle-hello-world:local .
```
And then you can run it by simply doing:
```
docker run --rm gradle-hello-world:local
```
#### Or alternatively, run it from the official build that is hosted on Docker hub
```
docker run --rm yarinquapi/gradle-hello-world:latest
```
