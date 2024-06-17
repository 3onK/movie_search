import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:movieSearch/controller/mainViewController.dart';
import 'package:movieSearch/data/provider/api.dart';
import 'package:movieSearch/data/repository/repository.dart';
import 'package:movieSearch/style/color.dart';
import 'package:movieSearch/style/shadow.dart';
import 'package:movieSearch/view/customWebView.dart';
import 'package:movieSearch/view/movieListView.dart';

class MainView extends StatelessWidget {
  final mainViewController =
      Get.put(MainViewController(repository: Repository(api: Api())));
  DateTime currentBackPressTime = DateTime.now();

  MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (!didPop) {
          exitApp();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body: SafeArea(
          bottom: false,
          child: Obx(
            () => IndexedStack(
              index: mainViewController.selectedTab.value,
              children: [
                MovieListView(),
                CustomWebView(
                    title: 'Notion',
                    url:
                        'https://3onk.notion.site/c579e2a7fb3446df82174b15cfa00b79?pvs=74')
              ],
            ),
          ),
        ),
        bottomNavigationBar: bottomNavigationBar(),
      ),
    );
  }

  Widget bottomNavigationBar() {
    return Obx(
      () => Container(
        decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            boxShadow: boxShadow),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            currentIndex: mainViewController.selectedTab.value,
            onTap: mainViewController.selectTab,
            selectedItemColor: primaryNavyBlue,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
            items: const [
              BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Icon(
                    Icons.home,
                    size: 24.0,
                  ),
                  label: '홈'),
              BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Icon(
                    Icons.person,
                    size: 24.0,
                  ),
                  label: '노션'),
            ],
          ),
        ),
      ),
    );
  }

  // 1초 내에 뒤로가기를 2회 입력하면 앱 종료
  exitApp() {
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > const Duration(seconds: 1)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: '한 번 더 누르시면 종료합니다.', textColor: primaryWhite);
    } else {
      SystemNavigator.pop();
    }
  }
}
