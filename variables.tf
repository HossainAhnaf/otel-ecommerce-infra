variable "location" {
  type        = string
  description = "value for location"
}

variable "aks_agent_count" {
  type        = number
  description = "value for agent count"
  default     = null
}

variable "aks_agent_size" {
  type        = string
  description = "value for agent size"
}


variable "aks_agent_max_pods" {
  type        = number
  description = "value for agent max pods"
}

variable "aks_agent_min_count" {
  type        = number
  description = "value for agent min count"
  default     = null
}

variable "aks_agent_max_count" {
  type        = number
  description = "value for agent max count"
  default     = null
}

variable "aks_sku_tier" {
  type        = string
  description = "value for sku tier"
}

variable "aks_azure_policy_enabled" {
  type        = bool
  description = "value for azure policy"
}

variable "aks_enable_auto_scaling" {
  type        = bool
  description = "value for enable auto scaling"
}
