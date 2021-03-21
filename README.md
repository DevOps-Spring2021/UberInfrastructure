# UberInfrastructure

## Infrastructure as Code with Terraform

## Objective
Building infrastructure on the AWS for the Uber appplication  

### Technology Stack
* AWS
* Terraform

### Prerequisites
* AWS CLI
* Terraform


### Build Instructions
- Run following commands in the root directory
```
 $ terraform init
 $ terraform plan -var-file="variable.tfvars"
 $ terraform apply -var-file="variable.tfvars"
```

<b>Note</b>: Change variables value in the variable.tfvars according to need 

### Destroy Instruction 
```
 $ terraform destroy -var-file="variable.tfvars"
```