import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum RegularState { WashandFold, WashandIron, DryCleaning }

class PriceListRegular extends StatefulWidget {
  final RegularState regularState;

  const PriceListRegular({Key key, @required this.regularState})
      : super(key: key);
  @override
  _PriceListRegularState createState() => _PriceListRegularState();
}

class _PriceListRegularState extends State<PriceListRegular> {
  final _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.widget.regularState == RegularState.DryCleaning
              ? 'Dry Cleaning'
              : this.widget.regularState == RegularState.WashandFold
                  ? "Wash and Fold"
                  : "Wash and Iron",
          style: GoogleFonts.aBeeZee(),
        ),
      ),
      body: Container(
        height: height,
        width: width,
        child: StreamBuilder(
          stream: getPricesDataSnapshots(context),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      var _data = snapshot.data.documents[index];
                      return SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Card(
                              child: ListTile(
                                subtitle: Text("1pc"),
                                title: Text(
                                  "Bed Sheets",
                                  style: GoogleFonts.aBeeZee(
                                      fontWeight: FontWeight.w600),
                                ),
                                trailing: Text(
                                  _data['bedsheets'].toString(),
                                  style: GoogleFonts.aBeeZee(
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                subtitle: Text("1pc"),
                                title: Text(
                                  "Duvets",
                                  style: GoogleFonts.aBeeZee(
                                      fontWeight: FontWeight.w600),
                                ),
                                trailing: Text(
                                  _data['duvet'].toString(),
                                  style: GoogleFonts.aBeeZee(
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                subtitle: Text("1pc"),
                                title: Text(
                                  "Native",
                                  style: GoogleFonts.aBeeZee(
                                      fontWeight: FontWeight.w600),
                                ),
                                trailing: Text(
                                  _data['native'].toString(),
                                  style: GoogleFonts.aBeeZee(
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                subtitle: Text("1pc"),
                                title: Text(
                                  "Shirts",
                                  style: GoogleFonts.aBeeZee(
                                      fontWeight: FontWeight.w600),
                                ),
                                trailing: Text(
                                  _data['shirts'].toString(),
                                  style: GoogleFonts.aBeeZee(
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                subtitle: Text("1pc"),
                                title: Text(
                                  "Trousers",
                                  style: GoogleFonts.aBeeZee(
                                      fontWeight: FontWeight.w600),
                                ),
                                trailing: Text(
                                  _data['trousers'].toString(),
                                  style: GoogleFonts.aBeeZee(
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }

  Stream<QuerySnapshot> getPricesDataSnapshots(BuildContext context) async* {
    yield* _firestore
        .collection('prices')
        .document('RbOPMcojfut9poVnUDlB')
        .collection('regular')
        .document('whQvgzq6e4v7Ey0W48bo')
        .collection(this.widget.regularState == RegularState.DryCleaning
            ? "dryCleaning"
            : this.widget.regularState == RegularState.WashandFold
                ? "washAndFold"
                : "washAndIron")
        .snapshots();
  }
}
