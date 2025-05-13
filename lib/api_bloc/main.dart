import 'package:bloc_tutorial/api_bloc/bloc/posts/post_bloc.dart';
import 'package:bloc_tutorial/api_bloc/ui/posts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PostBloc(),)
      ],
      child: MaterialApp(
        title: 'Material App',
        home: PostsScreen()
      ),
    );
  }
}













//Search Filter

// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Search Filter Demo',
//       theme: ThemeData.dark(),
//       home: SearchFilterScreen(),
//     );
//   }
// }
//
// class SearchFilterScreen extends StatefulWidget {
//   @override
//   _SearchFilterScreenState createState() => _SearchFilterScreenState();
// }
//
// class _SearchFilterScreenState extends State<SearchFilterScreen> {
//   List<String> items = [
//     'Apple',
//     'Banana',
//     'Orange',
//     'Pineapple',
//     'Strawberry',
//     'Grapes',
//     'Mango',
//     'Blueberry',
//   ];
//
//   List<String> filteredItems = [];
//   TextEditingController searchController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     filteredItems = items;
//     searchController.addListener(_filterList);
//   }
//
//   void _filterList() {
//     String query = searchController.text.toLowerCase();
//     setState(() {
//       filteredItems = items
//           .where((item) => item.toLowerCase().contains(query))
//           .toList();
//     });
//   }
//
//   @override
//   void dispose() {
//     searchController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Search Filter"),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(12.0),
//             child: TextField(
//               controller: searchController,
//               decoration: InputDecoration(
//                 hintText: 'Search...',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.search),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: filteredItems.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(filteredItems[index]),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
