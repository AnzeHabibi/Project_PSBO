part of 'widget.dart';

class ParticipantList extends StatelessWidget {
  final Participant participant;

  ParticipantList(this.participant);
  @override
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
                        image: NetworkImage(participant.photoParticipant), fit: BoxFit.cover)),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    participant.nameParticipant,
                    style: blueFontStyle2.copyWith(fontSize:16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 6),
                  Text(
                    participant.roleParticipant,
                    style: blueFontStyle3.copyWith(fontSize:12, color: greyColor),
                  )
                ],
              ),
            ],
          ),
          Container(
            height: 35,
            width: 120,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
            child: RaisedButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18))),
              color: Color(0xff236AFF),
              child: Text(
                "Edit Recruitment",
                style: whiteFontStyle.copyWith(fontSize: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
