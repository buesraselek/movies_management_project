terraform {
  backend "s3" {
    bucket = "ta-terraform-tfstates-535268269273"
    key    = "movies/movies-projet-exercise/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}
