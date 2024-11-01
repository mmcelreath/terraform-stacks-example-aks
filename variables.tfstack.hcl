# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "cluster_name" {
  type = string
}

variable "kubernetes_version" {
  type = string
}

variable "location" {
  type = string
}

# variable "identity_token_file" {
#   type = string
# }

variable "identity_token" {
  type      = string
  ephemeral = true
}

variable "azure_subscription_id" {
  type = string
  ephemeral = true
}

variable "azure_tenant_id" {
  type = string
  ephemeral = true
}

variable "azure_client_id" {
  type = string
  description = "ID of AzureAD service principal"
  ephemeral = true
}
