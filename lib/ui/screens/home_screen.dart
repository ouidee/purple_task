import 'package:flutter/material.dart';
import 'package:to_do/ui/widgets/category_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _appWidth;
  double _appHeight;

  bool get _isPortrait => _appWidth < _appHeight;

  @override
  Widget build(BuildContext context) {
    _appWidth = MediaQuery.of(context).size.width;
    _appHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Flex(
          direction: _isPortrait ? Axis.vertical : Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: Text('Monday 25 September'),
            ),
            Expanded(
              flex: 6,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) => CategoryCard(
                  categoryName: 'index: $index',
                  isEmpty: index == 3 ? true : false,
                  paddingLeft: index == 0 ? 32.0 : 16.0,
                  paddingRight: index == 3 ? 32.0 : 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
