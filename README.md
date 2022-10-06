# Official CD-MOJ container

Instância configurada e disponível para uso do CD-MOJ [disponível em Docker Hub](https://hub.docker.com/r/lucianosz7/cdmoj).

Essa é uma instância funcional do CD-MOJ. [https://moj.naquadah.com.br](https://moj.naquadah.com.br/cgi-bin/index.sh)

# Uso através do Docker Hub

Para baixar a imagem diretamente do Docker Hub execute o comando:

```
docker pull lucianosz7/cdmoj:1.2.0
```

E para executar a imagem:

```
docker run -it -p 80:80 lucianosz7/cdmoj:1.2.0 bash
```

# Construir o container através do repositório

Para construir o container execute os seguintes passos:

```
git clone https://github.com/cd-moj/cd-moj.docker.git && cd cd-moj.docker
```
Após clonar o repositório e entrar no diretório, construa o container:

```
docker build -t cd-moj:tag_opcional .
```

Depois do container criado, basta executá-lo:

```
docker run -it -p 80:80 cd-moj:tag_opcional bash
```

**NOTA**: Não é necessário criar um container todas às vezes que desejar utilizar a instância do CD-MOJ.

## Reutilizando um container

Para reutilizar um container basta localizar o ID criado anteriormente através do comando:

```
docker ps -a
```

Após localizada o ID do container, para iniciar o container utilize o seguinte comando:

```
docker start CONTAINER_ID
```

Para acessar o container execute o comando:

```
docker attach CONTAINER_ID
```

Caso deseje utilizar mais de uma janela do terminal com um container, utilize o seguinte comando:

```
docker exec -it CONTAINER_ID bash
```

# Daemons

Para executar os daemons do sistema execute os passos descritos abaixo.

Para executar o módulo corretor:

```
bash moj-serverside/daemons/executar-corretor.sh
```

Para executar o módulo julgador:

```
bash moj-serverside/daemons/executar-julgador.sh
```

