# decidim-communities

> **Skeleton — no functionality yet.** First custom module of [digidemocracy.ro](../README.md), milestone **M2**. Targets Decidim 0.32.x. License: AGPL-3.0.

Design document: [docs/COMMUNITIES.md](../docs/COMMUNITIES.md).

## Why

In standard Decidim, organisations (admins) create participatory spaces. In digidemocracy.ro, **citizens create communities**, and communities later create digital institutions (M3). This module adds that missing bottom-up layer.

## M2 scope

- Any **verified** user (Decidim authorizations, M1) can create a community.
- Community **level**: local, national or international, with a territorial scope (Decidim scopes) where relevant.
- **Membership rules**: open / request / invitation; minimum account seniority to vote internally.
- **Internal governance**: quorum, roles (founder, moderators), rules published on the community page.
- **Funding transparency**: declared sources of funding, visible publicly.
- **Reuse inside communities**: Decidim debates, comments, meetings and surveys — not reimplemented.
- Built as a **participatory space based on Decidim Assemblies** (components such as debates and meetings live in spaces, not in user groups).
- **Community support**: public links to content channels and support pages; no in-platform payments.

## Out of scope (later milestones)

Digital institutions and lists (M3), link to state institutions (M4), protest flow (M5), competencies (M6), federation (M7).

## Open design questions

- A "Community" assembly type vs. a new participatory space type built on the same foundations.
- Anti-capture rules (sudden mass joins before votes).

## Development

```bash
bundle install
# Tests will use decidim-dev's test app generator once code exists.
```
