import 'package:flutter/cupertino.dart';
import 'package:flutter_vibe_app/core/services/analytics_service.dart';
import 'package:flutter_vibe_app/core/services/api_service.dart';
import 'package:flutter_vibe_app/core/services/auth_service.dart';
import 'package:flutter_vibe_app/core/services/cache_service.dart';
import 'package:flutter_vibe_app/core/services/connectivity_service.dart';
import 'package:flutter_vibe_app/core/services/inactivity_service.dart';
import 'package:flutter_vibe_app/core/services/storage_service.dart';
import 'package:flutter_vibe_app/core/theme/app_theme.dart';
import 'package:flutter_vibe_app/localization/localization_service.dart';
import 'package:flutter_vibe_app/modules/home/home_screen.dart';
import 'package:flutter_vibe_app/modules/login/login_screen.dart';
import 'package:flutter_vibe_app/modules/onboarding/onboarding_screen.dart'
    deferred as onboarding;
import 'package:flutter_vibe_app/modules/settings/settings_screen.dart'
    deferred as settings;
import 'package:flutter_vibe_app/modules/prompt/prompt_screen.dart';
import 'package:flutter_vibe_app/modules/projects/projects_screen.dart';
import 'package:flutter_vibe_app/modules/subscription/subscription_screen.dart';
import 'package:flutter_vibe_app/shared/widgets/auth_guard.dart';
import 'package:flutter_vibe_app/shared/widgets/cupertino_switch_list_tile.dart';
import 'package:flutter_vibe_app/shared/widgets/debug_panel.dart';
import 'package:flutter_vibe_app/shared/widgets/loading_overlay.dart';
import 'package:flutter_vibe_app/shared/widgets/confetti.dart';
import 'package:flutter_vibe_app/shared/widgets/offline_indicator.dart';
import 'package:flutter_vibe_app/shared/widgets/update_prompt.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  final bool onboardingComplete;
  const App({super.key, required this.onboardingComplete});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApiService>(create: (_) => ApiService()),
        ChangeNotifierProvider<AuthService>(create: (_) => AuthService()),
        Provider<StorageService>(
            create: (_) => StorageService(SharedPreferencesStorage())),
        ChangeNotifierProvider<ConnectivityService>(
            create: (_) => ConnectivityService()),
        Provider<CacheService>(create: (_) => CacheService()),
        Provider<AnalyticsService>(create: (_) => AnalyticsService()),
      ],
      child: InactivityService(
        child: Consumer<LocalizationService>(
          builder: (context, localizationService, child) {
            return CupertinoApp(
              locale: localizationService.locale,
              title: 'AAppVibe',
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              navigatorObservers: [
                Provider.of<AnalyticsService>(context, listen: false)
                    .getObserver(),
              ],
              localizationsDelegates: [
                DefaultCupertinoLocalizations.delegate,
              ],
              home: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 600) {
                    return const TabletLayout();
                  } else {
                    return onboardingComplete
                        ? const AuthGuard(child: HomeScreen())
                        : FutureBuilder(
                            future: onboarding.loadLibrary(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return onboarding.OnboardingScreen();
                              } else {
                                return const CupertinoActivityIndicator();
                              }
                            },
                          );
                  }
                },
              ),
              builder: (context, child) {
                return Confetti(
                  child: DebugPanel(
                    child: LoadingOverlay(
                      child: UpdatePrompt(
                        child: OfflineIndicator(
                          child: child ?? const SizedBox.shrink(),
                        ),
                      ),
                    ),
                  ),
                );
              },
              routes: {
                '/login': (context) => const LoginScreen(),
                '/settings': (context) => FutureBuilder(
                      future: settings.loadLibrary(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.done) {
                          return settings.SettingsScreen();
                        } else {
                          return const CupertinoActivityIndicator();
                        }
                      },
                    ),
                '/subscription': (context) => const SubscriptionScreen(),
                '/prompt': (context) => const PromptScreen(),
                '/projects': (context) => const ProjectsScreen(),
              },
            );
          },
        ),
      ),
    );
  }
}

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoSplitView(
      left: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('AAppVibe'),
        ),
        child: ListView(
          children: [
            CupertinoListTile(
              title: const Text('Home'),
              onTap: () {},
            ),
            CupertinoListTile(
              title: const Text('Profile'),
              onTap: () {},
            ),
            CupertinoListTile(
              title: const Text('Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),
      right: const Center(
        child: Text('Select an item'),
      ),
    );
  }
}
