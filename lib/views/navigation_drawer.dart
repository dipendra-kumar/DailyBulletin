import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter/views/home.dart';
import 'category_news.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

int selectedIndex = 0;

bool toggled = false;

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      child: SafeArea(
        child: Material(
          color: Colors.blueGrey[100],
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(top: 10, left: 10),
            children: [
              const SizedBox(
                height: 20,
              ),
              buildMenuItem(
                text: "Top Headlines",
                icon: Icons.newspaper,
                onClicked: () {
                  selectedItem(context, 0);
                  setState(() {
                    selectedIndex = 0;
                  });
                },
                isSelected: selectedIndex == 0,
              ),
              const SizedBox(
                height: 20,
              ),
              Divider(color: Colors.deepPurple,height: 2),
              const SizedBox(height: 20,),
              buildMenuItem(
                isSelected: selectedIndex == 1,
                text: "Business",
                icon: Icons.business,
                onClicked: () {
                  selectedItem(context, 1);
                  setState(() {
                    selectedIndex = 1;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              buildMenuItem(
                isSelected: selectedIndex == 2,
                text: "Entertainment",
                icon: Icons.music_note_outlined,
                onClicked: () {
                  selectedItem(context, 2);
                  setState(() {
                    selectedIndex = 2;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              buildMenuItem(
                isSelected: selectedIndex == 3,
                text: "Science",
                icon: Icons.science_outlined,
                onClicked: () {
                  selectedItem(context, 3);
                  setState(() {
                    selectedIndex = 3;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              buildMenuItem(
                isSelected: selectedIndex == 4,
                text: "Technology",
                icon: Icons.biotech_outlined,
                onClicked: () {
                  selectedItem(context, 4);
                  setState(() {
                    selectedIndex = 4;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              buildMenuItem(
                isSelected: selectedIndex == 5,
                text: "Health",
                icon: Icons.health_and_safety_outlined,
                onClicked: () {
                  selectedItem(context, 5);
                  setState(() {
                    selectedIndex = 5;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              buildMenuItem(
                isSelected: selectedIndex == 6,
                text: "Sports",
                icon: Icons.sports_baseball,
                onClicked: () {
                  selectedItem(context, 6);
                  setState(() {
                    selectedIndex = 6;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(
      {required String text,
      required IconData icon,
      VoidCallback? onClicked,
      required bool isSelected}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 3.0,
                blurStyle: BlurStyle.outer
            )
          ],
        borderRadius: BorderRadius.circular(12),
        color: isSelected ? Colors.deepPurple : Colors.transparent,
      ),

      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text(
          text,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.w300,
            fontSize: isSelected ? 18 : 16,
            color: isSelected ? Colors.white : null,
          ),
        ),
        leading: Icon(
          icon,
          color: isSelected ? Colors.white : null,
          size: isSelected ? 30 : 22,
        ),
        onTap: onClicked,
      ),
    );
  }

  void selectedItem(BuildContext context, index) {
    switch (index) {
      case 0:
        (selectedIndex == index)
            ? (Navigator.pop(context))
            : Navigator.pushReplacement(context,
                CupertinoPageRoute(builder: (context) {
                return const Home();
              }));
        break;
      case 1:
        (selectedIndex == index)
            ? (Navigator.pop(context))
            : Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                    builder: (context) =>
                        CategoryNews(category: "Business".toLowerCase())));
        break;
      case 2:
        (selectedIndex == index)
            ? (Navigator.pop(context))
            : Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                    builder: (context) =>
                        CategoryNews(category: "Entertainment".toLowerCase())));
        break;
      case 3:
        (selectedIndex == index)
            ? (Navigator.pop(context))
            : Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                    builder: (context) =>
                        CategoryNews(category: "Science".toLowerCase())));
        break;
      case 4:
        (selectedIndex == index)
            ? (Navigator.pop(context))
            : Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                    builder: (context) =>
                        CategoryNews(category: "Technology".toLowerCase())));
        break;
      case 5:
        (selectedIndex == index)
            ? (Navigator.pop(context))
            : Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                    builder: (context) =>
                        CategoryNews(category: "Health".toLowerCase())));
        break;
        case 6:
        (selectedIndex == index)
            ? (Navigator.pop(context))
            : Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                    builder: (context) =>
                        CategoryNews(category: "Sports".toLowerCase())));
        break;
    }
  }
}
