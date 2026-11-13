# Roadmap

Estimates are indicative, assuming 2 Ruby on Rails developers experienced with Decidim, a part-time designer/frontend developer and a product owner. With one developer, roughly double them. Build order follows practical need, not the direction of the bottom-up flow.

| # | Milestone | Estimate |
|---|---|---|
| M0 | Foundation | 3–4 weeks |
| M1 | Identity & trust | 4–6 weeks |
| M2 | Citizen-created communities | 6–8 weeks |
| M3 | Digital institutions & lists | 6–8 weeks |
| M4 | Link to the Romanian state + public pilot | 4–6 weeks |
| M5 | Protest → community → institution | 4–5 weeks |
| M6 | Competencies v1 | 6–8 weeks |
| M7 | International federation | 8–10 weeks |
| M8 | Consultative e-voting & economic layer | 8–12 weeks (parallel) |

**~6–8 months to the public pilot (end of M4); ~14–18 months to the full version.**

## M0 — Foundation
Public repo under AGPL-3.0 with CLA; Decidim instance (staging + production) hosted in the EU; Romanian translation/adaptation; GDPR policies, terms of use.

## M1 — Identity & trust
Identity verification through Decidim's authorization handlers: start with SMS / document verification, then ROeID when integration is possible. Trust levels per account (unverified, verified, resident of a locality).

## M2 — Citizen-created communities
First custom module ([decidim-module-communities](decidim-module-communities/)). Any verified user can create a community (local / national / international) with membership rules, quorum, minimum seniority and funding transparency. Reuses Decidim debates, comments, meetings and surveys inside communities.

**Community support (no in-platform payments).** A community can fund itself from the content it creates and from the support of members and sympathisers. Digidemocracy does not host content or process payments: each community publicly declares its channels (YouTube, podcast, blog) and support pages (Open Collective, Patreon), and its transparency page shows its funding sources. Money never buys votes, visibility or positions in lists. An in-platform patronage module is out of scope for now.

## M3 — Digital institutions & lists
A community creates a digital institution (based on Decidim assemblies) with bodies elected by members. Lists built from existing components: policy proposals (Proposals), petitions & initiatives (Initiatives), citizen requests tracked by stage. Each item gets a jurisdiction level and a target.

## M4 — Link to the Romanian state + pilot
Submitting petitions as formal petitions under OG 27/2002 and tracking the 30-day deadline; submitting positions in consultations under Legea 52/2003; public record of authorities' answers. **Public pilot with 3–5 real communities.**

## M5 — Protest → community → institution
Fast flow to turn a protest into a community and an institution: demands, mobilisation, event planning, negotiation.

## M6 — Competencies v1
Self-declared competency profile with optional evidence (diplomas, institutional email). Public, auditable ranking algorithm, used only to select representatives, never to weight votes. Official validation with universities comes later through partnerships.

## M7 — International federation
National communities join international institutions; items move up and down between lists; voting eligibility computed from the target's jurisdiction. Links to the European Citizens' Initiative and European Parliament petitions.

## M8 — Consultative e-voting & economic layer
Consultative electronic votes/referendums built on Decidim's voting/elections module (no legal effect in Romania today). Sponsored events and community marketplace kept in a **separate commercial entity**, outside this repository.

## Running in parallel (non-code)
Security audit before the pilot; legal advice on petitions and GDPR; fundraising (e.g. NLnet / EU open-internet grants, EU democracy programmes).
