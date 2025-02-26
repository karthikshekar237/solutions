name: Terraform Deployment

on:
  push:
    branches:
      - main
      - develop
  pull_request:
    branches:
      - main
      - develop

jobs:
  terraform:
    runs-on: ubuntu-latest
    permissions:
      id-token: write
      contents: read
    steps:
      - name: Checkout Repository
        uses: actions/checkout@v3

      - name: Configure AWS Credentials via OIDC
        uses: aws-actions/configure-aws-credentials@v2
        with:
          role-to-assume: arn:aws:iam::970547379591:role/githuboidc
          aws-region: ap-southeast-2

      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v1
        with:
          terraform_version: "1.4.0"

      - name: Terraform Init
        working-directory: terraform
        run: terraform init

      - name: Terraform Plan
        working-directory: terraform
        run: terraform plan -out=tfplan

      - name: Terraform Apply (Main Branch - Manual Approval)
        if: github.ref == 'refs/heads/main'
        # When deploying to main, assign to the "prod" environment which should be configured to require manual approval.
        environment: prod
        working-directory: terraform
        run: terraform apply tfplan

      - name: Terraform Apply (Develop Branch - Auto Approve)
        if: github.ref == 'refs/heads/develop'
        working-directory: terraform
        run: terraform apply -auto-approve tfplan
