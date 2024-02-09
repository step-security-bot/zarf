FROM cgr.dev/chainguard/static:latest@sha256:fce1fdce595332afe7f339303ae288c349c4e4139d926f8c7ccf4b7ca2911553
ARG TARGETARCH

# 65532 is the UID of the `nonroot` user in chainguard/static.  See: https://edu.chainguard.dev/chainguard/chainguard-images/reference/static/overview/#users
USER 65532:65532

COPY --chown=65532:65532 "build/zarf-linux-$TARGETARCH" /zarf

CMD ["/zarf", "internal", "agent", "-l=trace", "--no-log-file"]
