// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';

// import '../provider/google_signin.dart';

// class Profile extends StatelessWidget {
//   const Profile({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return(
//       SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     const SizedBox(
//                       width: 15,
//                     ),
//                     Image.asset(
//                       'assets/icons/icon.png',
//                       height: 45,
//                       width: 45,
//                     ),
//                     const SizedBox(
//                       width: 15,
//                     ),
//                     const Text(
//                       "Profile",
//                       style: TextStyle(
//                         fontSize: 25,
//                         fontWeight: FontWeight.w500,
//                         color: Color.fromARGB(255, 47, 46, 65),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 160,
//                     ),
//                     ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         primary: const Color.fromARGB(255, 47, 46, 65),
//                       ),
//                       child: const Text("Edit"),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 15,
//                     vertical: 5,
//                   ),
//                   child: Container(
//                     height: 150,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       color: const Color.fromARGB(198, 152, 233, 229),
//                     ),
//                     child: Row(
//                       children: [
//                         const SizedBox(
//                           width: 25,
//                         ),
//                         CircleAvatar(
//                           radius: 45,
//                           backgroundImage: NetworkImage(user.photoURL!),
//                         ),
//                         const SizedBox(
//                           width: 25,
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const SizedBox(
//                               height: 36,
//                             ),
//                             Text(
//                               user.displayName!,
//                               style: const TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.w500),
//                             ),
//                             const SizedBox(height: 10),
//                             Text(
//                               'Age: ${data['age']}',
//                               style: const TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.w500),
//                             ),
//                             const SizedBox(height: 10),
//                             Text(
//                               'Blood Group: ${data['blood_group']}',
//                               style: const TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.w500),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: double.infinity,
//                   height: 150,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset('assets/images/counter.png'),
//                       const SizedBox(
//                         width: 50,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: const [
//                           SizedBox(
//                             height: 45,
//                           ),
//                           Text(
//                             '7 weeks 2 Days',
//                             style: TextStyle(
//                                 fontSize: 21, fontWeight: FontWeight.w500),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             'Your baby just got a heart ❤️',
//                             style: TextStyle(fontWeight: FontWeight.w500),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     final provider = Provider.of<GoogleSignInProvider>(context,
//                         listen: false);
//                     provider.logout();
//                   },
//                   style: ElevatedButton.styleFrom(
//                       primary: const Color.fromARGB(255, 47, 46, 65),
//                       fixedSize: const Size(240, 46)),
//                   label: const Text(
//                     "Logout",
//                     style: TextStyle(fontSize: 18),
//                   ),
//                   icon: const Icon(FontAwesomeIcons.google),
//                 ),
//               ],
//             ),
//           );
//     );
//   }
// }