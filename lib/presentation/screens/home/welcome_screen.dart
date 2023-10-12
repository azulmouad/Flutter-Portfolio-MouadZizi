part of '../screens.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  final int _countItems = 28;
  _scrollToIndex(int index) {
    itemScrollController.scrollTo(
        index: index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubic);
  }

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Device.screenType == sizerr.ScreenType.mobile;
    return Scaffold(
      backgroundColor: kColorBackground,
      body: Scaffold(
        body: Container(
          color: kColorBackground,
          width: 100.w,
          child: Stack(
            children: [
              ScrollablePositionedList.builder(
                itemCount: _countItems,
                itemScrollController: itemScrollController,
                itemPositionsListener: itemPositionsListener,
                itemBuilder: (_, i) {
                  return [
                    ///1
                    ///PROFILE
                    SizedBox(
                      width: 100.w,
                      height: isMobile ? 65.h : 80.h,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          const AnimatedCard(),
                          const CardProfile(),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              width: 1.5,
                              height: 8.h,
                              color: Colors.white38,
                            ),
                          ),
                        ],
                      ),
                    ),

                    ///2
                    Center(
                      child: CardDivineLine(
                        width: 1.5,
                        height: 8.h,
                        color: kColorOrange.withOpacity(.5),
                      ),
                    ),

                    ///3
                    const SizedBox(height: 10),

                    ///4
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 8.w),
                      child: Text(
                        "Is not just what it looks like and feels like.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),

                    ///5
                    Center(
                      child: AnimatedTextCard(
                        label: "Is how it works.",
                        size: 18.sp,
                      ),
                    ),

                    ///6
                    const SizedBox(height: 10),

                    ///7
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 8.w),
                      child: Text(
                        "- Steve Jobs",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: kColorGrey01,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    ///8
                    SizedBox(height: 3.h),

                    ///9
                    ///Lines
                    const CardLinesType1(),

                    ///10
                    ///My Services
                    Center(
                      child: SizedBox(
                        width: isMobile ? 95.w : 80.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: isMobile ? 5 : 10),
                              child: Text(
                                "My services",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: kPurple02,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ///Texts
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "The most creative intuitive workmate.",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      const Image(
                                        image: AssetImage(
                                          'assets/images/image_1.png',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                ///Cards
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: isMobile ? 2.w : 10.w),
                                    child: Column(
                                      children: [
                                        const CardServices(
                                          icon: FontAwesomeIcons.arrowPointer,
                                          title: 'Developer Skills',
                                          body:
                                              "A great knowledge of Dart. I make responsive applications with Flutter with interactive UI's designs.🎉",
                                          gradient: [
                                            Color(0xFFa770ef),
                                            Color(0xFFcf8bf3),
                                          ],
                                        ),
                                        SizedBox(height: 3.h),
                                        const CardServices(
                                          icon: FontAwesomeIcons.objectUngroup,
                                          title: 'UI Design',
                                          body:
                                              "A love for design and a good eye for creativity. I have proficiency in wireframing, color theory and visual communication.",
                                          gradient: [
                                            Color(0xFF20bdff),
                                            Color(0xFFa5fecb),
                                          ],
                                        ),
                                        SizedBox(height: 2.h),
                                        const CardServices(
                                          icon: FontAwesomeIcons.paintbrush,
                                          title: '2D Artist',
                                          body:
                                              "5+ years of digital illustration experience, mastering techniques in Photoshop and Procreate.",
                                          gradient: [
                                            Color(0xFFef629f),
                                            Color(0xFFeecda3),
                                          ],
                                        ),
                                        SizedBox(height: isMobile ? 3.h : 5.h),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    ///11
                    ///Lines
                    const CardLinesType2(),

                    ///12
                    /// Projects
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "My projects",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: kChibi02,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    ///13
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 8.w),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                            text: "A selection of my best projects.\n\n",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          TextSpan(
                            text: "(including this website)",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ]),
                      ),
                    ),

                    ///14
                    SizedBox(height: 1.h),

                    ///15
                    ///Projects
                    GridView(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isMobile ? 1 : 3,
                        childAspectRatio: 1.8,
                      ),
                      children: [
                        CardMyProject(
                          image: "assets/images/app_4.png",
                          onTap: () async {
                            await launchUrlString(kApp_1);
                          },
                        ),
                        CardMyProject(
                          image: "assets/images/app_1.png",
                          onTap: () async {
                            await launchUrlString(kApp_2);
                          },
                        ),
                        CardMyProject(
                          image: "assets/images/app_3.png",
                          onTap: () async {
                            await launchUrlString(kApp_3);
                          },
                        ),
                        CardMyProject(
                          image: "assets/images/app_2.png",
                          onTap: () async {
                            await launchUrlString(kApp_4);
                          },
                        ),
                        CardMyProject(
                          image: "assets/images/app_5.png",
                          onTap: () async {
                            await launchUrlString(kApp_5);
                          },
                        ),
                        CardMyProject(
                          image: "assets/images/app_6.png",
                          onTap: () async {
                            await launchUrlString(kApp_6);
                          },
                        ),
                        CardMyProject(
                          image: "assets/images/app_7.png",
                          onTap: () async {
                            await launchUrlString(kApp_7);
                          },
                        ),
                        CardMyProject(
                          image: "assets/images/app_8.png",
                          onTap: () async {
                            await launchUrlString(kApp_8);
                          },
                        ),
                        CardMyProject(
                          image: "assets/images/app_9.png",
                          onTap: () async {
                            await launchUrlString(kApp_9);
                          },
                        ),
                      ],
                    ),

                    ///16
                    const SizedBox(),

                    ///17
                    SizedBox(height: 4.h),

                    ///18
                    /// GITHUB
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Curious about the process?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: kColorGrey01,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    ///19
                    ///GITHUB
                    Center(
                      child: InkWell(
                        onTap: () async {
                          await launchUrlString(kGithub);
                        },
                        child: ShaderMask(
                            child: Text(
                              "Visit my Github",
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            shaderCallback: (rect) {
                              return const LinearGradient(
                                  colors: [kChibi03, kChibi04],
                                  stops: [-0.4, 0.5]).createShader(rect);
                            }),
                      ),
                    ),

                    ///20
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 3.h),
                        child: CardDivineLine(
                          height: 13.h,
                          width: 1.5,
                          color: kColorOrange02,
                        ),
                      ),
                    ),

                    ///21
                    Text(
                      "About me",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kColorOrange02,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    ///22
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.5.h),
                      child: Text(
                        "Welcome to Mouad's World",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),

                    ///23
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 3.h),
                        width: isMobile ? 95.w : 80.w,
                        height: isMobile ? 33.h : 45.h,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      CardInfoMe(
                                        label: "Language Programming",
                                        body:
                                            "Developer Java/Kotlin Android since 2016\nFlutter Front-end\nPHP/Laravel\nNode.js",
                                        gradient: [
                                          Color(0xFFff5acd),
                                          kColorOrange,
                                        ],
                                      ),
                                      CardInfoMe(
                                        label: "Illustration",
                                        body:
                                            "Freelancer illustrator since 2017. A love for portraits and character design",
                                        gradient: [
                                          Color(0xFFa6ffcb),
                                          Color(0xFF1fa2ff),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      CardInfoMe(
                                        label: "Networking",
                                        body:
                                            "Created a platform on Instagram to share my journey and connect with everyone",
                                        gradient: [
                                          Color(0xFFec77ab),
                                          kPurple01,
                                        ],
                                      ),
                                      CardInfoMe(
                                        label: "Music & Games",
                                        body:
                                            "Guitarist, pianist and singer in My freetime. I also enjoy playing Video Games as a hobby",
                                        gradient: [
                                          Color(0xFF9be15d),
                                          Color(0xFF00e3ae),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Expanded(
                              child: Center(
                                child: Image(
                                  image:
                                      AssetImage('assets/images/image_2.png'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    ///24
                    Padding(
                      padding: EdgeInsets.only(top: 2.h),
                      child: Text(
                        "Multitalented. Intuitive. Dedicated.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),

                    ///25
                    SizedBox(height: 1.5.h),

                    ///26
                    Text(
                      "Wanna know more? Visit my Instagram",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kColorGrey02,
                        fontSize: isMobile ? 15.sp : 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    ///27

                    SizedBox(height: 10.h),

                    ///28
                    ///Contact
                    Container(
                      width: 100.w,
                      height: isMobile ? 55.h : 80.h,
                      color: kColorBackground02,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CardDivineLine(
                            width: 1.4,
                            height: isMobile ? 15.h : 7.h,
                            color: kColorGrey01.withOpacity(.3),
                          ),
                          Column(
                            children: [
                              AnimatedTextCard(
                                label: "Let's work together!",
                                size: 17.sp,
                              ),
                              const CardContactMe(),
                            ],
                          ),
                          const CardBottomBar(),
                        ],
                      ),
                    ),
                  ][i];
                },
              ),

              ///BAR TOP
              CardBarHome(
                onChanged: _scrollToIndex,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
