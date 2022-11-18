import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 45),
        child: Column(
          children: const [
            ListTile(
              leading: Icon(
                Icons.people,
                color: Colors.indigo,
              ),
              title: Text("About Us"),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(
                Icons.quick_contacts_mail_outlined,
                color: Colors.indigo,
              ),
              title: Text("Contact Us"),
            ),
            SizedBox(height: 10),  ListTile(
              leading: Icon(
                Icons.telegram_rounded,
                color: Colors.indigo,
              ),
              title: Text("share App"),
            ),
            SizedBox(height: 10),  ListTile(
              leading: Icon(
                Icons.privacy_tip,
                color: Colors.indigo,
              ),
              title: Text("Privacy policy"),
            ),
            SizedBox(height: 10),SizedBox(height: 10),  ListTile(
              leading: Icon(
                Icons.business_center,
                color: Colors.indigo,
              ),
              title: Text("Terms and conditions"),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
