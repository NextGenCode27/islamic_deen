import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_deen/core/permission/location_permission/presentation/bloc/location_permission_bloc.dart';
import 'package:islamic_deen/core/style/theme/scaffold_background.dart';

class LocationView extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const LocationView());
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ScaffoldBackGround(
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    context
                        .read<LocationPermissionBloc>()
                        .add(IsLocatedLocationPermissionEvent());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    fixedSize: Size(size.width / 2, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: Icon(
                    Icons.location_pin,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  label: Text(
                    'Locate Me!',
                    style: TextStyle(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      fontSize: 18,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'For Pray Time App Needs To Location Permission Enabled. Please Enable Location Service For This App.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
