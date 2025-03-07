import 'package:flutter/material.dart';
import 'package:flutter_safe_bd/presentation/add_remove_contact_page/controllers/add_remove_contact_page_controller.dart';
import 'package:get/get.dart';

class AddRemoveContactPage extends StatefulWidget {
  const AddRemoveContactPage({super.key});

  @override
  State<AddRemoveContactPage> createState() => _AddRemoveContactPageState();
}

class _AddRemoveContactPageState extends State<AddRemoveContactPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameTEC = TextEditingController();
  final TextEditingController _phoneNumberTec = TextEditingController();
  final TextEditingController _whatsAppTec = TextEditingController();

  final FocusNode _focusNodePhoneNumber = FocusNode();
  final FocusNode _focusNodeWhatsApp = FocusNode();

  @override
  void dispose() {
    _nameTEC.dispose();
    _phoneNumberTec.dispose();
    _whatsAppTec.dispose();
    _focusNodePhoneNumber.dispose();
    _focusNodeWhatsApp.dispose();
    super.dispose();
  }

  @override
  void initState() {
    initialPageSetup();
    super.initState();
  }

  Future<void> initialPageSetup() async {
    await Get.find<AddRemoveContactPageController>().fetchContacts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Add / Remove Contact")),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                const SizedBox(height: 5),
                _buildAddForm(context),
                const SizedBox(height: 12),
                _buildContactListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GetBuilder<AddRemoveContactPageController> _buildContactListView() {
    return GetBuilder<AddRemoveContactPageController>(
      builder: (controller) {
        return ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemBuilder:
              (context, index) => ListTile(
                title: Text(controller.getListOfContacts[index].name ?? ""),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Phone :  ${(controller.getListOfContacts[index].phoneNumber ?? "").isEmpty ? "No data" : controller.getListOfContacts[index].phoneNumber}",
                    ),
                    Text(
                      "Whatsapp :  ${(controller.getListOfContacts[index].whatsapp ?? "").isEmpty ? "No data" : "wa.me/88${controller.getListOfContacts[index].whatsapp}"}",
                    ),
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.remove_circle_outline),
                ),
              ),
          itemCount: controller.getListOfContacts.length,
        );
      },
    );
  }

  Form _buildAddForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameTEC,
            textInputAction: TextInputAction.next,
            onFieldSubmitted:
                (value) =>
                    FocusScope.of(context).requestFocus(_focusNodePhoneNumber),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return "Can't be empty";
              }
              return null;
            },
            decoration: InputDecoration(hintText: "Name"),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _phoneNumberTec,
            textInputAction: TextInputAction.next,
            focusNode: _focusNodePhoneNumber,
            onFieldSubmitted:
                (value) =>
                    FocusScope.of(context).requestFocus(_focusNodeWhatsApp),
            keyboardType: TextInputType.number,
            validator: (value) {
              if ((value?.isEmpty ?? true) && (_whatsAppTec.text.isEmpty)) {
                return "Phone number or Whatsapp required";
              }
              if ((value?.length ?? 0) > 0) {
                if (value!.length != 11) {
                  return "Must be 11 digit";
                }
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "Phone number (for sending sms)",
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _whatsAppTec,
            focusNode: _focusNodeWhatsApp,
            keyboardType: TextInputType.number,
            validator: (value) {
              if ((value?.isEmpty ?? true) && (_phoneNumberTec.text.isEmpty)) {
                return "Phone number or Whatsapp required";
              }

              if ((value?.length ?? 0) > 0) {
                if (value!.length != 11) {
                  return "Must be 11 digit";
                }
              }
              return null;
            },
            decoration: InputDecoration(hintText: "Whatsapp number (11 digit)"),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: Get.width / 2,
            child: GetBuilder<AddRemoveContactPageController>(
              builder: (controller) {
                return ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await controller.addContact(
                        name: _nameTEC.text,
                        phone: _phoneNumberTec.text,
                        whatsapp: _whatsAppTec.text,
                      );
                    }
                  },
                  child: Text("Add"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
