import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_datastore/Client.dart';
import 'package:firebase_datastore/viewData.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  DatabaseReference ref = FirebaseDatabase.instance.ref("Employee");
  List<Client> empList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.name,
                controller: t1,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: t2,
              ),
              ElevatedButton.icon(
                  onPressed: () async {
                  await  ref.push().set({
                      "name": "${t1.text}",
                      "contact": "${t2.text}",
                    });
                    t1.clear();
                    t2.clear();
                  },
                  icon: Icon(Icons.add),
                  label: Text("add data")),
              ElevatedButton.icon(
                  onPressed: () {
                    DatabaseReference starCountRef =
                        FirebaseDatabase.instance.ref('Employee');
                    starCountRef.onValue.listen((DatabaseEvent event) {
                      Map data = event.snapshot.value as Map;
                      print(data);
                      empList.clear();
                      data.forEach((key,value) {
                        print("$key=>$value");
                        Client cl = Client.fromjson(value,key);
                        empList.add(cl);
                        print("empppppppppppp = $empList");
                      });
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return viewData(empList);
                        },
                      ));
                      setState(() {});
                    });
                  },
                  icon: Icon(Icons.view_agenda),
                  label: Text("view data")),
              // ListView.builder(
              //   shrinkWrap: true,
              //   itemCount: empList.length,
              //   itemBuilder: (context, index) {
              //     return ListTile(
              //       title: Text("${empList[index].name}"),
              //       subtitle: Text("${empList[index].contact}"),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
