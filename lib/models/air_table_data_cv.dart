import 'package:cv_finder/models/cv.dart';

class AirtableDataCv {
  String id;
  String createdTime;
  Cv cv;

  AirtableDataCv(
      {required this.id, required this.createdTime, required this.cv});
}
