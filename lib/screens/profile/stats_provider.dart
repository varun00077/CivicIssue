import 'package:flutter/material.dart';

class StatsProvider extends ChangeNotifier {
  int reportsSubmitted = 0;
  int issuesResolved = 0;
  int communityVotes = 0;
  int localRanking = 0;
  int progressPercent = 0;

  int reportsThisMonth = 0;
  int reportsLastMonth = 0;

  void addReport() {
    reportsSubmitted++;
    reportsThisMonth++;
    progressPercent =
        ((reportsSubmitted / 20) * 100).clamp(0, 100).toInt(); // Example calc
    notifyListeners();
  }

  void resolveIssue() {
    issuesResolved++;
    notifyListeners();
  }

  void addVote() {
    communityVotes++;
    notifyListeners();
  }
}
