import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:harsh_portfolio/animations/bottomAnimation.dart';
import 'package:harsh_portfolio/animations/entranceFader.dart';
import 'package:harsh_portfolio/constants.dart';
import 'package:harsh_portfolio/provider/themeProvider.dart';
import 'package:harsh_portfolio/widget/adaptiveText.dart';
import 'package:harsh_portfolio/widget/socialMediaIcon.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: height - 50,
      width: width,
      child: Stack(
        children: [
          Positioned(
            right: width * 0.2,
            child: Opacity(
              opacity: 0.9,
              child: EntranceFader(
                offset: Offset(0, 0),
                delay: Duration(seconds: 1),
                duration: Duration(milliseconds: 800),
                child: Image.asset(
                  'assets/harsh.png',
                  height: width < 1200 ? height * 0.8 : height * 0.85,
                ),
              ),
            ),
          ),
          Container(
            margin:
                EdgeInsets.fromLTRB(width * 0.1, height * 0.2, width * 0.1, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AdaptiveText(
                      "HEY THERE! ",
                      style: GoogleFonts.montserrat(
                        fontSize: height * 0.03,
                        fontWeight: FontWeight.w300,
                        color: _themeProvider.lightTheme
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                    EntranceFader(
                      offset: Offset(0, 0),
                      delay: Duration(seconds: 2),
                      duration: Duration(milliseconds: 800),
                      child: Image.asset(
                        "assets/hi.gif",
                        height: height * 0.05,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                AdaptiveText(
                  "Harsh",
                  style: GoogleFonts.montserrat(
                      fontSize: width < 1200 ? height * 0.085 : height * 0.095,
                      fontWeight: FontWeight.w500,
                      color: _themeProvider.lightTheme
                          ? Colors.black
                          : Colors.white,),
                ),
                AdaptiveText(
                  "Panchal",
                  style: GoogleFonts.montserrat(
                      color: _themeProvider.lightTheme
                          ? Colors.black
                          : Colors.white,
                      fontSize: width < 1200 ? height * 0.085 : height * 0.095,
                      fontWeight: FontWeight.w100,),
                ),
                EntranceFader(
                  offset: Offset(-10, 0),
                  delay: Duration(seconds: 1),
                  duration: Duration(milliseconds: 800),
                  child: Row(
                    children: [
                      Icon(
                        Icons.play_arrow_rounded,
                        color: kPrimaryColor,
                      ),
                      TyperAnimatedTextKit(
                          isRepeatingAnimation: true,
                          speed: Duration(milliseconds: 50),
                          textStyle: GoogleFonts.montserrat(
                            fontSize: height * 0.03,
                            fontWeight: FontWeight.w200,
                            color: _themeProvider.lightTheme
                                ? Colors.black
                                : Colors.white,
                          ),
                          text: [
                            " Flutter Developer",
                            " Android Developer",
                            " ReactNative Developer"
                          ]),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    kSocialIcons.length,
                    (index) => WidgetAnimator(
                      child: SocialMediaIconBtn(
                        icon: kSocialIcons[index],
                        socialLink: kSocialLinks[index],
                        height: height * 0.035,
                        horizontalPadding: width * 0.005,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
