output "ai-objects-storage" {
  value = ["${openstack_objectstorage_container_v1.ai-object-storage-container.*.name}"]
}
