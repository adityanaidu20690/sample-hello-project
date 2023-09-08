FROM openjdk:8
ADD calculator/target/calculator-1.0-SNAPSHOT.jar calc.jar 
EXPOSE 8085
ENTRYPOINT [ "java", "-jar", "tweettrend.jar"]
