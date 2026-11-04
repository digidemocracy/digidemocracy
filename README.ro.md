# digidemocracy.ro

> Infrastructură digitală de jos în sus pentru democrație semi-directă. **Stadiu: pre-alfa / M0 Fundația.** Nimic de aici nu este încă gata de producție.

[English](README.md)

digidemocracy.ro implementează cadrul descris în white paper-ul
[*The Digital Ecosystem: A Framework for Semi-Direct Democracy*](docs/whitepaper.pdf)
de Marius-Stelian Costea (4 iulie 2024).

## Ideea

Majoritatea platformelor de participare civică funcționează **de sus în jos**: o primărie sau un guvern deține platforma și invită cetățenii în procesele pe care le deschide. digidemocracy.ro funcționează **de jos în sus**:

1. **Cetățenii creează comunități** (locale, naționale sau internaționale).
2. **Comunitățile creează instituții digitale**, cu organe alese de membri.
3. **Instituțiile digitale țin liste**: propuneri de politici, petiții, inițiative publice, cereri cetățenești.
4. **Elementele din liste se adresează instituțiilor statului**: în România, petiții conform OG 27/2002 (termen de răspuns 30 de zile) și consultări conform Legii 52/2003; la nivel UE, Inițiativa Cetățenească Europeană și petițiile către Parlamentul European.
5. **Protestele pot deveni comunități**, apoi instituții digitale permanente care negociază cu autoritățile.

Fiecare element are un **nivel de jurisdicție** (local / național / UE / global) și o **țintă**. Dreptul de vot urmează jurisdicția țintei. Ierarhizarea după competență se folosește **doar pentru alegerea reprezentanților, niciodată pentru ponderarea voturilor**, iar algoritmul este public și auditabil.

## Construit pe Decidim

Pornim de la [Decidim](https://decidim.org) (Ruby on Rails, AGPL-3.0) și refolosim cât mai multe module existente: comentarii, propuneri, dezbateri, inițiative, adunări, grupuri, întâlniri, sondaje, voturi și autorizări (verificarea identității). Construim ca module proprii doar ce lipsește din Decidim. Ordinea de dezvoltare o dă nevoia practică, nu direcția fluxului. Vezi [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md).

## Structura

| Cale | Conținut |
|---|---|
| `app/` | Docker + script de generare a aplicației Decidim (limba implicită: română) |
| `decidim-module-communities/` | Primul modul propriu (M2): comunități create de cetățeni — schelet |
| `docs/` | White paper, arhitectură |
| `ROADMAP.md` | Etapele M0–M8 |

## Pornire rapidă (dezvoltare)

Vezi [app/README.md](app/README.md). Pe scurt, cu Docker instalat:

```bash
cd app
./setup.sh          # generează aplicația Decidim în app/digidemocracy_app (o singură dată)
docker compose up   # http://localhost:3000
```

> ⚠️ Setup-ul **nu a fost încă testat cap-coadă**. Deschide un issue dacă ceva nu merge.

## Contribuții

Contribuțiile sunt binevenite. Citește [CONTRIBUTING.md](CONTRIBUTING.md). Toți contributorii semnează [CLA-ul](CLA.md) (un singur comentariu la primul pull request) și respectă [Codul de conduită](CODE_OF_CONDUCT.md). Probleme de securitate: [SECURITY.md](SECURITY.md).

## Licență

Platforma civică este licențiată sub [GNU Affero General Public License v3.0](LICENSE). Oricine rulează o versiune modificată ca serviciu în rețea trebuie să-și publice modificările. Funcțiile comerciale (evenimente sponsorizate, media, marketplace) sunt planificate într-o entitate separată și nu fac parte din acest repository.

© 2024–2026 Marius-Stelian Costea și contributorii.
