HOME="/home/roian"

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


cp ./$svc.dockerfile ./$svc/dockerfile

if [ -d $HOME/src/$svc ]
then
	cp -r $HOME/src/$svc/* ./$svc
fi

cd ./$svc
echo "//////    docker build -t $svc:latest .    //////"
docker build -t $svc:latest .
rtn=$?
if [ $rtn -eq 1 ]
then
	echo "docker build fail"
else
	vtime=`date +%Y-%m-%d-%H-%M-%S`
	docker tag $svc changwskr/$svc:latest
	echo "============================================================="
	echo "REPOSITORY                           TAG        IMAGE ID       CREATED                  SIZE "
	docker images | grep $svc 
	echo "============================================================="
	echo "//////    docker create --name $svc $svc:latest    //////"
	docker create --name $svc $svc:latest
	echo "//////    docker start $svc                        //////"
	docker start $svc
	echo "//////    docker ps -a | grep $svc                 //////"
	docker ps -a | grep $svc
	echo "============================================================="
	docker inspect $svc | grep 'IPAddress' | grep -v Second | tail -1
	echo "============================================================="
	echo "//////    docker hub                 //////"
	docker login
	vtime=`date +%Y-%m-%d-%H-%M-%S`
	docker push changwskr/$svc:latest
fi

