# Communities — design (M2)

Status: **design draft**, not implemented yet. Module: [`decidim-module-communities`](../decidim-module-communities/). Tracking issue: [#3](https://github.com/digidemocracy/digidemocracy/issues/3).

## Purpose

In the white paper, everything starts with citizens: they create **communities** (c1…cn), and communities later create **digital institutions** (i1…in) that interact with state institutions. Standard Decidim works the other way around: an organisation's admins create the participatory spaces. This module adds the missing bottom-up step: **a verified citizen can create a community without an admin.**

## Core decision: a community is a participatory space, not a user group

In Decidim, debates, meetings, surveys and comments are *components*, and components live inside *participatory spaces* (processes, assemblies). **User groups** are only shared profiles that can sign or endorse together; they cannot host components.

Since we want to reuse as much of Decidim as possible inside communities, a community is modelled as a **participatory space based on Decidim Assemblies** (a dedicated "Community" assembly type, or a thin new space built on the same foundations — to be decided while implementing), which citizens can create themselves.

This replaces the earlier assumption in [ARCHITECTURE.md](ARCHITECTURE.md) that communities would be built on user groups.

| Concept | Decidim building block |
|---|---|
| Community | Participatory space based on Assemblies, created by a citizen |
| Discussions inside a community | Debates + Comments |
| Events, protests, gatherings | Meetings (in person, online or hybrid; online streaming via an external link) |
| Polls | Surveys |
| Members | Space members / private-space users, plus our membership rules |
| Digital institution (M3) | Another Assembly, created by the community (possibly as a child assembly) |

## Community fields

| Field | Notes |
|---|---|
| Name, description, logo | Standard space fields |
| Level | `local`, `national` or `international` |
| Geographic scope | **Required for `local`** (Decidim scopes, e.g. county / city); optional otherwise |
| Membership type | `open` (join instantly), `request` (founders/moderators approve), `requirements` (e.g. resident of the scope, verified identity) |
| Quorum | Minimum share of members for internal decisions to be valid |
| Minimum tenure | How long someone must be a member before voting internally or taking part in creating an institution (anti-capture) |
| Roles | Founder, moderators, members |
| Rules | Free-text community rules, shown publicly |
| Support links | Public links to content channels and support pages (see below) |
| Funding transparency | Public page listing funding sources |

## Who can create a community

- **Target (after M1):** any user with a verified identity (Decidim authorizations).
- **Until M1 exists:** in development and test environments, any registered user may create a community, so M2 can be built and tested before verification is ready.
- The creator becomes the **founder** and first moderator.

## Inside a community

Reuse, do not reimplement:

- **Debates** and **Comments** for discussion;
- **Meetings** for events, protest planning and online sessions;
- **Surveys** for internal polls.

**Lists** (policy proposals, petitions, initiatives, citizen requests) are *not* part of a community. They belong to the **digital institution** the community creates in M3, exactly as in the white paper.

## Community support (no in-platform payments)

A community can fund itself from the content it creates and from the support of members and sympathisers.

- Digidemocracy **does not host content and does not process payments**.
- Each community publicly declares its **channels** (YouTube, podcast, blog, etc.) and **support pages** (Open Collective, Patreon, etc.).
- The community's **transparency page** shows its funding sources.
- **Money never buys votes, visibility or positions in lists.**
- An in-platform patronage/payments module is **out of scope** for now.

## Rules to enforce

1. One person, one vote inside the community; no weighting by money or rank.
2. Minimum tenure before voting internally or helping create an institution (protects against sudden mass joins before a vote).
3. A `local` community must have a geographic scope.
4. Only `local` or `national` communities (through their institutions) may address Romanian state institutions (white paper rule; enforced in M3/M4).
5. GDPR: community membership can reveal political opinions (special-category data, Art. 9). Member lists are private by default; only counts are public unless a member chooses otherwise.

## Out of scope for M2

Digital institutions and lists (M3), formal link to state institutions (M4), protest → community flow (M5), competencies (M6), international federation (M7), consultative e-voting (M8).

## Open questions

- A "Community" assembly type vs. a new participatory space type built on the same foundations.
- How public member lists should be (privacy vs. legitimacy of a community).
- Exact anti-capture thresholds (tenure, quorum defaults).
- Whether moderators can be elected by members from the start or only once an institution exists.
