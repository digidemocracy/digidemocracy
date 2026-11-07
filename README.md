# digidemocracy.ro

> Bottom-up digital infrastructure for semi-direct democracy. **Status: pre-alpha / M0 Foundation.** Nothing here is production-ready.

[Română](README.ro.md)

digidemocracy.ro implements the framework described in the white paper
[*The Digital Ecosystem: A Framework for Semi-Direct Democracy*](docs/whitepaper.pdf)
by Marius-Stelian Costea (July 4, 2024).

## The idea

Most civic-participation platforms work **top-down**: a city hall or government runs a platform and invites citizens into processes it opens. digidemocracy.ro works **bottom-up**:

1. **Citizens create communities** (local, national or international).
2. **Communities create digital institutions** with bodies elected by their members.
3. **Digital institutions keep lists**: policy proposals, petitions, public initiatives, citizen requests.
4. **List items are addressed to state institutions**: in Romania, petitions under OG 27/2002 (30-day reply obligation) and consultations under Legea 52/2003; at EU level, the European Citizens' Initiative and petitions to the European Parliament.
5. **Protests can become communities**, and then permanent digital institutions that negotiate with authorities.

Every list item has a **jurisdiction level** (local / national / EU / global) and a **target** institution. Voting eligibility follows the target's jurisdiction. Competency ranking is used **only to select representatives, never to weight votes**, and the algorithm is public and auditable.

## Built on Decidim

We build on [Decidim](https://decidim.org) (Ruby on Rails, AGPL-3.0) and reuse as many existing modules as possible: comments, proposals, debates, initiatives, assemblies, user groups, meetings, surveys, elections/votings and authorizations (identity verification). Only what Decidim does not have is built as custom modules. Build order follows practical need, not the direction of the flow. See [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md).

## Repository layout

| Path | Content |
|---|---|
| `app/` | Docker setup + script to generate the Decidim application (Romanian default locale) |
| `decidim-module-communities/` | First custom module (M2): citizen-created communities — skeleton |
| `docs/` | White paper, architecture |
| `ROADMAP.md` | Milestones M0–M8 |

## Quick start (development)

See [app/README.md](app/README.md). In short, with Docker installed:

```bash
cd app
./setup.sh          # one-time, can take 20-40+ min; needs 8 GB+ RAM for Docker
docker compose up   # http://localhost:3000
```

> ⚠️ The setup has **not yet been tested end-to-end**. Please open an issue if something fails.

## Contributing

Contributions are welcome. Please read [CONTRIBUTING.md](CONTRIBUTING.md). All contributors must sign the [CLA](CLA.md) (done with one comment on your first pull request) and follow the [Code of Conduct](CODE_OF_CONDUCT.md). Security issues: see [SECURITY.md](SECURITY.md).

## License

The civic platform is licensed under the [GNU Affero General Public License v3.0](LICENSE). Anyone running a modified version as a network service must publish their changes. Commercial features (sponsored events, media, marketplace) are planned as a separate entity and are not part of this repository.

© 2024–2026 Marius-Stelian Costea and contributors.
