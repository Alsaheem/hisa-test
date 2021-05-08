import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'core/services/navigation_service.dart';
import 'core/services/network_services.dart';
import 'core/viewmodels/theme_provider.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  /// register services
  locator.registerLazySingleton<Service>(() => Service());
  locator.registerLazySingleton(() => NavigationService());

  /// register viewmodels
  // locator.registerFactory<NavigationViewModel>(() => NavigationViewModel());
}

// Register providers
final allProviders = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => DarkThemeProvider()),
];
