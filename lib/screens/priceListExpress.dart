import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum ExpressState { WashandFold, WashandIron, DryCleaning }

class PriceListExpress extends StatefulWidget {
  final ExpressState expressState;

  const PriceListExpress({Key key, @required this.expressState})
      : super(key: key);
  @override
  _PriceListExpressState createState() => _PriceListExpressState();
}

class _PriceListExpressState extends State<PriceListExpress> {
  final _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.widget.expressState == ExpressState.DryCleaning
              ? 'Dry Cleaning'
              : this.widget.expressState == ExpressState.WashandFold
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
        .collection('express')
        .document('Plg2H2JuJ2jV5ToVMr0V')
        .collection(this.widget.expressState == ExpressState.DryCleaning
            ? "dryCleaning"
            : this.widget.expressState == ExpressState.WashandFold
                ? "washAndFold"
                : "washAndIron")
        .snapshots();
  }
}
