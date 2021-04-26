part of 'pages.dart';

class NewProjectPage extends StatefulWidget {
  @override
  _NewProjectPageState createState() => _NewProjectPageState();
}

class _NewProjectPageState extends State<NewProjectPage> {
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
                            child: Column(
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
