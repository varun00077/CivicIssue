import 'package:civic_issue/screens/report%20issue/provider.dart';
import 'package:civic_issue/widgets/section_card.dart';
import 'package:flutter/material.dart';


class LocationSection extends StatelessWidget {
  final ReportIssueController controller;

  const LocationSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Issue Location',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MapPlaceholder(),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.place_outlined, size: 18, color: Color(0xFF667085)),
              const SizedBox(width: 6),
              Text(
                controller.locationSelected ? 'Location selected' : 'Select location on map',
                style: TextStyle(
                  color: controller.locationSelected ? Colors.black : const Color(0xFF667085),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: controller.toggleLocationSelected,
              icon: const Icon(Icons.my_location),
              label: const Text('Use Current Location'),
            ),
          ),
        ],
      ),
    );
  }
}

class _MapPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: const Color(0xFFF2F4F7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE6EAF0)),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.error_outline, size: 30, color: Color(0xFF98A2B3)),
            SizedBox(height: 8),
            Text(
              'Oops! Something went wrong.',
              style: TextStyle(color: Color(0xFF475467), fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 4),
            Text(
              'This page didn’t load Google Maps correctly.\nSee the console for details.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF98A2B3), fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}