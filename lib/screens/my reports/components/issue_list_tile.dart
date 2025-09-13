// import 'package:civic_issue/models/issue_model.dart';
// import 'package:flutter/material.dart';

// class IssueListTile extends StatelessWidget {
//   final Issue issue;

//   const IssueListTile({
//     super.key,
//     required this.issue,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final categoryClr = categoryColor(issue.category);
//     final statusClr = statusColor(issue.status);
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: const [
//           BoxShadow(
//             color: Color(0x10000000),
//             blurRadius: 6,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
//       child: Row(
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//             decoration: BoxDecoration(
//               color: categoryClr.withOpacity(0.15),
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Text(
//               issue.category.label.toUpperCase(),
//               style: TextStyle(
//                 color: categoryClr,
//                 fontWeight: FontWeight.w700,
//                 fontSize: 11,
//                 letterSpacing: 0.6,
//               ),
//             ),
//           ),
//           const SizedBox(width: 14),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   issue.title,
//                   style: const TextStyle(
//                       fontWeight: FontWeight.w700, fontSize: 16),
//                 ),
//                 const SizedBox(height: 6),
//                 Text(
//                   issue.trailingDescription,
//                   style: TextStyle(
//                     fontSize: 13,
//                     color: Colors.grey.shade600,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//             decoration: BoxDecoration(
//               color: statusClr.withOpacity(0.2),
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Text(
//               issue.status.label,
//               style: TextStyle(
//                 color: statusClr,
//                 fontWeight: FontWeight.w700,
//                 fontSize: 12,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'package:civic_issue/models/issue_model.dart';
import 'package:flutter/material.dart';

class IssueListTile extends StatelessWidget {
  final Issue issue;

  const IssueListTile({
    super.key,
    required this.issue,
  });

  @override
  Widget build(BuildContext context) {
    final categoryClr = categoryColor(issue.category);
    final statusClr = statusColor(issue.status);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x10000000),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        children: [
          // Category label - never shows "All" because no issue has Category.all
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: categoryClr.withOpacity(0.15),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              issue.category.label.toUpperCase(),
              style: TextStyle(
                color: categoryClr,
                fontWeight: FontWeight.w700,
                fontSize: 11,
                letterSpacing: 0.6,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  issue.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 16),
                ),
                const SizedBox(height: 6),
                Text(
                  issue.trailingDescription,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          // Status label - never "All"
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: statusClr.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              issue.status.label,
              style: TextStyle(
                color: statusClr,
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
