import 'package:civic_issue/screens/report%20issue/components/categories.dart';
import 'package:civic_issue/screens/report%20issue/components/description.dart';
import 'package:civic_issue/screens/report%20issue/components/location.dart';
import 'package:civic_issue/screens/report%20issue/components/photos.dart';
import 'package:civic_issue/screens/report%20issue/components/priority.dart';
import 'package:civic_issue/screens/report%20issue/components/submit.dart';
import 'package:civic_issue/screens/report%20issue/provider.dart';
import 'package:civic_issue/widgets/section_card.dart';
import 'package:flutter/material.dart';


class ReportIssue extends StatefulWidget {
  const ReportIssue({super.key});

  @override
  State<ReportIssue> createState() => _ReportIssueState();
}

class _ReportIssueState extends State<ReportIssue> {
  late final ReportIssueController controller;

  @override
  void initState() {
    super.initState();
    controller = ReportIssueController();
    controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Issue'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Help'),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SectionCard(
                title: 'Report a Civic Issue',
                child: Text(
                  'Help improve your community by reporting issues that need attention.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 12),
              LocationSection(controller: controller),
              const SizedBox(height: 12),
              CategoriesSection(controller: controller),
              const SizedBox(height: 12),
              PhotosSection(controller: controller),
              const SizedBox(height: 12),
              DescriptionSection(controller: controller),
              const SizedBox(height: 12),
              PrioritySection(controller: controller),
              const SizedBox(height: 13),
              SubmitBar(controller: controller),
            ],
          ),
        ),
      ),
      
    );
  }
}
