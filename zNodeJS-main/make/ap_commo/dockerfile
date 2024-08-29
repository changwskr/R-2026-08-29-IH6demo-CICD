FROM node:12 
#node:12는 컨테이너이름이다

RUN mkdir /home/roian
RUN mkdir /home/roian/src
RUN mkdir /home/roian/src/ap_commo
COPY lib /home/roian/src/ap_commo/lib
COPY node_modules /home/roian/src/ap_commo/node_modules
COPY ap_commo.js /home/roian/src/ap_commo/
COPY package-lock.json /home/roian/src/ap_commo/

CMD ["node", "/home/roian/src/ap_commo/ap_commo.js"] 
# nodel라는 명령어를 가지고 컨테이너의 최상단에 있는 hello.js을 실행해줘


