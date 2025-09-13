import 'package:civic_issue/models/issue_model.dart';
import 'package:civic_issue/screens/my%20reports/components/filter_chips.dart';
import 'package:civic_issue/screens/my%20reports/components/impact_header.dart';
import 'package:civic_issue/screens/my%20reports/components/issue_list_tile.dart';
import 'package:flutter/material.dart';


class MyReportScreen extends StatefulWidget {
  const MyReportScreen({super.key});

  @override
  State<MyReportScreen> createState() => _MyReportScreenState();
}

class _MyReportScreenState extends State<MyReportScreen> {
  Status selectedStatus = Status.all;
  Category selectedCategory = Category.all;

  final List<Issue> allIssues = [
    Issue(
      title: "Pothole on Main Street",
      trailingDescription: "Road needs patching urgently",
      category: Category.pothole,
      status: Status.inProgress,
    ),
    Issue(
      title: "Graffiti on Wall 23B",
      trailingDescription: "Needs to be removed",
      category: Category.graffiti,
      status: Status.notStarted,
    ),
    Issue(
      title: "Trash overflowing in park",
      trailingDescription: "Bins need emptying",
      category: Category.trash,
      status: Status.resolved,
    ),
    Issue(
      title: "Water leakage near hydrant",
      trailingDescription: "Leak causing puddle",
      category: Category.water,
      status: Status.inProgress,
    ),
    Issue(
      title: "Road cracks on 5th Avenue",
      trailingDescription: "Potential hazard for cars",
      category: Category.road,
      status: Status.notStarted,
    ),
  ];

  List<Issue> get filteredIssues {
    return allIssues.where((issue) {
      final statusMatches =
          selectedStatus == Status.all || issue.status == selectedStatus;
      final categoryMatches =
          selectedCategory == Category.all || issue.category == selectedCategory;
      return statusMatches && categoryMatches;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Reports"),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ImpactHeader(),
            const SizedBox(height: 20),
            // Search bar (non-functional placeholder)
            Container(
              height: 42,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x11000000),
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  )
                ],
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Search reports by description or location",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Text(
              "Filter by Status",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.grey.shade700),
            ),
            const SizedBox(height: 6),
            FilterChips<Status>(
              options: Status.values.toList(), // includes All
              selected: selectedStatus,
              labelBuilder: (s) => s.label,
              onSelected: (val) {
                setState(() {
                  selectedStatus = val;
                });
              },
              colorBuilder: (s) => statusColor(s),
            ),
            const SizedBox(height: 12),
            Text(
              "Filter by Category",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.grey.shade700),
            ),
            const SizedBox(height: 6),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: FilterChips<Category>(
                options: Category.values.toList(), // includes All
                selected: selectedCategory,
                labelBuilder: (c) => c.label,
                onSelected: (val) {
                  setState(() {
                    selectedCategory = val;
                  });
                },
                colorBuilder: (c) => categoryColor(c),
                isChoiceChip: true,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: filteredIssues.isEmpty
                  ? Center(
                      child: Text(
                        "No issues found with selected filters",
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  : ListView.separated(
                      itemCount: filteredIssues.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final issue = filteredIssues[index];
                        return IssueListTile(issue: issue);
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
