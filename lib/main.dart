import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pujocountdown/utils/scrolling_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Countdown',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CountdownScreen(),
    );
  }
}

class CountdownScreen extends StatefulWidget {
  @override
  _CountdownScreenState createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen> {
  DateTime targetDate = DateTime(2023, 10, 20);
  late DateTime currentDate;
  late Duration timeRemaining;
  BannerAd? _bannerAd;
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

  Future<void> _loadBannerAd() async {
    final adUnitId = 'YOUR_ADSENSE_AD_UNIT_ID';
    final adSize = AdSize.banner;

    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      size: adSize,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );

    _bannerAd!.load();
  }

  @override
  void initState() {
    _loadBannerAd();
    super.initState();
    currentDate = DateTime.now();
    timeRemaining = targetDate.difference(currentDate);
    Timer.periodic(Duration(seconds: 1), (Timer t) => secoundToggler());
    Timer.periodic(Duration(minutes: 1), (Timer t) => muniteToggler());
    Timer.periodic(Duration(hours: 1), (Timer t) => hourToggler());
    Timer.periodic(Duration(days: 1), (Timer t) => dayToggler());

    startTimer();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
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
              direction: FlipDirection.HORIZONTAL, // Flip horizontally
              front: Container(
                width: MediaQuery.of(context).size.width / 6,
                // height: 120,
                color: Colors.blue,
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
                width: 80,
                height: 120,
                color: Colors.blue,
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
                  direction: FlipDirection.HORIZONTAL,
                  front: Container(
                    // width: 80,
                    // height: 120,
                    color: Colors.blue,
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
                    width: 80,
                    height: 120,
                    color: Colors.black,
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
                flipper(munitesCardKey, timeRemaining.inMinutes % 60),
                // FlipCard(
                //   direction: FlipDirection.VERTICAL,
                //   front: Container(
                //     color: Colors.blue,
                //     alignment: Alignment.center,
                //     child: Text(
                //       formatTime(timeRemaining.inMinutes % 60),
                //       style: const TextStyle(
                //         fontSize: 72,
                //         color: Colors.white,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
                //   back: Container(
                //     color: Colors.blue,
                //     alignment: Alignment.center,
                //     child: Text(
                //       formatTime((timeRemaining.inMinutes % 60) + 1),
                //       style: const TextStyle(
                //         fontSize: 72,
                //         color: Colors.white,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
                // ),
                const SizedBox(width: 10),
                flipper(secoundCardKey, timeRemaining.inSeconds % 60),
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
