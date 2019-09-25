# Apache NiFi

Apache NiFi supports powerful and scalable directed graphs of data routing, transformation, and system mediation logic. [View more](https://nifi.apache.org/).

<br>

## Usage guide

### App configuration

<!-- Após clonar este repositório, configure o arquivo `.env` localizado na pasta `/env`. Nele, ficam ficam registradas configurações de ambiente, sendo que, serão necessários passar como parâmetros as seguintes opções: -->

After repository clone, edit `.env` file located on `/env` directory. This file has environments configurations to Docker and your network. The required parameters here are:

```properties
# Docker network subnet
ENV_SUBNET=XXX.XXX.XXX.XXX/X

# Docker Image (available on DockerHub)
NIFI_IMAGE=apache/nifi:X.X.X

# NiFi container IP (according to subnet setted in: ENV_SUBNET)
NIFI_IP=XXX.XXX.XXX.XXX

# Host machine port to access container
NIFI_ACCESS_PORT=XXXX

# NiFi port (setted in /app/nifi/src/conf/nifi.properties file)
NIFI_PORT=XXXX
```

<!-- Feito isto, caso haja a necessidade de alteração das configurações do NiFi, basta alterá-las no arquivo `/app/nifi/src/conf/nifi.properties` (que será carregado para dentro do container). -->



---
* Obs.: 
    - A aplicação vem com uma configuração pré-definida que pode ser configurada de acordo com a necessidade de implementação.
    - O "reset" das properties do arquivo `nifi.properties`, feito pela imagem oficial do NiFi, foi desabilitado nessa aplicação.
---

<br>

### Executando a aplicação

Este projeto utiliza o MakeFile (linux) e o bash para facilitar o uso do Apache NiFi e do Docker. Feitas as configurações, para inicializar o NiFi, executar na raiz do projeto um dos comandos:

- Inicialização do NiFi
    ```
    make start
    ```

- Desligamento do NiFi
    ```
    make stop
    ```

- Reinicialização do NiFi
    ```
    make restart
    ```

- Build da imagem (docker) do NiFi
    ```
    make build
    ```

- Build da imagem (docker) e reinicialização do NiFi (para aplicar alterações)
    ```
    make reload
    ```

- Exibição do status dos containers (docker)
    ```
    make status
    ```

- Exibição em tempo real dos logs gerados pelos containers
    ```
    make logs
    ```
    
---
* Obs.: 
    - Para usuários de windows, foi desenvolvido um script em batch como alternativa ao MakeFile (do linux). Sua utilização é a mesma dos comandos citados acima.
---

<br>

### Estrutura da aplicação

```
.
├── app
│   └── nifi
│       ├── res
│       │   ├── content_repository
│       │   ├── database_repository
│       │   ├── flowfile_repository
│       │   ├── logs
│       │   ├── provenance_repository
│       │   └── state
│       └── src
│           ├── conf
│           │   ├── args.properties
│           │   └── nifi.properties
│           ├── flow
│           └── lib
├── env
│   ├── docker-compose.yml
│   └── nifi
│       ├── Dockerfile
│       └── scripts
│           └── helpers.sh
├── LICENSE
├── make.bat
├── Makefile
└── README.md
```

- Para carregar processadores e serviços customizados no NiFi, os pacotes `nar` devem ser colocados na pasta `/app/nifi/src/lib`.

- Para alterar configurações do NiFi, basta editar o arquivo `nifi.properties`, localizado em `/app/nifi/src/conf`. Se for necessário editar outro arquivo de configuração, basta colocá-lo na pasta `/app/nifi/src/conf` (com volume para o container em `/opt/nifi/nifi-current/conf/custom`) referenciá-lo no `nifi.properties`.