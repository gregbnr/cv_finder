class Education {
  String school;
  String name;
  String description;

  Education(
      {required this.school, required this.name, required this.description});

  Map<String, dynamic> toJson() {
    return {
      'school': school,
      'name': name,
      'description': description,
    };
  }
}
