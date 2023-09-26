output "ai-users" {
  value = ["${ovh_cloud_project_user.ai-user.*.username}", "${ovh_cloud_project_user.ai-user.*.password}"]
  sensitive = true
}
