import 'package:flutter/material.dart';
import 'package:flutter_safe_bd/presentation/add_remove_contact_page/models/contact_model.dart';
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

  final List<ContactModel> _listOfContacts = [
    ContactModel(
      name: "MD",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
    ContactModel(
      name: "Sajid",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
    ContactModel(
      name: "Hossain",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
    ContactModel(
      name: "Hossain",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
    ContactModel(
      name: "Hossain",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
    ContactModel(
      name: "Hossain",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
    ContactModel(
      name: "Hossain",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
    ContactModel(
      name: "Hossain",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
    ContactModel(
      name: "Hossain",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
    ContactModel(
      name: "Hossain",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
    ContactModel(
      name: "Hossain",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
    ContactModel(
      name: "Hossain",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
    ContactModel(
      name: "Hossain",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
    ContactModel(
      name: "Hossain",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
    ContactModel(
      name: "Hossain",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
    ContactModel(
      name: "Hossain",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
    ContactModel(
      name: "Hossain",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
  ];

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
                ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder:
                      (context, index) => ListTile(
                        title: Text(_listOfContacts[index].name ?? ""),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Phone :  ${_listOfContacts[index].phoneNumber ?? ""}",
                            ),
                            Text(
                              "Whatsapp :  ${_listOfContacts[index].whatsapp ?? ""}",
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.remove_circle_outline),
                        ),
                      ),
                  itemCount: _listOfContacts.length,
                ),
              ],
            ),
          ),
        ),
      ),
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
            validator: (value) {
              if ((value?.isEmpty ?? true) && (_phoneNumberTec.text.isEmpty)) {
                return "Phone number or Whatsapp required";
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "Whatsapp (number or group code only)",
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: Get.width / 2,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {}
              },
              child: Text("Add"),
            ),
          ),
        ],
      ),
    );
  }
}
