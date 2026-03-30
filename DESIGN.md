# WeatherSense — Design Document

## Screens

### Bottom Navigation Bar
| Screen | Description |
|--------|-------------|
| **Home** | Current weather, hourly forecast, 🔍 Search icon in AppBar, 📍 Saved Locations icon in AppBar |
| **Forecast** | 7-day forecast, button to History screen |
| **Activities** | Outdoor activity scoring (bike, run, walk, fishing) with 1–5 stars based on forecast data. Mini weather summary at top. |
| **Settings** | Language (PL/EN), units (°C/°F, km/h, mph), offline mode toggle, cache management |

### Deeper Screens (no nav bar)
| Screen | Access from | Description |
|--------|-------------|-------------|
| **Cloud Scanner** | FAB on Home | Camera → TFLite model → cloud type classification + rain probability |
| **Saved Locations** | AppBar icon on Home | List of saved cities, add/remove, tap to switch active location |
| **History** | Button in Forecast | Chart of last 7 days pulled from SQLite (works fully offline) |
| **Search** | AppBar icon on Home | Search city → add to Saved Locations |

---

## Technology Map

| Technology | Where it's used |
|------------|----------------|
| **Streams** | Connectivity monitoring → forecastProvider auto-invalidate; periodic weather refresh; GPS location stream |
| **Go_Router** | `ShellRoute` for bottom nav; nested routes for deeper screens; deep linking (`weathersense://forecast/Warsaw`) |
| **Riverpod** | `forecastProvider` shared between Forecast and Activities (no duplicate requests); `settingsProvider`; `connectivityProvider` as `StreamProvider`; `locationProvider` |
| **Retrofit** | OpenWeatherMap API — current weather, 7-day forecast, geocoding for Search |
| **SQLite (drift)** | Cache forecast per location; Saved Locations; History data |
| **Offline mode** | `forecastProvider` falls back to SQLite cache when no connectivity; History always available offline |
| **ML — Activities** | Rule-based scoring + optional small TFLite dense model: `[temp, wind, humidity, precipitation] → activity_scores[]` |
| **ML — Cloud Scanner** | TFLite image classification model bundled in `assets/` (offline); classifies Cumulus, Stratus, Cirrus, Cumulonimbus |

---

## Architecture

```
lib/
├── core/
│   ├── network/          # Retrofit client, interceptors, connectivity stream
│   ├── database/         # Drift schema, DAOs
│   └── router/           # Go_Router config, ShellRoute
├── features/
│   ├── weather/          # Home + current weather
│   │   ├── data/         # Retrofit sources, SQLite cache, repository impl
│   │   ├── domain/       # Entities, repository interface
│   │   └── presentation/ # Riverpod providers, screens, widgets
│   ├── forecast/         # Forecast + History
│   ├── activities/       # Activity scoring, shares forecastProvider
│   ├── locations/        # Saved Locations + Search
│   ├── cloud_scanner/    # Camera + TFLite inference
│   └── settings/         # Language, units, cache
└── main.dart
```

---

## Provider Graph

```
ProviderScope (root)
├── connectivityProvider (StreamProvider)
├── locationProvider (StreamProvider — GPS)
├── settingsProvider (NotifierProvider — units, language)
├── forecastProvider (AsyncNotifierProvider)
│   ├── listens to connectivityProvider → invalidate on reconnect
│   ├── listens to locationProvider → invalidate on location change
│   ├── reads settingsProvider → correct units
│   ├── fetches from Retrofit (online)
│   └── falls back to SQLite cache (offline)
├── ForecastScreen → watches forecastProvider
└── ActivitiesScreen → watches forecastProvider (same instance, no extra request)
```

---

## InheritedWidget — WeatherTheme

Riverpod is built on top of InheritedWidget, so direct usage belongs in the **UI layer**, not business logic. The natural fit here is a dynamic `WeatherTheme` that propagates color/gradient styling down the widget tree based on weather conditions.

**Why InheritedWidget here, not Riverpod?**

| | InheritedWidget | Riverpod |
|--|----------------|---------|
| **Holds** | UI style (colors, gradients) | Business data (weather, locations) |
| **Scope** | Subtree of widgets | Global |
| **Use case** | Style propagation, no prop drilling | State management |

**Pattern:**
```dart
// 1. Data class
class WeatherThemeData {
  final Color primaryColor;
  final List<Color> backgroundGradient;
  final Color cardColor;

  const WeatherThemeData.sunny() : ...;
  const WeatherThemeData.rainy() : ...;
  const WeatherThemeData.snowy() : ...;
  const WeatherThemeData.night() : ...;
}

// 2. InheritedWidget
class WeatherTheme extends InheritedWidget {
  final WeatherThemeData data;
  const WeatherTheme({required this.data, required super.child});

  static WeatherThemeData of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<WeatherTheme>()!.data;

  @override
  bool updateShouldNotify(WeatherTheme old) => data != old.data;
}

// 3. Riverpod provides weather data → IW wraps subtree with derived style
class HomeScreen extends ConsumerWidget {
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = ref.watch(currentWeatherProvider);
    return WeatherTheme(
      data: WeatherThemeData.fromCondition(weather.condition),
      child: const HomeContent(),
    );
  }
}

// 4. Any widget in the tree accesses style via context — no prop drilling
class WeatherCard extends StatelessWidget {
  Widget build(BuildContext context) {
    final theme = WeatherTheme.of(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: theme.backgroundGradient),
      ),
    );
  }
}
```
