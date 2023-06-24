// import 'package:flutter/material.dart';
// import 'package:flip_board/flip_clock.dart';
// import 'package:lottie/lottie.dart';
// import '../../const.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   DateTime targetDate = DateTime(2023, 10, 22);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: _flipCountdown(prjoCountDownColor)),
//     );
//   }

//   Widget _flipCountdown(ColorScheme colors) => Container(
//         decoration: BoxDecoration(
//           color: colors.secondary,
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         padding: const EdgeInsets.all(24.0),
//         child: FlipCountdownClock(
//           hingeLength: 10,
//           duration: targetDate.difference(DateTime.now()),
//           digitSize: 54.0,
//           width: 46.0,
//           height: 62.0,
//           digitColor: colors.surface,
//           backgroundColor: colors.onSurface,
//           separatorColor: colors.onSurface,
//           borderColor: colors.primary,
//           hingeColor: colors.surface,
//           borderRadius: const BorderRadius.all(Radius.circular(8.0)),
//           onDone: () => print('Buzzzz!'),
//         ),
//       );
// }
import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:pujocountdown/responsive.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime targetDate = DateTime(2023, 10, 20);
  late DateTime currentDate;
  late Duration timeRemaining;
  // BannerAd? _bannerAd;
  bool _isAdLoaded = false;
  Timer? timer;
  GlobalKey<FlipCardState> daysCardKey = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> hoursCardKey = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> munitesCardKey = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> secoundCardKey = GlobalKey<FlipCardState>();

  void startTimer() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        currentDate = DateTime.now();
        timeRemaining = targetDate.difference(currentDate);
        startTimer();
      });
    });
  }

  String formatTime(int time) {
    return time.toString().padLeft(2, '0');
  }

  // Future<void> _loadBannerAd() async {
  //   final adUnitId = 'YOUR_ADSENSE_AD_UNIT_ID';
  //   final adSize = AdSize.banner;

  //   _bannerAd = BannerAd(
  //     adUnitId: adUnitId,
  //     size: adSize,
  //     request: AdRequest(),
  //     listener: BannerAdListener(
  //       onAdLoaded: (_) {
  //         setState(() {
  //           _isAdLoaded = true;
  //         });
  //       },
  //       onAdFailedToLoad: (ad, error) {
  //         ad.dispose();
  //       },
  //     ),
  //   );

  //   _bannerAd!.load();
  // }

  @override
  void initState() {
    // _loadBannerAd();
    super.initState();
    currentDate = DateTime.now();
    timeRemaining = targetDate.difference(currentDate);

    startTimer();
  }

  @override
  void dispose() {
    // _bannerAd?.dispose();
    super.dispose();
  }

  dayToggler() {
    daysCardKey.currentState!.toggleCard();
  }

  hourToggler() {
    hoursCardKey.currentState!.toggleCard();
  }

  muniteToggler() {
    munitesCardKey.currentState!.toggleCard();
  }

  secoundToggler() {
    secoundCardKey.currentState!.toggleCard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: ScrollingText(
      //   text: "Pujo is comming",
      //   textStyle: const TextStyle(fontSize: 12),
      // ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("asset/images/background.jpg"),
              //fit: BoxFit.cover
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (Responsive.isMobile(context))
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      flipper(daysCardKey, timeRemaining.inDays, "Days"),
                      flipper(hoursCardKey, timeRemaining.inHours % 24, "Hour"),
                    ],
                  ),
                  // const SizedBox(
                  //   height: 100,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      flipper(munitesCardKey, timeRemaining.inMinutes % 60,
                          "Munite"),
                      flipper(secoundCardKey, timeRemaining.inSeconds % 60,
                          "Secound"),
                    ],
                  ),
                ],
              ),
            if (!Responsive.isMobile(context))
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  flipper(daysCardKey, timeRemaining.inDays, "Days"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      flipper(hoursCardKey, timeRemaining.inHours % 24, "Hour"),
                      const SizedBox(
                        width: 10,
                      ),
                      flipper(munitesCardKey, timeRemaining.inMinutes % 60,
                          "Munite"),
                      const SizedBox(
                        width: 10,
                      ),
                      flipper(secoundCardKey, timeRemaining.inSeconds % 60,
                          "Secound"),
                    ],
                  )
                ],
              )
          ],
        ),
      ),
    );
  }

  Widget flipper(
    GlobalKey cardKey,
    int time,
    String title,
  ) {
    return Column(
      children: [
        FlipCard(
          flipOnTouch: false,
          key: cardKey,
          fill: Fill.fillFront,
          direction: FlipDirection.VERTICAL,
          front: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 240, 181, 16),
            ),
            alignment: Alignment.center,
            child: Text(
              formatTime(time),
              style: const TextStyle(
                fontSize: 72,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          back: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 240, 181, 16),
            ),
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              formatTime((time + 1)),
              style: const TextStyle(
                fontSize: 72,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(title)
      ],
    );
  }
}
