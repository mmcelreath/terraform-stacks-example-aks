# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "azurerm" {
  audience = ["api://AzureADTokenExchange"]
}

store "varset" "auth" {
  id = "varset-4HuWccs1GiuKR32P"
  category = "terraform"
}


deployment "dev" {
  inputs = {
    cluster_name          = "stacks-demo"
    kubernetes_version    = "1.30"
    location              = "eastus2"

    identity_token        = identity_token.azurerm.jwt
    # identity_token_file   = identity_token.azure.jwt_filename

    azure_subscription_id = store.varset.auth.oidc_client_id
    azure_tenant_id       = store.varset.auth.subscription_id
    azure_client_id       = store.varset.auth.tenant_id
  }
}

# orchestrate "auto_approve" "safe_plans_dev" {
#   check {
#       # Only auto-approve in the development environment if no resources are being removed
#       condition = context.plan.changes.remove == 0 && context.plan.deployment == deployment.dev
#       reason = "Plan has ${context.plan.changes.remove} resources to be removed."
#   }
# }