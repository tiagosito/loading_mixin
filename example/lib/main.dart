import 'package:flutter/material.dart';
import 'package:loading_mixin/loadig_configuration.dart';
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
      child: Center(
        child: ListView(
          children: [
            RaisedButton(
              onPressed: () async {
                var result = await this.startAutomaticLoad(context, requestData);

                result != null ? print('$result') : print('No data found!');
              },
              child: Text(
                'Default Load',
                style: TextStyle(color: Colors.white),
              ),
            ),
            RaisedButton(
              onPressed: () async {
                var customLoad = Center(
                  child: Center(
                    child: Container(
                      height: 150,
                      width: 150,
                      child: CircularProgressIndicator(
                        strokeWidth: 25,
                        backgroundColor: Colors.deepPurple,
                        valueColor: new AlwaysStoppedAnimation<Color>(Colors.yellow),
                      ),
                    ),
                  ),
                );
                var result = await this.startAutomaticLoad(
                  context,
                  requestData,
                  loadingConfig: LoadingConfig(customLoad: customLoad),
                );

                result != null ? print('$result') : print('No data found!');
              },
              child: Text(
                'Custom Load',
                style: TextStyle(color: Colors.white),
              ),
            ),
            RaisedButton(
              onPressed: () async {
                //Open Load
                var ovelayEntry = this.startManualLoad(context);

                //Your code
                print('Put your code here!');
                await Future.delayed(Duration(seconds: 2));

                //Close Load
                this.endManualLoad(context, ovelayEntry);
              },
              child: Text(
                'Manual Load',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //HTTP request Example
  static Future requestData() async {
    await Future.delayed(Duration(milliseconds: 1500));
    return 1844;
  }
}
