part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends LoginController {
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
                          child: Text("Sign In", style: blueFontStyle1),
                        ),
                        Text(
                            "Mari mencari rekan kerja yang sesuai dengan projekmu",
                            style: blackFontStyle2),
                        Container(
                            margin: EdgeInsets.only(top: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                _buildEmailTF(),
                                _buildPasswordTF(),
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
                                    "Sign In",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
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
                                });
                                if (_validateEmail == false &&
                                    _validatePassword == false) {
                                  setState(() {
                                    isLoadingTrue();
                                  });
                                  signIn(emailController.text,
                                      passwordController.text);
                                }
                              },
                              color: Color(0xFF1D2A64),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Don't have an account ? ",
                                  style: TextStyle(
                                      color: Color(0xFF424874),
                                      fontWeight: FontWeight.w400),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(SignUpPage);
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
