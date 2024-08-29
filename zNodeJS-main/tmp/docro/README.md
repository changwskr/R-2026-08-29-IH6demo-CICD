# Docker 실전 연습

### Installation
<pre>
cd /home
git clone https://github.com/changwskr/docro.git
</pre>

## Run
<pre>
cd docro
docker login
docker pull changwskr/docro
docker create --name sp_commo changwskr/docro:latest
docker start sp_commo
</pre>

## TEST
<pre>
docker inspect sp_commo | grep IPAddress
curl [ip]:8080
</pre>
