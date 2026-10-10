# Run Whisperer

Pre-apply advisory layer. Surfaces three signals about your impending
`lace apply`:

1. **Own-history similarity** — vector match against your org's past
   Runs whose plan-diff is structurally similar AND whose outcome went
   bad (rolled back, apply failed, or caused an incident).
2. **Own-stack pattern** — share of recent Runs against this stack
   that touched the same resource types AND went bad.
3. **Module README warning** — a section heading like `## Warning`,
   `## Migration`, or `## Breaking` in a manifest README that matches
   the structural shape of your plan-diff.

Confidence is the count of corroborating signals divided by 3. Below
the umbrella confidence floor (70%) the advisory is suppressed
entirely — no hedging UI. With v0's max=3 only an all-three (100%)
fire renders.

## Where it shows up

- **CLI** — between policy resolution and the apply step in
  `lace apply`. Skipped when below floor.
- **Portal** — Run-detail Advisories panel (org-admin gated). Heed /
  Dismiss / thumbs feedback closes the eval-harness loop.

## Configuration

None — Whisperer has no per-install knobs in v0. Disable by
uninstalling; scope by binding to specific stacks via the org admin
surface.

## Enforcement

Advisory only — structurally. The install zod rejects
`enforcement='mandatory'` with a 422; this surface never gates a Run.
