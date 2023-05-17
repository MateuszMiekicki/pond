FROM 0xd00d2bad/toad_cicd:latest

RUN git clone --depth=1 -b test/questdb-hostname https://github.com/Smart-Terrarium/toad.git
RUN mkdir -p toad/build
RUN cd toad/build && conan install ..
RUN cd toad && cmake -Bbuild -G Ninja -DCMAKE_BUILD_TYPE=Release
RUN cd toad && cmake --build build --parallel 4
RUN cd toad && cmake -Bbuild -G Ninja -DCMAKE_BUILD_TYPE=Release
RUN cd toad && cmake --build build --parallel 4
ENTRYPOINT [ "./toad/build/bin/collector" ]