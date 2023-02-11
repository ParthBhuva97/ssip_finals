import 'package:flutter/material.dart';
import 'package:jsk_app/documentInfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DocumentsList extends StatefulWidget {
  String cName;
  DocumentsList({super.key, required this.cName});

  @override
  State<DocumentsList> createState() => _DocumentsListState();
}

List<String> subServices = [];

class _DocumentsListState extends State<DocumentsList> {
  String? name = '';
  String? subTitle = '';
  @override
  void initState() {
    getName();
    getListitems(widget.cName);
    super.initState();
  }

  Future<void> getName() async {
    final prefs = await SharedPreferences.getInstance();
    switch (widget.cName) {
      case "Certificates":
        {
          setState(() {
            subTitle = "પ્રમાણપત્ર";
          });
          // statements;
        }
        break;
      case "Magisterial":
        {
          setState(() {
            subTitle = "મેજિસ્ટ્રિયલ";
          });
          // statements;
        }
        break;
      case "Miscellaneous":
        {
          setState(() {
            subTitle = "અન્ય";
          });
          // statements;
        }
        break;
      case "Revenue":
        {
          setState(() {
            subTitle = "આવક";
          });
          // statements;
        }
        break;
      case "RTI":
        {
          setState(() {
            subTitle = "RTI";
          });
          // statements;
        }
        break;
      case "Social Security":
        {
          setState(() {
            subTitle = "સામાજિક સુરક્ષા";
          });
          // statements;
        }
        break;
      case "Supply":
        {
          setState(() {
            subTitle = "પુરવઠો";
          });
          // statements;
        }
        break;
    }
    setState(() {
      name = prefs.getString('username');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "${subTitle}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          elevation: 0,
          toolbarHeight: 100,
          actions: [
            // Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child: IconButton(
            //     icon: Icon(Icons.notifications),
            //     onPressed: () {},
            //   ),
            // )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.blue,
            child: Stack(
              children: [
                Container(
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.linear_scale_sharp,
                          size: 30,
                          color: Colors.blueGrey,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Container(
                    height: 600,
                    color: Colors.white,
                    width: double.infinity,
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        itemCount: subServices.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 5, bottom: 5),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DocumentInfo(
                                            cName: widget.cName,
                                            docName: subServices[index])));
                              },
                              child: Card(
                                elevation: 5,
                                child: Container(
                                  //height: 50,
                                  margin: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        subServices[index],
                                        style: TextStyle(fontSize: 22.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Future<void> getListitems(String value) async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection(value).get();
    subServices.clear();
    querySnapshot.docs
        .map((doc) => setState(() {
              subServices.add(doc.id.toString());
            }))
        .toList();
    print("Get List Items Called.");
  }
}
