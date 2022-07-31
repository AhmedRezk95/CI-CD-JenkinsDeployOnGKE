
# create serviceaccount which has gke access from vm 
resource "google_service_account" "k8s-service-account" {
  account_id   = "k8s-service-account-id"
  display_name = "k8s-service-account"
}

resource "google_project_iam_member" "member" {
  project = "ahmed-rizk"
  # set the correct role
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.k8s-service-account.email}"

}

# resource "google_service_account_key" "mykey" {
#   service_account_id = google_service_account.k8s-service-account.name
#   private_key_type = "TYPE_GOOGLE_CREDENTIALS_FILE" 
# }


# resource "kubernetes_secret" "google-application-credentials" {
#   metadata {
#     name = "google-application-credentials"
#   }
#   data = {
#     "credentials.json" = base64decode(google_service_account_key.mykey.private_key)
#   }
# }
