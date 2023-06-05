# Terraform   
## What is a terraform module  
A terraform module is a collection of files that builds up a deployment package that can be consumed my any other Terraform module or at the top level of the configuration. It is best used to help orchestrate the IaC into reusable segments. It can be used to help simplify deployments by extending the Single Responsibility principal to ensure that deployments don't get too complicated by doing too many things at once.  
## Explain what a Provider is and when you would use one  
A provider in terraform in the connector that translates the terraform code (HCL) from a standardised IaC language into something that can be used to deploy into Any environment. It acts as a form of comiler taking the terraform and turning it into another set of commands that work with the end platforms it is tied to.  
## Explain the difference between a "resource" and a "data" source.
A Resource in Terraform is an object which terraform is managing, as such it can complete Create, read, update and delete oporations. Data resources are a readonly format that can be , but don't have to be, created/managed outside of the current deployment/state.  
## Explain what an Expression or Function is and when you would use one.  
- An Expression in Terraform is a representation of data, this could be a literal value which is a static definition of data, or it could be a calculation, reference to another data source or a function.
- A function in Terraform is a collection of built in logical processors that process/transform/ammend data within the configuratuion i.e. TimeStamp() which gets the current system datetime, or TimeAdd which adds a defined amount of time to a providfed time.  
##  Explain what a Meta-Argument like Count or For_Each is and when you would use one.  
