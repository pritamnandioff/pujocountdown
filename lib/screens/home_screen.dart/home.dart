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
            FlipCard(
              flipOnTouch: false,
              key: daysCardKey,
              direction: FlipDirection.VERTICAL, // Flip horizontally
              front: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 240, 181, 16),
                    borderRadius: BorderRadius.circular(16)),
                width: MediaQuery.of(context).size.width / 7,
                // height: 120,
                alignment: Alignment.center,
                child: Text(
                  formatTime(timeRemaining.inDays),
                  style: const TextStyle(
                    fontSize: 72,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              back: Container(
                padding: EdgeInsets.all(16),
                width: 80,
                height: 120,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 240, 181, 16),
                    borderRadius: BorderRadius.circular(16)),
                alignment: Alignment.center,
                child: Text(
                  formatTime((timeRemaining.inDays + 1)),
                  style: const TextStyle(
                    fontSize: 72,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Days',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlipCard(
                  flipOnTouch: false,
                  key: hoursCardKey,
                  direction: FlipDirection.VERTICAL,
                  front: Container(
                    padding: EdgeInsets.all(16),
                    // width: 80,
                    // height: 120,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 240, 181, 16),
                        borderRadius: BorderRadius.circular(16)),
                    alignment: Alignment.center,
                    child: Text(
                      formatTime(timeRemaining.inHours % 24),
                      style: const TextStyle(
                        fontSize: 72,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  back: Container(
                    padding: EdgeInsets.all(16),
                    // width: 80,
                    // height: 120,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 240, 181, 16),
                        borderRadius: BorderRadius.circular(16)),
                    alignment: Alignment.center,
                    child: Text(
                      formatTime((timeRemaining.inHours % 24) + 1),
                      style: const TextStyle(
                        fontSize: 72,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                FlipCard(
                  flipOnTouch: false,
                  key: munitesCardKey,
                  direction: FlipDirection.VERTICAL,
                  front: Container(
                    padding: EdgeInsets.all(16),
                    // width: 80,
                    // height: 120,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 240, 181, 16),
                        borderRadius: BorderRadius.circular(16)),
                    alignment: Alignment.center,
                    child: Text(
                      formatTime(timeRemaining.inMinutes % 24),
                      style: const TextStyle(
                        fontSize: 72,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  back: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 240, 181, 16),
                        borderRadius: BorderRadius.circular(16)),
                    // width: 80,
                    // height: 120,

                    alignment: Alignment.center,
                    child: Text(
                      formatTime((timeRemaining.inMinutes % 24) + 1),
                      style: const TextStyle(
                        fontSize: 72,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                FlipCard(
                  flipOnTouch: false,
                  key: secoundCardKey,
                  direction: FlipDirection.VERTICAL,
                  front: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 240, 181, 16),
                        borderRadius: BorderRadius.circular(16)),
                    alignment: Alignment.center,
                    child: Text(
                      formatTime(timeRemaining.inSeconds % 60),
                      style: const TextStyle(
                        fontSize: 72,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  back: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 240, 181, 16),
                        borderRadius: BorderRadius.circular(16)),
                    alignment: Alignment.center,
                    child: Text(
                      formatTime((timeRemaining.inSeconds % 60) + 1),
                      style: const TextStyle(
                        fontSize: 72,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Hours    Minutes    Seconds',
              style: TextStyle(fontSize: 20),
            ),
            // ScrollingText(
            //   text: "Pujo is comming",
            //   textStyle: TextStyle(fontSize: 12),
            // ),
            // if (_isAdLoaded)
            //   Container(
            //     alignment: Alignment.center,
            //     width: _bannerAd!.size.width.toDouble(),
            //     height: _bannerAd!.size.height.toDouble(),
            //     child: AdWidget(ad: _bannerAd!),
            //   )
            // else
            //   Container(
            //     height: _bannerAd!.size.height.toDouble(),
            //   ),
          ],
        ),
      ),
    );
  }

  FlipCard flipper(GlobalKey cardKey, int time) {
    return FlipCard(
      key: cardKey,
      fill: Fill.fillFront,
      direction: FlipDirection.VERTICAL,
      front: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 240, 181, 16),
        ),
        alignment: Alignment.center,
        child: Text(
          // formatTime(timeRemaining.inSeconds % 60),
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
          color: Color.fromARGB(255, 240, 181, 16),
        ),
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Text(
          formatTime((timeRemaining.inSeconds % 60)),
          style: const TextStyle(
            fontSize: 72,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
