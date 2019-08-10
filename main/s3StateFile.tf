############################################
#           S3 BACKEND                     #
############################################
terraform {
  backend "s3" {
    bucket = "cloudpart1buk"
    key    = "part1/terraform.tfstate"
    region = "eu-west-1"
    /*
     Make sure the profile is added hence you get an error like this:
        Initializing the backend...

        Error: No valid credential sources found for AWS Provider.
        Please see https://terraform.io/docs/providers/aws/index.html for more information on
        providing credentials for the AWS Provider
    */
    profile = "devops01"
  }
}