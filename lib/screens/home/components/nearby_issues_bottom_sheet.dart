import 'package:civic_issue/models/issue_model.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class NearbyIssuesBottomSheet extends StatelessWidget {
  final LatLng userPosition;

  const NearbyIssuesBottomSheet({super.key, required this.userPosition});

  // Dummy nearby issues data, replace with real API / logic
  List<Issue> _fetchNearbyIssues() {
    return [
      Issue(
        title: "Pothole on Main Street",
        trailingDescription: "Reported 500m from you",
        category: Category.pothole,
        status: Status.inProgress,
      ),
      Issue(
        title: "Trash Overflowing",
        trailingDescription: "Reported 200m from you",
        category: Category.trash,
        status: Status.notStarted,
      ),
      // Add more dummy issues here as needed
    ];
  }

  @override
  Widget build(BuildContext context) {
    final nearbyIssues = _fetchNearbyIssues();
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 5,
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const Text(
            'Nearby Issues',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              itemCount: nearbyIssues.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final issue = nearbyIssues[index];
                return ListTile(
                  title: Text(issue.title),
                  subtitle: Text(issue.trailingDescription),
                  trailing: Text(issue.category.label),
                  leading: Icon(_iconForCategory(issue.category)),
                  onTap: () {
                    // Optionally handle issue tap
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  IconData _iconForCategory(Category category) {
    // Map categories to icons
    switch (category) {
      case Category.pothole:
        return Icons.warning;
      case Category.graffiti:
        return Icons.brush;
      case Category.trash:
        return Icons.delete;
      case Category.water:
        return Icons.water_drop;
      case Category.road:
        return Icons.add_road_sharp;
      case Category.all:
        return Icons.report_problem;
    }
  }
}
