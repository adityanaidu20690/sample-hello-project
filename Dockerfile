FROM openjdk:8
ADD target/calculator-1.0-SNAPSHOT.jar calc.jar 
ENTRYPOINT [ "java", "-jar", "calc.jar"]
