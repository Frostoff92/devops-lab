variable "network_name" {
  description = "Docker network name"
  type        = string
  default     = "lab_net"
}

variable "web_container_name" {
  description = "Web application container name"
  type        = string
  default     = "frost-webapp"
}

variable "web_image" {
  description = "Web application image"
  type        = string
  default     = "ghcr.io/frostoff92/frost-webapp:latest"
}

variable "web_external_port" {
  description = "External port for web application"
  type        = number
  default     = 5000
}

variable "redis_container_name" {
  description = "Redis container name"
  type        = string
  default     = "lab-redis"
}

variable "redis_image" {
  description = "Redis Docker image"
  type        = string
  default     = "redis:7-alpine"
}
