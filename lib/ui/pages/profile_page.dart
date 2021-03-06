part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  final data;

  const ProfilePage({Key key, this.data}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 3,
                                    blurRadius: 15,
                                    color: Colors.black12)
                              ],
                              image: DecorationImage(
                                  image: AssetImage("assets/btn_back.png"),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(width: 8),
                        Text("Back", style: blueFontStyle2),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 56),
                  ProfileCard(data: widget.data),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - (2 * 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Text("Last Project",
                        //     style: blueFontStyle2.copyWith(
                        //         fontSize: 18,
                        //         fontWeight: FontWeight.w600,
                        //         color: mainColor)),
                        // Text(
                        //   "see all",
                        //   style: blueFontStyle2.copyWith(
                        //       fontSize: 12,
                        //       fontWeight: FontWeight.w200,
                        //       color: mainColor),
                        // ),
                      ],
                    ),
                  ),
                  // Container(
                  //     height: 188,
                  //     width: double.infinity,
                  //     child: ListView(
                  //       scrollDirection: Axis.horizontal,
                  //       children: [
                  //         GestureDetector(
                  //           onTap: () {},
                  //           child: Row(
                  //             children: mockMyProject
                  //                 .map((e) => Padding(
                  //                       padding: EdgeInsets.only(
                  //                           left: (e == mockMyProject.first)
                  //                               ? 16
                  //                               : 0,
                  //                           right: 16),
                  //                       child: MyProjectCard(e),
                  //                     ))
                  //                 .toList(),
                  //           ),
                  //         )
                  //       ],
                  //     )),
                  SizedBox(
                    height: 24,
                  ),
                  Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 16, left: 16, bottom: 16),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Container(
                          width: 400,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                            child: Text(
                              "See the CV",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Get.to(MainPage());
                        },
                        color: Color(0xFF1D2A64),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      )),
    );
  }
}
