import 'package:civic_issue/screens/report%20issue/provider.dart';
import 'package:flutter/material.dart';


class SubmitBar extends StatelessWidget {
  final ReportIssueController controller;

  const SubmitBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final enabled = controller.isValid;
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 12,
              offset: Offset(0, -2),
            )
          ],
        ),
        child: SizedBox(
          height: 48,
          child: ElevatedButton.icon(
            onPressed: enabled ? () {} : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: enabled ? const Color(0xFF2D6CDF) : const Color(0xFFE6EAF0),
              foregroundColor: enabled ? Colors.white : const Color(0xFF98A2B3),
              elevation: 0,
            ),
            icon: const Icon(Icons.send),
            label: const Text('Submit Report'),
          ),
        ),
      ),
    );
  }
}
