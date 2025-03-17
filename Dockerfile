FROM amazoncorretto:11-alpine3.21-full

ARG IRPF_YEAR=2025
ARG IRPF_VERSION=1.0

ARG IRPF_BASENAME="IRPF${IRPF_YEAR}-${IRPF_VERSION}"

RUN apk add --quiet --no-cache \
        libx11 \
        libxext \
        libxi \
        libxrender \
        libxtst \
        ttf-dejavu \
    && wget "https://downloadirpf.receita.fazenda.gov.br/irpf/${IRPF_YEAR}/irpf/arquivos/${IRPF_BASENAME}.zip" \
    && unzip "${IRPF_BASENAME}.zip" -d "/usr/local/src" \
    && rm "${IRPF_BASENAME}.zip"

WORKDIR "/usr/local/src/IRPF${IRPF_YEAR}"

CMD ["java", "-jar", "irpf.jar"]
