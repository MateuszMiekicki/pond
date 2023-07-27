FROM 0xd00d2bad/toad_cicd:latest

RUN apt-get update && apt-get install -y supervisor
RUN git clone --depth=1 https://github.com/Smart-Terrarium/toad.git
WORKDIR toad
RUN mkdir -p build
RUN cd build && conan install ..
RUN cmake -Bbuild -GNinja -DCMAKE_BUILD_TYPE=Debug
RUN cmake --build build --parallel 2 --target all
ENV SPDLOG_LEVEL=trace
CMD ["supervisord", "-c", "./.cicd/supervisord.conf"]
