
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 253, 253),
      appBar: AppBar(
        title: const Text("first lesson"),
        centerTitle: true,
        leading: const Icon(Icons.search),
        actions: const [
          Icon(Icons.search),
        ],
      ),
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("lib/Assets/bulbsd.jpg"),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        child: const Text("click"),
      ),
    );
  }

  // Widget myContainer({required Color color, required String text}) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Container(
  //         height: 100,
  //         width: 120,
  //         decoration: BoxDecoration(
  //           color: color,
  //           borderRadius: BorderRadius.circular(20),
  //           border: Border.all(
  //             width: 1,
  //             color: Colors.black,
  //           ),
  //         ),
  //       ),
  //       const SizedBox(
  //         height: 10,
  //       ),
  //       Text(text)
  //     ],
  //   );
  // }
}
