import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/scrollbar_behavior_enum.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:movie_db_api/screens/screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  IntroScreenState createState() => IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static late bool _state;

  List<Slide> slides = [];

  Future<void> changeState() async {
    final SharedPreferences prefs = await _prefs;
    const bool state = true;

    setState(() async {
      _state = await prefs.setBool('state', state).then((bool success) {
        return state;
      });
    });
  }

  Future<void> getState() async {
    _state = await _prefs.then((SharedPreferences prefs) {
      return prefs.getBool('state') ?? false;
    });
    if (_state) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const MyHomePage();
              } else {
                return const WelcomePage();
              }
            },
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    getState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    slides.add(
      Slide(
          backgroundImage: "assets/images/spider.jpg",
          backgroundBlendMode: BlendMode.lighten),
    );
    slides.add(
      Slide(
          backgroundImage: "assets/images/father.jpg",
          backgroundBlendMode: BlendMode.lighten),
    );
    slides.add(
      Slide(
          backgroundImage: "assets/images/got.jpg",
          backgroundBlendMode: BlendMode.lighten),
    );
    slides.add(
      Slide(
          backgroundImage: "assets/images/joker.jpg",
          backgroundBlendMode: BlendMode.lighten),
    );
    return IntroSlider(
      // List slides
      slides: slides,

      // Skip button
      //renderSkipBtn: renderSkipBtn(),
      onSkipPress: onSkip,
      skipButtonStyle: myButtonStyle(),

      // Next button
      renderNextBtn: renderNextBtn(),
      onNextPress: onNextPress,
      nextButtonStyle: myButtonStyle(),

      // Done button
      renderDoneBtn: renderDoneBtn(),
      onDonePress: onDonePress,
      doneButtonStyle: myButtonStyle(),

      // Dot indicator

      colorDot: const Color(0x33FFA8B0),
      colorActiveDot: const Color(0xffFFA8B0),
      sizeDot: 13.0,

      // Show or hide status bar
      hideStatusBar: false,
      //backgroundColorAllSlides: Colors.blueGrey,

      // Scrollbar
      verticalScrollbarBehavior: scrollbarBehavior.SHOW_ALWAYS,
    );
  }

  void onSkip() {
    changeState();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const MyHomePage();
            } else {
              return const WelcomePage();
            }
          },
        ),
      ),
    );
  }

  void onDonePress() {
    changeState();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const MyHomePage();
            } else {
              return const WelcomePage();
            }
          },
        ),
      ),
    );
  }

  void onNextPress() {}

  Widget renderNextBtn() {
    return const Icon(
      Icons.navigate_next,
      color: Colors.black,
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return const Icon(
      Icons.done,
      color: Colors.black, //Color(0xffF3B4BA),
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
      backgroundColor: MaterialStateProperty.all<Color>(
          const Color.fromARGB(51, 235, 14, 36)),
      overlayColor: MaterialStateProperty.all<Color>(
          const Color.fromARGB(51, 235, 14, 36)),
    );
  }
}
