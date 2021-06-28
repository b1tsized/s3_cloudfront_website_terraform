# Terraform for S3 Website with Cloudfront

### Pre-req:

  * [Terraform Downloaded and Installed](https://www.terraform.io/downloads.html)
  * DNS managed domain in Route53

## Why I made this? 

I made this Terraform to help others upload their simple websites to S3 using Cloudfront to distribute it. This will make a secure site that uses HTTPS and can allow you to connect anything into Lambda or other services. This is great for a small simple site to use for a blog, portfolio, or resume. I use this for my personal site and it is around 3 USD a month to run. This is much cheaper than most providers and is completely serverless and allows you to focus on your site itself. If you need any server side coding I would suggest using Lambda with the API service.

With Cloudfront it will automatically pull from the bucket every 24 hours to refresh with any changes, because versioning is enabled.

The `root_bucket` is strictly used to redirect to the `www_bucket`. I've also made this to automatically load all of your website files to the bucket if you have them inside of the website folder. So, make sure to populate it otherwise you'll need to upload them manually after it has run.

## How to set-up this project for yourself.

1. Download this repo locally.

    `git clone https://github.com/b1tsized/s3_cloudfront_website_terraform.git`

2. Navigate to the folder you just downloaded.

    `cd ./s3_cloudfront_website_terraform/`

3. Initialize the directory in Terraform.

    `terraform init`

4. Update your variables in the `terraform.tfvars` file. If you need to use your AWS Access Key and Secret Key make sure to uncomment it in the `variables.tf`, `terraform.tfvars`, and `providers.tf`.

5. Add all of your files for your website into the `website` folder.

6. Check that everything is valid.

    `terraform validate`

7. Run your plan to verify all changes in AWS.

    `terraform plan`

8. Apply your changes.

    `terraform apply`

9. Type `yes` to confirm changes.

10. Wait for it to complete may take around 30 minutes with domain verification.

## If you already have a Route53 Domain Zone.

If you already have a Route53 domain registered with zones you'll need to update all of the references to `aws_route53_zone.main` to `data.aws_route53_zone.main`. 

I've made notes in both the `route53.tf` and `acm.tf` files.

### Support

If you have any issues I'll try and help as best I can to debug or update. Just send me a message!