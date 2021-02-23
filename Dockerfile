FROM mikkeloscar/maze-build-gha:latest

COPY build.sh /build.sh

USER builder

WORKDIR /home/builder

ENTRYPOINT ["/build.sh"]
