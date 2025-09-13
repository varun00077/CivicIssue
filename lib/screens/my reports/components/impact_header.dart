// import 'package:flutter/material.dart';

// class ImpactHeader extends StatelessWidget {
//   const ImpactHeader({super.key});

//   Widget impactStat(String label, String value) {
//     return Column(
//       children: [
//         Text(
//           value,
//           style: const TextStyle(
//             fontSize: 24,
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'RobotoMono',
//           ),
//         ),
//         const SizedBox(height: 6),
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 12,
//             color: Colors.white70,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           colors: [Color(0xff3f65f9), Color(0xff2e42ef)],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: const [
//           BoxShadow(
//             color: Color(0x33000000),
//             blurRadius: 8,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "Your Impact",
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           const SizedBox(height: 18),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               impactStat("Total Reports", "5"),
//               impactStat("Resolved", "2"),
//             ],
//           ),
//           const SizedBox(height: 16),
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.25),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: const [
//                 Icon(Icons.trending_up, color: Colors.white, size: 22),
//                 SizedBox(width: 8),
//                 Text(
//                   "Community Impact Score",
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(width: 6),
//                 Text(
//                   "75 points",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class ImpactHeader extends StatelessWidget {
  const ImpactHeader({super.key});

  Widget impactStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono',
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white70,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff3f65f9), Color(0xff2e42ef)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Your Impact",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              impactStat("Total Reports", "5"),
              impactStat("Resolved", "2"),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.25),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.trending_up, color: Colors.white, size: 22),
                SizedBox(width: 8),
                Text(
                  "Community Impact Score",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 6),
                Text(
                  "75 points",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
