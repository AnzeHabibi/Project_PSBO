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
                          : "https://images.unsplash.com/photo-1553267751-1c148a7280a1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
                      start: "Deadline",
                      date: e['endDate']));
                else {
                  mockMyProject.add(MyProject(
                      name: e['title'],
                      description: "dari API",
                      id: e['id'],
                      photoCreator: e['projectManager']['photo'] != ''
                          ? e['projectManager']['photo']
                          : "https://images.unsplash.com/photo-1553267751-1c148a7280a1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
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
                            Column(
                              children: [
                                Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(DetailPage());
                                    },
                                    child: isLoading()
                                        ? Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : Column(
                                            children: mockMyProject
                                                .map((e) => Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 8),
                                                      child: MyProject2Card(e),
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
