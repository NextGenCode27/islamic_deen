import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_deen/core/global/placemarks/presentation/bloc/placemark_bloc.dart';
import 'package:islamic_deen/core/style/theme/scaffold_background.dart';
import 'package:islamic_deen/core/utils/calculate_duration.dart';
import 'package:islamic_deen/core/utils/get_current_date.dart';
import 'package:islamic_deen/core/utils/time_in_float.dart';
import 'package:islamic_deen/core/widgets/card.dart';
import 'package:islamic_deen/features/namaz/data/datasource/remote/namaz_remote_datasource.dart';
import 'package:islamic_deen/features/namaz/presentation/bloc/namaz_bloc.dart';

class NamazView extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const NamazView());
  const NamazView({super.key});

  @override
  State<NamazView> createState() => _NamazViewState();
}

class _NamazViewState extends State<NamazView> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;a

    return Scaffold(
      body: ScaffoldBackGround(
        child: CustomScrollView(
          slivers: [
            BlocBuilder<PlacemarkBloc, PlacemarkState>(
              builder: (context, state) {
                if (state is PlacemarkInitial) {
                  NamazRemoteDatasourceImpl()
                      .fetchNamazTime(city: 'city', country: 'country');
                }
                if (state is PlacemarkSuccess) {
                  context.read<NamazBloc>().add(
                        FetchNamazTimingEvent(
                            city: state.placemark[0].locality!,
                            country: state.placemark[0].country!),
                      );
                  return SliverAppBar(
                    centerTitle: false,
                    title: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        '${state.placemark[0].locality}, ${state.placemark[0].country}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                  );
                }
                return SliverAppBar(
                  centerTitle: false,
                  title: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Locating you...',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                );
              },
            ),
            SliverToBoxAdapter(
              child: BlocBuilder<NamazBloc, NamazState>(
                builder: (context, state) {
                  if (state is NamazSuccess) {
                    final sunrise = timInFloat(
                        time: state.namazTimings.data!.timings!.sunrise
                            .toString());
                    final sunset = timInFloat(
                        time: state.namazTimings.data!.timings!.sunset
                            .toString());
                    final currentTime = currentTimeInFloat(now: DateTime.now());
                    final currentTimeProgressValue = calculateDuration(
                      fromTime: sunrise,
                      toTime: sunset,
                      currentTime: currentTime,
                    );

                    String getCurrentPrayerTime() {
                      final currentTime = DateTime.now();
                      final formatedDate = getCurrentDate(now: currentTime);
                      for (final prayerTime in state.namazTimings.data!.timings!
                          .toJson()
                          .entries) {
                        final parsedPrayerTime =
                            DateTime.parse('$formatedDate ${prayerTime.value}');
                        if (parsedPrayerTime.isAfter(currentTime)) {
                          return prayerTime.value;
                        }
                      }
                      return 'No prayer';
                    }

                    String getCurrentPrayerName() {
                      final currentTime = DateTime.now();
                      final formatedDate = getCurrentDate(now: currentTime);
                      for (final prayerTime in state.namazTimings.data!.timings!
                          .toJson()
                          .entries) {
                        final parsedPrayerTime =
                            DateTime.parse('$formatedDate ${prayerTime.value}');
                        if (parsedPrayerTime.isAfter(currentTime)) {
                          return prayerTime.key;
                        }
                      }
                      return 'No prayer';
                    }

                    String getPreviousPrayerName() {
                      final currentTime = DateTime.now();
                      final formatedDate = getCurrentDate(now: currentTime);
                      for (final prayerTime in state.namazTimings.data!.timings!
                          .toJson()
                          .entries) {
                        final parsedPrayerTime =
                            DateTime.parse('$formatedDate ${prayerTime.value}');
                        if (parsedPrayerTime.isBefore(currentTime)) {
                          print(prayerTime.key);
                          return prayerTime.key;
                        }
                      }
                      return 'No prayer';
                    }

                    String getPreviousPrayerTime() {
                      final currentTime = DateTime.now();
                      final formatedDate = getCurrentDate(now: currentTime);
                      for (final prayerTime in state.namazTimings.data!.timings!
                          .toJson()
                          .entries) {
                        final parsedPrayerTime =
                            DateTime.parse('$formatedDate ${prayerTime.value}');
                        if (parsedPrayerTime.isBefore(currentTime)) {
                          print(prayerTime.value);
                          return prayerTime.value;
                        }
                      }
                      return 'No prayer';
                    }

                    String getNextPrayerTime() {
                      final currentTime = DateTime.now();
                      bool foundCurrentPrayer = false;
                      final formatedDate = getCurrentDate(now: currentTime);
                      for (final prayerTime in state.namazTimings.data!.timings!
                          .toJson()
                          .entries) {
                        final parsedPrayerTime =
                            DateTime.parse('$formatedDate ${prayerTime.value}');
                        if (parsedPrayerTime.isAfter(currentTime) &&
                            foundCurrentPrayer) {
                          return prayerTime.value;
                        } else if (parsedPrayerTime.isAfter(currentTime)) {
                          foundCurrentPrayer = true;
                        }
                      }
                      return 'No prayer';
                    }

                    String getNextPrayerName() {
                      final currentTime = DateTime.now();
                      bool foundCurrentPrayer = false;
                      final formatedDate = getCurrentDate(now: currentTime);
                      for (final prayerTime in state.namazTimings.data!.timings!
                          .toJson()
                          .entries) {
                        final parsedPrayerTime =
                            DateTime.parse('$formatedDate ${prayerTime.value}');
                        if (parsedPrayerTime.isAfter(currentTime) &&
                            foundCurrentPrayer) {
                          return prayerTime.key;
                        } else if (parsedPrayerTime.isAfter(currentTime)) {
                          foundCurrentPrayer = true;
                        }
                      }
                      return 'No prayer';
                    }

                    return CustomCard(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PrayerListTileWidget(
                                    title: 'Current Prayer',
                                    prayerName: getPreviousPrayerName(),
                                    prayerTime: getPreviousPrayerTime(),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  PrayerListTileWidget(
                                    title: 'Next Prayer',
                                    prayerName: getCurrentPrayerName(),
                                    prayerTime: getCurrentPrayerTime(),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  PrayerListTileWidget(
                                    title: 'After That',
                                    prayerName: getNextPrayerName(),
                                    prayerTime: getNextPrayerTime(),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 150,
                                width: 150,
                                child: Image(
                                  image: AssetImage('assets/images/dash1.png'),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SunTimeProgressWidget(
                            currentProgressValue: currentTimeProgressValue,
                            sunrise: state.namazTimings.data!.timings!.sunrise
                                .toString(),
                            sunset: state.namazTimings.data!.timings!.sunset
                                .toString(),
                          ),
                        ],
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SunTimeProgressWidget extends StatelessWidget {
  const SunTimeProgressWidget({
    super.key,
    required this.currentProgressValue,
    required this.sunrise,
    required this.sunset,
  });
  final double currentProgressValue;
  final String sunrise;
  final String sunset;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text(
                  'Sunrise',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.0,
                  ),
                ),
                Text(
                  sunrise,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Text(
                  'Sunset',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.0,
                  ),
                ),
                Text(
                  sunset,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 10,
          child: LinearProgressIndicator(
            value: currentProgressValue,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }
}

class PrayerListTileWidget extends StatelessWidget {
  const PrayerListTileWidget({
    super.key,
    required this.title,
    required this.prayerName,
    required this.prayerTime,
  });
  final String title;
  final String prayerName;
  final String prayerTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            letterSpacing: 2.0,
          ),
        ),
        Text(
          prayerName,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        Text(
          prayerTime,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
      ],
    );
  }
}
