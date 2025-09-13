import 'package:civic_issue/screens/report%20issue/provider.dart';
import 'package:civic_issue/widgets/section_card.dart';
import 'package:flutter/material.dart';



class PhotosSection extends StatelessWidget {
  final ReportIssueController controller;

  const PhotosSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Add Photos',
      trailingBadge: Text('${controller.photos.length}/5',
          style: const TextStyle(color: Color(0xFF667085))),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: controller.addDummyPhoto,
                  icon: const Icon(Icons.photo_camera_outlined),
                  label: const Text('Take Photo'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: controller.addDummyPhoto,
                  icon: const Icon(Icons.photo_outlined),
                  label: const Text('Gallery'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (controller.photos.isEmpty)
            Container(
              height: 90,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFFF2F4F7),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE6EAF0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.add_a_photo_outlined, color: Color(0xFF98A2B3)),
                  SizedBox(height: 6),
                  Text(
                    'No photos added yet',
                    style: TextStyle(color: Color(0xFF475467), fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Photos help resolve issues faster',
                    style: TextStyle(color: Color(0xFF98A2B3), fontSize: 12),
                  ),
                ],
              ),
            )
          else
            SizedBox(
              height: 84,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) => _PhotoThumb(
                  onRemove: () => controller.removePhotoAt(i),
                ),
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemCount: controller.photos.length,
              ),
            ),
        ],
      ),
    );
  }
}

class _PhotoThumb extends StatelessWidget {
  final VoidCallback onRemove;

  const _PhotoThumb({required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 84,
          height: 84,
          decoration: BoxDecoration(
            color: const Color(0xFFEFF4FF),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE6EAF0)),
          ),
          child: const Icon(Icons.image, color: Color(0xFF2D6CDF)),
        ),
        Positioned(
          right: -6,
          top: -6,
          child: IconButton(
            onPressed: onRemove,
            icon: const Icon(Icons.cancel, color: Color(0xFF98A2B3)),
            splashRadius: 18,
            tooltip: 'Remove',
          ),
        ),
      ],
    );
  }
}
