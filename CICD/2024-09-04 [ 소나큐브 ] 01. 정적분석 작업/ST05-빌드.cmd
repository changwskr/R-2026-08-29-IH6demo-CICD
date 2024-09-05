
cd "C:\Programming(23-08-15)\zRepository\R-2026-08-29-IH6demo-CICD"
mvn clean compile package -DskipTests=True
mvn sonar:sonar -Dsonar.host.url=http://10.250.127.193:9000 -Dsonar.login=633171b2201cf35101ca5b93261bc134919088e1
