part of 'pages.dart';

class MyProjectPage extends StatefulWidget {
  @override
  _MyProjectPageState createState() => _MyProjectPageState();
}

class _MyProjectPageState extends MyProjectController {
  @override
  void initState() {
    mockMyProject = [];
    WidgetsBinding.instance
        .addPostFrameCallback((_) => getMyProject(0).then((response) {
              response.map((e) {
                var tile = mockMyProject.firstWhere(
                    (item) => item.id == e['id'],
                    orElse: () => null);
                if (tile != null)
                  setState(() => tile = MyProject(
                      name: e['title'],
                      description: "dari API",
                      id: e['id'],
                      photoCreator: e['projectManager']['photo'] != ''
                          ? e['projectManager']['photo']
                          : "https://art.placefull.com/Content/Properties/shared/images/no-profile-image.png",
                      start: "Deadline",
                      date: e['endDate']));
                else {
                  mockMyProject.add(MyProject(
                      name: e['title'],
                      description: "dari API",
                      id: e['id'],
                      photoCreator: e['projectManager']['photo'] != ''
                          ? e['projectManager']['photo']
                          : "https://art.placefull.com/Content/Properties/shared/images/no-profile-image.png",
                      start: "Deadline",
                      date: e['endDate']));
                }
              }).toList();
              setState(() {
                isLoadingFalse();
              });
            }));

    super.initState();
  }

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
                            isLoading()
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Column(
                                    children: [
                                      Container(
                                        child: Column(
                                            children: mockMyProject
                                                .map((e) => GestureDetector(
                                                    onTap: () {
                                                      Get.to(DetailPage(
                                                        id: e.id,
                                                      ));
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 8),
                                                      child: MyProject2Card(e),
                                                    )))
                                                .toList()),
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
