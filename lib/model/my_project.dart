part of 'model.dart';

class MyProject {
  final String id;
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

List<MyProject> mockMyProject = [];
