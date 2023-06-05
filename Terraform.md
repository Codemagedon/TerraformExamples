# Terraform   
## What is a terraform module  
A terraform module is a collection of files that builds up a deployment package that can be consumed my any other Terraform module or at the top level of the configuration. It is best used to help orchestrate the IaC into reusable segments. It can be used to help simplify deployments by extending the Single Responsibility principal to ensure that deployments don't get too complicated by doing too many things at once.  
## Explain what a Provider is and when you would use one  
A provider in terraform in the connector that translates the terraform code (HCL) from a standardised IaC language into something that can be used to deploy into Any environment. It acts as a form of comiler taking the terraform and turning it into another set of commands that work with the end platforms it is tied to.  
## Explain the difference between a "resource" and a "data" source.
A Resource in Terraform is an object which terraform is managing, as such it can complete Create, read, update and delete oporations. Data resources are a readonly format that can be , but don't have to be, created/managed outside of the current deployment/state.  
## Explain what an Expression or Function is and when you would use one.  
- An Expression in Terraform is a representation of data, this could be a literal value which is a static definition of data, or it could be a calculation, reference to another data source or a function.
- A function in Terraform is a collection of built in logical processors that process/transform/ammend data within the configuratuion i.e. TimeStamp() which gets the current system datetime, or TimeAdd(Date,Increment) which adds a defined amount of time to a provided time.  
##  Explain what a Meta-Argument like Count or For_Each is and when you would use one.  
Meta arguments are functions that are available against all resources within terraform. 
The count meta argument takes in an integer and then repeats the module/resource the same number of times as the integer provided. Using this may require modification to the Terraform code to allow resources to deploy. 
The For_each argument iterates over an array of objects, or a map() in Terraform, it runs the modules for each of the objects in the array/map(), and allows the values in the object to be passed into the moduesles as the configurations variables.  
## Explain what the Terraform State is.  
Terraform state is a record of the environment that is being managed by terraform mapped to the resources that exist in the environments.it allows terraform to understand the changes that the configuration would implement and if they would modify, create or destroy resources.
## Show an example using Terraform Console and/or listing what resources are in your Terraform State.  
Running "terraform show" will show the current state 

## Explain or show an example of anything related to Terraform that you believe would benefit from being automated with Terraform.  
Any resources in any environment, but especially code driven environemnts like Azure, are not just better off implemented using IaC DSL's like Terrraform but should be done so to achieve immunity from human error.  
  
## Commands to run to deploy resources 
az login --scope https://graph.microsoft.com/.default  
az account set --subscription 5b43514f-1e41-4473-9f0c-76e74f6e182c  
terraform init  
terraform plan -out prod.tfplan -var-file .\Environments\Production.tfvars  
terraform apply prod.tfplan  
terraform plan -out canary.tfplan -var-file .\Environments\canary.tfvars  
terraform apply canary.tfplan  
terraform apply -destroy -var-file .\Environments\Production.tfvars  
terraform apply -destroy -var-file .\Environments\canary.tfvars  