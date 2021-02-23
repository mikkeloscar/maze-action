FROM mikkeloscar/maze-build-gha:latest

COPY build.sh /build.sh

ENTRYPOINT ["/build.sh"]
