provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}

module "storage-bucket" {
  source  = "SweetOps/storage-bucket/google"
  version = "0.1.1"

  name = ["ar85-storage-bucket-test", "ar85-storage-bucket-test2"]
}

output storage-bucket_url {
  value = "${module.storage-bucket.url}"
}
