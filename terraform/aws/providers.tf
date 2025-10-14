terraform {
  required_version = ">= 1.8.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.40" 
    }
    
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.26" 
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.13"
    }
  }
}

provider "aws" {}
