# IAM Stack Example

This example demonstrates how to compose IAM roles and policies in a modular, bottom-up fashion using reusable base terraform modules from [registry-tf](https://github.com/lace-cloud/registry-tf) monorepo.

---

## 🧠 Design Principles Behind This Example

This example demonstrates a layered, modular approach to composing IAM infrastructure. The stack is structured in two levels to emphasize clarity, reuse, and clean separation of concerns:

### ✅ Level 1: Policy Composition
- Each policy is modeled as a self-contained unit.
- It combines the `iam/policy` and `iam/policy_attachment` base modules.
- Inputs like `policy_name`, `actions`, and `resources` are fully parameterized.

### ✅ Level 2: IAM Role + Policy Bundles
- The role is created using the `iam/role` module.
- Policies are composed independently and attached to the role explicitly.
- This makes it easy to mix, match, and evolve roles and policies over time.

By structuring policy composition and role definition as distinct layers, this pattern reinforces a declarative, graph-oriented infrastructure design. It supports testability, reuse, and long-term maintainability — all while making the dependency graph explicit and transparent.

---

## 📐 Diagram of Composition

```hcl
[terraform.tfvars]
       ↓
[root variables.tf]
       ↓
[main.tf]
    ├── iam/role (base)
    └── policy bundle (cloudwatch_logs) ──▶ iam/policy + iam/policy_attachment
```

---

## 🧩 Modules Used

- [iam/role](../../iam/role)
- [iam/policy](../../iam/policy)
- [iam/policy_attachment](../../iam/policy_attachment)

---

## 🚀 How to Use

From this directory:

```bash
terraform init
terraform apply
```

This will:
- Create an IAM role named via `role_name`
- Attach a policy allowing CloudWatch logs permissions

---

## 🧾 Inputs

See [variables.tf](./variables.tf) for input structure.

---

## 📋 Example Configuration

Paste the following into a `terraform.tfvars` file to get started:

```hcl
# Example for IAM stack
role_name = "example-lambda-role"

assume_role_policy = jsonencode({
  Version = "2012-10-17",
  Statement = [{
    Effect    = "Allow",
    Principal = { Service = "lambda.amazonaws.com" },
    Action    = "sts:AssumeRole"
  }]
})

tags = {
  environment = "dev"
  team        = "platform"
}

---

## 📤 Outputs

- IAM role name and ARN
- IAM policy ARN
