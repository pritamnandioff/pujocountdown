import 'dart:async';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:pujocountdown/responsive.dart';
import 'package:pujocountdown/screens/home_screen.dart/widgets/scrollable_text.dart';
import 'package:pujocountdown/screens/ui/footer.dart';
import '../../const.dart';
import '../ui/add_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime targetDate = DateTime(2023, 10, 20);
  late DateTime currentDate;
  late Duration timeRemaining;
  GlobalKey<FlipCardState> daysCardKey = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> hoursCardKey = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> munitesCardKey = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> secoundCardKey = GlobalKey<FlipCardState>();
  // BannerAd? _bannerAd;
  // bool _isAdLoaded = false;
  // Timer? timer;

  // dayToggler() {
  //   daysCardKey.currentState!.toggleCard();
  // }

  // hourToggler() {
  //   hoursCardKey.currentState!.toggleCard();
  // }

  // muniteToggler() {
  //   munitesCardKey.currentState!.toggleCard();
  // }

  // secoundToggler() {
  //   secoundCardKey.currentState!.toggleCard();
  // }

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

  void startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
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

  @override
  void initState() {
    // _loadBannerAd();
    super.initState();
    currentDate = DateTime.now();
    timeRemaining = targetDate.difference(currentDate);
    startTimer();
  }

  // @override
  // void dispose() {
  //   // _bannerAd?.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: Colors.white,
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover),
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (Responsive.isMobile(context))
                    Column(
                      children: [
                        SizedBox(
                          height: 100,
                          child: Image.asset("assets/images/ma_durga.png"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "মা আসছে",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        kDefaulCountDown,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            flipper(daysCardKey, timeRemaining.inDays, "Days"),
                            Column(
                              children: const [
                                Text(
                                  " : ",
                                  style: TextStyle(
                                    fontSize: 72,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("")
                              ],
                            ),
                            flipper(hoursCardKey, timeRemaining.inHours % 24,
                                "Hour"),
                          ],
                        ),
                        kDefaulCountDown,
                        SizedBox(
                          height: 100,
                          width: MediaQuery.of(context).size.width - 20,
                          child: const ScrollingText(
                              text:
                                  "!... 🙏 Hold your breath Durga Puja is coming 🙏...!!",
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                        ),
                        kDefaulCountDown,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            flipper(munitesCardKey,
                                timeRemaining.inMinutes % 60, "Munite"),
                            Column(
                              children: const [
                                Text(
                                  " : ",
                                  style: TextStyle(
                                    fontSize: 72,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("")
                              ],
                            ),
                            flipper(secoundCardKey,
                                timeRemaining.inSeconds % 60, "Secound"),
                          ],
                        ),
                        kDefaulCountDown,
                        SizedBox(
                          height: 200,
                        ),
                      ],
                    ),

                  //desktop

                  if (!Responsive.isMobile(context))
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                          child: Image.asset("assets/images/ma_durga.png"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "মা আসছে",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        kDefaulCountDown,
                        SizedBox(
                          width: 150,
                          child: flipper(
                              daysCardKey, timeRemaining.inDays, "Days"),
                        ),
                        kDefaulCountDown,
                        SizedBox(
                          height: 100,
                          width: MediaQuery.of(context).size.width - 20,
                          child: const ScrollingText(
                              text:
                                  "!... 🙏 Hold your breath Durga Puja is coming 🙏...!!",
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                        ),
                        kDefaulCountDown,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            flipper(hoursCardKey, timeRemaining.inHours % 24,
                                "Hour"),
                            Column(
                              children: const [
                                Text(
                                  " : ",
                                  style: TextStyle(
                                    fontSize: 72,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("")
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            flipper(munitesCardKey,
                                timeRemaining.inMinutes % 60, "Munite"),
                            Column(
                              children: const [
                                Text(
                                  " : ",
                                  style: TextStyle(
                                    fontSize: 72,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("")
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            flipper(secoundCardKey,
                                timeRemaining.inSeconds % 60, "Secound"),
                          ],
                        ),
                        kDefaulCountDown
                      ],
                    ),
                ],
              ),
            ),
            Positioned(
              child: SizedBox(
                height: 100,
                width: 100,
                child: Image.network(
                  "https://media.giphy.com/media/vzZFTW5cprX5HjEpyY/giphy.gif",
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Column(
        children: [
          adsenseAdsView(),
          const Footer(),
        ],
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
              style: TextStyle(
                fontSize: Responsive.isMobile(context) ? 50 : 72,
                color: Colors.black,
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
        const SizedBox(
          height: 10,
        ),
        Text(title)
      ],
    );
  }
}
