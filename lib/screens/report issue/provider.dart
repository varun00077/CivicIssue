import 'package:flutter/material.dart';

enum PriorityLevel { low, medium, high }

class ReportIssueController extends ChangeNotifier {
  bool locationSelected = false;
  String? selectedCategory;
  final List<ImageProvider> photos = [];
  String description = '';
  PriorityLevel priority = PriorityLevel.medium;

  bool get isValid =>
      locationSelected &&
      selectedCategory != null &&
      description.trim().isNotEmpty;

  void toggleLocationSelected() {
    locationSelected = true;
    notifyListeners();
  }

  void setCategory(String category) {
    selectedCategory = category;
    notifyListeners();
  }

  void addDummyPhoto() {
    if (photos.length >= 5) return;
    // Using a simple colored placeholder
    photos.add(const AssetImage('assets/placeholder.png'));
    notifyListeners();
  }

  void removePhotoAt(int index) {
    if (index < 0 || index >= photos.length) return;
    photos.removeAt(index);
    notifyListeners();
  }

  void setDescription(String value) {
    description = value;
    notifyListeners();
  }

  void setPriority(PriorityLevel level) {
    priority = level;
    notifyListeners();
  }
}
