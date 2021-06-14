# GitHub Repositories

Terraform module which manages GitHub repositories

## Terraform versions

Terraform 0.12 and above are supported

## Usage

```hcl
module "repos" {
  source   = "./modules/module-github-repo"
  for_each = var.repositories

  name = each.key
  description = each.key

  template_source = [
    {
      template_owner = "terraform"
      template_repository = "template-module"
    }
  ]
}
```

## Examples

N/A

## Inputs notes

github_access_token requires a Personal Access Token (PAT) as its input. PATs should not be stored in version control as can be retrieved and used for evil. The example shows passing this value as a Secure Systems Manager Parameter Store value as follows.

```hcl
data "aws_ssm_parameter" "pat" {
  name = "/PAT"
}
```

The above entry can be used in the root module and passed as an input as above.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| github | 4.3.0 |

## Providers

| Name | Version |
|------|---------|
| github | 4.3.0 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [github_repository](https://registry.terraform.io/providers/integrations/github/4.3.0/docs/resources/repository) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allow\_merge\_commit | (Optional) Set to false to disable merge commits on the repository. | `bool` | `true` | no |
| allow\_rebase\_merge | (Optional) Set to false to disable rebase merges on the repository. | `bool` | `true` | no |
| allow\_squash\_merge | (Optional) Set to false to disable squash merges on the repository. | `bool` | `true` | no |
| archive\_on\_destroy | (Optional) Set to true to archive the repository instead of deleting on destroy. | `bool` | `true` | no |
| archived | (Optional) Specifies if the repository should be archived. Defaults to false. NOTE Currently, the API does not support unarchiving. | `any` | `null` | no |
| auto\_init | (Optional) Set to true to produce an initial commit in the repository. | `bool` | `false` | no |
| delete\_branch\_on\_merge | (Optional) Automatically delete head branch after a pull request is merged. Defaults to false. | `bool` | `true` | no |
| description | (Optional) A description of the repository. | `any` | n/a | yes |
| gitignore\_template | (Optional) Use the name of the template without the extension. For example, "Haskell". | `any` | `null` | no |
| has\_issues | (Optional) Set to true to enable the GitHub Issues features on the repository. | `bool` | `true` | no |
| has\_projects | (Optional) Set to true to enable the GitHub Projects features on the repository. Per the GitHub documentation when in an organization that has disabled repository projects it will default to false and will otherwise default to true. If you specify true when it has been disabled it will return an error. | `bool` | `false` | no |
| has\_wiki | (Optional) Set to true to enable the GitHub Wiki features on the repository. | `bool` | `false` | no |
| is\_template | (Optional) Set to true to tell GitHub that this is a template repository. | `bool` | `false` | no |
| license\_template | (Optional) Use the name of the template without the extension. For example, "mit" or "mpl-2.0". | `any` | `null` | no |
| name | (Required) The name of the repository. | `any` | n/a | yes |
| template\_source | (Optional) Specifies the organization or user and the name of the template repository. | <pre>list(object({<br>    template_owner = string<br>    template_repository = string<br>  }))</pre> | `null` | no |
| topics | (Optional) The list of topics of the repository. | `any` | `null` | no |
| visibility | (Optional) Can be public, internal or private. | `string` | `"private"` | no |
| vulnerability\_alerts | (Optional) - Set to true to enable security alerts for vulnerable dependencies. Enabling requires alerts to be enabled on the owner level. (Note for importing: GitHub enables the alerts on public repos but disables them on private repos by default.) See GitHub Documentation for details. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| repo | All attributes for the created repository |
