# Frequently used Queries

1. Update date using `AWS graph notebook`

```java
%%gremlin -p v,e
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
// Creating a new Date object with the current date and time
Date currentDate = Date.from(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant());
// Creating a new Date object with a specific date and time
LocalDateTime customDateTime = LocalDateTime.of(2023, 5, 29, 10, 30, 0);
g.V(49360).property("end_time", Date.from(customDateTime.atZone(ZoneId.systemDefault()).toInstant()))
```

2. Convert Gremlin DSL/bytecode to groovy query

```java
GroovyTranslator.of("g").
	translate(g.company(companyId).manager().asAdmin().getBytecode())
```
