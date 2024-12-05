
resource "humanitec_resource_definition" "resource_group" {
  driver_type = "humanitec/terraform"
  id          =  "resourcegroup"
  name        = "resource_group"
  type        = "base-env"
  driver_account = "quickstart-azure"

  driver_inputs = {
    secrets_string = jsonencode({
      terraform = {
        tokens = {
          app_terraform_io = "gnCbsFyjFuE9BQ.atlasv1.Alq1J2JTyEGtlCvpyC1VnowUiH9tyr5zdSoASQUcodqnAsNQpvA7KiwXvbJBX6qYA3k"
        }
      }
    })
    values_string = jsonencode({
      files = {
        ".gitconfig" = <<-EOT
            [url "https://${var.git_password}@github.com/"]
              insteadOf = https://github.com/
            git
        EOT
        "provider.tf" = <<-EOT
            provider "azurerm" {
              features {}
              client_id     = "${var.client_id_secret_reference_key}"
              client_secret = "${var.client_secret_secret_reference_key}"
              subscription_id = "${var.subscription_id}"
              tenant_id = "${var.tenant_id}"
            }
        EOT
        "terraformcloud.tf" = <<-EOT
            terraform {
              required_providers {
                azurerm = {
                  version = "3.116.0"
                  source  = "hashicorp/azurerm"
                }
              }
              cloud {
                organization = "Fernandinho"
                workspaces {
                  name = "workspace-$${context.app.id}"
                }
              }
            }
        EOT
      }
      source = {
        rev  = "refs/heads/dev"
        url  = "https://${var.git_password}@github.com/vvrepo/teste-esteira.git"
      }

      runner_mode = "managed"

      variables = {
        name = "rgdv$${context.app.id}"
        location            = var.resource_group_location
      }    
    })
  }
}

resource "humanitec_resource_definition_criteria" "this" {
  resource_definition_id = humanitec_resource_definition.resource_group.id
  app_id                 = "quickstart"
}