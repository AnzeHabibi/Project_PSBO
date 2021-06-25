part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends DashboardController {
  var name, photo;
  List<MyProject> FiveMyProject = [];
  List<NewProject> FiveNewProjects = [];
  List<PendingProject> FivePendingprojects = [];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getDashboard().then((data) {
        setState(() {
          name = data['user']['name'];
          photo = data['user']['photo'] != ''
              ? data['user']['photo']
              : "https://art.placefull.com/Content/Properties/shared/images/no-profile-image.png";
          List<dynamic> fiveMyProjectList = data["CompleteFiveMyProject"];
          fiveMyProjectList.map((e) {
            print("e" + e.toString());
            var tile = FiveMyProject.firstWhere((item) => item.id == e['id'],
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
              FiveMyProject.add(MyProject(
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
          List<dynamic> FiveNewProjectsList = data["FiveNewProjects"];
          FiveNewProjectsList.map((e) {
            print(e);
            var tile = FiveNewProjects.firstWhere((item) => item.id == e['id'],
                orElse: () => null);
            if (tile != null)
              setState(() => tile = NewProject(
                  name: e['title'],
                  description: "dari API",
                  id: e['id'],
                  picturePath: e['photos'].length != 0
                      ? e['photos'][0]['photo']
                      : "https://images.unsplash.com/photo-1553267751-1c148a7280a1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
                  start: "Start",
                  date: e['startDate']));
            else {
              FiveNewProjects.add(NewProject(
                  name: e['title'],
                  description: "dari API",
                  id: e['id'],
                  picturePath: e['photos'].length != 0
                      ? e['photos'][0]['photo']
                      : "https://images.unsplash.com/photo-1553267751-1c148a7280a1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
                  start: "Start",
                  date: e['startDate']));
            }
          }).toList();
          List<dynamic> FivePendingprojectsList = data["FivePendingprojects"];
          FivePendingprojectsList.map((e) {
            print("ini e nya" + e.toString());
            var tile = FivePendingprojects.firstWhere((item) => item.id == e.id,
                orElse: () => null);
            if (tile != null)
              setState(() => tile = PendingProject(
                  id: e['idProject']['_id'],
                  photoCreator: e['idProject']['projectManager']['photo'] != ''
                      ? e['idProject']['projectManager']['photo']
                      : "https://art.placefull.com/Content/Properties/shared/images/no-profile-image.png",
                  name: e['idProject']['title'],
                  description: e['idProject']['description'],
                  start: "Deadline",
                  date: e['idProject']['endDate']));
            else {
              FivePendingprojects.add(PendingProject(
                  id: e['idProject']['_id'],
                  photoCreator: e['idProject']['projectManager']['photo'] != ''
                      ? e['idProject']['projectManager']['photo']
                      : "https://art.placefull.com/Content/Properties/shared/images/no-profile-image.png",
                  name: e['idProject']['title'],
                  description: e['idProject']['description'],
                  start: "Deadline",
                  date: e['idProject']['endDate']));
            }
          }).toList();
          print("Aaa" + FivePendingprojects.length.toString());
          isLoadingFalse();
        });
      });
    });
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
                                    Text("Welcome,",
                                        style: blueFontStyle1.copyWith(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w400)),
                                    Container(
                                      constraints:
                                          new BoxConstraints(maxWidth: 250),
                                      child: Text(name.toString(),
                                          overflow: TextOverflow.clip,
                                          maxLines: 2,
                                          softWrap: true,
                                          style: blueFontStyle1.copyWith(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w900)),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(MyProfilePage());
                                  },
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.blue[100]
                                                .withOpacity(0.5),
                                            spreadRadius: 0.5,
                                            blurRadius: 3,
                                            offset: Offset(0,
                                                2), // changes position of shadow
                                          ),
                                        ],
                                        image: DecorationImage(
                                            image: NetworkImage(photo),
                                            fit: BoxFit.cover)),
                                  ),
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
                                GestureDetector(
                                  onTap: () {
                                    Get.to(MyProjectPage());
                                  },
                                  child: Text(
                                    "see all",
                                    style: blueFontStyle2.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w200,
                                        color: mainColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16),
                          FiveMyProject.isEmpty
                              ? Container(
                                  height: 188,
                                  width: double.infinity,
                                  child: Center(
                                      child: Text(
                                          "You Haven't Create Any Project",
                                          style: blueFontStyle2.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w200,
                                              color: mainColor))))
                              : Container(
                                  height: 188,
                                  width: double.infinity,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Row(
                                          children: FiveMyProject.map((e) =>
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: (e ==
                                                              FiveMyProject
                                                                  .first)
                                                          ? 16
                                                          : 0,
                                                      right: 16),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Get.to(
                                                          DetailPage(id: e.id));
                                                    },
                                                    child: MyProjectCard(e),
                                                  ))).toList(),
                                        ),
                                      )
                                    ],
                                  )),
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
                                GestureDetector(
                                  onTap: () {
                                    Get.to(NewProjectPage());
                                  },
                                  child: Text(
                                    "see all",
                                    style: blueFontStyle2.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w200,
                                        color: mainColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          FiveNewProjects.isEmpty
                              ? Container(
                                  height: 228,
                                  width: double.infinity,
                                  child: Center(
                                      child: Text("There's No New Project",
                                          style: blueFontStyle2.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w200,
                                              color: mainColor))))
                              : Container(
                                  height: 228,
                                  width: double.infinity,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Row(
                                        children: FiveNewProjects.map((e) =>
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: (e ==
                                                            FiveNewProjects
                                                                .first)
                                                        ? 16
                                                        : 0,
                                                    right: 16),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Get.to(
                                                        DetailPage(id: e.id));
                                                  },
                                                  child: NewProjectCard(e),
                                                ))).toList(),
                                      ),
                                    ],
                                  )),
                          SizedBox(height: 16),
                          FivePendingprojects.isEmpty
                              ? Container()
                              : Container(
                                  width: MediaQuery.of(context).size.width -
                                      (2 * 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("Pending",
                                          style: blueFontStyle2.copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: mainColor)),
                                      // GestureDetector(
                                      //   onTap: () {
                                      //     Get.to(PendingProjectPage());
                                      //   },
                                      //   child: Text(
                                      //     "see all",
                                      //     style: blueFontStyle2.copyWith(
                                      //         fontSize: 12,
                                      //         fontWeight: FontWeight.w200,
                                      //         color: mainColor),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                          FivePendingprojects.isEmpty
                              ? Container()
                              : Container(
                                  height: 188,
                                  width: double.infinity,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Row(
                                          children: FivePendingprojects.map(
                                              (e) => Padding(
                                                  padding: EdgeInsets.only(
                                                      left: (e ==
                                                              FivePendingprojects
                                                                  .first)
                                                          ? 16
                                                          : 0,
                                                      right: 16),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Get.to(
                                                          DetailPage(id: e.id));
                                                    },
                                                    child:
                                                        PendingProjectCard(e),
                                                  ))).toList(),
                                        ),
                                      )
                                    ],
                                  )),
                          SizedBox(height: 36),
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
                Get.to(UploadPost());
              },
            ),
          );
  }
}
