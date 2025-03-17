FROM amazoncorretto:23-alpine3.21

ARG IRPF_YEAR=2025
ARG IRPF_VERSION=1.0

ARG IRPF_BASENAME="IRPF${IRPF_YEAR}-${IRPF_VERSION}"

RUN wget "https://downloadirpf.receita.fazenda.gov.br/irpf/${IRPF_YEAR}/irpf/arquivos/${IRPF_BASENAME}.zip" \
    && unzip "${IRPF_BASENAME}.zip" -d "/usr/local/src" \
    && rm "${IRPF_BASENAME}.zip"

WORKDIR "/usr/local/src/IRPF${IRPF_YEAR}"

CMD ["java", "-jar", "irpf.jar"]
