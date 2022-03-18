import 'package:cv_finder/models/cv.dart';
import 'package:cv_finder/models/education.dart';
import 'package:cv_finder/models/experience.dart';
import 'package:cv_finder/services/air_table_http.dart';
import 'package:cv_finder/services/hex_color.dart';
import 'package:cv_finder/theme.dart';
import 'package:cv_finder/widget/cv_text_field.dart';
import 'package:cv_finder/widget/transparant_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  AirTableHttp airTableHttp = AirTableHttp();

  Color currentColor = const Color(0xff443a49);
  Color pickerColor = const Color(0xff443a49);

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  final _formKey = GlobalKey<FormState>();
  String name = "";
  String email = "";
  String phone = "";
  String address = "";
  String job = "";
  String skills = "";
  String infos = "";
  List<Experience> listExperiences = [];
  List<Education> listEducations = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        TransparantAppBar("Créer un cv"), // form
        Expanded(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Wrap(
                direction: Axis.vertical,
                spacing: 10,
                children: [
                  CvTextField(context,
                      label: "Nom",
                      icon: const Icon(Icons.person),
                      onChanged: (value) => setState(() => name = value)),
                  Wrap(
                    spacing: 20,
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => colorPickerDialog(),
                        child: const Text('Choisir une couleur'),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        color: currentColor,
                      ),
                    ],
                  ),
                  CvTextField(context,
                      label: "Email",
                      icon: const Icon(Icons.email),
                      onChanged: (value) => setState(() => email = value)),
                  CvTextField(context,
                      label: "Téléphone",
                      icon: const Icon(Icons.phone),
                      onChanged: (value) => setState(() => phone = value)),
                  CvTextField(context,
                      label: "Adresse",
                      icon: const Icon(Icons.house),
                      onChanged: (value) => setState(() => address = value)),
                  CvTextField(context,
                      label: "Travail",
                      icon: const Icon(Icons.work),
                      onChanged: (value) => setState(() => job = value)),
                  CvTextField(context,
                      label: "Compétences",
                      icon: const Icon(Icons.wallet_membership),
                      onChanged: (value) => setState(() => skills = value)),
                  CvTextField(context,
                      label: "Informations",
                      icon: const Icon(Icons.info),
                      onChanged: (value) => setState(() => infos = value)),
                  // Experiences
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Wrap(
                        runAlignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text("Ajouter une entreprise", style: ubuntu12Light),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () => setState(
                              () => listExperiences.add(
                                Experience(
                                    company: "", date: "", description: ""),
                              ),
                            ),
                          ),
                        ],
                      ),
                      for (int i = 0; i < listExperiences.length; i++)
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Container(
                            height: 250,
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Wrap(
                                direction: Axis.vertical,
                                spacing: 3,
                                children: [
                                  CvTextField(context,
                                      label: "Entreprise",
                                      icon: const Icon(Icons.apartment),
                                      onChanged: (value) => setState(() =>
                                          listExperiences[i].company = value)),
                                  CvTextField(context,
                                      label: "Date",
                                      icon: const Icon(Icons.calendar_today),
                                      onChanged: (value) => setState(() =>
                                          listExperiences[i].date = value)),
                                  CvTextField(context,
                                      label: "Information",
                                      icon: const Icon(Icons.description),
                                      onChanged: (value) => setState(() =>
                                          listExperiences[i].description =
                                              value)),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  // Educations
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Wrap(
                        runAlignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text("Ajouter une formation", style: ubuntu12Light),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () => setState(
                              () => listEducations.add(
                                Education(
                                    name: "", school: "", description: ""),
                              ),
                            ),
                          ),
                        ],
                      ),
                      for (int i = 0; i < listEducations.length; i++)
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Container(
                            height: 250,
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Wrap(
                                direction: Axis.vertical,
                                spacing: 3,
                                children: [
                                  CvTextField(context,
                                      label: "Nom de l'école",
                                      icon:
                                          const Icon(Icons.apartment_outlined),
                                      onChanged: (value) => setState(() =>
                                          listEducations[i].school = value)),
                                  CvTextField(context,
                                      label: "Nom formation",
                                      icon: const Icon(Icons.school),
                                      onChanged: (value) => setState(() =>
                                          listEducations[i].name = value)),
                                  CvTextField(context,
                                      label: "Information",
                                      icon: const Icon(Icons.description),
                                      onChanged: (value) => setState(() =>
                                          listEducations[i].description =
                                              value)),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ), // validation
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Votre cv a été créé')),
              );
              Cv cv = Cv(
                  name: name,
                  color: currentColor.toHex(),
                  email: email,
                  phone: phone,
                  address: address,
                  job: job,
                  experiences: listExperiences,
                  educations: listEducations,
                  skills: skills,
                  infos: infos);
              airTableHttp.pushCv(cv);
            }
          },
          child: const Text('Envoyer'),
        ),
      ],
    );
  }

  void colorPickerDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choisissez votre couleur'),
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: pickerColor,
            onColorChanged: changeColor,
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Valider'),
            onPressed: () {
              setState(() => currentColor = pickerColor);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
