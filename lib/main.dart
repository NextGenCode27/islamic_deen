import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_deen/bloc_observer.dart';
import 'package:islamic_deen/core/global/placemarks/presentation/bloc/placemark_bloc.dart';
import 'package:islamic_deen/core/permission/location_permission/presentation/bloc/location_permission_bloc.dart';
import 'package:islamic_deen/core/style/theme/dark_theme.dart';
import 'package:islamic_deen/core/style/theme/light_theme.dart';
import 'package:islamic_deen/features/namaz/presentation/bloc/namaz_bloc.dart';
import 'package:islamic_deen/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:islamic_deen/features/splash/presentation/views/splash_view.dart';
import 'package:islamic_deen/inject_dependencies.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await injectDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocatior<SplashBloc>(),
        ),
        BlocProvider(
          create: (context) => serviceLocatior<LocationPermissionBloc>(),
        ),
        BlocProvider(
          create: (context) => serviceLocatior<PlacemarkBloc>(),
        ),
        BlocProvider(
          create: (context) => serviceLocatior<NamazBloc>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'I S L A M I C  D E E N',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const SplashView(),
    );
  }
}
