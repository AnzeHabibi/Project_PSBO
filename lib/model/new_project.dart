part of 'model.dart';

class NewProject {
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final String start;
  final String date;
  final String nameCreator;
  final String photoCreator;
  

  NewProject(
      {this.id,
      this.picturePath,
      this.name,
      this.description,
      this.start,
      this.nameCreator,
      this.photoCreator,
      this.date});
}

List<NewProject> mockProject = [
  NewProject(
      id: 1,
      picturePath:
          "https://images.unsplash.com/photo-1512758017271-d7b84c2113f1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
      name: "Desain untuk lomba di codig 2.0",
      description: "Desain untuk lomba di codig 2.0",
      start: "Start",
      date: "Nov 22, 2021"),
  NewProject(
      id: 2,
      picturePath:
          "https://images.unsplash.com/photo-1550867428-138aec9fce23?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80",
      name: "Membuat aplikasi menggunakan flutter",
      description: "Desain untuk lomba di codig 2.0",
      start: "Start",
      date: "Nov 22, 2021"),

      NewProject(
      id: 3,
      picturePath:
          "https://images.unsplash.com/photo-1545296664-39db56ad95bd?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=690&q=80",
      name: "Membuat mockup menggunakan software Figma",
      description: "Desain untuk lomba di codig 2.0",
      start: "Start",
      date: "Nov 22, 2021"),
  NewProject(
      id: 4,
      picturePath:
          "https://images.unsplash.com/photo-1520509414578-d9cbf09933a1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=349&q=80",
      name: "Memulai membuat program dengan bahasa Python",
      description: "Desain untuk lomba di codig 2.0",
      start: "Start",
      date: "Nov 22, 2021")
];
