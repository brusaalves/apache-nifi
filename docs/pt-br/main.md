# Apache NiFi

O Apache NiFi suporta gráficos direcionados poderosos e escalonáveis ​​da lógica de roteamento, transformação e mediação de dados. [Leia mais](https://nifi.apache.org/).

## Guia de uso

---
### Configurando a aplicação

Após clonar este repositório, configure o arquivo `.env` localizado na pasta `/env`. Nele, ficam ficam registradas configurações de ambiente, sendo que, serão necessários passar como parâmetros as seguintes opções:

```properties
# Máscara de rede docker à ser implementada pelos containers
ENV_SUBNET=XXX.XXX.XXX.XXX/X

# Imagem do docker (disponível no DockerHub) à ser implementada
NIFI_IMAGE=apache/nifi:X.X.X

# IP do container do NiFi (deve ser parametrizado conforme a máscara de rede configurada em: ENV_SUBNET)
NIFI_IP=XXX.XXX.XXX.XXX

# Porta da máquina host à ser mapeada
NIFI_ACCESS_PORT=XXXX

# Porta de execução do NiFi configurada no arquivo: /app/nifi/src/conf/nifi.properties
NIFI_PORT=XXXX
```

Feito isto, caso haja a necessidade de alteração das configurações do NiFi, basta alterá-las no arquivo `/app/nifi/src/conf/nifi.properties` (que será carregado para dentro do container).

** Obs.: A aplicação vem com uma configuração pré-definida que pode ser configurada de acordo com a necessidade de implementação.

---
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
** Obs.: Para usuários de windows, foi desenvolvido um script em batch como alternativa ao MakeFile (do linux). Sua utilização é a mesma dos comandos citados acima.

---
## Guia de desenvolvimento