// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import 'authentication.dart';
import 'firestore.dart';
import 'thirdParty.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<AuthenticationService>(
      () => registerModule.authenticationService);
  gh.lazySingleton<DialogService>(() => registerModule.dialogService);
  gh.lazySingleton<FireStoreService>(() => registerModule.fireStoreService);
  gh.lazySingleton<NavigationService>(() => registerModule.navigationService);
  gh.lazySingleton<SnackbarService>(() => registerModule.snackBarService);
  return get;
}

class _$RegisterModule extends RegisterModule {
  @override
  AuthenticationService get authenticationService => AuthenticationService();
  @override
  DialogService get dialogService => DialogService();
  @override
  FireStoreService get fireStoreService => FireStoreService();
  @override
  NavigationService get navigationService => NavigationService();
  @override
  SnackbarService get snackBarService => SnackbarService();
}
