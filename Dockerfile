FROM openjdk:8
ADD target/calculator-1.0-SNAPSHOT.jar calc.jar 
EXPOSE 8085
ENTRYPOINT [ "java", "-jar", "tweettrend.jar"]
