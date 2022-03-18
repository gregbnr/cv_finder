import 'package:cv_finder/theme.dart';
import 'package:cv_finder/widget/transparant_app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        TransparantAppBar("Accueil"),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: Wrap(
            spacing: 50,
            direction: Axis.vertical,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 150,
                child: Text(
                    "Bienvenue sur l'application pour créer et voir les cv en ligne des utilisateurs",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: ubuntu20Medium),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 150,
                child: Text("Création : créer votre Cv au complet",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: ubuntu15Medium),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 150,
                child: Text(
                    "Rechercher : Trouver un Cv et localiser ou contacter son propriétaire",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: ubuntu15Medium),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
