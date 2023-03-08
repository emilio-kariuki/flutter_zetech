import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataFetched extends StatefulWidget {
  const DataFetched({super.key});

  @override
  State<DataFetched> createState() => _DataFetchedState();
}

class _DataFetchedState extends State<DataFetched> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("data fetched"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('student').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            final docs = snapshot.data!.docs;
            return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> data =
                      docs[index].data() as Map<String, dynamic>;

                  return ListTile(
                    title: Text(data['name']),
                    subtitle: Text(data['email']),
                    trailing: GestureDetector(
                        onTap: () async {
                          await FirebaseFirestore.instance
                              .doc(docs[index].id)
                              .delete()
                              .then((value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text("Data deleted successfully")));
                              });
                        },
                        child: Icon(Icons.delete)),
                  );
                });
          }

          if (!snapshot.hasData) {
            return const Text("No data found");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          return Container();
        },
      ),
    );
  }
}
