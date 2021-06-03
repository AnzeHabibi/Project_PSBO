part of 'pages.dart';

class NewProjectPage extends StatefulWidget {
  @override
  _NewProjectPageState createState() => _NewProjectPageState();
}

class _NewProjectPageState extends NewProjectController {
  @override
  void initState() {
    mockProject = [];
    WidgetsBinding.instance
        .addPostFrameCallback((_) => getNewProject(0).then((response) {
              response.map((e) {
                print(e);
                var tile = mockProject.firstWhere((item) => item.id == e['id'],
                    orElse: () => null);
                if (tile != null)
                  setState(() => tile = NewProject(
                      name: e['title'],
                      description: "dari API",
                      id: e['id'],
                      picturePath: e['photos'] != []
                          ? e['photos'][0]['photo']
                          : "https://images.unsplash.com/photo-1553267751-1c148a7280a1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
                      start: "Start",
                      date: e['startDate']));
                else {
                  mockProject.add(NewProject(
                      name: e['title'],
                      description: "dari API",
                      id: e['id'],
                      picturePath: e['photos'] != []
                          ? e['photos'][0]['photo']
                          : "https://images.unsplash.com/photo-1553267751-1c148a7280a1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
                      start: "Start",
                      date: e['startDate']));
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSearchTF(),
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
                                    children: mockProject
                                        .map((e) => Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 16),
                                              child: NewProject2Card(e),
                                            ))
                                        .toList()),
                          ),
                        ),
                      ],
                    ),
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

TextEditingController searchController = new TextEditingController();
Widget _buildSearchTF() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 45.0,
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              fillColor: Colors.white,
              hintText: "Cari Project",
              hintStyle: TextStyle(
                color: Color(0xFFD2D9DF),
                fontSize: 12,
              ),
              suffixIcon: Icon(
                Icons.search,
                color: mainColor,
                size: 20,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffD2D9DF), width: 1.5),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(30.0),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffD2D9DF), width: 1.5),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(30.0),
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
