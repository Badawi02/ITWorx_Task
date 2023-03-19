# It_worx_Task

<p align="center">
 <img src="https://github.com/Badawi02/ITWorx_Task/blob/feature/simple-web/ScreenShots/0.png"/>
</p>

## Tools Used
 - AWS
 - Terraform
 - Bash script


### Project Details:
 - Infrastructure as code using Terraform that builds an environment on AWS
 - VPC in US-EAST-1
 - Public-subnet in availability zone A
 - Security Group (SG)
 - EC2 instance of type T3a.micro with Amazon AMI Linux
 - Internet Gateway (IGW)        


### Getting Started

- Download The Code

```bash
  git clone https://github.com/Badawi02/ITWorx_Task.git
```
- Enter your AWS account credentials at file : terraform.tfvars
<p align="center">
 <img src="https://github.com/Badawi02/ITWorx_Task/blob/feature/simple-web/ScreenShots/1.png"/>
</p>


- Build the Infrastructure
```bash
  terraform init
```
```bash
  terraform plan
```
```bash
  terraform apply
```
- Output :
<p align="center">
 <img src="https://github.com/Badawi02/ITWorx_Task/blob/feature/simple-web/ScreenShots/2.png"/>
</p>


Now you can check your AWS account, you can see this resources has been created:
- VPC named "simple-web-app".
- 1 Subnet "webserver-subnet".
- 1 Internet gateway "Web-IGW"
- 1 Security group "webserver-sg"
- 1 public EC2 named "Web_Server" install on it nginx 

You can hit EC2 from public ip of it
- Output :
<p align="center">
 <img src="https://github.com/Badawi02/ITWorx_Task/blob/feature/simple-web/ScreenShots/3.png"/>
</p>

You can destroy the infrastructure and delete all resources created from my code 
```bash
  terraform destroy
```
