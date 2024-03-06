# Exercise 13

In this exercise, you will manage resource drift that can occur if a resource under Terraform's control has been changed manually in cloud.

1. In the current directory, run the `init` and `apply` command to create the resources need to set up the scenario.
2. Open the AWS dashboard and find the created resource.
3. Add two tags to the resource manually from the AWS dashboard: `Service = Backend`, `Author = John Doe`.
4. Run the `plan` command. What do you see?  ---> I see the below:

gibran@Gibrans-MBP 13-resource-drift % terraform plan 
aws_instance.app_server: Refreshing state... [id=i-0b445f79fcbf5e2f7]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # aws_instance.app_server will be updated in-place
  ~ resource "aws_instance" "app_server" {
        id                                   = "i-0b445f79fcbf5e2f7"
      ~ tags                                 = {
          + "Author"  = "John Doe"
          + "Service" = "Backend"
        }
      ~ tags_all                             = {
          + "Author"  = "John Doe"
          + "Service" = "Backend"
        }
        # (28 unchanged attributes hidden)

        # (6 unchanged blocks hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
gibran@Gibrans-MBP 13-resource-drift % 


5. Reconcile the local state with the actual configuration in AWS. Ensure that the `apply` command reports with "no changes needed".