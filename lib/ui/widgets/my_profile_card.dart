part of 'widget.dart';

class MyProfileCard extends StatelessWidget {

  final MyProfile myProfile;

  const MyProfileCard({Key key, this.myProfile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width - (16 * 2),
                height: 340,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Container(
                        height: 292,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Color(0xffE6EAF2)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),

                    Container(
                      height: 85,
                      width: 85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Colors.white, width: 2),
                          image: DecorationImage(
                              image: NetworkImage(
                          "https://art.placefull.com/Content/Properties/shared/images/no-profile-image.png"),
                              fit: BoxFit.cover)),
                    ),
                    
                    Column(
                      children: [
                        SizedBox(height: 100),
                        Text(myProfile.name, style: blueFontStyle1.copyWith(fontSize:24),),
                        SizedBox(height:8),
                        Text(myProfile.mail, style: blackFontStyle3.copyWith(fontSize:16, color: Colors.grey),),
                        SizedBox(height:16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                          Column(
                            children: [
                              Text("Role", style: blueFontStyle1.copyWith(fontSize:12, fontWeight: FontWeight.w300),),
                              SizedBox(height:8),
                              Text("Designer", style: blackFontStyle3.copyWith(fontSize:12, color: mainColor, fontWeight: FontWeight.w700),),
                            ],
                          ),
                           Container(
                             height:24,
                             width:1,
                             color: Color(0xffC9CBD3),
                           ),
                          Column(
                            children: [
                              Text("Specialist", style: blueFontStyle1.copyWith(fontSize:12, fontWeight: FontWeight.w300),),
                                SizedBox(height:8),
                                Text("UI/UX Design", style: blackFontStyle3.copyWith(fontSize:12, color: mainColor, fontWeight: FontWeight.w700),),
                            ],
                          )
                        ],),
                        SizedBox(height:32),
                        Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height:48,
                              width: 48,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/btn_wa.png"), fit: BoxFit.cover)
                              ),
                            ),
                            Container(
                              height:48,
                              width: 48,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/btn_msg.png"), fit: BoxFit.cover)
                              ),
                            ),
                            Container(
                              height:48,
                              width: 48,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/btn_ig.png"), fit: BoxFit.cover)
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}