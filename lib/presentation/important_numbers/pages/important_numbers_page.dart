import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ImportantNumbersPage extends StatelessWidget {
  const ImportantNumbersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Important numbers")),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                const SizedBox(height: 5),
                _buildImportantNumberRangpur(),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListTile _buildImportantNumberRangpur() {
    return ListTile(
      title: Text("Rangpur", style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDesignationAndNumber(
            designation: "পুলিশ সুপার",
            number: "০২৫৮৯৯৬১২৩৩",
          ),
          _buildDesignationAndNumber(
            designation: "অতিরিক্ত পুলিশ সুপার (প্রশাসন ও অর্থ)",
            number: "০১৩২০১৩১৩০৪",
          ),
          _buildDesignationAndNumber(
            designation: "অতিরিক্ত পুলিশ সুপার (ক্রাইম অ্যান্ড অপস্)",
            number: "০১৩২০১৩১৩০৩",
          ),
          _buildDesignationAndNumber(
            designation: "সহকারী পুলিশ সুপার",
            number: "০১৩১৫২০৭১১১",
          ),
          _buildDesignationAndNumber(
            designation: "সহকারী পুলিশ সুপার (এসএএফ)",
            number: "০১৩২০১৩১৩১৩",
          ),
        ],
      ),
    );
  }

  Wrap _buildDesignationAndNumber({
    required String designation,
    required String number,
  }) {
    return Wrap(
      children: [
        Text("$designation : ", style: TextStyle(fontWeight: FontWeight.bold)),
        SelectableText(
          number,
          contextMenuBuilder: (context, editableTextState) {
            return AdaptiveTextSelectionToolbar.buttonItems(
              anchors: editableTextState.contextMenuAnchors,
              buttonItems:
                  editableTextState.contextMenuButtonItems..add(
                    ContextMenuButtonItem(
                      onPressed: () {
                        final selectedText = editableTextState
                            .textEditingValue
                            .selection
                            .textInside(
                              editableTextState.textEditingValue.text,
                            );
                        launchUrl(Uri.parse("tel:$selectedText"));
                        editableTextState.hideToolbar();
                      },
                      label: "Call",
                    ),
                  ),
            );
          },
        ),
      ],
    );
  }
}
