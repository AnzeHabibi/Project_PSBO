part of 'model.dart';

class Participant {
  final int id;
  final String photoParticipant;
  final String nameParticipant;
  final String emailParticipant;
  final String roleParticipant;
  final String specialistParticipant;

  Participant(
      {this.id,
      this.nameParticipant,
      this.emailParticipant,
      this.photoParticipant,
      this.roleParticipant,
      this.specialistParticipant});
}

List<Participant> mockParticipant = [
  Participant(
      id: 1,
      photoParticipant:
          "https://images.unsplash.com/photo-1586822339087-80cc375ac083?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=80",
      nameParticipant: "Ojan",
      emailParticipant: "ojan@ajim.com",
      roleParticipant: "Software Engineer",
      specialistParticipant: "Mobile Developer"),
  Participant(
      id: 2,
      photoParticipant:
          "https://images.unsplash.com/photo-1524638431109-93d95c968f03?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80",
      nameParticipant: "Levina Siantono",
      emailParticipant: "levina@anivel.com",
      roleParticipant: "Project Manager",
      specialistParticipant: "Time Management"),
  Participant(
      id: 3,
      photoParticipant:
          "https://images.unsplash.com/photo-1613125558858-bc695ee71dbe?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=332&q=80",
      nameParticipant: "Linda Ayu",
      emailParticipant: "Linda@Linda.com",
      roleParticipant: "Project Manager",
      specialistParticipant: "Anak FEM"),
  Participant(
      id: 4,
      photoParticipant:
          "https://images.unsplash.com/photo-1611414839025-fca0981833fb?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80",
      nameParticipant: "Ali Naufal",
      emailParticipant: "Ali@Naufal.com",
      roleParticipant: "Kahim",
      specialistParticipant: "Gmeet"),
];
