FROM mikkeloscar/maze-build-gha:latest

COPY build.sh /build.sh
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
