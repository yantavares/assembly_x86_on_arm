# Especifica uma imagem base x86_64. O Ubuntu é uma escolha popular por sua ampla documentação e suporte.
FROM --platform=linux/amd64 ubuntu:latest

# Evita prompts interativos durante a construção da imagem
ARG DEBIAN_FRONTEND=noninteractive

# Atualiza os repositórios de pacotes e instala ferramentas necessárias
RUN apt-get update && apt-get install -y \
    yasm \
    vim \
    nasm \
    gcc \
    g++ \
    gdb \
    && rm -rf /var/lib/apt/lists/*

# Define o diretório de trabalho dentro do container
WORKDIR /workspace

# Comando padrão ao iniciar o container
CMD ["bash"]

