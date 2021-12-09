FROM quay.io/openshift/origin-cli:4.8

WORKDIR ~
COPY main.sh main.sh
COPY console-link.yaml console-link.yaml
RUN chmod +x main.sh
CMD ["./main.sh"]