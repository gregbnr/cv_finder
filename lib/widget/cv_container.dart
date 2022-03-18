import 'package:cv_finder/models/cv.dart';
import 'package:cv_finder/services/hex_color.dart';
import 'package:cv_finder/theme.dart';
import 'package:flutter/material.dart';

Widget CvContainer(Cv cv) {
  return Container(
    height: 850,
    width: 600,
    decoration: BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(
        offset: Offset.fromDirection(4, -4),
        blurRadius: 4,
      )
    ]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 850,
          width: 80,
          color: HexColor.fromHex(cv.color),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Wrap(
            spacing: 10,
            direction: Axis.vertical,
            children: [
              // header
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                child: Text(cv.name, style: ubuntu24Bold),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                child: Text(cv.job, style: ubuntu15Medium),
              ),
              Wrap(
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 5,
                children: [
                  const Icon(Icons.house_outlined),
                  Text(cv.address, style: ubuntu12),
                ],
              ),
              Wrap(
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 5,
                children: [
                  const Icon(Icons.mail_outline),
                  Text(cv.email, style: ubuntu12),
                ],
              ),
              Wrap(
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 5,
                children: [
                  const Icon(Icons.phone_android_outlined),
                  Text(cv.phone, style: ubuntu12),
                ],
              ),
              // formation
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                child: Text("Formations", style: ubuntu15Medium),
              ),
              Container(
                color: HexColor.fromHex(cv.color),
                width: 400,
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Wrap(
                  spacing: 5,
                  direction: Axis.vertical,
                  children: [
                    for (var education in cv.educations)
                      Wrap(
                        spacing: 3,
                        runAlignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.vertical,
                        children: [
                          Text(education.name + ", " + education.school,
                              style: ubuntu12),
                          Text(education.description, style: ubuntu12Light)
                        ],
                      ),
                  ],
                ),
              ),
              // experience
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                child: Text("Expériences", style: ubuntu15Medium),
              ),
              Container(
                color: HexColor.fromHex(cv.color),
                width: 400,
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Wrap(
                  spacing: 5,
                  direction: Axis.vertical,
                  children: [
                    for (var experience in cv.experiences)
                      Wrap(
                        spacing: 3,
                        runAlignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.vertical,
                        children: [
                          Text(experience.company + " | " + experience.date,
                              style: ubuntu12),
                          Text(experience.description, style: ubuntu12Light)
                        ],
                      ),
                  ],
                ),
              ),
              // competence
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                child: Text("Compétences", style: ubuntu15Medium),
              ),
              Container(
                color: HexColor.fromHex(cv.color),
                width: 400,
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(cv.skills, style: ubuntu12),
              ),
              // information
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                child: Text("Informations", style: ubuntu15Medium),
              ),
              Container(
                color: HexColor.fromHex(cv.color),
                width: 400,
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(cv.infos, style: ubuntu12),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
