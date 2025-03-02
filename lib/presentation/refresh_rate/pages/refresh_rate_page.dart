import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RefreshRatePage extends StatefulWidget {
  const RefreshRatePage({super.key});

  @override
  State<RefreshRatePage> createState() => _RefreshRatePageState();
}

class _RefreshRatePageState extends State<RefreshRatePage> {
  final TextEditingController _refreshRateTEC = TextEditingController();

  @override
  void dispose() {
    _refreshRateTEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Refresh rate")),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                const SizedBox(height: 3),
                TextField(
                  controller: _refreshRateTEC,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 3),
                ElevatedButton(onPressed: () {}, child: Text("Apply")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
