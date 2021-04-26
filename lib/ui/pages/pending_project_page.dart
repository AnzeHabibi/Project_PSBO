part of 'pages.dart';

class PendingProjectPage extends StatefulWidget {
  @override
  _PendingProjectPageState createState() => _PendingProjectPageState();
}

class _PendingProjectPageState extends State<PendingProjectPage> {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(MainPage());
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
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
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSearchTF(),
                            SizedBox(
                              height: 12,
                            ),
                            Column(
                              children: [
                                Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(DetailPage());
                                    },
                                    child: Column(
                                        children: mockPendingProject
                                            .map((e) => Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 8),
                                                  child: PendingProject2Card(e),
                                                ))
                                            .toList()),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              )),
            ],
          ),
        ],
      ),
    );
  }
}
