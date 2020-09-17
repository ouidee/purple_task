import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:purple_task/globals/globals.dart';

class SettingsScreen extends StatelessWidget {
  final Color backgroundColor;

  const SettingsScreen({
    Key key,
    @required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _appWidth = MediaQuery.of(context).size.width;
    bool _isWide = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // colored background
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.grey[850],
                      backgroundColor,
                    ]),
              ),
            ),
            // container for settings
            Positioned(
              width: _isWide ? 550 : _appWidth,
              top: _isWide ? 50 : 0,
              bottom: _isWide ? 50 : 0,
              child: Hero(
                tag: 'settings',
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        const BoxShadow(
                          color: Color(0xff45000000),
                          offset: Offset(0.0, 4.0),
                          blurRadius: 8.0,
                        ),
                      ]),
                ),
              ),
            ),
            Positioned(
              width: _isWide ? 550 : _appWidth,
              top: _isWide ? 50 : 0,
              bottom: _isWide ? 50 : 0,
              child: Column(
                children: [
                  const SizedBox(height: 8.0),
                  // back button and title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(AntIcons.arrow_left),
                        color: Colors.grey[700],
                        tooltip: CLOSE,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      Text(
                        SETTINGS,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox(width: 40.0),
                    ],
                  ),
                  SizedBox(height: 32.0),
                  Expanded(
                    child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        children: [
                          Divider(),
                          ListTile(
                            title: Text(DISPLAY_TIME_COMPLETED),
                            trailing: Switch(
                              value: true,
                              onChanged: null,
                            ),
                          ),
                          Divider(),
                          ListTile(
                            title: Text(DATE_FORMAT),
                          ),
                          Divider(),
                          ListTile(
                            title: Text(TIME_FORMAT),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
