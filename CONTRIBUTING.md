# Contributing to digidemocracy.ro

Thank you for helping! Contributions in English or Romanian are welcome.

## Before you start

- Read the [white paper](docs/whitepaper.pdf), [ARCHITECTURE](docs/ARCHITECTURE.md) and [ROADMAP](ROADMAP.md).
- For anything bigger than a small fix, open an issue first so we can agree on the approach.
- **Reuse Decidim first.** If a Decidim module or feature already does the job (comments, proposals, debates, etc.), use or configure it instead of writing new code. If something should change in Decidim itself, consider contributing upstream.

## The CLA

All contributors must sign the [Contributor License Agreement](CLA.md). You keep the copyright on your work; you grant the project a broad license, including the right to relicense. When you open your first pull request, the CLA bot will ask you to comment:

> I have read the CLA Document and I hereby sign the CLA

## Workflow

1. Fork the repo and create a branch from `main` (`feature/…`, `fix/…`).
2. Keep pull requests small and focused; describe what and why.
3. Add or update tests (RSpec) for code changes; run `bundle exec rubocop` when the module has Ruby code.
4. User-facing text must have both `en` and `ro` translations.
5. A maintainer reviews; at least one approval is required to merge.

## Principles we will not compromise on

- Competency ranking never weights a vote.
- Algorithms affecting representation are public and documented.
- Personal data is minimised (GDPR); political opinions are special-category data.

## Conduct

This project follows the [Code of Conduct](CODE_OF_CONDUCT.md).
