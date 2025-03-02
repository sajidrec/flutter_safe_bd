import 'package:flutter/material.dart';
import 'package:flutter_safe_bd/utils/custom_message.dart';

class CustomizeMessagePage extends StatefulWidget {
  const CustomizeMessagePage({super.key});

  @override
  State<CustomizeMessagePage> createState() => _CustomizeMessagePageState();
}

class _CustomizeMessagePageState extends State<CustomizeMessagePage> {
  final TextEditingController _customMsgTEC = TextEditingController();

  @override
  void dispose() {
    _customMsgTEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Custom message")),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                const SizedBox(height: 3),
                TextField(
                  controller: _customMsgTEC,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText:
                        "Add you're custom message (This message will be added with default message)",
                  ),
                ),
                const SizedBox(height: 5),
                ElevatedButton(onPressed: () {}, child: Text("Apply")),
                const SizedBox(height: 5),
                Text(CustomMessage.defaultMessage),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
