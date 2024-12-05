variable "humanitec_organization" {
    description = "REQUIRED: used to specify the organization where the resources, token and application will be applied" 
}

variable "client_id_secret_reference_key" {
    description = "REQUIRED: used to specify the secret reference key for the client id"
    default = "dce55e2f-ce0e-4314-99c0-043388ef6ecf"
}

variable "client_secret_secret_reference_key" {
    description = "REQUIRED: used to specify the secret reference key for the client secret"
    default = "moO8Q~rb-g_BJmI4cPB2AxUj6JS_3YGBKU-JmcUY"
}

variable "resource_group_location" {
    description = "REQUIRED: used to specify the location of the resource group"
    default = "brazilsouth"
}

variable "git_password" {
    description = "REQUIRED: used to specify the password for the git repository"
    default = "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"
}

variable "subscription_id" {
    description = "REQUIRED: used to specify the subscription id"
    default = "84c846a7-3273-4925-be8c-a43f407fa842"
}

variable "tenant_id" {
    description = "REQUIRED: used to specify the tenant id"
    default = "f8d886ff-2097-4c25-96a8-6dc1a287954d"
}
