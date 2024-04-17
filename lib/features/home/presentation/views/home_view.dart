import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_deen/core/global/placemarks/presentation/bloc/placemark_bloc.dart';
import 'package:islamic_deen/core/style/theme/scaffold_background.dart';

class HomeView extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (context) => const HomeView());
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScaffoldBackGround(
        child: Center(
          child: BlocBuilder<PlacemarkBloc, PlacemarkState>(
            builder: (context, state) {
              if (state is PlacemarkSuccess) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.placemark[0].locality.toString()),
                    Text(state.placemark[0].country.toString()),
                  ],
                );
              }
              return const Text('Home View');
            },
          ),
        ),
      ),
    );
  }
}
