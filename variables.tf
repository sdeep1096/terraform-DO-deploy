variable "k8s_name" {
    default = "my-k8s-cluster"
}

variable "region" {
    default = "blr1"
}

variable "node_size" {
    default = "s-2vcpu-2gb"
}

variable "node_count" {
    default = 3
}

variable "k8s_version" {
    default = "1.31.1-do.5"
}