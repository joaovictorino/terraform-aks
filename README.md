# Terraform criando Azure Kubernetes Service no Azure

Pré-requisitos
- Az-cli instalado
- Terraform instalado

Logar no Azure via az-cli, o navegador será aberto para que o login seja feito
````sh
az login
````

Inicializar o Terraform
````sh
terraform init
````

Executar o Terraform
````sh
terraform apply -auto-approve
````

Adicionar credenciais do AKS no kubectl local
````sh
az aks get-credentials --resource-group rg-aula-infra --name aks-aula-infra
````