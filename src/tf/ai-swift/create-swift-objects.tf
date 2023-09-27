resource "openstack_objectstorage_container_v1" "ai-object-storage-container" {
  count = var.number_of_attendees
  name   = "attendee-${count.index}-data"
}