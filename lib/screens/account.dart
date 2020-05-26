import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/services/firestore.dart';
import 'package:laundry_app/state/authState.dart';
import 'package:laundry_app/state/userState.dart';
import '../screens/settings.dart';
import '../screens/editProfile.dart';
import 'package:provider/provider.dart';
import 'package:laundry_app/state/themeNotifier.dart';
import 'package:laundry_app/utils/theme.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var _darkTheme;

  String _uid;
  @override
  void initState() {
    getUid();
    UserNotifier userNotifier =
        Provider.of<UserNotifier>(context, listen: false);
    getUsersData(userNotifier, _uid);
    super.initState();
  }

  Future<void> getUid() async {
    var uid = await Provider.of<AuthenticationState>(context, listen: false)
        .currentUserId();
    setState(() {
      this._uid = uid;
    });
  }

  @override
  Widget build(BuildContext context) {
    UserNotifier userNotifier = Provider.of<UserNotifier>(context);

    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);
    _darkTheme = (themeNotifier.getTheme() == darkTheme);
    double height = MediaQuery.of(context).size.width;
    double width = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.more_vert,
                ),
                onPressed: _modalBottomSheetMenu)
          ],
          title: Text('Profile', style: GoogleFonts.aBeeZee()),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: ListView.builder(
            itemCount: userNotifier.userProfileData.length,
            itemBuilder: (context, index) {
              var _data = userNotifier.userProfileData[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 150),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(_data.photoUrl),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          _data.username,
                          style: GoogleFonts.aBeeZee(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        _data.email,
                        style: GoogleFonts.aBeeZee(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color:
                                _darkTheme ? Colors.white54 : Colors.black54),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        _data.phone,
                        style: GoogleFonts.aBeeZee(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color:
                                _darkTheme ? Colors.white54 : Colors.black54),
                      ),
                    )
                  ],
                ),
              );
            }));
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        // backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (builder) {
          return new Container(
            padding: EdgeInsets.only(top: 10),
            height: MediaQuery.of(context).size.height * 0.2,
            // color: Color(0xFF737373), //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                  leading: new Icon(
                    Icons.edit,
                    // color: Colors.black,
                  ),
                  title: new Text(
                    'Edit Profile',
                    style: TextStyle(
                        // color: Colors.black,
                        ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EditProfile()));
                  },
                ),
                new ListTile(
                  leading: new Icon(
                    Icons.settings,
                    // color: Colors.black,
                  ),
                  title: new Text(
                    'Settings',
                    style: TextStyle(
                        // color: Colors.black,
                        ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Settings()));
                  },
                ),
              ],
            ),
          );
        });
  }
}
