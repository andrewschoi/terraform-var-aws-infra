## Summary

This repository creates boots a Elastic Map Reduce (EMR) Spark Cluster on AWS using Terraform.

## Requirements

```
- Terraform v1.5.7
- aws v2.9.8
```

## Setting up AWS Command Line Interface

### Generating AWS Access Keys

```
Create a IAM user with Administrator Access on AWS console
Create and save an access key (and its corresponding secret key)
```

### Configuring AWS CLI

After installing AWS CLI, the following should prompt you for the access key and secret key generated in the previous step.

```
aws configure
```

## Usage

Terraform is one of the most versatile Infrastucture as Code (IaC) tools for managing and provisioning cloud infrastructure.

There are many IaC tools out there. AWS has its own called CloudFormation. So why Terraform? Terraform's biggest advantage is its support for multiple cloud providers and low learning curve.

### Terraform ABC's

Provision and destroying resources on Terraform usually follows the following pattern.

> init -> fmt -> validate -> plan -> apply -> destroy (optional)

```
Terraform init # Initializes a Terraform project in the directory in which it is called

Terraform fmt # Formats *.tf files for consistency and readibility

Terraform validate # Validates syntax

Terraform plan # Gives a preview of an execution plan to create your infrastructure

Terraform apply # Executes and creates your infrastructure

Terraform destroy # Destroys all resources that the project created
```

## A Quick Rundown on Syntax

### Variables

Terraform supports variables that allow us to parameterize infrastructure without rewriting too much code. The following is how you declare a variable.

```
variable <variable name> {
  type = <number | string | list | etc.>
  default = <some default value>
}
```

You can access a variable by using

`var.<variable name>`

### Resources

Resources are how you will create most of your infrastructure in terraform. Here's how you do it.

```
resource <resource name> <local resource identifier> {
  <attribute> = <value>
  ...
}
```

How do you know what attributes are required for a specific resource? You have to read the documentation. Here's the link to the documentation for using [Terraform with AWS]("https://registry.terraform.io/providers/hashicorp/aws/latest/docs).

### Permissions

This is not directly related to Terraform, but it can be a reason why your build fails. IAM stands for Identity and Access Management, and it's responsible for not only creating physical user login accounts, but controlling what provisioned resources can do and how they can interact with other resources. If your build is failing, make sure your instances have the right permissions / policies / roles.
