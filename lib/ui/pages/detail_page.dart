part of 'pages.dart';

class DetailPage extends StatefulWidget {
  final String id;

  const DetailPage({Key key, this.id}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends DetailProjectController {
  var dataProject;
  var dataPhotoProject;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      dataProject = getDetailProject(widget.id).then((data) {
        setState(() {
          dataProject = data;
          dataPhotoProject = dataProject['project']['photos'];
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
            body: SafeArea(
                bottom: false,
                child: Stack(
                  children: [
                    Container(
                      height: 430,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(dataProject['project']
                                          ['photos'] !=
                                      []
                                  ? dataProject['project']['photos'][0]['photo']
                                  : "https://images.unsplash.com/photo-1512758017271-d7b84c2113f1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80"),
                              fit: BoxFit.cover)),
                    ),
                    ListView(
                      children: [
                        SizedBox(
                          height: 328,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Text(dataProject['project']['title'],
                              style: whiteFontStyle.copyWith(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Text(
                                "Deadline ",
                                style: blueFontStyle3.copyWith(
                                    color: Color(0xffD43F51),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(dataProject['project']['endDate'],
                                  style: blueFontStyle3.copyWith(
                                    color: Colors.white,
                                    fontSize: 16,
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 16,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              boxShadow: [
                                                BoxShadow(
                                                    spreadRadius: 3,
                                                    blurRadius: 15,
                                                    color: Colors.black12)
                                              ],
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 2),
                                              image: DecorationImage(
                                                  image: NetworkImage(dataProject[
                                                                      'project']
                                                                  [
                                                                  'projectManager']
                                                              ['photo'] !=
                                                          ''
                                                      ? dataProject['project']
                                                              ['projectManager']
                                                          ['photo']
                                                      : "https://images.unsplash.com/photo-1524638431109-93d95c968f03?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80"),
                                                  fit: BoxFit.cover)),
                                        ),
                                        SizedBox(width: 12),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              dataProject['project']
                                                  ['projectManager']['name'],
                                              style: blueFontStyle2.copyWith(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(height: 6),
                                            Text(
                                              "Project Manager",
                                              style: blueFontStyle3.copyWith(
                                                  color: greyColor),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    Text("Description",
                                        style: blueFontStyle2.copyWith(
                                            fontWeight: FontWeight.w600)),
                                    SizedBox(height: 8),
                                    Text(dataProject['project']['description'],
                                        style: blackFontStyle3.copyWith(
                                            height: 1.5,
                                            fontWeight: FontWeight.w300,
                                            color: Color(0xff404040))),
                                    SizedBox(height: 24),
                                    Text("Photos :",
                                        style: blueFontStyle2.copyWith(
                                            fontWeight: FontWeight.w600)),
                                    SizedBox(height: 8),
                                    Container(
                                        height: 90,
                                        child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: dataPhotoProject
                                              .map<Widget>((e) =>
                                                  GestureDetector(
                                                      onTap: () {},
                                                      child: photoWidget(
                                                          e['photo'])))
                                              .toList(),
                                          // Container(
                                          //   height: 100,
                                          //   width: 110,
                                          //   decoration: BoxDecoration(
                                          //     borderRadius:
                                          //         BorderRadius.circular(18),
                                          //     image: DecorationImage(
                                          //         image: NetworkImage(
                                          //             "https://images.unsplash.com/photo-1600697395780-1cf7ab1fef5b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=80"),
                                          //         fit: BoxFit.cover),
                                          //   ),
                                          // ),
                                          // SizedBox(width: 12),
                                          // Container(
                                          //   height: 100,
                                          //   width: 110,
                                          //   decoration: BoxDecoration(
                                          //     borderRadius:
                                          //         BorderRadius.circular(18),
                                          //     image: DecorationImage(
                                          //         image: NetworkImage(
                                          //             "https://images.unsplash.com/photo-1612772992614-bc2c2a2c3362?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80"),
                                          //         fit: BoxFit.cover),
                                          //   ),
                                          // ),
                                          // SizedBox(width: 12),
                                          // Container(
                                          //   height: 100,
                                          //   width: 110,
                                          //   decoration: BoxDecoration(
                                          //     borderRadius:
                                          //         BorderRadius.circular(18),
                                          //     image: DecorationImage(
                                          //         image: NetworkImage(
                                          //             "https://images.unsplash.com/photo-1533750088811-7a8b16218df7?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=750&q=80"),
                                          //         fit: BoxFit.cover),
                                          //   ),
                                          // ),
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(height: 40),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 16),
                                  width: MediaQuery.of(context).size.width -
                                      (2 * 16),
                                  height: 50,
                                  child: RaisedButton(
                                    onPressed: () {
                                      Get.to(RegistrantPage());
                                    },
                                    child: Text("Join Project",
                                        style: whiteFontStyle.copyWith(
                                          fontSize: 18,
                                        )),
                                    color: mainColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                  ),
                                ),
                              ),
                              SizedBox(height: 40),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(MainPage());
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
                                    image: AssetImage("assets/btn_back.png"),
                                    fit: BoxFit.cover)),
                          ),
                        ))
                  ],
                )),
          );
  }
}

Widget photoWidget(String link) {
  return Column(
    children: [
      Container(
        height: 100,
        width: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          image: DecorationImage(image: NetworkImage(link), fit: BoxFit.cover),
        ),
      ),
      SizedBox(width: 12),
    ],
  );
}

Widget btnAssign() {
  return Align(
    alignment: FractionalOffset.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Container(
          width: 400,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
            child: Text(
              "Join Project",
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        onPressed: () {
          
        },
        color: Color(0xFF1D2A64),
      ),
    ),
  );
}

Widget btnMember() {
  return Align(
    alignment: FractionalOffset.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Container(
          width: 400,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
            child: Text(
              "See Member",
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        onPressed: () {
        },
        color: Color(0xFF1DAD2B),
      ),
    ),
  );
}

Widget btnParticipant() {
  return Align(
    alignment: FractionalOffset.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Container(
          width: 400,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
            child: Text(
              "See Pasrticipant",
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        onPressed: () {
        },
        color: Color(0xFF696969),
      ),
    ),
  );
}