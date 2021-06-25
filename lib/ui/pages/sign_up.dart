part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  final data;

  const SignUpPage({Key key, this.data}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends UpdateProfileController {
  File _image;
  PlatformFile cv;
  String cvfilename = '';

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  Widget build(BuildContext context) {
    return isLoading()
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
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
                          child: Text("Edit Profile", style: blueFontStyle1),
                        ),
                        Text(
                            "Mari mencari rekan kerja yang sesuai dengan projekmu",
                            style: blackFontStyle2),
                        Container(
                            margin: EdgeInsets.only(top: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  children: [
                                    Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                            width: 160,
                                            height: 160,
                                            margin: EdgeInsets.only(top: 26),
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        "assets/photo_border.png"))),
                                            child: GestureDetector(
                                                onTap: () {
                                                  _showPicker(context);
                                                },
                                                child: CircleAvatar(
                                                    radius: 55,
                                                    child: _image != null
                                                        ? ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100),
                                                            child: Image.file(
                                                              _image,
                                                              width: 140,
                                                              height: 140,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          )
                                                        : Container(
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                image: DecorationImage(
                                                                    image: widget.data['photo'] !=
                                                                            ''
                                                                        ? NetworkImage(widget.data[
                                                                            'photo'])
                                                                        : AssetImage(
                                                                            "assets/photo.png"),
                                                                    fit: BoxFit
                                                                        .cover)),
                                                          )))))
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                _buildEmailTF2(widget.data['email']),
                                _buildNickTF(widget.data['name']),
                                _buildPhoneTF(widget.data['phoneNumber']),
                                _buildSpecialistTF(widget.data['speciality']),
                                SizedBox(
                                  height: 16,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 0, 0, 12),
                                  child: Text('Social Media',
                                      style: blueFontStyle4),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                _buildLinkedinTF(widget.data['linkedin']),
                                _buildWATF(widget.data['whatsapp']),
                                _buildInstagramTF(widget.data['instagram']),
                                Container(
                                    margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        16, 0, 0, 12),
                                                child: Text("CV",
                                                    style: blueFontStyle2),
                                              ),
                                              Stack(
                                                children: <Widget>[
                                                  Container(
                                                      width: 400,
                                                      height: 45.0,
                                                      child: TextButton(
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    2, 0, 0, 0),
                                                            child: Text(
                                                                cvfilename == ''
                                                                    ? widget.data[
                                                                            'cv']
                                                                        [
                                                                        'title']
                                                                    : cvfilename,
                                                                style:
                                                                    blackFontStyle3),
                                                          ),
                                                        ),
                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty
                                                                .all<
                                                                    RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          18.0),
                                                              side: BorderSide(
                                                                  color: Color(
                                                                      0xffD2D9DF),
                                                                  width: 1.5)),
                                                        )),
                                                      )),
                                                  Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Container(
                                                        width: 100,
                                                        height: 45.0,
                                                        child: RaisedButton(
                                                          textColor:
                                                              Colors.white,
                                                          color: mainColor,
                                                          child: Stack(
                                                            children: <Widget>[
                                                              Align(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Text(
                                                                    "Upload",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            16)),
                                                              ),
                                                              GestureDetector(
                                                                  onTap:
                                                                      () async {
                                                                FilePickerResult
                                                                    result =
                                                                    await FilePicker
                                                                        .platform
                                                                        .pickFiles(
                                                                  type: FileType
                                                                      .custom,
                                                                  allowedExtensions: [
                                                                    'pdf'
                                                                  ],
                                                                );

                                                                if (result !=
                                                                    null) {
                                                                  PlatformFile
                                                                      file =
                                                                      result
                                                                          .files
                                                                          .first;

                                                                  print(file
                                                                      .path);
                                                                  setState(() {
                                                                    cvfilename =
                                                                        file.name;
                                                                    cv = file;
                                                                  });
                                                                } else {
                                                                  // User canceled the picker
                                                                }
                                                              })
                                                            ],
                                                          ),
                                                          shape: new RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.only(
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          18),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          18))),
                                                        )),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
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
                                    "Update",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                editProfile(
                                    widget.data['name'],
                                    widget.data['email'],
                                    phoneController.text,
                                    specialistController.text,
                                    linkedinController.text,
                                    waController.text,
                                    instagramController.text,
                                    _image,
                                    cv);
                              },
                              color: Color(0xFF1D2A64),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(SignInPage());
                          },
                          child: Padding(
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

bool _validateEmail = false;
bool _validatePassword = false;
bool _validatePhone = false;
bool _validateNick = false;
bool _validateRole = false;
bool _validateSpecialist = false;

Widget _buildEmailTF2(String email) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 0, 12),
          child: Text("Email", style: blueFontStyle2),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 0, 12),
          child: Text(email, style: blackFontStyle2),
        ),
      ],
    ),
  );
}

TextEditingController passwordController = new TextEditingController();
Widget _buildPasswordTF() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 0, 12),
          child: Text("Password", style: blueFontStyle2),
        ),
        Container(
          height: 45.0,
          child: TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              fillColor: Colors.white,
              errorText:
                  _validatePassword ? 'Inputan tidak\'bisa kosong' : null,
              hintText: "Input Password",
              hintStyle: TextStyle(
                color: Color(0xFFD2D9DF),
                fontSize: 12,
              ),
              suffixIcon: Icon(
                Icons.remove_red_eye,
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

Widget _buildNickTF(String name) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 0, 12),
          child: Text("Nickname", style: blueFontStyle2),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 0, 12),
          child: Text(name, style: blackFontStyle2),
        ),
      ],
    ),
  );
}

TextEditingController phoneController = new TextEditingController();
Widget _buildPhoneTF(String number) {
  phoneController = new TextEditingController(text: number);
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 0, 12),
          child: Text("Phone", style: blueFontStyle2),
        ),
        Container(
          height: 45.0,
          child: TextField(
            controller: phoneController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              fillColor: Colors.white,
              errorText: _validatePhone ? 'Inputan tidak\'bisa kosong' : null,
              hintText: "Input Phone",
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

TextEditingController roleController = new TextEditingController();
Widget _buildRoleTF() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 0, 12),
          child: Text("Role", style: blueFontStyle2),
        ),
        Container(
          height: 45.0,
          child: TextField(
            controller: roleController,
            decoration: InputDecoration(
              fillColor: Colors.white,
              errorText: _validateRole ? 'Inputan tidak\'bisa kosong' : null,
              hintText: "Input role",
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

TextEditingController specialistController = new TextEditingController();
Widget _buildSpecialistTF(String special) {
  specialistController = new TextEditingController(text: special);
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 0, 12),
          child: Text("Specialist", style: blueFontStyle2),
        ),
        Container(
          height: 45.0,
          child: TextField(
            controller: specialistController,
            decoration: InputDecoration(
              fillColor: Colors.white,
              errorText:
                  _validateSpecialist ? 'Inputan tidak\'bisa kosong' : null,
              hintText: "Input specialist",
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
