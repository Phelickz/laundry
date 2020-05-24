import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Services extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help, color: Colors.black,), 
            onPressed: (){})
        ],
        title:
            Text('Services', style: GoogleFonts.aBeeZee(color: Colors.black)),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: width,
              height: height / 3,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage('assets/images.jpg'),
                                fit: BoxFit.cover))),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black38),
                    ),
                    Positioned(
                      top: (height / 3) / 2.5,
                      left: width * 0.1,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Text(
                              'DRY CLEANING',
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              'Focus on other things and let us do your laundry',
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white70),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: width,
              height: height / 3,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage('assets/images (1).jpg'),
                                fit: BoxFit.cover))),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black54),
                    ),
                    Positioned(
                      top: (height / 3) / 2.5,
                      left: width * 0.21,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Text(
                              'WASH AND FOLD',
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              "Don't let those clothes pile up",
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white70),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 4,),
            Container(
              width: width,
              height: height / 3,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/Commercial-laundry-services-need-a-way-to-attract-larger-customers-_1448_40082832_0_14100389_500.jpg'),
                                fit: BoxFit.cover))),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black54),
                    ),
                    Positioned(
                      top: (height / 3) / 2.5,
                      left: width * 0.1,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Text(
                              'LAUNDRY',
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              'We can handle your Blankets, Duvets and Comforters',
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white70),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
