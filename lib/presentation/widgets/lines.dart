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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
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
                size: 4.5.sp,
              ),
              const SizedBox(width: 15),
              ShaderMask(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 4.5.sp,
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
          const SizedBox(height: 18),
          Text(
            body,
            style: TextStyle(
              fontSize: 3.sp,
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
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(bottom: bottom ?? 15),
        child: InkWell(
          onTap: () {
            //print(" ink click");
          },
          child: HoverCard(
            builder: (context, hovering) {
              return Image(
                image: AssetImage(image),
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
              spreadRadius: -30,
            ),
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
    return Expanded(
      child: InkWell(
        onTap: () {},
        onHover: (value) {
          setState(() {
            _isHover = value;
          });
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          //  width: double.infinity,
          decoration: BoxDecoration(
              color: kColorBackground02,
              borderRadius: BorderRadius.circular(15),
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
                        fontSize: 6.3.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shaderCallback: (rect) {
                      return LinearGradient(
                          colors: widget.gradient,
                          stops: const [-0.2, 0.6]).createShader(rect);
                    }),
              ),
              const SizedBox(height: 18),
              Text(
                widget.body,
                style: TextStyle(
                  color: kColorGrey01,
                  fontSize: 3.sp,
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
    //SizedBox(height: 5.h),
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
                width: 13.w,
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
                          fontSize: 4.5.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Icon(
                        FontAwesomeIcons.chevronRight,
                        size: 3.sp,
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
            padding: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Front-End Developer,\nUI Designer',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 2.7.sp,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await launchUrlString("https://largely.ma/");
                  },
                  child: Text(
                    '©2022 Largely',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 2.7.sp,
                    ),
                  ),
                ),
                Row(
                  children: [
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
            fontSize: 2.7.sp,
          ),
        ),
      ),
    );
  }
}
