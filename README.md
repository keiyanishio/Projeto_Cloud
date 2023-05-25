# Projeto_Cloud

## 1. Introdução
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Esse projeto tem como objetivo criar dois RDSs (em zonas diferentes) e um Load Balancer com dois EC2 e no final conecta-los, usando os Web Server (EC2) para enviar os dados nos RDSs. Tudo feito em Terradorm.

**iamgem**

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mas antes, precisamos entender o que são esses serviços mencionados anteriormente: 

- **Load Balancer** : esse serviço tem como objetivo direcionar as solicitações entre os servidores conectados a ele, assim evitando a sobrecarga dos outro serviçoes.
- **EC2** : junto com a criação do Load Balancer, dois EC2 são implementandos juntos, no nosso caso seriam os servidores do projeto.
- **RDS** : são os bancos de dados, no projeto tem o objetivo de armazenar os dados enviados pelos EC2.

## 2. Primeiros passos
- Baixar o [Terraform](https://youtu.be/Cn6xYf0QJME)
- Cria um user [AWS IAM USER](https://youtu.be/LhAyqaZwYKE)
- Baixar, set up iniciais e configurar no seu computador a [AWS CLI](https://youtu.be/XxTcw7UTues)
- Criar SSH keys_pair no Windows:
Passo 1 - gerar keys_pair:
```

```
## 3. Criando os primeiros arquivos
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Antes de implementar os serviços, precisamos criar alguns arquivos para configurar o projeto:
- variables.tf
```terraform
variable "access_key" {}

variable "secret_key" {}

variable "key_pair" {}

variable "region" {
    default = "us-east-1"
 }
```
Na hora de dar o **terraform.apply**, você precisará preencher o *acces_key*, *secret_key* e *key_pairs*. Porém nesse projeto vamos criar os serviços  na região us-east-1 
(Norte Virgínia), mencionado na "region".

**iamgem**









