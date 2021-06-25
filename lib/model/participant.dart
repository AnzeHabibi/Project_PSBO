part of 'model.dart';

class Participant {
  final String id;
  final String idUser;
  final String photoParticipant;
  final String nameParticipant;
  final String emailParticipant;
  final bool accepted;

  Participant({
    this.accepted,
    this.id,
    this.idUser,
    this.nameParticipant,
    this.emailParticipant,
    this.photoParticipant,
  });
}

List<Participant> mockParticipant = [];
