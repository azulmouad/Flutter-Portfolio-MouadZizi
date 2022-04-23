part of '../screens.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
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
                margin: EdgeInsets.only(top: 10.h),
                padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 5.w),
                width: 70.w,
                height: 60.h,
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
                        await launch(kEmail);
                      },
                      child: Text(
                        'moad.devloper@gmail.com',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 7.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          icon: Icon(
                            FontAwesomeIcons.instagram,
                            color: Colors.white,
                            size: 10.sp,
                          ),
                          onPressed: () async {
                            await launch(kInsta);
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            FontAwesomeIcons.facebook,
                            color: Colors.white,
                            size: 10.sp,
                          ),
                          onPressed: () async {
                            await launch(kFace);
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            FontAwesomeIcons.store,
                            color: Colors.white,
                            size: 10.sp,
                          ),
                          onPressed: () async {
                            await launch(kCodeCanyon);
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
          const CardBarContact(),
        ],
      ),
    );
  }
}
