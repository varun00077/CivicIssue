import 'package:civic_issue/screens/profile/stats_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = Provider.of<StatsProvider>(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Civic Impact",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatCard(Icons.assignment, "Reports Submitted",
                  stats.reportsSubmitted.toString(), Colors.blue),
              _buildStatCard(Icons.check_circle, "Issues Resolved",
                  stats.issuesResolved.toString(), Colors.green),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatCard(Icons.thumb_up, "Community Votes",
                  stats.communityVotes.toString(), Colors.red),
              _buildStatCard(Icons.emoji_events, "Local Ranking",
                  "#${stats.localRanking}", Colors.amber),
            ],
          ),
          const SizedBox(height: 20),
          Text("Next Level Progress: ${stats.progressPercent}%",
              style: const TextStyle(fontWeight: FontWeight.bold)),
          LinearProgressIndicator(
            value: stats.progressPercent / 100,
            minHeight: 8,
          ),
          const SizedBox(height: 20),
          const Text("Monthly Activity",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatCard(Icons.assignment, "This Month",
                  stats.reportsThisMonth.toString(), Colors.blue),
              _buildStatCard(Icons.assignment, "Last Month",
                  stats.reportsLastMonth.toString(), Colors.green),
            ],
          ),
          const SizedBox(height: 20),
          const Text("You're in the top 25% of active reporters in your area!",
              style: TextStyle(color: Colors.blue)),
          const SizedBox(height: 30),
          // ElevatedButton(
          //   onPressed: () {
          //     stats.addReport(); // demo button to trigger state change
          //   },
          //   child: const Text("Add Report"),
          // ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
      IconData icon, String title, String value, Color color) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 30),
          const SizedBox(height: 8),
          Text(value,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(title, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
