# WeatherSense

A Flutter portfolio project covering advanced Flutter concepts: Streams, Go_Router, Riverpod, Retrofit, SQLite, offline mode, and on-device ML.

See [DESIGN.md](DESIGN.md) for full screen breakdown, architecture, provider graph, and design decisions.

---

## Checklist

### Setup
- [ ] Project structure (feature-based folders)
- [ ] Go_Router — ShellRoute with bottom nav
- [ ] Riverpod — ProviderScope, basic providers
- [ ] Retrofit — OpenWeatherMap client, models, json_serializable
- [ ] SQLite — Drift schema (forecasts, locations, history)

### Core Features
- [ ] Home screen — current weather
- [ ] Forecast screen — 7-day list
- [ ] Search screen — geocoding API, add to Saved Locations
- [ ] Saved Locations screen — CRUD on SQLite
- [ ] Settings screen — language, units

### Streams & Offline
- [ ] `connectivityProvider` as `StreamProvider`
- [ ] `locationProvider` as `StreamProvider` (GPS)
- [ ] `forecastProvider` — offline fallback to SQLite cache
- [ ] Periodic refresh stream (every 30 min)
- [ ] History screen — last 7 days from SQLite

### Activities
- [ ] Activity scoring rules (temp, wind, precipitation thresholds)
- [ ] Star rating UI (1–5) per activity
- [ ] Mini weather summary at top of Activities screen
- [ ] (Optional) TFLite model for activity scoring

### ML — Cloud Scanner
- [ ] Find/train cloud classification TFLite model
- [ ] Bundle model in `assets/`
- [ ] Camera integration
- [ ] TFLite inference → cloud type + rain probability
- [ ] Cloud Scanner screen UI

### Polish
- [ ] Deep linking via Go_Router
- [ ] l10n — PL/EN
- [ ] Error states + loading skeletons
- [ ] Offline banner (connectivity stream → UI)
- [ ] App icon + splash screen
