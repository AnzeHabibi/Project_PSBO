part of 'pages.dart';

class OpeningPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F8FB),
      body: SafeArea(
        child: Stack(
          children: [
             Align(
                      alignment: FractionalOffset.bottomCenter,
                                          child: Padding(
                        padding: const EdgeInsets.only(right: 16,
                        left: 16,
                        bottom: 16),
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Container(
                              width: 400,
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                                child: Text(
                                  "Let's Begin",
                                  style:
                                      TextStyle(color: Colors.white, fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            onPressed: () {
                              Get.to(MainPage());
                            },
                            color: Color(0xFF1D2A64),
                          ),
                      ),
                    ),
            Align(
              alignment: Alignment.center,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 280,
                    width: MediaQuery.of(context).size.width-(16*2),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/target.png"),fit:BoxFit.cover
                      )
                    ),
                  ),
                  SizedBox(height:12),
                  Text("Welcome Buddy", style: blueFontStyle1.copyWith(fontSize:28)),
                  SizedBox(height:8),
                  Text("Welcome to Mamen Project, let's\ncooperate with other users.", style: blackFontStyle3.copyWith(fontWeight:FontWeight.w200, fontSize: 16, color:Colors.grey, height:1.4 ), textAlign: TextAlign.center,)
                ],),
            )
          ],
        ),)
      
    );
  }
}