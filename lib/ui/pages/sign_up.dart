part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  File _image;

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
    return MaterialApp(
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
                    child: Text("Sign Up", style: blueFontStyle1),
                  ),
                  Text("Mari mencari rekan kerja yang sesuai dengan projekmu",
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
                                                          BorderRadius.circular(
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
                                                          shape:
                                                              BoxShape.circle,
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  "https://scontent.fcgk6-2.fna.fbcdn.net/v/t1.6435-9/159902851_2023597117781416_8920989103309733742_n.jpg?_nc_cat=103&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeF7JV6Ak-Jk3EtljOwrYnh9GKkqCuNh1agYqSoK42HVqKSLlcOXmFUDFDsgCzTkCaArAqhMNA-HB-wK_Gl65koI&_nc_ohc=mIkys3ijJEIAX9MJKc9&_nc_ht=scontent.fcgk6-2.fna&oh=3135405f013b37c6c73df8bee9546f06&oe=60A079A8"),
                                                              fit: BoxFit
                                                                  .cover)),
                                                    )))))
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          _buildEmailTF(),
                          _buildNickTF(),
                          _buildPasswordTF(),
                          _buildPhoneTF(),
                          _buildRoleTF(),
                          _buildSpecialistTF(),
// Padding(
// padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
// child: Text("Password", style: TextStyle(color: Color(0xFF424874), fontWeight: FontWeight.w400),),
// ),
// TextField(
// obscureText: true,
// decoration: InputDecoration(

// fillColor:Colors.white,
// suffixIcon :Icon(Icons.remove_red_eye, color: Colors.grey) ,
// hintText: " Input Password",
// hintStyle: TextStyle(color: Color(0xFFBDBDBD), fontSize:14),
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(30,)),
// focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color:Color(0xFFBDBDBD),),
// ),
// ),
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
                            padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                            child: Text(
                              "Countinue",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            emailController.text.isEmpty
                                ? _validateEmail = true
                                : _validateEmail = false;
                            passwordController.text.isEmpty
                                ? _validatePassword = true
                                : _validatePassword = false;
                            nickController.text.isEmpty
                                ? _validateNick = true
                                : _validateNick = false;
                            phoneController.text.isEmpty
                                ? _validatePhone = true
                                : _validatePhone = false;
                            roleController.text.isEmpty
                                ? _validateRole = true
                                : _validateRole = false;
                            specialistController.text.isEmpty
                                ? _validateSpecialist = true
                                : _validateSpecialist = false;
                          });
                          if (_validateEmail == false &&
                              _validatePassword == false &&
                              _validateNick == false &&
                              _validatePhone == false &&
                              _validateRole == false &&
                              _validateSpecialist == false) {
                            Get.to(SignUnPage2());
                          }
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
                          Text(
                            "Sign In",
                            style: TextStyle(
                                color: Color(0xFF424874),
                                fontWeight: FontWeight.w700),
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

TextEditingController emailController = new TextEditingController();
bool _validateEmail = false;
bool _validatePassword = false;
bool _validatePhone = false;
bool _validateNick = false;
bool _validateRole = false;
bool _validateSpecialist = false;
Widget _buildEmailTF() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 0, 12),
          child: Text("Email", style: blueFontStyle2),
        ),
        Container(
          height: 45.0,
          child: TextField(
            controller: emailController,
            decoration: InputDecoration(
              fillColor: Colors.white,
              errorText: _validateEmail ? 'Inputan tidak\'bisa kosong' : null,
              hintText: "Example@sample.com",
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

TextEditingController nickController = new TextEditingController();
Widget _buildNickTF() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 0, 12),
          child: Text("Nickname", style: blueFontStyle2),
        ),
        Container(
          height: 45.0,
          child: TextField(
            controller: nickController,
            decoration: InputDecoration(
              fillColor: Colors.white,
              errorText: _validateNick ? 'Inputan tidak\'bisa kosong' : null,
              hintText: "Input Nickname",
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

TextEditingController phoneController = new TextEditingController();
Widget _buildPhoneTF() {
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
Widget _buildSpecialistTF() {
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
