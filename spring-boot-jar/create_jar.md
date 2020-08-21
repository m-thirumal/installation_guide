# Create jar for Spring-Boot Project

### Gradle:

In `gradle` project, go to project directory run the following command to create jar

	 ./gradlew build

Without test

	./gradlew build -x test
	
	
The above command will create the `JAR` in the directory `/build/libs/ {XXXXX.jar}`
	
	
### Maven:

	 mvn install
	 
To skip test

	mvn install –DskipTests
	
In Mac,
	
	mvn clean package -DskipTests=true
	
	
	
