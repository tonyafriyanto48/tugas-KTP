import 'dart:ffi';

import 'package:flutter/material.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//       // appBar: AppBar(
//       //   actions: [
//       //     IconButton(
//       //         onPressed: (){
//       //           _logout();
//       //         },
//       //         icon: Icon(Icons.logout)
//       //     )
//       //   ],
//       // ),
//       body: SingleChildScrollView(
//         child: RefreshIndicator(
//           onRefresh: () async{
//             setState(() {
//
//             });
//           },
//           child: FutureBuilder<List>( //Menyambungkan kedatabase untuk dapat ditampilkan data yang sudah di input
//               // future: MahasiswaService().getData(),
//               future: null,
//               builder: (context, snapshot){
//                 if(snapshot.hasError) print(snapshot.error);
//                 return snapshot.hasData
//                     ? new ItemList(list: snapshot.data,)
//                     : new Center(
//                   child: new CircularProgressIndicator(),
//                 );
//               }
//           ),
//         ),
//       ),
//     );
//   }
//
//   // void _logout() async{
//   //   var response = await Network().logout('/logout');
//   //   var body = jsonDecode(response.body);
//   //   print(body);
//   //   if(body['success'] == true){
//   //     SharedPreferences localStorage = await SharedPreferences.getInstance();
//   //     localStorage.remove('user');
//   //     localStorage.remove('token');
//   //     Navigator.of(context).pushReplacement(
//   //         MaterialPageRoute(builder: (_){
//   //           return LoginPage();
//   //         })
      );
//   //   }
  }
}
