FROM alpine:3.21

ARG IRPF_YEAR=2025
ARG IRPF_VERSION=1.0

RUN wget "https://downloadirpf.receita.fazenda.gov.br/irpf/${IRPF_YEAR}/irpf/arquivos/IRPF${IRPF_YEAR}-${IRPF_VERSION}.zip"
