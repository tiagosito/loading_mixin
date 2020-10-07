import 'package:flutter/material.dart';
import 'package:loading_mixin/loading_mixin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //primarySwatch: Colors.blue,
        primaryColor: Colors.deepPurple,
        buttonColor: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoadingMixinTest(),
    );
  }
}

class LoadingMixinTest extends StatefulWidget {
  @override
  _LoadingMixinTestState createState() => _LoadingMixinTestState();
}

class _LoadingMixinTestState extends State<LoadingMixinTest> with LoadingMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading Mixin'),
      ),
      body: buildBody(),
    );
  }

  buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          RaisedButton(
            onPressed: () async {
              var result = await this.startLoad(context, requestData);

              result != null ? print('$result') : print('No data found!');
            },
            child: Text(
              'Async',
              style: TextStyle(color: Colors.white),
            ),
          ),
          RaisedButton(
            onPressed: () async {
              var customLoad = Container(
                height: 50,
                width: 50,
                color: Colors.transparent,
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.yellow),
                  ),
                ),
              );
              var result = await this.startLoad(context, requestData, customLoad: customLoad);

              result != null ? print('$result') : print('No data found!');
            },
            child: Text(
              'Async',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  //HTTP request Example
  static Future requestData() async {
    await Future.delayed(Duration(milliseconds: 1500));
    return 1844;
  }
}
