part of 'widgets.dart';

class CardBarContact extends StatelessWidget {
  const CardBarContact({Key? key}) : super(key: key);

  goHome() => Get.back();

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
            left: isMobile ? 15 : 0,
            right: isMobile ? 15 : 0,
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
                'Azul Mouad Zizi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (!isMobile)
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        goHome();
                      },
                      child: Text(
                        'Profile',
                        style: kStyleBarText,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        goHome();
                      },
                      child: Text(
                        'Services',
                        style: kStyleBarText,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        goHome();
                      },
                      child: Text(
                        'Projects',
                        style: kStyleBarText,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        goHome();
                      },
                      child: Text(
                        'About me',
                        style: kStyleBarText,
                      ),
                    ),
                    TextButton(
                      onPressed: null,
                      child: Text(
                        'Contact',
                        style: kStyleBarText,
                      ),
                    ),
                  ],
                ),
              TextButton.icon(
                onPressed: () => goHome(),
                icon: Text(
                  'Back to main page',
                  style: kStyleBarText,
                ),
                label: Icon(
                  FontAwesomeIcons.chevronRight,
                  size: kStyleBarText.fontSize! - 3,
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

class CardAvatarContact extends StatelessWidget {
  const CardAvatarContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = Device.screenType == sizerr.ScreenType.mobile;
    return Container(
      width: isMobile ? 40.w : 13.w,
      height: isMobile ? 40.w : 13.w,
      decoration: const BoxDecoration(
          color: Colors.white12,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.white38,
              blurRadius: 5,
            ),
            BoxShadow(
              color: Colors.white38,
              blurRadius: 5,
            ),
          ]),
      padding: const EdgeInsets.all(4),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(300),
              child: const AnimatedCard()),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Image(
              image: AssetImage('assets/images/image_3.png'),
            ),
          ),
        ],
      ),
    );
  }
}
