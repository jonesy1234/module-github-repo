resource "github_repository" "this" {
  name                   = var.name
  description            = var.description
  visibility             = var.visibility
  has_issues             = var.has_issues
  has_projects           = var.has_projects
  has_wiki               = var.has_wiki
  is_template            = var.is_template
  allow_merge_commit     = var.allow_merge_commit
  allow_squash_merge     = var.allow_squash_merge
  allow_rebase_merge     = var.allow_rebase_merge
  delete_branch_on_merge = var.delete_branch_on_merge
  auto_init              = var.auto_init
  gitignore_template     = var.gitignore_template
  license_template       = var.license_template
  archived               = var.archived
  archive_on_destroy     = var.archive_on_destroy
  topics                 = var.topics
  vulnerability_alerts   = var.vulnerability_alerts

  dynamic "template" {
    for_each = var.template_source == null ? [] : var.template_source

    content {
      owner      = template.value.template_owner
      repository = template.value.template_repository
    }
  }
}
