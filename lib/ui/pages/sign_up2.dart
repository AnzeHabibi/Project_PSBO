part of 'pages.dart';

class SignUnPage2 extends StatefulWidget {
  final String email;
  final String name;
  final String password;
  final String phone;
  final String specialist;
  final File photo;

  const SignUnPage2(
      {Key key,
      this.email,
      this.name,
      this.password,
      this.phone,
      this.specialist,
      this.photo})
      : super(key: key);
  @override
  _SignUnPage2State createState() => _SignUnPage2State();
}

class _SignUnPage2State extends SignUpController {
  String _fileName;
  String _path;
  Map<String, String> _paths;
  String _extension;
  bool _loadingPath = false;
  bool _multiPick = false;
  bool _hasValidMime = false;
  FileType _pickingType;
  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  void _openFileExplorer() async {
    if (_pickingType != FileType.CUSTOM || _hasValidMime) {
      setState(() => _loadingPath = true);
      try {
        if (_multiPick) {
          _path = null;
          _paths = await FilePicker.getMultiFilePath(
              type: _pickingType, fileExtension: _extension);
        } else {
          _paths = null;
          _path = await FilePicker.getFilePath(
              type: _pickingType, fileExtension: _extension);
        }
      } on PlatformException catch (e) {
        print("Unsupported operation" + e.toString());
      }
      if (!mounted) return;
      setState(() {
        _loadingPath = false;
        _fileName = _path != null
            ? _path.split('/').last
            : _paths != null ? _paths.keys.toString() : '...';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return isLoading()
        ? Center(
            child: CircularProgressIndicator(),
          )
        : MaterialApp(
            home: Scaffold(
              backgroundColor: Color(0xFFFBFBFB),
              body: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.fromLTRB(16, 48, 16, 0),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text("Sign Up 2", style: blueFontStyle1),
                        ),
                        Text(
                            "Mari mencari rekan kerja yang sesuai dengan projekmu",
                            style: blackFontStyle2),
                        Container(
                            margin: EdgeInsets.only(top: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                //  Padding(
                                //padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                                //child: Text("Email", style: TextStyle(color: Color(0xFF424874), fontWeight: FontWeight.w400),),
                                // ),
                                /*TextField(
 decoration: InputDecoration(

fillColor:Colors.white,
labelText: "Example@sample.com",
labelStyle: TextStyle(color: Color(0xFFD2D9DF), fontSize:14,),
border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(30,)),
  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color:Color(0xFFBDBDBD),)),
 ),
  ),*/
                                _buildLinkedinTF(),
                                _buildWATF(),
                                _buildInstagramTF(),
                                _addFileCV(),
                                // Padding(
                                //padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                                //child: Text("Password", style: TextStyle(color: Color(0xFF424874), fontWeight: FontWeight.w400),),
                                // ),
                                // TextField(
                                //obscureText: true,
                                //decoration: InputDecoration(

                                //  fillColor:Colors.white,
                                //  suffixIcon :Icon(Icons.remove_red_eye, color: Colors.grey) ,
                                //  labelText: "Input Password",
                                //  labelStyle: TextStyle(color: Color(0xFFBDBDBD), fontSize:14),
                                //  border: OutlineInputBorder(
                                // borderRadius: BorderRadius.circular(30,)),
                                // focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color:Color(0xFFBDBDBD),),
                                // ),
                                //),
                                // ),
                              ],
                            )),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: Container(
                                width: 400,
                                height: 45,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 12, 0, 0),
                                  child: Text(
                                    "Selesai",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  isLoadingTrue();
                                });
                                signUp(
                                    widget.email,
                                    widget.name,
                                    widget.password,
                                    widget.phone,
                                    widget.specialist,
                                    widget.photo,
                                    linkedinController.text,
                                    waController.text,
                                    instagramController.text);
                              },
                              color: Color(0xFF1D2A64),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Have an account ? ",
                                style: TextStyle(
                                    color: Color(0xFF424874),
                                    fontWeight: FontWeight.w400),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(SignInPage());
                                },
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                      color: Color(0xFF424874),
                                      fontWeight: FontWeight.w700),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}

TextEditingController linkedinController = new TextEditingController();
Widget _buildLinkedinTF() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 0, 12),
          child: Text("Linkedin", style: blueFontStyle2),
        ),
        Container(
          height: 45.0,
          child: TextField(
            controller: linkedinController,
            decoration: InputDecoration(
              fillColor: Colors.white,
              hintText: "Input linkedin",
              hintStyle: TextStyle(
                color: Color(0xFFD2D9DF),
                fontSize: 12,
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

TextEditingController waController = new TextEditingController();
Widget _buildWATF() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 0, 12),
          child: Text("WhatsApps", style: blueFontStyle2),
        ),
        Container(
          height: 45.0,
          child: TextField(
            controller: waController,
            decoration: InputDecoration(
              fillColor: Colors.white,
              hintText: "Input WhatsApps",
              hintStyle: TextStyle(
                color: Color(0xFFD2D9DF),
                fontSize: 12,
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

TextEditingController instagramController = new TextEditingController();
Widget _buildInstagramTF() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 0, 12),
          child: Text("Instagram", style: blueFontStyle2),
        ),
        Container(
          height: 45.0,
          child: TextField(
            controller: instagramController,
            decoration: InputDecoration(
              fillColor: Colors.white,
              hintText: "Input Instagram",
              hintStyle: TextStyle(
                color: Color(0xFFD2D9DF),
                fontSize: 12,
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

TextEditingController cvController = new TextEditingController();
Widget _buildCVTF() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 0, 12),
          child: Text("CV/Portofolio", style: blueFontStyle2),
        ),
        Container(
          height: 45.0,
          child: TextField(
            controller: cvController,
            decoration: InputDecoration(
              fillColor: Colors.white,
              hintText: "Input link CV",
              hintStyle: TextStyle(
                color: Color(0xFFD2D9DF),
                fontSize: 12,
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

Widget _addFileCV() {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 12),
                    child: Text("Photo", style: blueFontStyle2),
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                          width: 400,
                          height: 45.0,
                          child: TextButton(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                                child: Text("Upload CV Here",
                                    style: blackFontStyle3),
                              ),
                            ),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(
                                      color: Color(0xffD2D9DF), width: 1.5)),
                            )),
                          )),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            width: 100,
                            height: 45.0,
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: mainColor,
                              child: Stack(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text("Upload",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                  ),
                                  GestureDetector(onTap: () {
                                   _openFileExplorer();
                                  })
                                ],
                              ),
                              shape: new RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(18),
                                      topRight: Radius.circular(18))),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
