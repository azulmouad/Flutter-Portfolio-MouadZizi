part of 'widgets.dart';

class CardBarContact extends StatelessWidget {
  const CardBarContact({Key? key}) : super(key: key);

  goHome() => Get.back();

  @override
  Widget build(BuildContext context) {
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
          height: 7.h,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF814094).withOpacity(.178),
                blurRadius: 2,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(),
              Text(
                'Azul Mouad Zizi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 4.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      goHome();
                    },
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 2.5.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      goHome();
                    },
                    child: Text(
                      'Services',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 2.5.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      goHome();
                    },
                    child: Text(
                      'Projects',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 2.5.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      goHome();
                    },
                    child: Text(
                      'About me',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 2.5.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: null,
                    child: Text(
                      'Contact',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 2.5.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              TextButton.icon(
                onPressed: () => goHome(),
                icon: Text(
                  'Back to main page',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 2.5.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                label: Icon(
                  FontAwesomeIcons.chevronRight,
                  size: 2.3.sp,
                  color: Colors.white,
                ),
              ),
              const SizedBox(),
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
    return Container(
      width: 13.w,
      height: 13.w,
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
