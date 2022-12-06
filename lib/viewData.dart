import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class viewData extends StatefulWidget {
  List empList;

  viewData(this.empList);

  @override
  State<viewData> createState() => _viewDataState();
}

class _viewDataState extends State<viewData> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //
  //   t1.text;
  //   t2.text;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.empList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onLongPress: () async {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  print("Hardik");
                  return Dialog(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        viewData(widget.empList),
                                  ));
                              Navigator.pop(context);
                            },
                            child: Text("cancel")),
                        TextButton(
                            onPressed: () async {
                              DatabaseReference starCountRef = FirebaseDatabase
                                  .instance
                                  .ref('Employee/${widget.empList[index].key}');
                              await starCountRef.remove();
                              Navigator.pop(context);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        viewData(widget.empList),
                                  ));
                              Navigator.pop(context);
                              setState(() {});
                            },
                            child: Text("Delete"))
                      ],
                    ),
                  );
                },
              );
            },
            title: Text("${widget.empList[index].name}"),
            subtitle: Text("${widget.empList[index].contact}"),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    print("Hardik");
                    return Dialog(
                      child: SizedBox(
                        height: 200,
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                  hintText:
                                      "${t1.text = widget.empList[index].name}"),
                              controller: t1,
                              keyboardType: TextInputType.name,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  hintText:
                                      "${t2.text = widget.empList[index].contact}"),
                              controller: t2,
                              keyboardType: TextInputType.number,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                viewData(widget.empList),
                                          ));
                                      Navigator.pop(context);
                                      setState(() {});
                                    },
                                    child: Text("cancel")),
                                TextButton(
                                    onPressed: () async {
                                      DatabaseReference starCountRef =
                                          FirebaseDatabase.instance.ref(
                                              'Employee/${widget.empList[index].key}');
                                      await starCountRef.update({
                                        "name": "${t1.text}",
                                        "contact": "${t2.text}",
                                      });
                                      Navigator.pop(context);
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                viewData(widget.empList),
                                          ));
                                      Navigator.pop(context);
                                      setState(() {});
                                    },
                                    child: Text("Update"))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              icon: Icon(Icons.update_outlined),
            ),
          );
        },
      ),
    );
  }
}
