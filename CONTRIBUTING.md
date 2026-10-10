# Contributing

This repository holds the `lace` organization's registry artifacts. Pull
requests are reviewed by `@lace-cloud/platform-team`.

## Folder shape

```
<axis>/<author>/<name>/manifest.yaml
<axis>/<author>/<name>/README.md
```

`<axis>` is one of `modules`, `scanners`, `handlers` or `agents`. `<author>` is
`lace`. A module carries its `*.tf` files beside `manifest.yaml` and may nest
under a cloud-system tier, as in `modules/aws/<name>/main.tf`. Every other axis
is a manifest and a README.

What each axis's manifest must declare is in the
[registry docs](https://lace.cloud/docs/registry). The publish endpoint is the
contract: it validates every manifest against its axis when it is published.

## What the check enforces

`check.yml` runs on every pull request into `develop` or `main` and fails it
unless each changed manifest:

- carries the envelope keys `apiVersion`, `axis`, `author`, `name`, `version`,
  `displayName` and `runtime`, with an `axis` of `module`, `scanner`, `handler`
  or `agent`;
- bumps `version` when the manifest already exists on the base branch;
- for a module, passes `lace module validate` with the verdict
  `already-lace-style`.

## Review checklist

- [ ] The check passes.
- [ ] `(axis, author, name)` is unique across the repository.
- [ ] `README.md` sits beside `manifest.yaml` and explains what the artifact does
      and how to configure it.
- [ ] No secrets, credentials or customer data in any manifest or README.

## Manifest immutability

Once a version is published, its content is frozen. Publishing different
content at the same `(axis, author, name, version)` is refused with `409`. To
ship a fix, bump `version`.
