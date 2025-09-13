import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final ValueChanged<String> onSearch;

  const SearchField({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(12),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search issues by category or location',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          fillColor: Colors.white,
          filled: true,
        ),
        onSubmitted: onSearch,
      ),
    );
  }
}
