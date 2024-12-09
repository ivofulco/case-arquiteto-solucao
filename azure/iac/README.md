
- [Visão geral](#visão-geral)
- [TFSTATE](#tfstate)
- [Inicializando as dependencias](#inicializando-as-dependencias)

# Visão geral

O Terraform irá ser responsável por criar alguns recursos computicionais, como por exemplo Azure Functions. Funcionamento da estrutura de pastas de uam Azure Function:


```terraform

terraform-azure-function/
├── main.tf
├── variables.tf
├── outputs.tf

```

---


# TFSTATE
 
Por ter o objetivo didático o arquivo de estado [(tfstate)](https://developer.hashicorp.com/terraform/language/state) será armazenado localmente, porém poderia ser armazenado em um storage remoto, ou em um repositório privado, ou ainda utilizar o [Terraform Cloud](https://app.terraform.io/session)

---

# Inicializando as dependencias

Dentro da pasta da chamada dos modulos do Terraform abre seu terminal e digite

`terraform init`

Criando os recursos sem necessidade de aprovação para continuar

`terraform apply -auto-approve`

Destruindo os recursos sem necessidade de aprovação para continuar

`terraform destroy -auto-approve`