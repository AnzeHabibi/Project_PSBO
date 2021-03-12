part of 'pages.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Container(
                height: 430,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1512758017271-d7b84c2113f1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80"),
                        fit: BoxFit.cover)),
              ),
                  
              ListView(
                children: [
                  SizedBox(
                    height: 328,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text("Desain untuk lomba di codig 2.0", style: whiteFontStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w600,) ),
                  ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                children: [
                Text("Deadline ", style: blueFontStyle3.copyWith(color:Color(0xffD43F51), fontSize: 16, fontWeight: FontWeight.w600),),
                Text("22 November 2021 ", style: blueFontStyle3.copyWith(color: Colors.white, fontSize: 16,)),
            ],),
              ),
                  SizedBox(height:16),
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
                                            color: Colors.white, width: 2),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://images.unsplash.com/photo-1524638431109-93d95c968f03?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80"),
                                            fit: BoxFit.cover)),
                                  ),
                                  SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Levina Siantono",
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
                              Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in.",
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
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 110,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://images.unsplash.com/photo-1600697395780-1cf7ab1fef5b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=80"),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                      Container(
                                        height: 100,
                                        width: 110,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://images.unsplash.com/photo-1612772992614-bc2c2a2c3362?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80"),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                      Container(
                                        height: 100,
                                        width: 110,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://images.unsplash.com/photo-1533750088811-7a8b16218df7?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=750&q=80"),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(height: 40),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      width: MediaQuery.of(context).size.width - (2 * 16),
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
                            borderRadius: BorderRadius.circular(18)),
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
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
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
