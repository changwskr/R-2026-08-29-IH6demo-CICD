svc=`echo $0 | cut -c1-8`

if [ ! -d ./$svc ]
then
	mkdir ./$svc	
fi

if [ ! -f ./$svc.dockerfile ]
then
	echo "./$svc.dockerfile is not found"
	exit
fi

pid=`docker ps | grep $svc | awk '{print $1}'`
if [ "$pid" != "" ]
then
	echo "//////   docker container stop $svc   //////"
	echo docker stop $svc
	docker stop $svc
fi

cid=`docker ps -a | grep $svc | awk '{print $1}'`
if [ "$cid" != "" ]
then
	echo "//////    docker container rm $cid     //////"
	echo docker rm $cid
	docker rm $cid
fi

did=`docker images $svc | grep $svc | awk '{print $3}'`
if [ "$did" != "" ]
then
	echo "//////    docker image rmi $did     //////"
	echo docker rmi $did
	docker rmi $did
fi

cp ./$svc.dockerfile ./$svc/Dockerfile
cp $HOME/src/*.js ./$svc

cd ./$svc
docker build -t $svc:latest .
rtn=$?
if [ $rtn -eq 1 ]
then
	echo "docker build fail"
else
	echo "============================================================="
	echo "REPOSITORY                           TAG        IMAGE ID       CREATED                  SIZE "
	docker images | grep $svc 
	echo "============================================================="
	docker create --name $svc $svc:latest
	#docker create --name $svc changwskr/$svc:1.0
	docker tag $svc changwskr/$svc:1.0
	docker start $svc
	echo "============================================================="
	docker inspect $svc | grep 'IPAddress' | grep -v Second | tail -1
fi

#docker stop sp_php01 || true
#docker ps -a | grep sp_php01 | awk '{print "docker rm "$1}' | sh
#docker build -t sp_php01 .
#docker tag sp_php01 changwskr/sp_php01:1.0
#docker create --name sp_php01 changwskr/sp_php01:1.0
#docker start sp_php01
#usermod -aG sudo commo
#docker login
#docker push sp_commo changwskr/sp_commo:1.0


