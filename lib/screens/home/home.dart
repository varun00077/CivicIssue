// import 'package:civic_issue/core/constants.dart';
// import 'package:civic_issue/screens/report%20issue/report_issue.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   GoogleMapController? _mapController;

//   static const CameraPosition _initialPosition = CameraPosition(
//     target: LatLng(28.6139, 77.2090), // New Delhi
//     zoom: 14.0,
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("CivicReport"),
//         centerTitle: true,
//         actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
//       ),
//       body: Column(
//         children: [
//           // Top Tabs
//           Container(
//             color: Colors.grey[200],
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: const [
//                 TabButton(title: "Home", selected: true),
//                 TabButton(title: "My Reports"),
//                 TabButton(title: "Profile"),
//               ],
//             ),
//           ),

//           // Google Map
//           Expanded(
//             child: GoogleMap(
//               initialCameraPosition: _initialPosition,
//               onMapCreated: (controller) {
//                 _mapController = controller;
//               },
//               myLocationEnabled: true,
//               myLocationButtonEnabled: true,
//               zoomControlsEnabled: false,
//             ),
//           ),

//           // Nearby Issues button
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.white,
//                 foregroundColor: Colors.black,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 elevation: 2,
//               ),
//               onPressed: () {},
//               icon: const Icon(Icons.list),
//               label: const Text("Nearby Issues"),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.of(
//             context,
//           ).push(MaterialPageRoute(builder: (context) => ReportIssue()));
//         },
//         backgroundColor: buttonColor,
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// class TabButton extends StatelessWidget {
//   final String title;
//   final bool selected;

//   const TabButton({super.key, required this.title, this.selected = false});

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () {},
//       child: Text(
//         title,
//         style: TextStyle(
//           fontWeight: selected ? FontWeight.bold : FontWeight.normal,
//           color: selected ? Colors.blue : Colors.black,
//         ),
//       ),
//     );
//   }
// }


// report_issue_screen.dart
import 'package:civic_issue/screens/home/components/chatbot_fab.dart';
import 'package:civic_issue/screens/home/components/map_view.dart';
import 'package:civic_issue/screens/home/components/nearby_issues_bottom_sheet.dart';
import 'package:civic_issue/screens/home/components/search_field.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';   // ✅ for LatLng
import 'package:civic_issue/screens/report issue/provider.dart';

class ReportIssueScreen extends StatefulWidget {
  const ReportIssueScreen({super.key});

  @override
  State<ReportIssueScreen> createState() => _ReportIssueScreenState();
}

class _ReportIssueScreenState extends State<ReportIssueScreen> {
  late final ReportIssueController controller;
  Position? currentPosition;

  @override
  void initState() {
    super.initState();
    controller = ReportIssueController();
    controller.addListener(() => setState(() {}));
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) return;

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) return;
    }

    final pos = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      currentPosition = pos;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _openChatbot() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Chatbot'),
        content: const Text('Chatbot UI or integration here'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bottomSheetHeight = size.height * 0.3;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Issue'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Help'),
          ),
        ],
      ),
      body: SafeArea(
        child: currentPosition == null
            ? const Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  // ✅ Convert Position → LatLng
                  MapViewPage(
                    position: LatLng(
                      currentPosition!.latitude,
                      currentPosition!.longitude,
                    ),
                  ),

                  Positioned(
                    top: 12,
                    left: 16,
                    right: 16,
                    child: SearchField(onSearch: (query) {
                      // Implement search action
                    }),
                  ),

                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    height: bottomSheetHeight,
                    // ✅ Pass LatLng instead of Position
                    child: NearbyIssuesBottomSheet(
                      userPosition: LatLng(
                        currentPosition!.latitude,
                        currentPosition!.longitude,
                      ),
                    ),
                  ),
                ],
              ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ChatbotFAB(onPressed: _openChatbot),
            FloatingActionButton(
              onPressed: () {
                // Your + button action
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
