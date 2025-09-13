import 'package:civic_issue/screens/report%20issue/provider.dart';
import 'package:civic_issue/widgets/section_card.dart';
import 'package:flutter/material.dart';



class DescriptionSection extends StatelessWidget {
  final ReportIssueController controller;

  const DescriptionSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final chars = controller.description.characters.length;
    return SectionCard(
      title: 'Description',
      trailingBadge: Text('$chars/500',
          style: const TextStyle(color: Color(0xFF667085))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            maxLines: 5,
            maxLength: 500,
            onChanged: controller.setDescription,
            decoration: const InputDecoration(
              hintText:
                  'Describe the issue in detail. Include location details, severity, and any safety concerns…',
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {}, // integrate STT later
              icon: const Icon(Icons.mic_none),
              label: const Text('Voice to Text'),
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: const [
              Icon(Icons.info_outline, size: 16, color: Color(0xFF98A2B3)),
              SizedBox(width: 6),
              Expanded(
                child: Text(
                  'Provide clear details to help resolve the issue quickly',
                  style: TextStyle(color: Color(0xFF98A2B3)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
