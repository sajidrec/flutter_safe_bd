import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Settings")),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text("Customize message"),
                    leading: Icon(Icons.message_rounded),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text("Refresh rate"),
                    leading: Icon(Icons.refresh),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
