resource "ovh_cloud_project_user" "ai-user" {
  count = var.number_of_users
  role_names = ["ai_training_operator", "objectstore_operator"]
  description = "AI user ${count.index} for workshop"
}