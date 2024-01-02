# README

For each commit, run `terraform plan` and then `terraform apply`, then move on to next commit.

This is the final result of `terraform plan`:

```bash
terraform-refactor-test % op run --env-file=".env_vars" -- terraform plan
aws_s3_bucket.all_my_s3_buckets["second_s3_bucket"]: Refreshing state... [id=cantbelievethisnameisnottaken100]
aws_s3_bucket.all_my_s3_buckets["s3_bucket"]: Refreshing state... [id=cantbelievethisnameisnottaken]

Terraform will perform the following actions:

  # aws_s3_bucket.s3_bucket has moved to aws_s3_bucket.all_my_s3_buckets["s3_bucket"]
    resource "aws_s3_bucket" "all_my_s3_buckets" {
        id                          = "cantbelievethisnameisnottaken"
        tags                        = {}
        # (10 unchanged attributes hidden)

        # (3 unchanged blocks hidden)
    }

  # aws_s3_bucket.second_s3_bucket has moved to aws_s3_bucket.all_my_s3_buckets["second_s3_bucket"]
    resource "aws_s3_bucket" "all_my_s3_buckets" {
        id                          = "cantbelievethisnameisnottaken100"
        tags                        = {}
        # (10 unchanged attributes hidden)

        # (3 unchanged blocks hidden)
    }

Plan: 0 to add, 0 to change, 0 to destroy.

─────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't
guarantee to take exactly these actions if you run "terraform apply" now.
```

This is the final result of `terraform apply`:

```bash
terraform-refactor-test % op run --env-file=".env_vars" -- terraform apply
aws_s3_bucket.all_my_s3_buckets["second_s3_bucket"]: Refreshing state... [id=cantbelievethisnameisnottaken100]
aws_s3_bucket.all_my_s3_buckets["s3_bucket"]: Refreshing state... [id=cantbelievethisnameisnottaken]

Terraform will perform the following actions:

  # aws_s3_bucket.s3_bucket has moved to aws_s3_bucket.all_my_s3_buckets["s3_bucket"]
    resource "aws_s3_bucket" "all_my_s3_buckets" {
        id                          = "cantbelievethisnameisnottaken"
        tags                        = {}
        # (10 unchanged attributes hidden)

        # (3 unchanged blocks hidden)
    }

  # aws_s3_bucket.second_s3_bucket has moved to aws_s3_bucket.all_my_s3_buckets["second_s3_bucket"]
    resource "aws_s3_bucket" "all_my_s3_buckets" {
        id                          = "cantbelievethisnameisnottaken100"
        tags                        = {}
        # (10 unchanged attributes hidden)

        # (3 unchanged blocks hidden)
    }

Plan: 0 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes


Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
```

# Setup

Environment variables for AWS credentials stored in 1Password.  Run commands like this:

```bash
op run --env-file=".env_vars" -- terraform plan
op run --env-file=".env_vars" -- terraform apply
```
