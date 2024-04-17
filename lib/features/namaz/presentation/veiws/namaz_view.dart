import 'package:flutter/material.dart';
import 'package:islamic_deen/core/style/theme/scaffold_background.dart';
import 'package:islamic_deen/core/widgets/card.dart';
import 'package:islamic_deen/core/widgets/sun_progress_bar.dart';

class NamazView extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (context) => const NamazView());
  const NamazView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ScaffoldBackGround(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(),
            SliverToBoxAdapter(
              child: CustomCard(
                child: CustomPaint(
                  foregroundPainter: SunProgressBarPainter(0.1),
                  painter: SunProgressBarPainter(0.1),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
