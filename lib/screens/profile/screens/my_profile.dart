// import 'package:flutter/material.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const CircleAvatar(
//             radius: 40,
//             child: Icon(Icons.person, size: 40),
//           ),
//           const SizedBox(height: 12),
//           const Text("Sarah Johnson",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//           const Text("sarah.johnson@email.com"),
//           const Text("Member since March 2024",
//               style: TextStyle(color: Colors.blue)),
//           const SizedBox(height: 20),
//           const Text("Account Settings",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           ListTile(
//             leading: const Icon(Icons.edit),
//             title: const Text("Edit Profile"),
//             onTap: () {},
//           ),
//           ListTile(
//             leading: const Icon(Icons.lock),
//             title: const Text("Change Password"),
//             onTap: () {},
//           ),
//           ListTile(
//             leading: const Icon(Icons.email),
//             title: const Text("Email Preferences"),
//             onTap: () {},
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source, imageQuality: 80);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      Navigator.of(context).pop(); // Close bottom sheet
    }
  }

  void _showImageSourceActionSheet() {
    showModalBottomSheet(
    
      context: context,
      builder: (_) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take photo'),
              onTap: () => _pickImage(ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from gallery'),
              onTap: () => _pickImage(ImageSource.gallery),
            ),
            ListTile(
              leading: const Icon(Icons.close),
              title: const Text('Cancel'),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }

  void _onEditProfile() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Edit Profile clicked')),
    );
  }

  void _onChangePassword() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Change Password clicked')),
    );
  }

  void _onEmailPreferences() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Email Preferences clicked')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Profile'),
      //   centerTitle: true,
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   foregroundColor: Colors.black87,
      //   // actions: [
      //   //   IconButton(
      //   //     icon: const Icon(Icons.settings),
      //   //     onPressed: () {
      //   //       ScaffoldMessenger.of(context).showSnackBar(
      //   //         const SnackBar(content: Text('Settings clicked')),
      //   //       );
      //   //     },
      //   //   )
      //   // ],
      // ),
      backgroundColor: const Color(0xfff5f7fa),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _showImageSourceActionSheet,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 48,
                          backgroundColor: Colors.grey.shade300,
                          backgroundImage:
                              _imageFile != null ? FileImage(_imageFile!) : null,
                          child: _imageFile == null
                              ? const Icon(Icons.person, size: 50, color: Colors.grey)
                              : null,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.blue,
                            child: const Icon(Icons.camera_alt, size: 16, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Sarah Johnson',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'sarah.johnson@email.com',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Member since March 2024',
                      style: TextStyle(color: Colors.blue, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                  child: Text(
                    'Account Settings',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.blue.shade300),
                  title: const Text('Edit Profile'),
                  subtitle: const Text('Update your name and personal information'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: _onEditProfile,
                ),
                const Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.lock, color: Colors.green.shade300),
                  title: const Text('Change Password'),
                  subtitle: const Text('Update your account password'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: _onChangePassword,
                ),
                const Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.email, color: Colors.red.shade300),
                  title: const Text('Email Preferences'),
                  subtitle: const Text('Manage email notifications'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: _onEmailPreferences,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
