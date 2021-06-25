part of 'model.dart';

class PendingProject {
  final String id;
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

List<PendingProject> mockPendingProject = [];
