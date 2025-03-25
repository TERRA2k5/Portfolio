import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/UI/HomePage.dart';
import 'package:portfolio/UI/Projects.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({super.key});

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {

  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index){
          setState(() {
            currentIndex = index;
          });
        },
        children: const [
          Homepage(),
          Projects()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Colors.black87,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        onTap: (index) {
          pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.ease);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person ),  label: "About"),
          BottomNavigationBarItem(icon: Icon(Icons.phone_android), label: "Projects")
        ],
      ),
    );
  }
}
