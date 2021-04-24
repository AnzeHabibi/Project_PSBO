part of 'model.dart';

class PendingProject {
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final String start;
  final String date;
  final String nameCreator;
  final String photoCreator;

  PendingProject(
      {this.id,
      this.picturePath,
      this.name,
      this.description,
      this.start,
      this.nameCreator,
      this.photoCreator,
      this.date});
}

List<PendingProject> mockPendingProject = [
  PendingProject(
      id: 1,
      photoCreator:
          "https://images.unsplash.com/photo-1557555187-23d685287bc3?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80",
      name: "UX Project for Competition",
      description: "Desain untuk lomba di codig 2.0",
      start: "Deadline",
      date: "Nov 22, 2021"),
  PendingProject(
      id: 2,
      photoCreator:
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=634&q=80",
      name: "Start Up Challenge 2021",
      description: "Desain untuk lomba di codig 2.0",
      start: "Deadline",
      date: "Nov 22, 2021"),
  PendingProject(
      id: 3,
      photoCreator:
          "https://images.unsplash.com/photo-1591258739299-5b65d5cbb235?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
      name: "Figma Competition Internasional",
      description: "Desain untuk lomba di codig 2.0",
      start: "Deadline",
      date: "Nov 22, 2021"),
  PendingProject(
      id: 4,
      photoCreator:
          "https://images.unsplash.com/photo-1563306406-e66174fa3787?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=634&q=80",
      name: "Membuat program denganb Python",
      description: "Desain untuk lomba di codig 2.0",
      start: "Deadline",
      date: "Nov 22, 2021")
];
