import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_deen/core/global/placemarks/presentation/bloc/placemark_bloc.dart';
import 'package:islamic_deen/core/permission/location_permission/presentation/bloc/location_permission_bloc.dart';
import 'package:islamic_deen/core/permission/location_permission/presentation/views/location_view.dart';
import 'package:islamic_deen/core/style/theme/scaffold_background.dart';
import 'package:islamic_deen/features/home/presentation/views/home_view.dart';
import 'package:islamic_deen/features/namaz/presentation/veiws/namaz_view.dart';
import 'package:islamic_deen/features/splash/presentation/bloc/splash_bloc.dart';

class SplashView extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (context) => const SplashView());
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ScaffoldBackGround(
        child: BlocConsumer<SplashBloc, SplashState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is SplashInitial) {
              context.read<SplashBloc>().add(InitializeAppEvent());
            }
            if (state is SplashSuccess) {
              return BlocConsumer<LocationPermissionBloc,
                      LocationPermissionState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is LocationPermissionInitial) {
                      context
                          .read<LocationPermissionBloc>()
                          .add(IsLocatedLocationPermissionEvent());
                    }
                    if (state is LocationPermissionLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is LocationPermissionSuccess) {
                      if (state.location == true) {
                        context
                            .read<PlacemarkBloc>()
                            .add(FetchPlacemarkEvent());
                        return const NamazView();
                      } else {
                        return const LocationView();
                      }
                    }
                    return const LocationView();
                  });
            }
            return const Center(
              child: SizedBox(
                height: 200,
                width: 200,
                child: Image(
                  image: AssetImage('assets/images/dash1.png'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
