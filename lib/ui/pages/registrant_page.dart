part of 'pages.dart';

class RegistrantPage extends StatefulWidget {
  final String id;
  final int type;

  const RegistrantPage({Key key, this.type, this.id}) : super(key: key);

  @override
  _RegistrantPageState createState() => _RegistrantPageState();
}

class _RegistrantPageState extends RegistrantController {
  List<Participant> participant = [];

  @override
  void initState() {
    if (widget.type == 1) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        getParticipant(widget.id).then((data) {
          setState(() {
            participant = [];
            data
                .map((e) => {
                      print(e),
                      participant.add(
                        Participant(
                            accepted: e['accepted'],
                            id: e['_id'],
                            idUser: e['idUser']['_id'],
                            photoParticipant: e['idUser']['photo'] != ''
                                ? e['idUser']['photo']
                                : "https://art.placefull.com/Content/Properties/shared/images/no-profile-image.png",
                            nameParticipant: e['idUser']['name'],
                            emailParticipant: e['idUser']['email']),
                      )
                    })
                .toList();
            print(data);
            isLoadingFalse();
          });
        });
      });
    } else if (widget.type == 2) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        getMember(widget.id).then((data) {
          setState(() {
            participant = [];
            data
                .map((e) => {
                      print(e),
                      participant.add(
                        Participant(
                            accepted: e['accepted'],
                            id: e['_id'],
                            idUser: e['idUser']['_id'],
                            photoParticipant: e['idUser']['photo'] != ''
                                ? e['idUser']['photo']
                                : "https://art.placefull.com/Content/Properties/shared/images/no-profile-image.png",
                            nameParticipant: e['idUser']['name'],
                            emailParticipant: e['idUser']['email']),
                      )
                    })
                .toList();
            print(data);
            isLoadingFalse();
          });
        });
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading()
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            body: SafeArea(
              child: ListView(
                children: [
                  Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(DetailPage());
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 24),
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
                                            image: AssetImage(
                                                "assets/btn_back.png"),
                                            fit: BoxFit.cover)),
                                  ),
                                  SizedBox(width: 8),
                                  Text("Back", style: blueFontStyle2),
                                ],
                              ),
                            ),
                          ),
                          Column(
                              children: participant.length != 0
                                  ? participant
                                      .map((e) => Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 24),
                                            child: GestureDetector(
                                              onTap: () {
                                                getProfile(e.idUser);
                                              },
                                              child: ParticipantList(e, () {
                                                acceptParticipant(e.id);
                                                initState();
                                              }),
                                            ),
                                          ))
                                      .toList()
                                  : [Center(child: Text("Empty"))])
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
