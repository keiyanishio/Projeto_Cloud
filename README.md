# Projeto_Cloud

## 1. Introdução
&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Esse projeto tem como objetivo criar dois RDSs (em zonas diferentes) e um Load Balancer com dois EC2 e no final conecta-los em Terraform,
usando os 
Web Server (EC2) para enviar os dados nos RDSs.

imagem

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mas antes, precisamos entender o que são esses serviços mencionados anteriormente: 

- **Load Balancer** : esse serviço tem como objetivo direcionar as solicitações entre os servidores conectados a ele, assim evitando a sobrecarga dos outro serviçoes.
- **EC2** : junto com a criação do Load Balancer, dois EC2 são implementandos juntos, no nosso caso seriam os servidores do projeto.
- **RDS** : são os bancos de dados, no projeto tem o objetivo de armazenar os dados enviados pelos EC2.

## 2. Primeiros passos
- Baixar o [Terraform](https://youtu.be/Cn6xYf0QJME)
- Cria um user [AWS IAM USER](https://youtu.be/LhAyqaZwYKE)
- Baixar, set up iniciais e configurar no seu computador a [AWS CLI](https://youtu.be/XxTcw7UTues)


