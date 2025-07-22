variable "location" {
  type        = string
  description = "value for location"
}

variable "aks_agent_count" {
  type        = number
  description = "value for agent count"
}

variable "aks_agent_size" {
  type        = string
  description = "value for agent size"
}

variable "aks_agent_pool_name" {
  type        = string
  description = "value for agent pool name"
}

variable "aks_agent_max_pods" {
  type        = number
  description = "value for agent max pods"
}

variable "aks_sku_tier" {
  type        = string
  description = "value for sku tier"
}

variable "aks_azure_policy_enabled" {
  type        = bool
  description = "value for azure policy"
}

variable "aks_auto_scaler_profile_enabled" {
  type        = bool
  description = "value for auto scaler profile"
}
