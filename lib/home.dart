import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_lesson/DataFetched.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final schoolController = TextEditingController();
  final courseController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 253, 253, 253),
        appBar: AppBar(
          title: const Text("first lesson"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //* name form field
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black,
                    width: 1,
                  )),
                  label: Text(
                    "Name",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),

              //* email form field

              const SizedBox(
                height: 10,
              ),

              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black,
                    width: 1,
                  )),
                  label: Text(
                    "Email",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),

              //* phone form field

              const SizedBox(
                height: 10,
              ),

              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black,
                    width: 1,
                  )),
                  label: Text(
                    "Phone",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),

              //* school form field

              const SizedBox(
                height: 10,
              ),

              TextFormField(
                controller: schoolController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black,
                    width: 1,
                  )),
                  label: Text(
                    "School",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),

              //* course form field

              const SizedBox(
                height: 10,
              ),

              TextFormField(
                controller: courseController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black,
                    width: 1,
                  )),
                  label: Text(
                    "Course",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),

              //*(submit button)

              const SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () async {
                      if (nameController.text.isEmpty ||
                          emailController.text.isEmpty ||
                          phoneController.text.isEmpty ||
                          schoolController.text.isEmpty ||
                          courseController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text("Fill in fields")));
                      } else {
                        //* create an instance of cloud firestore
                        FirebaseFirestore firestore =
                            FirebaseFirestore.instance;

                        //* send the data and create the collection to store the data

                        await firestore.collection("student").doc().set({
                          "name": nameController.text,
                          "email": emailController.text,
                          "phone": phoneController.text,
                          "school": schoolController.text,
                          "course": courseController.text,
                        }).then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text("Data sent successfully")));
                        });
                      }
                    },
                    child: const Text(
                      "submit",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => DataFetched()));
          },
          child: Text("next"),
        ));
  }
}
