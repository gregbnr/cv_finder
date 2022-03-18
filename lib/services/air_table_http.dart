import 'dart:convert';

import 'package:cv_finder/models/air_table_data_cv.dart';
import 'package:cv_finder/models/cv.dart';
import 'package:cv_finder/models/education.dart';
import 'package:cv_finder/models/experience.dart';
import 'package:cv_finder/utils/config.dart';
import 'package:http/http.dart' as http;

class AirTableHttp {
  final Uri urlList = Uri.https(
    "api.airtable.com",
    "/v0/${Config.projectBase}/list",
    {"maxRecords": "100", "view": "Grid view"},
  );

  final Uri urlCvPush = Uri.https(
    "api.airtable.com",
    "/v0/${Config.projectBase}/list",
  );

  final Uri urlExperiencePush = Uri.https(
    "api.airtable.com",
    "/v0/${Config.projectBase}/experience",
  );

  final Uri urlEducationPush = Uri.https(
    "api.airtable.com",
    "/v0/${Config.projectBase}/education",
  );

  Future<List<AirtableDataCv>> getList() async {
    final res = await http.get(
      urlList,
      headers: {"Authorization": "Bearer ${Config.apiKey}"},
    );

    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      List<AirtableDataCv> values = [];
      data.forEach(
        (value) {
          List<Education> tempEducations = [];
          dynamic educations = value['fields']['education'] ?? [];
          for (int cpt = 0; cpt < educations.length; cpt++) {
            tempEducations.add(Education(
                school: value['fields']['description (from education)'][cpt],
                name: value['fields']['name (from education)'][cpt],
                description: value['fields']['description (from education)']
                    [cpt]));
          }
          List<Experience> tempExperiences = [];
          dynamic experiences = value['fields']['experience'] ?? [];
          for (int cpt = 0; cpt < experiences.length; cpt++) {
            tempExperiences.add(Experience(
                description: value['fields']['description (from experience)']
                    [cpt],
                company: value['fields']['company (from experience)'][cpt],
                date: value['fields']['date (from experience)'][cpt]));
          }
          Cv cv = Cv(
            name: value['fields']['name'],
            color: value['fields']['color'],
            address: value['fields']['address'],
            educations: tempEducations,
            email: value['fields']['email'],
            experiences: tempExperiences,
            infos: value['fields']['infos'],
            job: value['fields']['job'],
            phone: value['fields']['phone'],
            skills: value['fields']['skills'],
          );
          return values.add(
            AirtableDataCv(
                id: value['id'], createdTime: value['createdTime'], cv: cv),
          );
        },
      );
      return values;
    } else {
      throw "ERROR !!!!!";
    }
  }

  Future<bool> pushCv(Cv cv) async {
    bool requestExperiences = false;
    bool requestEducations = false;
    List<String> experiencesId = [];
    List<String> educationsId = [];

    // Experiences
    if (cv.experiences.isNotEmpty) {
      List<dynamic> experiences = [];

      for (var experience in cv.experiences) {
        experiences.add({"fields": experience.toJson()});
      }

      Map<String, dynamic> jsonExperience = {"records": experiences};

      final res = await http.post(
        urlExperiencePush,
        body: json.encode(jsonExperience),
        headers: {
          "Authorization": "Bearer ${Config.apiKey}",
          "Content-type": "application/json",
          'Accept': 'application/json',
        },
      );

      if (res.statusCode == 200) {
        var convertDataToJson = jsonDecode(res.body);
        var data = convertDataToJson['records'];
        data.forEach((value) {
          experiencesId.add(value["id"]);
        });
        requestExperiences = true;
      } else {
        print(res.body);
        requestExperiences = false;
      }
    } else {
      requestExperiences = true;
    }

    // Educations
    if (cv.educations.isNotEmpty) {
      List<dynamic> educations = [];
      for (var education in cv.educations) {
        educations.add({"fields": education.toJson()});
      }

      Map<String, dynamic> jsonEducation = {"records": educations};

      final res = await http.post(
        urlEducationPush,
        body: json.encode(jsonEducation),
        headers: {
          "Authorization": "Bearer ${Config.apiKey}",
          "Content-type": "application/json",
          'Accept': 'application/json',
        },
      );

      if (res.statusCode == 200) {
        var convertDataToJson = jsonDecode(res.body);
        var data = convertDataToJson['records'];
        data.forEach((value) {
          educationsId.add(value["id"]);
        });
        requestEducations = true;
      } else {
        requestEducations = false;
      }
    } else {
      requestEducations = true;
    }

    // Cv push
    if (requestEducations && requestExperiences) {
      Map<String, dynamic> jsonCv = {
        "records": [
          {
            "fields": {
              "name": cv.name,
              "color": cv.color,
              "email": cv.email,
              "phone": cv.phone,
              "address": cv.address,
              "job": cv.job,
              "skills": cv.skills,
              "infos": cv.infos,
              "experience": experiencesId,
              "education": educationsId
            }
          }
        ]
      };

      final res = await http.post(
        urlCvPush,
        body: json.encode(jsonCv),
        headers: {
          "Authorization": "Bearer ${Config.apiKey}",
          "Content-type": "application/json",
          'Accept': 'application/json',
        },
      );

      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
