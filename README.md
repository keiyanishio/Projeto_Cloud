# Projeto_Cloud

## 1. Introdução
Esse projeto tem como objetivo criar dois RDSs (em zonas diferentes) e um Load Balancer com dois EC2 e no final conecta-los, usando os Web Server (EC2) para enviar os dados nos RDSs. Tudo feito em Terradorm.

**iamgem**

Mas antes, precisamos entender o que são esses serviços mencionados anteriormente: 

- **Load Balancer** : esse serviço tem como objetivo direcionar as solicitações entre os servidores conectados a ele, assim evitando a sobrecarga dos outro serviços.
- **EC2** : junto com a criação do Load Balancer, dois EC2 são implementandos juntos. Aqui no projeto seriam os servidores (Web Servers).
- **RDS** : são os bancos de dados, no projeto tem o objetivo de armazenar os dados enviados pelos EC2.

## 2. Primeiros passos
- Baixar o [Terraform](https://youtu.be/Cn6xYf0QJME)
- Cria um user [AWS IAM USER](https://youtu.be/LhAyqaZwYKE)
- Baixar, set up iniciais e configurar no seu computador a [AWS CLI](https://youtu.be/XxTcw7UTues)
- Criar SSH keys_pair no Windows:

Passo 1: gerar keys_pair
```
ssh-keygen -t rsa -b 4096
```

Passo 2: vá para o diretório dos usuários
```
C:\Users\YourUsername
```

Passo 3: ir ao diretório .ssh
```
cd C:\Users\YourUsername\.ssh
```

Passo 4: copiar e colar o key_pairs em algum lugar
```
cat id_rsa.pub
```

## 3. Criando os primeiros arquivos
Antes de implementar os serviços, precisamos criar alguns arquivos para configurar o projeto:
- **variables.tf**
```terraform
variable "access_key" {}

variable "secret_key" {}

variable "region" {
    default = "us-east-1"
}

variable "key_pair" {}

variable "user" {}

variable "password" {}
```
Na hora de dar o **terraform.apply**, você precisará preencher o *access_key*, *secret_key*, *key_pairs* e *user* que foram criados no começo, porém você escolher uma senha para os RDSs. E nesse projeto vamos criar os serviços  na região us-east-1 (Norte Virgínia), mencionado em "region".

**iamgem**

- **provider.tf**

```terraform
provider "aws" {
    region = "${var.region}"
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
}
```
Preenchidos anteriormente, os valores colocados serão encaixados nessas variáveis, com intuito de criar um provedor AWS na região definida com as permissões
das chaves.

- **key_pairs.tf**
```terraform
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "${var.key_pair}"
}
```
No **key_pairs** é criado um par de chaves para autenticar e acessar instâncias EC2 na AWS. O public-key é SSH key_pair que foi criado no início e selecionado na hora de rodar.

## 4. Configurações dos serviços
- **az.tf**
```terraform
data "aws_availability_zones" "available_zones" {}

resource "aws_default_subnet" "az1" {
  availability_zone = data.aws_availability_zones.available_zones.names[0] 
}

resource "aws_default_subnet" "az2" {
  availability_zone = data.aws_availability_zones.available_zones.names[1] 
}
```
Aqui são definidos as zonas que serão utilizados no projeto (us-east-1a e us-east-1b).







