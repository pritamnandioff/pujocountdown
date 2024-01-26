import 'dart:async';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pujocountdown/responsive.dart';
import 'package:pujocountdown/screens/home_screen/widgets/scrollable_text.dart';
import 'package:pujocountdown/screens/home_screen/widgets/footer.dart';
import '../../const.dart';

// import '../ui/add_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime targetDate = DateTime(2024, 10, 09);
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
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: Colors.white,
      extendBody: true,
      body: Container(
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [
        //       Colors.cyan,
        //       Color.fromARGB(255, 252, 237, 72),
        //     ],
        //   ),
        // ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  PreferredSize(
                    preferredSize: Size(screenSize.width, 1000),
                    child: Container(
                      color: const Color.fromARGB(255, 240, 181, 16),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: () {
                                  Fluttertoast.showToast(
                                      msg: "Ma durga",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 100,
                                      fontSize: 16.0);
                                },
                                icon: const Icon(Icons.home_rounded)),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Fluttertoast.showToast(
                                          msg: "Comming soon",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 100,
                                          fontSize: 16.0);
                                    },
                                    child: const Text(
                                      'Discover',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(width: screenSize.width / 20),
                                  InkWell(
                                    onTap: () {
                                      Fluttertoast.showToast(
                                          msg: "Comming soon",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 100,
                                          fontSize: 16.0);
                                    },
                                    child: const Text(
                                      'Contact Us',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Fluttertoast.showToast(
                                    msg: "Comming soon",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 100,
                                    fontSize: 16.0);
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              width: screenSize.width / 50,
                            ),
                            InkWell(
                              onTap: () {
                                Fluttertoast.showToast(
                                    msg: "Comming soon",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 100,
                                    fontSize: 16.0);
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
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
                                  "!... 🙏 Hold your breath Durga Puja is coming 🙏 ..!!",
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
                        // adsenseAdsView(context),
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
                        kDefaulCountDown,
                        // adsenseAdsView(context),
                      ],
                    ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Countdown to Durga Puja 2023: Celebrate the Festival of Maa Durga",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30.0, horizontal: 20),
                    child: SelectableText(
                      blog,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Footer()
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
      // bottomNavigationBar: const Footer(),
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
