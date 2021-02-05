import 'package:flutter/material.dart';
import 'package:go_away/src/GlobalPage/GlobalPage.dart';
import 'package:go_away/src/Utils/ColorUtils/ColorUtil.dart';
import 'package:go_away/src/Utils/StyleUtils/StyleUtil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget currentScreen = GlobalPage();
  final PageStorageBucket bucket = PageStorageBucket();

  int currentTab = 0;

  void removeUserCountry() async {
    var preference = await SharedPreferences.getInstance();
    preference.remove('userCountry');
  }

  // ignore: missing_return
  String getPageTitle(int currentTab) {
    var pageTitle = 'GLOBAL';

    switch (currentTab) {
      case 0:
        pageTitle = 'GLOBAL';
        break;
      case 1:
        pageTitle = 'FAQ';
        break;
      case 2:
        pageTitle = 'NEWS';
        break;
      case 3:
        pageTitle = 'MAP';
        break;
    }
    setState(() {
      pageTitle = pageTitle;
    });
    return pageTitle;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor:
            currentTab == 3 ? Colors.white : getPageBackgroundColor(),
        title: Row(
          children: [
            Container(
              height: 30,
              width: 100,
              child: Hero(
                tag: 'ic_goaway',
                child: Image.asset(
                  'assets/images/ic_go_away.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                removeUserCountry();
              },
              child: Text(
                getPageTitle(currentTab),
                style: getPageTitleTestStyle(18.0),
              ),
            ),
          ],
        ),
      ),
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),

    );
  }
}
