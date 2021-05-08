part of 'widget.dart';

class RegistrantCard extends StatelessWidget {
  final String name, email, role, specialist, photo;

  RegistrantCard(
      {this.name, this.email, this.role, this.specialist, this.photo});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width - (16 * 2),
                height: 420,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Container(
                        height: 400,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Color(0xffE6EAF2)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 85,
                      width: 85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Colors.white, width: 2),
                          image: DecorationImage(
                              image: NetworkImage(this.photo),
                              fit: BoxFit.cover)),
                    ),
                    Column(
                      children: [
                        SizedBox(height: 100),
                        Text(
                          this.name,
                          style: blueFontStyle1.copyWith(fontSize: 24),
                        ),
                        SizedBox(height: 8),
                        Text(
                          this.email,
                          style: blackFontStyle3.copyWith(
                              fontSize: 16, color: Colors.grey),
                        ),
                        SizedBox(height: 16),
                        Container(
                          height: 35,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18)),
                          child: RaisedButton(
                            onPressed: () {
                              Get.to(ProfilePage());
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                            color: Color(0xff236AFF),
                            child: Text(
                              "Detail Participant",
                              style: whiteFontStyle.copyWith(fontSize: 10),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Role",
                                  style: blueFontStyle1.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  this.role,
                                  style: blackFontStyle3.copyWith(
                                      fontSize: 12,
                                      color: mainColor,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            Container(
                              height: 24,
                              width: 1,
                              color: Color(0xffC9CBD3),
                            ),
                            Column(
                              children: [
                                Text(
                                  "Specialist",
                                  style: blueFontStyle1.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  this.specialist,
                                  style: blackFontStyle3.copyWith(
                                      fontSize: 12,
                                      color: mainColor,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 32),
                        Container(
                          height: 35,
                          width: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18)),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                            color: mainColor,
                            child: Text(
                              "Accept Participant",
                              style: whiteFontStyle2.copyWith(fontSize: 12),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          height: 35,
                          width: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18)),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                            color: Color(0xffD43F51),
                            child: Text(
                              "Refuse Participant",
                              style: whiteFontStyle2.copyWith(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
