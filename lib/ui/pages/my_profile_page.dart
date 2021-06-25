part of 'pages.dart';

class MyProfilePage extends StatefulWidget {
  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends ShowProfileController {
  var e;
  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => getMyProfile().then((response) {
              setState(() {
                mockMyProfile = [];
                e = response['user'];
                var tile = mockMyProfile.firstWhere(
                    (item) => item.id == e['id'],
                    orElse: () => null);
                if (tile != null)
                  setState(() => tile = MyProfile(
                      name: e['name'],
                      id: e['id'],
                      mail: e['email'],
                      photo: e['photo'] != ''
                          ? e['photo']
                          : "https://art.placefull.com/Content/Properties/shared/images/no-profile-image.png",
                      specialist: e['specialist'],
                      instagram: e['instagram'],
                      whatsapp: e['whatsapp']));
                else {
                  mockMyProfile.add(MyProfile(
                      name: e['name'],
                      id: e['id'],
                      mail: e['email'],
                      photo: e['photo'] != ''
                          ? e['photo']
                          : "https://art.placefull.com/Content/Properties/shared/images/no-profile-image.png",
                      specialist: e['speciality'],
                      instagram: e['instagram'],
                      whatsapp: e['whatsapp']));
                }
                isLoadingFalse();
                print("ssss" + mockMyProfile[0].name.toString());
              });
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading()
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            body: SafeArea(
              child: ListView(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(MainPage());
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
                                          image:
                                              AssetImage("assets/btn_back.png"),
                                          fit: BoxFit.cover)),
                                ),
                                SizedBox(width: 8),
                                Text("Back", style: blueFontStyle2),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 24),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(SignUpPage(data: e));
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 3,
                                        blurRadius: 15,
                                        color: Colors.black12)
                                  ],
                                  image: DecorationImage(
                                      image: AssetImage("assets/btn_edit.png"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(height: 56),
                          MyProfileCard(myProfile: mockMyProfile.first),
                          SizedBox(
                            height: 24,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - (2 * 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("Last Project",
                                    style: blueFontStyle2.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: mainColor)),
                                Text(
                                  "see all",
                                  style: blueFontStyle2.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w200,
                                      color: mainColor),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              height: 188,
                              width: double.infinity,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Row(
                                      children: mockMyProject
                                          .map((e) => Padding(
                                                padding: EdgeInsets.only(
                                                    left: (e ==
                                                            mockMyProject.first)
                                                        ? 16
                                                        : 0,
                                                    right: 16),
                                                child: MyProjectCard(e),
                                              ))
                                          .toList(),
                                    ),
                                  )
                                ],
                              )),
                          SizedBox(
                            height: 24,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
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
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 12, 0, 0),
                                    child: Text(
                                      "Logout",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Get.to(SignInPage());
                                },
                                color: Color(0xFFD43F51),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
