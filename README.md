<img src="https://github.com/tiagosito/loading_mixin/raw/master/doc/assets/loading_mixin_full.png" width="100%" alt="logo" />
<h2 align="center">
  Want to add Loading to your app?<br/>
  With Loading Mixin you get it in a simple, fast and customizable way
</h2>

<p align="center">
<a href="https://pub.dartlang.org/packages/loading_mixin">
  <img alt="Pub Package" src="https://img.shields.io/pub/v/loading_mixin.svg">
</a>
  <a href="https://www.buymeacoffee.com/tiagosito" target="_blank"><img alt="Buy Me A Coffee" src="https://i.imgur.com/aV6DDA7.png"> </a>
</p>
 
  
## Overview

This package is for you to add loading to your application with just two words, adding this mixin to your class.


#### Contributing
  - [https://github.com/tiagosito/loading_mixin](https://github.com/tiagosito/loading_mixin)

#### For more information, see the complete example
  - [https://pub.dev/packages/loading_mixin/example](https://pub.dev/packages/loading_mixin/example)

- **[Getting Started](#getting-started)**

#### Getting Started


#### In _pubspec.yaml_:
```yaml
dependencies:
  loading_mixin: any
```

### Load type: Automatic, Custom, Manual and Predefined Time
<img src="https://github.com/tiagosito/loading_mixin/blob/master/doc/assets/loading_mixin.gif?raw=true" width="30%" alt="Loading Mixin" />

#### Basic:

#### First: in your State class, add the mixin to the LoadingMixin class
```dart
import 'package:loading_mixin/loading_mixin.dart';

class LoadingMixinTest extends StatefulWidget {
  @override
  _LoadingMixinTestState createState() => _LoadingMixinTestState();
}

//State Class
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
  .
  .
  .
  ```

#### Second: add the startLoad method by passing your asynchronous function wherever you need
```dart
  RaisedButton(onPressed: () async {
      var result = await this.startAutomaticLoad(context, requestData);

      result != null ? print('$result') : print('No data found!');
    },
    child: Text('Default Load',style: TextStyle(color: Colors.white),
    ),
  )

  //Async/HTTP request Example
  static Future requestData() async {
    await Future.delayed(Duration(milliseconds: 1500));
    return 1844;
  }
}
```

#### Custom: You can also customize your loading by passing the customLaod parameter
```dart

  RaisedButton(onPressed: () async {
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
      var result = await this.startAutomaticLoad(
        context,
        requestData,
        loadingConfig: LoadingConfig(customLoad: customLoad),
        );

      result != null ? print('$result') : print('No data found!');
    },
    child: Text(
        'Async',
        style: TextStyle(color: Colors.white),
    ),
  )

```
#### Manual Load: You can also start and finish the load manually
```dart

  RaisedButton( onPressed: () async {
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
  )

```

## Features and bugs

Please send feature requests and bugs at the [issue tracker](https://github.com/tiagosito/loading_mixin/issues).
