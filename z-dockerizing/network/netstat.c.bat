echo "특정 포터와 연결된 프로세스 찾기 및 죽이기"
netstat -ano | findstr 8082

echo "# netstat -ano   | findstr 8080"
echo "#  TCP    0.0.0.0:8080           0.0.0.0:0              LISTENING       25800"
echo "#  TCP    [::]:8080              [::]:0                 LISTENING       25800"
echo "#  taskkill /f /pid 19676 "