# Terraform a Security Group in AWS

## Examples

For examples how to use, please refer to the examples folder.

## Usage

```
module "allow-al" {

  source = "jason-morsley/aws-security-group"

  name = "example"

  tags = {
    Terraform = "true"
  }

}
```