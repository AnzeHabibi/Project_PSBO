part of 'widget.dart';

class ParticipantList extends StatelessWidget {
  final Participant participant;
  final Function acceptRequest;

  ParticipantList(this.participant, this.acceptRequest);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 3,
                          blurRadius: 15,
                          color: Colors.black12)
                    ],
                    border: Border.all(color: Colors.white, width: 2),
                    image: DecorationImage(
                        image: NetworkImage(participant.photoParticipant),
                        fit: BoxFit.cover)),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    participant.nameParticipant,
                    style: blueFontStyle2.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 6),
                ],
              ),
            ],
          ),
          participant.accepted
              ? Container(
                  height: 35,
                  width: 120,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(18)),
                  child: RaisedButton(
                    onPressed: null,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18))),
                    color: Color(0xff236AFF),
                    child: Text(
                      "Accepted",
                      style: whiteFontStyle.copyWith(fontSize: 10),
                    ),
                  ),
                )
              : Container(
                  height: 35,
                  width: 120,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(18)),
                  child: RaisedButton(
                    onPressed: () {
                      acceptRequest();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18))),
                    color: Color(0xff236AFF),
                    child: Text(
                      "Accept Participant",
                      style: whiteFontStyle.copyWith(fontSize: 10),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  final String name, email, role, specialist, photo;

  CustomDialog({this.name, this.email, this.role, this.specialist, this.photo});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
          padding: EdgeInsets.only(top: 100, bottom: 16, left: 16, right: 16),
          margin: EdgeInsets.only(top: 16),
          child: RegistrantCard(
            name: this.name,
            email: this.email,
            photo: this.photo,
          ))
    ]);
  }
}
