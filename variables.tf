variable "name" {
  description = "(Required) The name of the repository."
}

variable "description" {
  description = "(Optional) A description of the repository."
}

variable "visibility" {
  description = "(Optional) Can be public, internal or private."
  default     = "private"
}

variable "has_issues" {
  description = "(Optional) Set to true to enable the GitHub Issues features on the repository."
  default     = true
}

variable "has_projects" {
  description = "(Optional) Set to true to enable the GitHub Projects features on the repository. Per the GitHub documentation when in an organization that has disabled repository projects it will default to false and will otherwise default to true. If you specify true when it has been disabled it will return an error."
  default     = false
}

variable "has_wiki" {
  description = "(Optional) Set to true to enable the GitHub Wiki features on the repository."
  default     = false
}

variable "is_template" {
  description = "(Optional) Set to true to tell GitHub that this is a template repository."
  default     = false
}

variable "allow_merge_commit" {
  description = "(Optional) Set to false to disable merge commits on the repository."
  default     = true
}

variable "allow_squash_merge" {
  description = "(Optional) Set to false to disable squash merges on the repository."
  default     = true
}

variable "allow_rebase_merge" {
  description = "(Optional) Set to false to disable rebase merges on the repository."
  default     = true
}

variable "delete_branch_on_merge" {
  description = "(Optional) Automatically delete head branch after a pull request is merged. Defaults to false."
  default     = true
}

variable "auto_init" {
  description = "(Optional) Set to true to produce an initial commit in the repository."
  default     = false
}

variable "gitignore_template" {
  description = "(Optional) Use the name of the template without the extension. For example, \"Haskell\"."
  default     = null
}

variable "license_template" {
  description = "(Optional) Use the name of the template without the extension. For example, \"mit\" or \"mpl-2.0\"."
  default     = null
}

variable "archived" {
  description = "(Optional) Specifies if the repository should be archived. Defaults to false. NOTE Currently, the API does not support unarchiving."
  default     = null
}

variable "archive_on_destroy" {
  description = "(Optional) Set to true to archive the repository instead of deleting on destroy."
  default     = true
}

variable "topics" {
  description = "(Optional) The list of topics of the repository."
  default     = null
}

variable "vulnerability_alerts" {
  description = "(Optional) - Set to true to enable security alerts for vulnerable dependencies. Enabling requires alerts to be enabled on the owner level. (Note for importing: GitHub enables the alerts on public repos but disables them on private repos by default.) See GitHub Documentation for details."
  default     = false
}

variable "template_source" {
  description = "(Optional) Specifies the organization or user and the name of the template repository."
  type = list(object({
    template_owner      = string
    template_repository = string
  }))
  default = null
}
