import 'package:flutter/material.dart';

class AddRemoveContactPage extends StatelessWidget {
  const AddRemoveContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Add / Remove Contact")),
        body: SingleChildScrollView(child: Column(children: [])),
      ),
    );
  }
}
