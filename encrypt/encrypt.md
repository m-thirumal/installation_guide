# Encrypting properties file in Spring boot

1.Generating the encrypted value:

  Download and extract from <http://www.jasypt.org/download.html>

  Run the below from the bin of the extracted download:

```bash
 WINDOWS :- encrypt.bat input="testuser" password=MY_PASS
 LINUX    :- ./encrypt.sh input="postgres" password=INDsolv
```

2.Added dependency to the project:

```bash
<dependency>
    <groupId>com.github.ulisesbocchio</groupId>
    <artifactId>jasypt-spring-boot-starter</artifactId>
    <version>1.14</version>
 </dependency>
```

3.Using encrypted username/password in properties.yml:

Place the generated text between `“ENC(” and “)”`
 Build the project.

4.Running your project using spring-boot:run:  Run the below from project directory:

 ```bash
mvn spring-boot:run -Djasypt.encryptor.password=MY_PASS
./gradlew bootRun -Djasypt.encryptor.password=MY_PASS
```

5.Running project’s jar: Run the below from project target directory:

```bash
java -jar target\jasypt-test-0.0.1-SNAPSHOT.jar --jasypt.encryptor.password=MY_PASS
```