part of 'model.dart';

class MyProject {
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final String start;
  final String date;
  final String nameCreator;
  final String photoCreator;

  MyProject(
      {this.id,
      this.picturePath,
      this.name,
      this.description,
      this.start,
      this.nameCreator,
      this.photoCreator,
      this.date});
}

List<MyProject> mockMyProject = [
  MyProject(
      id: 1,
      photoCreator:
          "https://images.unsplash.com/photo-1553267751-1c148a7280a1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
      name: "UX Project for Competition",
      description: "Desain untuk lomba di codig 2.0",
      start: "Deadline",
      date: "Nov 22, 2021"),
  MyProject(
      id: 2,
      photoCreator:
          "https://images.unsplash.com/photo-1564564321837-a57b7070ac4f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1055&q=80",
      name: "Start Up Challenge 2021",
      description: "Desain untuk lomba di codig 2.0",
      start: "Deadline",
      date: "Nov 22, 2021"),
  MyProject(
      id: 3,
      photoCreator:
          "https://images.unsplash.com/photo-1545296664-39db56ad95bd?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=690&q=80",
      name: "Figma Competition Internasional",
      description: "Desain untuk lomba di codig 2.0",
      start: "Deadline",
      date: "Nov 22, 2021"),
  MyProject(
      id: 4,
      photoCreator:
          "https://images.unsplash.com/photo-1563306406-e66174fa3787?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=634&q=80",
      name: "Membuat program denganb Python",
      description: "Desain untuk lomba di codig 2.0",
      start: "Deadline",
      date: "Nov 22, 2021")
];
