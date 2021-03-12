part of 'pages.dart';

class RegistrantPage extends StatefulWidget {
  @override
  _RegistrantPageState createState() => _RegistrantPageState();
}

class _RegistrantPageState extends State<RegistrantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(DetailPage());
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
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
                        SizedBox(width:8),
                        Text("Back", style:blueFontStyle2),
                      ],
                    ),
                  ),
                ),
                  Column(
                    children : mockParticipant.map((e) => Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                      child: ParticipantList(e),
                    )).toList()
                  )
              ],
            )
          ],),
      ),
      
    );
  }
}