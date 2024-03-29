part of 'widgets.dart';

class CardLinesType1 extends StatelessWidget {
  const CardLinesType1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 60.w,
        height: 20.h,
        child: Column(
          children: [
            CardDivineLine(
              width: 1.8,
              height: 8.h,
              color: kPurple02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Expanded(
                  child: CardDivineLine(
                    width: 0,
                    height: 1.8,
                    color: kPurple02,
                  ),
                ),
                Expanded(child: SizedBox()),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: CardDivineLine(
                width: 1.8,
                height: 8.h,
                color: kPurple02,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardLinesType2 extends StatelessWidget {
  const CardLinesType2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 50.w,
        height: 20.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CardDivineLine(
              width: 1.8,
              height: 8.h,
              color: kChibi02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(child: SizedBox()),
                Expanded(
                  child: CardDivineLine(
                    width: 0,
                    height: 1.8,
                    color: kChibi02,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: CardDivineLine(
                width: 1.8,
                height: 8.h,
                color: kChibi02,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardDivineLine extends StatelessWidget {
  const CardDivineLine(
      {Key? key,
      required this.width,
      required this.height,
      required this.color})
      : super(key: key);

  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color,
    );
  }
}

class CardServices extends StatelessWidget {
  const CardServices(
      {Key? key,
      required this.title,
      required this.icon,
      required this.gradient,
      required this.body})
      : super(key: key);

  final String title;
  final IconData icon;
  final List<Color> gradient;
  final String body;

  @override
  Widget build(BuildContext context) {
    final isMobile = Device.screenType == sizerr.ScreenType.mobile;
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: isMobile ? 10 : 15, horizontal: isMobile ? 15 : 25),
      decoration: BoxDecoration(
        color: kPurple03,
        border: Border.all(color: kPurple02, width: .5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: gradient[0],
                size: isMobile ? 13.sp : 14.5.sp,
              ),
              const SizedBox(width: 15),
              ShaderMask(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: isMobile ? 13.sp : 14.5.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  shaderCallback: (rect) {
                    return LinearGradient(
                        colors: gradient,
                        stops: const [-0.4, 0.5]).createShader(rect);
                  }),
            ],
          ),
          SizedBox(height: isMobile ? 5 : 18),
          Text(
            body,
            style: TextStyle(
              fontSize: isMobile ? 13.sp : 13.sp,
              color: kColorGrey02,
              fontWeight: FontWeight.w200,
            ),
          ),
        ],
      ),
    );
  }
}

class CardMyProject extends StatelessWidget {
  const CardMyProject(
      {Key? key, required this.image, this.bottom, required this.onTap})
      : super(key: key);

  final String image;
  final double? bottom;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isMobile = Device.screenType == sizerr.ScreenType.mobile;
    return Container(
      margin: EdgeInsets.only(bottom: bottom ?? 15),
      child: InkWell(
        onTap: () {
          //print(" ink click");
        },
        child: HoverCard(
          builder: (context, hovering) {
            return Image(
              image: AssetImage(image),
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            );
          },
          depth: 1,
          depthColor: Colors.transparent,
          onTap: () {
            // print("click");
            onTap();
          },
          shadow: const BoxShadow(
            color: Colors.transparent,
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ),
      ),
    );
  }
}

class CardInfoMe extends StatefulWidget {
  const CardInfoMe(
      {Key? key,
      required this.label,
      required this.body,
      required this.gradient})
      : super(key: key);

  final String label;
  final String body;
  final List<Color> gradient;

  @override
  State<CardInfoMe> createState() => _CardInfoMeState();
}

class _CardInfoMeState extends State<CardInfoMe> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = Device.screenType == sizerr.ScreenType.mobile;
    return Expanded(
      child: InkWell(
        onTap: () {},
        onHover: (value) {
          setState(() {
            _isHover = value;
          });
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: isMobile ? 5 : 8),
          padding: EdgeInsets.symmetric(
              vertical: isMobile ? 10 : 15, horizontal: isMobile ? 15 : 25),
          //  width: double.infinity,
          decoration: BoxDecoration(
              color: kColorBackground02,
              borderRadius: BorderRadius.circular(5),
              boxShadow: _isHover
                  ? [
                      BoxShadow(
                          color: widget.gradient[0].withOpacity(.5),
                          blurRadius: 35,
                          offset: const Offset(0, 10)),
                    ]
                  : null),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ShaderMask(
                    child: Text(
                      widget.label,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isMobile ? 14.sp : 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shaderCallback: (rect) {
                      return LinearGradient(
                          colors: widget.gradient,
                          stops: const [-0.2, 0.6]).createShader(rect);
                    }),
              ),
              SizedBox(height: isMobile ? 5 : 18),
              Text(
                widget.body,
                style: TextStyle(
                  color: kColorGrey01,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardContactMe extends StatefulWidget {
  const CardContactMe({Key? key}) : super(key: key);

  @override
  State<CardContactMe> createState() => _CardContactMeState();
}

class _CardContactMeState extends State<CardContactMe> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = Device.screenType == sizerr.ScreenType.mobile;
    return SizedBox(
      height: 15.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            margin: EdgeInsets.only(top: _isHover ? 4.0.h : 5.h),
            duration: const Duration(milliseconds: 300),
            child: InkWell(
              onTap: () => Get.toNamed('/contact'),
              onHover: (value) {
                setState(() {
                  _isHover = value;
                });
              },
              child: AnimatedContainer(
                // margin: EdgeInsets.only(top: _isHover ? 4.0.h : 5.h),
                width: isMobile ? 33.w : 20.w,
                duration: const Duration(milliseconds: 300),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                decoration: BoxDecoration(
                    color: _isHover ? kPurple01 : kColorBackground02,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: _isHover
                            ? kPurple01.withOpacity(.3)
                            : Colors.black12,
                        blurRadius: 20,
                      ),
                    ]),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Contact me',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.5.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Icon(
                        FontAwesomeIcons.chevronRight,
                        size: 13.sp,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardBottomBar extends StatelessWidget {
  const CardBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = Device.screenType == sizerr.ScreenType.mobile;
    return SizedBox(
      width: 100.w,
      child: Column(
        children: [
          const CardDivineLine(
            color: kPurple01,
            width: double.infinity,
            height: 1.3,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 25,
              horizontal: isMobile ? 20 : 40,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Front-End Developer,UI Designer',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.7.sp,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        // await launchUrlString("https://largely.ma/");
                      },
                      child: Text(
                        '©${DateTime.now().year} Azul Mouad'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.7.sp,
                        ),
                      ),
                    ),
                    if (!isMobile) SizedBox(width: 20.w),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardSocialMedia(
                      label: "LinkedIn",
                      onTap: () async {
                        await launchUrlString(kLinkedIn);
                      },
                    ),
                    CardSocialMedia(
                      label: "Github",
                      onTap: () async {
                        await launchUrlString(kGithub);
                      },
                    ),
                    CardSocialMedia(
                      label: "Email",
                      onTap: () async {
                        await launchUrlString(kEmail);
                      },
                    ),
                    CardSocialMedia(
                      label: "Facebook",
                      onTap: () async {
                        await launchUrlString(kFace);
                      },
                    ),
                    CardSocialMedia(
                      label: "Instagram",
                      onTap: () async {
                        await launchUrlString(kInsta);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardSocialMedia extends StatefulWidget {
  const CardSocialMedia({Key? key, required this.label, required this.onTap})
      : super(key: key);
  final String label;
  final VoidCallback onTap;

  @override
  State<CardSocialMedia> createState() => _CardSocialMediaState();
}

class _CardSocialMediaState extends State<CardSocialMedia> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: widget.onTap,
        onHover: (value) {
          setState(() {
            _isHover = value;
          });
        },
        child: Text(
          widget.label,
          style: TextStyle(
            color: _isHover ? kPurple01 : Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 12.5.sp,
          ),
        ),
      ),
    );
  }
}
