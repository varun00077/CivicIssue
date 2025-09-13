import 'package:civic_issue/screens/report%20issue/provider.dart';
import 'package:civic_issue/widgets/section_card.dart';
import 'package:flutter/material.dart';



class PrioritySection extends StatelessWidget {
  final ReportIssueController controller;

  const PrioritySection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Priority Level',
      trailingBadge: _PriorityBadge(level: controller.priority),
      child: Column(
        children: [
          _PriorityTile(
            title: 'Low',
            subtitle: 'Non-urgent, cosmetic issues',
            icon: Icons.eco_outlined,
            value: PriorityLevel.low,
            groupValue: controller.priority,
            onChanged: controller.setPriority,
          ),
          const SizedBox(height: 8),
          _PriorityTile(
            title: 'Medium',
            subtitle: 'Standard civic issues',
            icon: Icons.priority_high_outlined,
            value: PriorityLevel.medium,
            groupValue: controller.priority,
            onChanged: controller.setPriority,
            highlight: true,
          ),
          const SizedBox(height: 8),
          _PriorityTile(
            title: 'High',
            subtitle: 'Safety concerns, urgent repairs',
            icon: Icons.warning_amber_rounded,
            value: PriorityLevel.high,
            groupValue: controller.priority,
            onChanged: controller.setPriority,
          ),
          const SizedBox(height: 8),
          Row(
            children: const [
              Icon(Icons.info_outline, size: 16, color: Color(0xFF98A2B3)),
              SizedBox(width: 6),
              Expanded(
                child: Text(
                  'Priority helps determine response time. High priority issues receive immediate attention.',
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

class _PriorityBadge extends StatelessWidget {
  final PriorityLevel level;
  const _PriorityBadge({required this.level});

  @override
  Widget build(BuildContext context) {
    final text = switch (level) {
      PriorityLevel.low => 'Low',
      PriorityLevel.medium => 'Medium',
      PriorityLevel.high => 'High',
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF4FF),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF2D6CDF),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _PriorityTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final PriorityLevel value;
  final PriorityLevel groupValue;
  final void Function(PriorityLevel) onChanged;
  final bool highlight;

  const _PriorityTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    final selected = value == groupValue;
    final borderColor = selected
        ? const Color(0xFF2D6CDF)
        : const Color(0xFFE6EAF0);
    final bgColor = (highlight && selected) ? const Color(0xFFFFF5EC) : Colors.white;

    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () => onChanged(value),
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: borderColor),
        ),
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Icon(icon, color: selected ? const Color(0xFFDC6803) : const Color(0xFF667085)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                      )),
                  const SizedBox(height: 2),
                  Text(subtitle,
                      style: const TextStyle(color: Color(0xFF667085))),
                ],
              ),
            ),
            Radio<PriorityLevel>(
              value: value,
              groupValue: groupValue,
              onChanged: (_) => onChanged(value),
              activeColor: const Color(0xFF2D6CDF),
            ),
          ],
        ),
      ),
    );
  }
}
