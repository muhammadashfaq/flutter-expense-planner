import 'package:flutter/material.dart';

class FlexiableVsExpanded extends StatelessWidget {
  const FlexiableVsExpanded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flexible vs Expanded'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Flexible',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 100,
                color: Colors.red,
                child: const Text('Item 1'),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Container(
                  height: 100,
                  color: Colors.blue,
                  child: const Text('Item 2'),
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: Container(
                  height: 100,
                  color: Colors.orange,
                  child:const  Text('Item 3'),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Expanded',
              style: TextStyle(fontSize: 30),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Expanded is replacement of Flexible if you do not want to use the fit property of Flexible. Expanded only knows the flex configuration \n\nExpanded is perfect replacement of Flexible.',
              style: TextStyle(fontSize: 15),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  height: 100,
                  child: Text('Item 1'),
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  height: 100,
                  child: Text('Item 2'),
                  color: Colors.blue,
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  height: 100,
                  child: Text('Item 3'),
                  color: Colors.orange,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
