// import 'package:flutter/material.dart';

// enum Status { all, inProgress, resolved, notStarted }
// enum Category { all, graffiti, pothole, trash, water, road }

// extension StatusExtension on Status {
//   String get label {
//     switch (this) {
//       case Status.all:
//         return "All";
//       case Status.inProgress:
//         return "Work In Progress";
//       case Status.resolved:
//         return "Resolved";
//       case Status.notStarted:
//         return "Not Yet Started";
//     }
//   }
// }

// extension CategoryExtension on Category {
//   String get label {
//     switch (this) {
//       case Category.all:
//         return "All Categories";
//       case Category.graffiti:
//         return "Graffiti";
//       case Category.pothole:
//         return "Pothole";
//       case Category.trash:
//         return "Trash/Litter";
//       case Category.water:
//         return "Water";
//       case Category.road:
//         return "Road";
//     }
//   }
// }

// Color categoryColor(Category category) {
//   switch (category) {
//     case Category.graffiti:
//       return Colors.purple.shade300;
//     case Category.pothole:
//       return Colors.orange.shade400;
//     case Category.trash:
//       return Colors.green.shade400;
//     case Category.water:
//       return Colors.blue.shade300;
//     case Category.road:
//       return Colors.red.shade400;
//     case Category.all:
//       return Colors.grey;
//   }
// }

// Color statusColor(Status status) {
//   switch (status) {
//     case Status.inProgress:
//       return Colors.orange.shade600;
//     case Status.resolved:
//       return Colors.green.shade600;
//     case Status.notStarted:
//       return Colors.grey.shade600;
//     case Status.all:
//       return Colors.grey.shade600;
//   }
// }

// class Issue {
//   final String title;
//   final String trailingDescription;
//   final Category category;
//   final Status status;

//   Issue({
//     required this.title,
//     required this.trailingDescription,
//     required this.category,
//     required this.status,
//   });
// }

import 'package:flutter/material.dart';

enum Status { all, inProgress, resolved, notStarted }
enum Category { all, graffiti, pothole, trash, water, road }

extension StatusExtension on Status {
  String get label {
    switch (this) {
      case Status.all:
        return "All";
      case Status.inProgress:
        return "Work In Progress";
      case Status.resolved:
        return "Resolved";
      case Status.notStarted:
        return "Not Yet Started";
    }
  }
}

extension CategoryExtension on Category {
  String get label {
    switch (this) {
      case Category.all:
        return "All Categories";
      case Category.graffiti:
        return "Graffiti";
      case Category.pothole:
        return "Pothole";
      case Category.trash:
        return "Trash/Litter";
      case Category.water:
        return "Water";
      case Category.road:
        return "Road";
    }
  }
}

Color categoryColor(Category category) {
  switch (category) {
    case Category.graffiti:
      return Colors.purple.shade300;
    case Category.pothole:
      return Colors.orange.shade400;
    case Category.trash:
      return Colors.green.shade400;
    case Category.water:
      return Colors.blue.shade300;
    case Category.road:
      return Colors.red.shade400;
    case Category.all:
      return Colors.grey;
  }
}

Color statusColor(Status status) {
  switch (status) {
    case Status.inProgress:
      return Colors.orange.shade600;
    case Status.resolved:
      return Colors.green.shade600;
    case Status.notStarted:
      return Colors.grey.shade600;
    case Status.all:
      return Colors.grey.shade600;
  }
}

class Issue {
  final String title;
  final String trailingDescription;
  final Category category;
  final Status status;

  Issue({
    required this.title,
    required this.trailingDescription,
    required this.category,
    required this.status,
  });
}
