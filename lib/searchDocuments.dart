import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'documentInfo.dart';

List<String> certificates = [];
List<String> magisterial = [];
List<String> miscellaneous = [];
List<String> revenue = [];
List<String> rti = [];
List<String> social = [];
List<String> supply = [];

List<String> services = [
  "Certificates",
  "Magisterial",
  "Miscellaneous",
  "Revenue",
  "RTI",
  "Social Security",
  "Supply"
];
List<String> subServices = [];

class SearchDocuments extends StatefulWidget {
  const SearchDocuments({super.key});

  @override
  State<SearchDocuments> createState() => _SearchDocumentsState();
}

class _SearchDocumentsState extends State<SearchDocuments> {
  TextEditingController _searchController = new TextEditingController();
  bool _isSuffixIconVisible = false;
  List _resultsList = [];

  @override
  void initState() {
    // TODO: implement initState
    subServices.clear();
    for (int i = 0; i < services.length; i++) {
      getListitems(services[i], i);
      print("Called");
    }
    _resultsList = subServices;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Documents Here"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      _isSuffixIconVisible = value.isNotEmpty;
                    });
                    searchResultsList();
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blue[100],
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(width: 0, style: BorderStyle.none),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey[800],
                    ),
                    suffixIcon: AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: _isSuffixIconVisible ? 1.0 : 0.0,
                      child: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: ListView.builder(
                      itemCount: _resultsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 5, bottom: 5),
                          child: GestureDetector(
                            onTap: () {
                              if (certificates.contains(_resultsList[index])) {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          DocumentInfo(
                                        cName: "Certificates",
                                        docName: _resultsList[index],
                                      ),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        const begin = Offset(0.0, 1.0);
                                        const end = Offset.zero;
                                        final tween =
                                            Tween(begin: begin, end: end);
                                        final offsetAnimation =
                                            animation.drive(tween);

                                        return SlideTransition(
                                          position: offsetAnimation,
                                          child: child,
                                        );
                                      },
                                    ));
                              } else if (magisterial
                                  .contains(_resultsList[index])) {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          DocumentInfo(
                                        cName: "Magisterial",
                                        docName: _resultsList[index],
                                      ),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        const begin = Offset(0.0, 1.0);
                                        const end = Offset.zero;
                                        final tween =
                                            Tween(begin: begin, end: end);
                                        final offsetAnimation =
                                            animation.drive(tween);

                                        return SlideTransition(
                                          position: offsetAnimation,
                                          child: child,
                                        );
                                      },
                                    ));
                              } else if (miscellaneous
                                  .contains(_resultsList[index])) {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          DocumentInfo(
                                        cName: "Miscellaneous",
                                        docName: _resultsList[index],
                                      ),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        const begin = Offset(0.0, 1.0);
                                        const end = Offset.zero;
                                        final tween =
                                            Tween(begin: begin, end: end);
                                        final offsetAnimation =
                                            animation.drive(tween);

                                        return SlideTransition(
                                          position: offsetAnimation,
                                          child: child,
                                        );
                                      },
                                    ));
                              } else if (revenue
                                  .contains(_resultsList[index])) {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          DocumentInfo(
                                        cName: "Revenue",
                                        docName: _resultsList[index],
                                      ),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        const begin = Offset(0.0, 1.0);
                                        const end = Offset.zero;
                                        final tween =
                                            Tween(begin: begin, end: end);
                                        final offsetAnimation =
                                            animation.drive(tween);

                                        return SlideTransition(
                                          position: offsetAnimation,
                                          child: child,
                                        );
                                      },
                                    ));
                              } else if (rti.contains(_resultsList[index])) {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          DocumentInfo(
                                        cName: "RTI",
                                        docName: _resultsList[index],
                                      ),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        const begin = Offset(0.0, 1.0);
                                        const end = Offset.zero;
                                        final tween =
                                            Tween(begin: begin, end: end);
                                        final offsetAnimation =
                                            animation.drive(tween);

                                        return SlideTransition(
                                          position: offsetAnimation,
                                          child: child,
                                        );
                                      },
                                    ));
                              } else if (social.contains(_resultsList[index])) {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          DocumentInfo(
                                        cName: "Social Security",
                                        docName: _resultsList[index],
                                      ),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        const begin = Offset(0.0, 1.0);
                                        const end = Offset.zero;
                                        final tween =
                                            Tween(begin: begin, end: end);
                                        final offsetAnimation =
                                            animation.drive(tween);

                                        return SlideTransition(
                                          position: offsetAnimation,
                                          child: child,
                                        );
                                      },
                                    ));
                              } else if (supply.contains(_resultsList[index])) {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          DocumentInfo(
                                        cName: "Supply",
                                        docName: _resultsList[index],
                                      ),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        const begin = Offset(0.0, 1.0);
                                        const end = Offset.zero;
                                        final tween =
                                            Tween(begin: begin, end: end);
                                        final offsetAnimation =
                                            animation.drive(tween);

                                        return SlideTransition(
                                          position: offsetAnimation,
                                          child: child,
                                        );
                                      },
                                    ));
                              }
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => DocumentInfo(
                              //             docName: subServices[index])));
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
                                      _resultsList[index],
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  searchResultsList() {
    var showResults = [];

    if (_searchController.text != "") {
      for (var subService in subServices) {
        var title = subService.toLowerCase();

        if (title.contains(_searchController.text.toLowerCase())) {
          showResults.add(subService);
        }
      }
    } else {
      showResults = List.from(subServices);
    }
    setState(() {
      _resultsList = showResults;
    });
  }

  Future<void> getListitems(String value, int index) async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection(value).get();
    querySnapshot.docs
        .map((doc) => setState(() {
              switch (index) {
                case 0:
                  {
                    certificates.add(doc.id.toString());
                    // statements;
                  }
                  break;

                case 1:
                  {
                    magisterial.add(doc.id.toString());
                    //statements;
                  }
                  break;
                case 2:
                  {
                    miscellaneous.add(doc.id.toString());
                    //statements;
                  }
                  break;
                case 3:
                  {
                    revenue.add(doc.id.toString());
                    //statements;
                  }
                  break;
                case 4:
                  {
                    rti.add(doc.id.toString());
                    //statements;
                  }
                  break;
                case 5:
                  {
                    social.add(doc.id.toString());
                    //statements;
                  }
                  break;
                case 6:
                  {
                    supply.add(doc.id.toString());
                    //statements;
                  }
                  break;

                default:
                  {
                    print("Error");
                    //statements;
                  }
                  break;
              }
              subServices.add(doc.id.toString());
            }))
        .toList();
    print("Get List Items Called.");
  }
}
