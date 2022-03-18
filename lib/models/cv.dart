import 'package:cv_finder/models/education.dart';
import 'package:cv_finder/models/experience.dart';

class Cv {
  String name;
  String color;
  String email;
  String phone;
  String address;
  String job;
  List<Experience> experiences = [];
  List<Education> educations = [];
  String skills;
  String infos;

  Cv(
      {required this.name,
      required this.color,
      required this.email,
      required this.phone,
      required this.address,
      required this.job,
      required this.experiences,
      required this.educations,
      required this.skills,
      required this.infos});

  Map<String, dynamic> toJson() {
    List listExperiences = [];
    List listEducations = [];
    for (var experience in experiences) {
      listExperiences.add(experience.toJson());
    }
    for (var education in educations) {
      listEducations.add(education.toJson());
    }
    return {
      'name': name,
      'color': color,
      'email': email,
      'phone': phone,
      'address': address,
      'job': job,
      'skills': skills,
      'infos': infos,
      'experience': listExperiences,
      'education': listEducations,
    };
  }
}
