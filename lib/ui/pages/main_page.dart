part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(color: Colors.white),
              SafeArea(
                  child: Container(
                color: Color(0xFFFBFCFD),
              )),
              SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Good Morning, ",
                                  style: blueFontStyle1.copyWith(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400)),
                              Text("Abiyyu Habibi",
                                  style: blueFontStyle1.copyWith(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w900)),
                            ],
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue[100].withOpacity(0.5),
                                    spreadRadius: 0.5,
                                    blurRadius: 3,
                                    offset: Offset(
                                        0, 2), // changes position of shadow
                                  ),
                                ],
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://media-exp1.licdn.com/dms/image/C5603AQH3bArr0cSQLA/profile-displayphoto-shrink_800_800/0/1608781057747?e=1620864000&v=beta&t=7n3Gd-JXKjKD_pkZ2GERYlNaFCLIGf_URZgVWpaQsoE"),
                                    fit: BoxFit.cover)),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Container(
                      width: MediaQuery.of(context).size.width - (2 * 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Your Projects",
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
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Container(
                        height: 160,
                        width: double.infinity,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Row(
                              children: [
                                MyProjectCard(),
                                SizedBox(
                                  width: 24,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Container(
                      width: MediaQuery.of(context).size.width - (2 * 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("New Project",
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
                        height: 228,
                        width: double.infinity,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(DetailPage());
                              },
                              child: Row(
                                children: mockProject
                                    .map((e) => Padding(
                                          padding: EdgeInsets.only(
                                              left: (e == mockProject.first)
                                                  ? 16
                                                  : 0,
                                              right: 16),
                                          child: NewProjectCard(e),
                                        ))
                                    .toList(),
                              ),
                            )
                          ],
                        )),
                    SizedBox(height: 16),
                    Container(
                      width: MediaQuery.of(context).size.width - (2 * 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Pending",
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
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Container(
                        height: 160,
                        width: double.infinity,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Row(
                              children: [
                                MyProjectCard(),
                                SizedBox(
                                  width: 16,
                                ),
                                MyProjectCard(),
                                SizedBox(
                                  width: 16,
                                ),
                                MyProjectCard(),
                                SizedBox(
                                  width: 16,
                                ),
                                MyProjectCard(),
                                SizedBox(
                                  width: 16,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height:36),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: mainColor,
        onPressed: () {
          Get.to(DetailPage());
        },
      ),
    );
  }
}
