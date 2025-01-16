// import 'package:flutter/material.dart';
// import 'package:sara/screens/update_order.dart';

// class OrderDetails extends StatelessWidget {
//   const OrderDetails({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 80,
//         backgroundColor: Colors.cyan,
//         title: const Text(
//           'Order Details',
//           style: TextStyle(fontSize: 30, color: Colors.white),
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemBuilder: (context, index) {
//                 return Container(
//                   margin:
//                       const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.3),
//                         spreadRadius: 2,
//                         blurRadius: 5,
//                       ),
//                     ],
//                   ),
//                   child: Row(
//                     children: [
//                       SizedBox(
//                         width: 80,
//                         height: 80,
//                         child: Image.asset(
//                           'images/Screenshot 2024-11-17 230023.png',
//                         ),
//                       ),
//                       const SizedBox(width: 16),
//                    const   Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'item.productName',
//                               style:  TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 16),
//                             ),
//                              SizedBox(height: 4),
//                             Text('Quantity: ${'item.quantity'}',
//                                 style:  TextStyle(fontSize: 14)),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(16),
//             alignment: Alignment.center,
//             child:const Text(
//               ' Total Price: totalPrice',
//               style:  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.cyan,
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const UpdateOrder(
//                             productName: ' product A',
//                             productImage:
//                                 'images/Screenshot 2024-11-17 230023.png'),
//                       ),
//                     );
//                   },
//                   child: const Text(
//                     'Edit',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.cyan,
//                 ),
//                 onPressed: () {},
//                 child: const Text(
//                   'Cansel',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
