import 'package:flutter/material.dart';
import 'package:flutter_safe_bd/presentation/refresh_rate/controllers/refresh_rate_page_controller.dart';
import 'package:get/get.dart';

class RefreshRatePage extends StatefulWidget {
  const RefreshRatePage({super.key});

  @override
  State<RefreshRatePage> createState() => _RefreshRatePageState();
}

class _RefreshRatePageState extends State<RefreshRatePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _refreshRateTEC = TextEditingController();

  @override
  void dispose() {
    _refreshRateTEC.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _initialPageSetup();
    super.initState();
  }

  Future<void> _initialPageSetup() async {
    _refreshRateTEC.text =
        "${await Get.find<RefreshRatePageController>().getRefreshRate()}";
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
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _refreshRateTEC,
                    validator: (value) {
                      if ((value?.isEmpty ?? true) ||
                          (int.parse(value ?? "0")) <= 0) {
                        return "must be greater than 0 second";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(height: 3),
                Text("Refresh interval in seconds"),
                const SizedBox(height: 3),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await Get.find<RefreshRatePageController>()
                          .addRefreshRate(rate: _refreshRateTEC.text);
                      Get.back();
                    }
                  },
                  child: Text("Apply"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
