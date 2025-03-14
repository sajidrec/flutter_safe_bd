import 'package:flutter/material.dart';
import 'package:flutter_safe_bd/presentation/customize_message/controllers/customize_message_page_controller.dart';
import 'package:flutter_safe_bd/utils/custom_message.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

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
  void initState() {
    initialPageSetup();
    super.initState();
  }

  Future<void> initialPageSetup() async {
    await Get.find<CustomizeMessagePageController>()
        .fetchUserCustomizedMessage();
    _customMsgTEC.text =
        Get.find<CustomizeMessagePageController>().getCustomMessage;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Custom message (Whatsapp)")),
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
                GetBuilder<CustomizeMessagePageController>(
                  builder: (controller) {
                    return ElevatedButton(
                      onPressed: () async {
                        await controller.setCustomMessage(
                          msg: _customMsgTEC.text,
                        );
                      },
                      child: Text("Apply"),
                    );
                  },
                ),
                const SizedBox(height: 5),
                Text(
                  "This is just example what you're message will look like. Position data is not accurate here.",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                GetBuilder<CustomizeMessagePageController>(
                  builder: (controller) {
                    return Text(
                      "${controller.getCustomMessage}\n${CustomMessage.defaultWhatsAppMessage(position: Position(longitude: 0, latitude: 0, timestamp: DateTime.now(), accuracy: 0, altitude: 0, altitudeAccuracy: 0, heading: 0, headingAccuracy: 0, speed: 0, speedAccuracy: 0))}",
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
