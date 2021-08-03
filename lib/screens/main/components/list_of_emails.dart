import 'package:flutter/material.dart';
import 'package:outlook/components/side_menu.dart';
import 'package:outlook/models/Email.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../constants.dart';
import 'email_card.dart';

class ListOfEmails extends StatelessWidget {
  const ListOfEmails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ListOfEmailsMobileView();
    return ScreenTypeLayout(
      desktop: ListOfEmailsDesktopView(),
      mobile: ListOfEmailsMobileView(),
    );
  }
}

class ListOfEmailsDesktopView extends StatelessWidget {
  const ListOfEmailsDesktopView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      color: kBgDarkColor,
      child: Column(
        children: [
          TextField(
            onChanged: (value) {},
            decoration: InputDecoration(
              hintText: "Search",
              fillColor: kBgLightColor,
              filled: true,
              suffixIcon: WebsafeSvg.asset(
                "assets/Icons/Search.svg",
                width: 24,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: kDefaultPadding),
          Row(
            children: [
              WebsafeSvg.asset(
                "assets/Icons/Angle down.svg",
                width: 16,
                color: Colors.black,
              ),
              SizedBox(width: 5),
              Text(
                "Sort by date",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Spacer(),
              MaterialButton(
                minWidth: 20,
                onPressed: () {},
                child: WebsafeSvg.asset(
                  "assets/Icons/Sort.svg",
                  width: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: kDefaultPadding),
          Expanded(
            child: ListView.builder(
              itemCount: emails.length,
              itemBuilder: (context, index) => EmailCard(
                isActive: index == 0,
                email: emails[index],
                press: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListOfEmailsMobileView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    void _openDrawer() {
      _scaffoldKey.currentState!.openDrawer();
    }

    void _closeDrawer() {
      Navigator.of(context).pop();
    }

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Center(child: SideMenu()),
      ),
      body: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        color: kBgDarkColor,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  child: IconButton(
                    onPressed: () {
                      _openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                      size: 28,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: "Search",
                      fillColor: kBgLightColor,
                      filled: true,
                      suffixIcon: WebsafeSvg.asset(
                        "assets/Icons/Search.svg",
                        width: 24,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: kDefaultPadding),
            Row(
              children: [
                WebsafeSvg.asset(
                  "assets/Icons/Angle down.svg",
                  width: 16,
                  color: Colors.black,
                ),
                SizedBox(width: 5),
                Text(
                  "Sort by date",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Spacer(),
                MaterialButton(
                  minWidth: 20,
                  onPressed: () {},
                  child: WebsafeSvg.asset(
                    "assets/Icons/Sort.svg",
                    width: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: kDefaultPadding),
            Expanded(
              child: ListView.builder(
                itemCount: emails.length,
                itemBuilder: (context, index) => EmailCard(
                  isActive: index == 0,
                  email: emails[index],
                  press: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
