import 'package:civic_issue/screens/report%20issue/provider.dart';
import 'package:civic_issue/widgets/section_card.dart';
import 'package:flutter/material.dart';


class CategoriesSection extends StatelessWidget {
  final ReportIssueController controller;

  const CategoriesSection({super.key, required this.controller});

  static const List<_Category> _categories = [
    _Category(icon: Icons.handyman, label: 'Pothole'),
    _Category(icon: Icons.lightbulb_outline, label: 'Street Light'),
    _Category(icon: Icons.format_paint, label: 'Graffiti'),
    _Category(icon: Icons.delete_outline, label: 'Trash/Litter'),
  ];

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Issue Category',
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: _categories.map((c) {
          final selected = controller.selectedCategory == c.label;
          return GestureDetector(
            onTap: () => controller.setCategory(c.label),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: selected ? const Color(0xFFEFF4FF) : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: selected ? const Color(0xFF2D6CDF) : const Color(0xFFE6EAF0),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(c.icon, color: selected ? const Color(0xFF2D6CDF) : const Color(0xFF667085)),
                  const SizedBox(width: 8),
                  Text(
                    c.label,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: selected ? const Color(0xFF2D6CDF) : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _Category {
  final IconData icon;
  final String label;
  const _Category({required this.icon, required this.label});
}
