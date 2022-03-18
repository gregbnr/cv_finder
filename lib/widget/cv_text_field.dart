import 'package:cv_finder/theme.dart';
import 'package:flutter/material.dart';

Widget CvTextField(BuildContext context,
    {required String label,
    required Icon icon,
    required Function(String) onChanged}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width - 150,
    child: TextFormField(
      decoration: InputDecoration(
        icon: icon,
        labelText: label,
        labelStyle: ubuntu12Light,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Le champ ne peut pas être vide';
        }
        return null;
      },
      onChanged: onChanged,
    ),
  );
}
