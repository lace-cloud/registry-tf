# S3 Stack Example

This example demonstrates how to compose an S3 bucket and its versioning configuration using separate, reusable Terraform modules from the [terraform-modules](https://github.com/lace-cloud/registry-tf) monorepo.

---

## 🧠 Design Principles Behind This Example

This example demonstrates how separate infrastructure concerns — bucket creation and versioning — can be modularized and composed cleanly.

- The `s3` module handles creation of the S3 bucket, including tagging and lifecycle configuration.
- The `s3_versioning` module configures versioning independently, allowing it to be reused, toggled, or evolved without affecting the core bucket logic.

By decoupling creation from configuration, this pattern keeps modules focused and reusable while allowing teams to compose functionality in flexible and consistent ways.

---

## 📐 Diagram of Composition

```hcl
[terraform.tfvars]
       ↓
[root variables.tf]
       ↓
[main.tf]
    ├── s3_bucket ─────▶ modules/s3
    └── versioning ───▶ modules/s3_versioning
```

---

## 🧩 Modules Used

- [s3](../../modules/s3)
- [s3_versioning](../../modules/s3_versioning)

---

## 🚀 How to Use

From this directory:

```bash
terraform init
terraform apply
```

This will:
- Create a versioned S3 bucket with the specified name and tags.

---

## 🧾 Inputs

See [variables.tf](./variables.tf) for input structure.

---

## 📋 Example Configuration

Paste the following into a `terraform.tfvars` file:

```hcl
# Example for S3 stack
bucket_name = "my-example-s3-bucket"

---

## 📤 Outputs

- S3 bucket name
- S3 bucket ARN
