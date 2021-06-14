output "repo" {
  description = "All attributes for the created repository"
  value       = github_repository.this.*
}