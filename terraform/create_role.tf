
# Resource - https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/custom_db_role

terraform {
  required_providers {
    mongodbatlas = {
      source = "mongodb/mongodbatlas"
      version = "1.4.6"
    }
  }
}

provider "mongodbatlas" {
  public_key = "<ATLAS_PUBLIC_API_KEY>"
  private_key  = "<ATLAS_PRIVATE_API_KEY>"
}

# DATABASE Role
resource "mongodbatlas_custom_db_role" "test_role" {
  project_id = "<ATLAS_PROJECT_ID>"
  role_name  = "myCustomRole"
  actions {
    action = "FIND"
    resources {
      collection_name = ""
      database_name   = "anyDatabase"
    }
  }
  actions {
    action = "UPDATE"
    resources {
      collection_name = ""
      database_name   = "anyDatabase"
    }
  }
  actions {
    action = "INSERT"
    resources {
      collection_name = ""
      database_name   = "anyDatabase"
    }
  }
  actions {
    action = "REMOVE"
    resources {
      collection_name = ""
      database_name   = "anyDatabase"
    }
  }
}

#OUTPUT the role creation
#Response example - https://www.mongodb.com/docs/atlas/reference/api/custom-roles-create-a-role/#response
output "test_role" {
  value = mongodbatlas_custom_db_role.test_role.role_name
}