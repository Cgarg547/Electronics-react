# Allow the app to read its secrets under secret/data/garg-electronics/*
path "secret/data/garg-electronics/*" {
  capabilities = ["read", "list"]
}

# Allow dynamic database credentials
path "database/creds/garg-electronics-db" {
  capabilities = ["read"]
}

# Deny access to all other secret paths
path "*" {
  capabilities = ["deny"]
}
