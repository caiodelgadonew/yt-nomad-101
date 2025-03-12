# Nomad 101 - Nem todo mundo precisa de Kubernetes

Repositório com os arquivos do vídeo: https://youtu.be/ckqWFSZ2So4 

## Links:
- [Install Nomad](https://developer.hashicorp.com/nomad/install)
- [The Million Container Challenge](https://www.hashicorp.com/en/c1m)
- [The Two Million Container Challenge](https://www.hashicorp.com/en/c2m)
- [Kubernetes - Considerations for Large Clusters / Limits](https://kubernetes.io/docs/setup/best-practices/cluster-large/)


## Commands

Install Docker
```bash
$ curl -fsSL https://get.docker.com | sudo bash
```

Install Nomad (Ubuntu) 
```bash
$ wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

$ echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

$ sudo apt update && sudo apt install nomad

$ nomad --version
```

Nomad dev mode
```bash
$ nomad agent -dev -bind 0.0.0.0

$ sudo nomad agent -dev -bind 0.0.0.0 -network-interface='{{ GetDefaultInterfaces | attr "name" }}'
```

Nomad Commands
```bash
$ nomad node status
$ nomad job status
```

### Jobs - View [jobs](jobs/) folder

```bash
$ nomad validate exemplo.hcl
$ nomad fmt exemplo.hcl
$ nomad run exemplo.hcl
$ nomad job status
$ nomad job status exemplo
```

Scale UP/Down
```bash
$ nomad job scale exemplo 10
$ nomad job scale exemplo 3
$ nomad job scale exemplo 50
$ nomad job scale exemplo 1
```

```bash
$ time nomad job scale hello-world 150
$ time nomad job scale hello-world 1
```

```bash
$ nomad fmt wordpress.hcl
$ nomad validate wordpress.hcl
$ nomad run wordpress.hcl
```
```bash
$ sudo apt install speedtest-cli
```

```bash
$ nomad job stop -purge exemplo

```
