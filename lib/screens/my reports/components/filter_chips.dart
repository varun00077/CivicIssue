// import 'package:flutter/material.dart';

// class FilterChips<T> extends StatelessWidget {
//   final List<T> options;
//   final T selected;
//   final String Function(T) labelBuilder;
//   final void Function(T) onSelected;
//   final Color Function(T) colorBuilder;
//   final bool isChoiceChip; // if true, uses ChoiceChip, else FilterChip

//   const FilterChips({
//     super.key,
//     required this.options,
//     required this.selected,
//     required this.labelBuilder,
//     required this.onSelected,
//     required this.colorBuilder,
//     this.isChoiceChip = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       spacing: 8,
//       children: options.map((option) {
//         final bool isSelected = option == selected;
//         if (isChoiceChip) {
//           return ChoiceChip(
//             label: Text(labelBuilder(option)),
//             selected: isSelected,
//             onSelected: (selected) {
//               if (selected) {
//                 onSelected(option);
//               }
//             },
//             selectedColor: colorBuilder(option).withOpacity(0.25),
//             labelStyle: TextStyle(
//               color: isSelected
//                   ? colorBuilder(option)
//                   : Colors.grey.shade700,
//               fontWeight: FontWeight.w600,
//             ),
//             backgroundColor: Colors.white,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15),
//               side: BorderSide(color: colorBuilder(option).withOpacity(0.65), width: 1.5),
//             ),
//           );
//         }
//         return FilterChip(
//           label: Text(labelBuilder(option)),
//           selected: isSelected,
//           onSelected: (selected) {
//             if (selected) {
//               onSelected(option);
//             } else {
//               // Optionally handle deselect (switch to All)
//             }
//           },
//           selectedColor: colorBuilder(option).withOpacity(0.2),
//           labelStyle: TextStyle(
//             color: isSelected ? colorBuilder(option) : Colors.grey[700],
//             fontWeight: FontWeight.w600,
//           ),
//           backgroundColor: Colors.grey.shade200,
//         );
//       }).toList(),
//     );
//   }
// }


import 'package:flutter/material.dart';

class FilterChips<T> extends StatelessWidget {
  final List<T> options;
  final T selected;
  final String Function(T) labelBuilder;
  final void Function(T) onSelected;
  final Color Function(T) colorBuilder;
  final bool isChoiceChip; // ChoiceChip for category, FilterChip for status

  const FilterChips({
    super.key,
    required this.options,
    required this.selected,
    required this.labelBuilder,
    required this.onSelected,
    required this.colorBuilder,
    this.isChoiceChip = false,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: options.map((option) {
        final bool isSelected = option == selected;
        if (isChoiceChip) {
          return ChoiceChip(
            label: Text(labelBuilder(option)),
            selected: isSelected,
            onSelected: (selected) {
              if (selected) {
                onSelected(option);
              }
            },
            selectedColor: colorBuilder(option).withOpacity(0.25),
            labelStyle: TextStyle(
              color: isSelected
                  ? colorBuilder(option)
                  : Colors.grey.shade700,
              fontWeight: FontWeight.w600,
            ),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: colorBuilder(option).withOpacity(0.65), width: 1.5),
            ),
          );
        }

        // FilterChip for status
        return FilterChip(
          label: Text(labelBuilder(option)),
          selected: isSelected,
          onSelected: (selected) {
            if (selected) {
              onSelected(option);
            }
          },
          selectedColor: colorBuilder(option).withOpacity(0.2),
          labelStyle: TextStyle(
            color: isSelected ? colorBuilder(option) : Colors.grey[700],
            fontWeight: FontWeight.w600,
          ),
          backgroundColor: Colors.grey.shade200,
        );
      }).toList(),
    );
  }
}

