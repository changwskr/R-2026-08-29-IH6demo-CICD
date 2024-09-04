
mvn sonar:sonar -Dsonar.host.url=http://192.168.0.8:9000 -Dsonar.login=squ_be03c39b0f496240d167a07fb803790cf7cc644c
소나빌더를 통해서 정적분석 작업을 한다.

(윈도우에서 직접실행 필요)
C:\Programming(23-08-15)\MyProject-Inteli\IH6demo-2025-08-03>
mvn sonar:sonar -Dsonar.host.url=http://192.168.0.8:9000 -Dsonar.login=squ_be03c39b0f496240d167a07fb803790cf7cc644c

[INFO] Scanning for projects...
[INFO]
[INFO] -------------------< com.example:IH6demo-2025-08-03 >-------------------
[INFO] Building IH6demo-2025-08-032 0.0.1-SNAPSHOT
[INFO]   from pom.xml
[INFO] --------------------------------[ jar ]---------------------------------
[INFO]
[INFO] --- sonar:3.9.1.2184:sonar (default-cli) @ IH6demo-2025-08-03 ---
[INFO] User cache: C:\Users\chang\.sonar\cache
[INFO] SonarQube version: 10.6.0.92116
[INFO] Default locale: "ko_KR", source code encoding: "UTF-8"
[INFO] Load global settings
[INFO] Load global settings (done) | time=663ms
[INFO] Server id: 147B411E-AZFAECqqzz3gtUaUdUTC
[INFO] Loading required plugins
[INFO] Load plugins index
[INFO] Load plugins index (done) | time=460ms
[INFO] Load/download plugins
[INFO] Load/download plugins (done) | time=1213ms
[INFO] Process project properties
[INFO] Process project properties (done) | time=21ms
[INFO] Project key: com.example:IH6demo-2025-08-03
[INFO] Base dir: C:\Programming(23-08-15)\MyProject-Inteli\IH6demo-2025-08-03
[INFO] Working dir: C:\Programming(23-08-15)\MyProject-Inteli\IH6demo-2025-08-03\target\sonar
[INFO] Load project settings for component key: 'com.example:IH6demo-2025-08-03'
[INFO] Load quality profiles
[INFO] Load quality profiles (done) | time=1398ms
[INFO] Load active rules
[INFO] Load active rules (done) | time=15361ms
[INFO] Load analysis cache
[INFO] Load analysis cache (404) | time=15ms
[WARNING] The property 'sonar.login' is deprecated and will be removed in the future. Please use the 'sonar.token' property instead when passing a token.
[INFO] Preprocessing files...
[INFO] 2 languages detected in 80 preprocessed files
[INFO] 0 files ignored because of scm ignore settings
[INFO] Loading plugins for detected languages
[INFO] Load/download plugins
[INFO] Load/download plugins (done) | time=745ms
[INFO] Load project repositories
[INFO] Load project repositories (done) | time=14ms
[INFO] Indexing files...
[INFO] Project configuration:
[INFO] 80 files indexed
[INFO] Quality profile for java: Sonar way
[INFO] Quality profile for xml: Sonar way
[INFO] ------------- Run sensors on module IH6demo-2025-08-032
[INFO] Load metrics repository
[INFO] Load metrics repository (done) | time=33ms
[INFO] Sensor JavaSensor [java]
[INFO] Configured Java source version (sonar.java.source): 17, preview features enabled (sonar.java.enablePreview): false
[INFO] Server-side caching is enabled. The Java analyzer will not try to leverage data from a previous analysis.
[INFO] Using ECJ batch to parse 79 Main java source files with batch size 173 KB.
[WARNING] Invalid character encountered in file C:/Programming(23-08-15)/MyProject-Inteli/IH6demo-2025-08-03/src/main/java/com/example/h3demo/common/ComUtil.java at line 17 for encoding UTF-8. Please fix file content or configure the encoding to be used using property 'sonar.sourceEncoding'.
[INFO] Starting batch processing.
[INFO] The Java analyzer cannot skip unchanged files in this context. A full analysis is performed for all files.
[INFO] 100% analyzed
[INFO] Batch processing: Done.
[INFO] Did not optimize analysis for any files, performed a full analysis for all 79 files.
[WARNING] Use of preview features have been detected during analysis. Enable DEBUG mode to see them.
[INFO] No "Test" source files to scan.
[INFO] No "Generated" source files to scan.
[INFO] Sensor JavaSensor [java] (done) | time=10981ms
[INFO] Sensor SurefireSensor [java]
[INFO] parsing [C:\Programming(23-08-15)\MyProject-Inteli\IH6demo-2025-08-03\target\surefire-reports]
[INFO] Sensor SurefireSensor [java] (done) | time=5ms
[INFO] Sensor XML Sensor [xml]
[INFO] 1 source file to be analyzed
[INFO] 1/1 source file has been analyzed
[INFO] Sensor XML Sensor [xml] (done) | time=459ms
[INFO] Sensor JaCoCo XML Report Importer [jacoco]
[INFO] 'sonar.coverage.jacoco.xmlReportPaths' is not defined. Using default locations: target/site/jacoco/jacoco.xml,target/site/jacoco-it/jacoco.xml,build/reports/jacoco/test/jacocoTestReport.xml
[INFO] No report imported, no coverage information will be imported by JaCoCo XML Report Importer
[INFO] Sensor JaCoCo XML Report Importer [jacoco] (done) | time=7ms
[INFO] Sensor Java Config Sensor [iac]
[INFO] 0 source files to be analyzed
[INFO] 0/0 source files have been analyzed
[INFO] Sensor Java Config Sensor [iac] (done) | time=47ms
[INFO] Sensor IaC Docker Sensor [iac]
[INFO] 0 source files to be analyzed
[INFO] 0/0 source files have been analyzed
[INFO] Sensor IaC Docker Sensor [iac] (done) | time=138ms
[INFO] Sensor TextAndSecretsSensor [text]
[INFO] Available processors: 12
[INFO] Using 12 threads for analysis.
[INFO] The property "sonar.tests" is not set. To improve the analysis accuracy, we categorize a file as a test file if any of the following is true:
  * The filename starts with "test"
  * The filename contains "test." or "tests."
  * Any directory in the file path is named: "doc", "docs", "test" or "tests"
  * Any directory in the file path has a name ending in "test" or "tests"

[INFO] Using git CLI to retrieve untracked files
[INFO] Analyzing language associated files and files included via "sonar.text.inclusions" that are tracked by git
[INFO] 80 source files to be analyzed
[INFO] 80/80 source files have been analyzed
[INFO] Sensor TextAndSecretsSensor [text] (done) | time=4098ms
[INFO] ------------- Run sensors on project
[INFO] Sensor Zero Coverage Sensor
[INFO] Sensor Zero Coverage Sensor (done) | time=150ms
[INFO] Sensor Java CPD Block Indexer
[INFO] Sensor Java CPD Block Indexer (done) | time=153ms
[INFO] SCM Publisher SCM provider for this project is: git
[INFO] SCM Publisher 80 source files to be analyzed
[INFO] SCM Publisher 79/80 source files have been analyzed (done) | time=3992ms
[WARNING] Missing blame information for the following files:
[WARNING]   * pom.xml
[WARNING] This may lead to missing/broken features in SonarQube
[INFO] CPD Executor 16 files had no CPD blocks
[INFO] CPD Executor Calculating CPD for 63 files
[INFO] CPD Executor CPD calculation finished (done) | time=137ms
[INFO] SCM revision ID 'd9fb0f5c9ffece871e564d8fe20f850e7ca25f1d'
[INFO] Analysis report generated in 436ms, dir size=670.5 kB
[INFO] Analysis report compressed in 868ms, zip size=284.3 kB
[INFO] Analysis report uploaded in 1732ms
[INFO] ANALYSIS SUCCESSFUL, you can find the results at: http://192.168.0.8:9000/dashboard?id=com.example%3AIH6demo-2025-08-03
[INFO] Note that you will be able to access the updated dashboard once the server has processed the submitted analysis report
[INFO] More about the report processing at http://192.168.0.8:9000/api/ce/task?id=3df58031-6d34-4198-aadf-f1d5173c0be1
[INFO] Analysis total time: 45.035 s
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  53.110 s
[INFO] Finished at: 2024-08-11T15:46:46+09:00
[INFO] ------------------------------------------------------------------------

C:\Programming(23-08-15)\MyProject-Inteli\IH6demo-2025-08-03>