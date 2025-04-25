import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentPage extends StatefulWidget {
   StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();

}

class _StudentPageState extends State<StudentPage> {

  
  final namectrl = TextEditingController();
  final agectrl = TextEditingController();

  final  studentRef = FirebaseFirestore.instance.collection("students");

  void addStudent() async{
    final name = namectrl.text.trim();
    final age = int.tryParse(agectrl.text.trim());

    if(name.isEmpty || age == null){
      return;
    }

    await studentRef.add(
      {
        "name": name,
        "age": age,
      }
    );
    namectrl.clear();
    agectrl.clear();
  }

  void deleteStudent(String docId) async{
    await studentRef.doc(docId).delete();
  }

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Page"),
      ),
      body:   Column(
        children: [
          Padding(padding:  const EdgeInsets.all(12),
          child: Column(
            children: [
               TextField(
            controller: namectrl,
            decoration: const InputDecoration(
              labelText: "Student Name",
            ),
          ),
           TextField(
            controller: agectrl,
            decoration: const InputDecoration(
              labelText: "Student Age",
            ),
          ),
          ElevatedButton(onPressed: addStudent,
           child: const Text("Submit")
          ),
            ],

          ),
          ),
         const  Divider(),
        Expanded(
  child: StreamBuilder(
    stream: studentRef.snapshots(),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return const Center(
          child: Text("Something went wrong"),
        );
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
        return const Center(
          child: Text("No students found"),
        );
      }

      final students = snapshot.data!.docs;

      return ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final doc = students[index];
          final data = doc.data();

          return ListTile(
            title: Text(data['name']),
            subtitle: Text("Age: ${data['age']}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {}, 
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () =>{ 
                    deleteStudent(doc.id)
                  }, 
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          );
        },
      );
    },
  ),
),

         
        ],

      ),
    );
  }
}