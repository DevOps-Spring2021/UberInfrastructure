variable "prefix" {
  description = "Azure_FE"
  default     = "Azure-FE"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be provisioned"
  default     = "East Us"
}

variable "kubernetes_client_id" {
  description = "The Client ID for the Service Principal to use for this Managed Kubernetes Cluster"
  default     = "8e0cd877-7b71-47d5-96ce-cc583dcec110"
}

variable "kubernetes_client_secret" {
  description = "The Client Secret for the Service Principal to use for this Managed Kubernetes Cluster"
  default     = "zgQm2M9qk92.kCFbaQ_rls1w40X0.hy8dI"
}
variable "ssh_key" {
  description = "SSH into cluster"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDoNmCqJGKuKqNYRCOwQVTLWjQxwx9lXYiCwhfHLsTK5Oo2dVtHbh6mFvZubXPBgD3dK/lwxCZsfQrUo1wSaP5XlygDw6Zii7J31xFqwf6YHbJFY2KKeTt9ZpC5JOP50AoZVDmjwJtGfVVAS3m+7s3uTAAQDfkMDRp+J7kx511ZtedBsJdOVkgPyh61FrzVjGUmV9FXJ1PZSzIaaudVst3/DVmppxjmfyhGI9rKlUyOceHBik2UJ166/43i8xnJhQgt0V1vc/nhhPTV6GXs9kqZ7RNyvX8T8qWrQ22gFmDhFMWnc/0Xm1wDQOvfyEbA4KDdyl67/XWyAqZfJMTX1VHP0ydcKqtZlEzlvySdCwfNob6OSb+m6lHvLgc34FvKsyOYhadS76eYY114UN29v91xbdGuFyryMnVTU/FdT/uuXKC+TORigG7ExkGYf67mHaap5f/MqIVHKRpsi2AOw769tYpi615H6d1wYau2tlgLPj4oq0D54CC5HBeaY5vTHS0= phapa@XPS"
}
#a8eec281-aaa3-4dae-ac9b-9a398b9215e7
