class Experience {
  String company;
  String date;
  String description;

  Experience({
    required this.company,
    required this.date,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'company': company,
      'date': date,
      'description': description,
    };
  }
}
