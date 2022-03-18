import 'package:carousel_slider/carousel_slider.dart';
import 'package:cv_finder/models/air_table_data_cv.dart';
import 'package:cv_finder/screens/map_screen.dart';
import 'package:cv_finder/services/air_table_http.dart';
import 'package:cv_finder/widget/cv_container.dart';
import 'package:cv_finder/widget/transparant_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  AirTableHttp airTableHttp = AirTableHttp();
  bool didLoad = false;

  List<Widget> items = [];

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
        TransparantAppBar("Chercher un cv"),
        SizedBox(
          height: MediaQuery.of(context).size.height - 80,
          child: FutureBuilder(
            future: airTableHttp.getList(),
            builder: (BuildContext context,
                AsyncSnapshot<List<AirtableDataCv>> snapshot) {
              if (snapshot.hasData) {
                List<AirtableDataCv>? values = snapshot.data;
                SetListCarousel(values!);
                return CarouselSlider(
                  options: CarouselOptions(
                      aspectRatio: 0.8,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true),
                  items: items,
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
    );
  }

  void SetListCarousel(List<AirtableDataCv> values) {
    for (var element in values) {
      items.add(
        Column(
          children: [
            Expanded(
              child: FittedBox(
                child: CvContainer(element.cv),
              ),
            ),
            ElevatedButton(
                child: const Text('Contacter'),
                onPressed: () => launch("tel://" + element.cv.phone)),
            ElevatedButton(
              child: const Text('Localiser'),
              onPressed: () {
                setState(
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MapPage()),
                  ),
                );
              },
            ),
          ],
        ),
      );
    }
  }
}
