import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:cv_finder/screens/create_page.dart';
import 'package:cv_finder/screens/home_page.dart';
import 'package:cv_finder/screens/search_page.dart';
import 'package:cv_finder/theme.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainState();
}

class _MainState extends State<MainPage> {
  List<CollapsibleItem>? _items;
  int _selectedIndex = 0;
  final AssetImage _avatarImg = const AssetImage('assets/images/profil.png');

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Accueil',
        icon: Icons.house,
        onPressed: () => setState(() => _selectedIndex = 0),
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Créer un cv',
        icon: Icons.create,
        onPressed: () => setState(() => _selectedIndex = 1),
      ),
      CollapsibleItem(
        text: 'Chercher un cv',
        icon: Icons.search,
        onPressed: () => setState(() => _selectedIndex = 2),
      ),
    ];
  }

  _screen(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const CreatePage();
      case 2:
        return const SearchPage();
      default:
        return const Text("No Page Found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CollapsibleSidebar(
          isCollapsed: true,
          items: _items ?? [],
          avatarImg: _avatarImg,
          title: "CV Finder",
          body: _screen(_selectedIndex),
          backgroundColor: Colors.black,
          selectedTextColor: Colors.blueAccent,
          selectedIconColor: Colors.blueAccent,
          textStyle: ubuntu15Italic,
          titleStyle: ubuntu20Medium,
          sidebarBoxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 50,
              spreadRadius: 0.01,
              offset: Offset(3, 3),
            ),
          ],
        ),
      ),
    );
  }
}
