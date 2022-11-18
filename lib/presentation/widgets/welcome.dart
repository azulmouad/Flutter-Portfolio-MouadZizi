part of 'widgets.dart';

class CardBarHome extends StatelessWidget {
  const CardBarHome({Key? key, required this.onChanged}) : super(key: key);

  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final isMobile = Device.screenType == sizerr.ScreenType.mobile;
    final paddingTop = MediaQuery.of(context).padding.top;
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 5.0,
        ),
        //blendMode: BlendMode.dstOver,
        child: Container(
          alignment: Alignment.center,
          width: 100.w,
          height: 7.h + (isMobile ? paddingTop : 0),
          padding: EdgeInsets.only(
            top: isMobile ? paddingTop : 0,
            left: isMobile ? 20 : 0,
            right: isMobile ? 20 : 0,
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF814094).withOpacity(.178),
                blurRadius: 2,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: isMobile
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.spaceAround,
            children: [
              if (!isMobile) const SizedBox(),
              Text(
                'Mouad Zizi'.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w900,
                ),
              ),
              if (!isMobile)
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        onChanged(0);
                      },
                      child: Text(
                        'Profile',
                        style: kStyleBarText,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        onChanged(8);
                      },
                      child: Text(
                        'Services',
                        style: kStyleBarText,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        onChanged(10);
                      },
                      child: Text(
                        'Projects',
                        style: kStyleBarText,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        onChanged(19);
                      },
                      child: Text(
                        'About me',
                        style: kStyleBarText,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        onChanged(26);
                      },
                      child: Text(
                        'Contact',
                        style: kStyleBarText,
                      ),
                    ),
                  ],
                ),
              TextButton.icon(
                onPressed: () => Get.toNamed('/contact'),
                icon: Text(
                  'Work request',
                  style: kStyleBarText,
                ),
                label: Icon(
                  FontAwesomeIcons.chevronRight,
                  size: (kStyleBarText.fontSize! - 3),
                  color: Colors.white,
                ),
              ),
              if (!isMobile) const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class CardAvatar extends StatelessWidget {
  const CardAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = Device.screenType == sizerr.ScreenType.mobile;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: isMobile ? 50.w : 17.w,
          height: isMobile ? 50.w : 17.w,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(300),
            boxShadow: kGradientCirclePic1,
          ),
          child: Center(
            child: Container(
              width: isMobile ? 48.w : 16.5.w,
              height: isMobile ? 48.w : 16.5.w,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(300),
                boxShadow: kGradientCirclePic2,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: Stack(
                  alignment: Alignment.center,
                  children: const [
                    AnimatedCard(),
                    //TODO: IMAGE PICTURE
                    Image(
                      image: AssetImage('assets/images/azul-mouad-2.png'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 9.sp),
        Text(
          'Flutter / Front-End Developer',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 1.h),
        Text(
          'Based in Marrakech, Morocco.',
          style: TextStyle(
            color: kColorGrey01,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4.sp),
        TextButton.icon(
          onPressed: () {},
          icon: Text(
            'Let\'s work!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          label: Icon(
            FontAwesomeIcons.chevronRight,
            size: 10.sp,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

///Animated Card

class CardProfile extends StatefulWidget {
  const CardProfile({Key? key}) : super(key: key);

  @override
  State<CardProfile> createState() => _CardProfileState();
}

class _CardProfileState extends State<CardProfile> {
  final Duration duration = const Duration(milliseconds: 2000);

  bool _isAnimated = false;
  late Timer _timer;
  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(duration, (timer) {
      setState(() {
        _isAnimated = !_isAnimated;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Device.screenType == sizerr.ScreenType.mobile;
    return SizedBox(
      width: 100.w,
      height: 70.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const CardAvatar(),
          //liser
          AnimatedPositioned(
            duration: duration,
            top: _isAnimated ? 23.h : 26.h,
            left: isMobile ? 5.w : 28.w,
            child: CardAnimateTile(
              label: "Azul Mouàd",
              hint: "Hi! I'm",
              sizeText: 15.sp,
              isHi: true,
            ),
          ),
          //limen
          AnimatedPositioned(
            duration: duration,
            top: _isAnimated ? 13.h : 15.h,
            right: isMobile ? 10.w : 30.w,
            child: CardAnimateTile(
              label: "Ui Designer 📐",
              hint: "",
              sizeText: 15.sp,
              color: kColorDark,
            ),
          ),
          //center
          AnimatedPositioned(
            duration: duration,
            top: _isAnimated ? 35.h : 37.h,
            right: isMobile ? 5.w : 35.w,
            child: CardAnimateTile(
              label: "2D Artist  🎨",
              hint: "",
              sizeText: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}

///circle
class AnimatedCard extends StatefulWidget {
  const AnimatedCard({Key? key}) : super(key: key);

  @override
  AnimatedCardState createState() => AnimatedCardState();
}

class AnimatedCardState extends State<AnimatedCard> {
  List<Color> colorList = [
    // Color(0xFFa5fecb),
    const Color(0xFF4bc0c8),
    const Color(0xFFfeac5e),
    const Color(0xFFc779d0),
    const Color(0xFF20bdff),
  ];
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];
  int index = 0;
  Color bottomColor = const Color(0xFFfeac5e);
  Color topColor = const Color(0xFFc779d0);
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 300)).then((value) {
      setState(() {
        bottomColor = const Color(0xFF4bc0c8);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(seconds: 2),
          onEnd: () {
            setState(() {
              index = index + 1;
              // animate the color
              bottomColor = colorList[index % colorList.length];
              topColor = colorList[(index + 1) % colorList.length];

              //// animate the alignment
              // begin = alignmentList[index % alignmentList.length];
              // end = alignmentList[(index + 2) % alignmentList.length];
            });
          },
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: begin, end: end, colors: [bottomColor, topColor])),
        ),
        // Positioned.fill(
        //   child: IconButton(
        //     icon: Icon(Icons.play_arrow),
        //     onPressed: () {
        //       setState(() {
        //         bottomColor = Colors.blue;
        //       });
        //     },
        //   ),
        // )
      ],
    );
  }
}

class CardAnimateTile extends StatelessWidget {
  const CardAnimateTile({
    Key? key,
    required this.label,
    required this.hint,
    required this.sizeText,
    this.color = Colors.black,
    this.isHi = false,
  }) : super(key: key);

  final String label;
  final String hint;
  final double sizeText;
  final Color color;
  final bool isHi;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white38,
              border: Border.all(color: Colors.white, width: .3),
            ),
            child: Row(
              children: [
                if (isHi)
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      "👋",
                      style: TextStyle(
                        color: color,
                        fontSize: sizeText,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (hint.isNotEmpty)
                      Text(
                        hint,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.sp,
                        ),
                      ),
                    if (hint.isNotEmpty) const SizedBox(height: 5),
                    Text(
                      label,
                      style: TextStyle(
                        color: color,
                        fontSize: sizeText,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

class AnimatedTextCard extends StatefulWidget {
  const AnimatedTextCard({Key? key, required this.label, required this.size})
      : super(key: key);
  final String label;
  final double size;

  @override
  State<AnimatedTextCard> createState() => _AnimatedTextCardState();
}

class _AnimatedTextCardState extends State<AnimatedTextCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 6));

    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animationController.forward();
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        child: Text(
          widget.label,
          style: TextStyle(
            color: Colors.white,
            fontSize: widget.size,
            fontWeight: FontWeight.w900,
          ),
        ),
        shaderCallback: (rect) {
          return LinearGradient(colors: colorizeColors, stops: [
            _animation.value - 0.5,
            _animation.value,
            _animation.value + 0.5,
          ]).createShader(rect);
        });
  }
}
