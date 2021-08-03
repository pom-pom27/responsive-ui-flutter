import 'package:flutter/material.dart';
import 'package:outlook/components/side_menu.dart';
import 'package:outlook/screens/email/email_screen.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'components/list_of_emails.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout(
        mobile: PhoneView(),
        desktop: DesktopView(),
        tablet: TabletView(),
      ),
    );
  }
}

class PhoneView extends StatelessWidget {
  const PhoneView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListOfEmails();
  }
}

class TabletView extends StatelessWidget {
  const TabletView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: ListOfEmails(),
        ),
        Expanded(
          flex: 8,
          child: EmailScreen(),
        ),
      ],
    );
  }
}

class DesktopView extends StatelessWidget {
  const DesktopView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: SideMenu(),
        ),
        Expanded(
          flex: 3,
          child: ListOfEmails(),
        ),
        Expanded(
          flex: 8,
          child: EmailScreen(),
        ),
      ],
    );
  }
}
