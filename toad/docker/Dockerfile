FROM 0xd00d2bad/toad_cicd:latest

RUN apt-get update && apt-get install -y supervisor

RUN git clone --depth=1 -b feature/github-31 https://github.com/Smart-Terrarium/toad.git
RUN mkdir -p toad/build
RUN cd toad/build && conan install ..
RUN cd toad && cmake -Bbuild -G Ninja -DCMAKE_BUILD_TYPE=Release
RUN cd toad && cmake --build build --parallel 4
RUN cd toad && cmake -Bbuild -G Ninja -DCMAKE_BUILD_TYPE=Release
RUN cd toad && cmake --build build --parallel 4
CMD ["supervisord", "-c", "./toad/.cicd/supervisord.conf"]
