// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: DefaultTabController(
//         length: 2, // The number of tabs / content sections to display.
//         child: Scaffold(
//           appBar: AppBar(
//             // Provide a back button automatically.
//             automaticallyImplyLeading: false,
//             title: Text('Two Tabs Example'),
//             bottom: TabBar(
//               tabs: [
//                 Tab(icon: Icon(Icons.home), text: "Home"),
//                 Tab(icon: Icon(Icons.settings), text: "Settings"),
//               ],
//             ),
//           ),
//           body: TabBarView(
//             children: [
//               // First tab content
//               Center(child: Text('Home Tab Content')),
//               // Second tab content
//               Center(child: Text('Settings Tab Content')),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
