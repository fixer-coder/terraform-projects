# Deploy Static site

---

## Project Description

Our engineering team has been complaining about not having a centralized documentation platform where everyone can search for projects related
documentations, How to(s), common pitfalls and others types of documentation platform. The leadership team has tasked your manager to look for
a solution and with the help of your team architect, they have decided to host a static site on AWS s3 and use cloudfront to distribute content
to different regions where we have branches. Your manager have tasked you to do a POC on this idea to see if it is possible or not.

## Part of the process to automate with IAC

<img width="861" alt="Screen Shot 2021-12-08 at 6 17 14 PM" src="https://user-images.GitHubusercontent.com/80710703/145311618-f49f2d9f-8471-484b-a18b-bac870dbe1a2.png">

## Deploying Static site follow through

Terraform code to deploy resources to automatically deploy static site from GitHub using codepipeline and use cloudfront to deliver content

### How to deploy the Resource

- Create codestar connections manually to the GitHub account that you intend to get code from.
  - Use GitHub version 2 in aws
  - Give access to only the repository need
  - Put in the required variables needed by terraform

#### Compulsory Variables

- aws-account
- codestar-connections-arn

### Deploying

- Run terraform init
- Run terraform plan
  - Read through the plan to confirm that expected resource will be created
- Run Terraform apply

### Room for improvement

- Create the codestar connection using terraform
- Have GitHub action do validations, formatting and output the plan of terraform code
- Setup terraform remote state to use aws s3 bucket and locking to use dynamo db
