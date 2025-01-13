// import 'package:flutter/material.dart';
// import 'package:sara/screens/EditProfilePage.dart';
// import 'package:sara/screens/ProfileInfoField..dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'profile page',
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.cyan,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               margin: const EdgeInsets.only(top: 20),
//               alignment: Alignment.center,
//               child: const CircleAvatar(
//                 radius: 60,
//                 backgroundImage:
//                     AssetImage('images/photo_2024-12-18_22-30-02.jpg'),
//               ),
//             ),
//             const SizedBox(height: 10),
//             const Text(
//               'maysaa',
//               style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.cyan),
//             ),
//             const SizedBox(height: 30),
//             const Profileinfofield(
//                 icon: Icons.person_outline,
//                 title: 'first name :',
//                 value: 'maysaa'),
//             const Profileinfofield(
//                 icon: Icons.person_outline,
//                 title: 'last name :',
//                 value: ' haj ali'),
//             const Profileinfofield(
//                 icon: Icons.person_outline,
//                 title: 'user name :',
//                 value: 'maysaa121'),
//             const Profileinfofield(
//                 icon: Icons.email,
//                 title: 'E_mail :',
//                 value: 'maysaa@example.com'),
//             const Profileinfofield(
//                 icon: Icons.location_on,
//                 title: 'location :',
//                 value: 'syria/Damascus'),
//             const Profileinfofield(
//                 icon: Icons.phone,
//                 title: 'phone number :',
//                 value: '+963912345678'),
//             const Profileinfofield(
//                 icon: Icons.lock, title: 'password :', value: '*****'),
//             const Profileinfofield(
//                 icon: Icons.lock_outline,
//                 title: 'confirm password :',
//                 value: '*****'),
//             const SizedBox(height: 30),
//             // ElevatedButton(
//             //   style: ElevatedButton.styleFrom(
//             //     backgroundColor: Colors.cyan,
//             //     padding:
//             //         const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//             //     shape: RoundedRectangleBorder(
//             //         borderRadius: BorderRadius.circular(20)),
//             //   ),
//             //   onPressed: () {
//             //     Navigator.push(
//             //       context,
//             //       MaterialPageRoute(builder: (context) => const EditProfilePage()),
//             //     );
//             //   },
//             //   child: const Text(
//             //     'Edit Profile',
//             //     style: TextStyle(fontSize: 16),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
