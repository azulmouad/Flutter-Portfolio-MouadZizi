part of '../screens.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    final isMobile = Device.screenType == sizerr.ScreenType.mobile;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          //animated
          SizedBox(
            width: 100.w,
            height: 100.h,
            child: const AnimatedCard(),
          ),
          //info
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5.0,
                sigmaY: 5.0,
              ),
              child: Container(
                // margin: EdgeInsets.only(top: isMobile ? 15.h : 10.h),
                padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 15),
                width: isMobile ? 80.w : 60.w,
                height: isMobile ? 60.h : 80.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white30,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Card Avatar
                    const CardAvatarContact(),
                    InkWell(
                      onTap: () async {
                        await launchUrlString(kEmail);
                      },
                      child: Text(
                        'moad.devloper@gmail.com',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          icon: Icon(
                            FontAwesomeIcons.linkedin,
                            color: Colors.white,
                            size: isMobile ? 9.w : 4.w,
                          ),
                          onPressed: () async {
                            await launchUrlString(kLinkedIn);
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            FontAwesomeIcons.instagram,
                            color: Colors.white,
                            size: isMobile ? 9.w : 4.w,
                          ),
                          onPressed: () async {
                            await launchUrlString(kInsta);
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            FontAwesomeIcons.facebook,
                            color: Colors.white,
                            size: isMobile ? 9.w : 4.w,
                          ),
                          onPressed: () async {
                            await launchUrlString(kFace);
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            FontAwesomeIcons.store,
                            color: Colors.white,
                            size: isMobile ? 9.w : 4.w,
                          ),
                          onPressed: () async {
                            await launchUrlString(kCodeCanyon);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          //bar top
          const Positioned(
            top: 0,
            child: CardBarContact(),
          ),
        ],
      ),
    );
  }
}
