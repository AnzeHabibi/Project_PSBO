part of 'pages.dart';

class SignUnPage2 extends StatefulWidget {
  @override
  _SignUnPage2State createState() => _SignUnPage2State();
}

class _SignUnPage2State extends State<SignUnPage2> {
  @override
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
                    child: Text("Sign Up 2", style: blueFontStyle1),
                  ),
                  Text("Mari mencari rekan kerja yang sesuai dengan projekmu",
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
                          _buildCVTF(),
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
                            padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                            child: Text(
                              "Selesai",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Get.to(OpeningPage());
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
                        Text(
                          "Sign In",
                          style: TextStyle(
                              color: Color(0xFF424874),
                              fontWeight: FontWeight.w700),
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
