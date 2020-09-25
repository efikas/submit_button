# submit_button

A new Flutter package project.

## Getting Started

Submit button with spinner animation. Written in Dart. Fully customizable.

![Screenshot](https://raw.githubusercontent.com/aligorithm/assets/master/ezgif-3-faf66acba323.gif)
## Getting Started

Add this to your package's `pubspec.yaml` file

```yaml
dependencies:
  submit_button: ^0.0.1
```

## Usage

Next, you just have to import the package using:

```dart
import 'package:submit_button/submit_button.dart';
```

Then wrap your body within a `Stack` and place the `EasyLoader()` widget at the end of the `Stack`

```dart
  class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _loading = false;

  void _submit() {
    setState(() {
      _loading = true;
    });

    Future.delayed(Duration(milliseconds: 5000), () {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        children: [
          SubmitButton(
            isLoading: _loading,
            spinnerColor: Colors.green,
            backgroundColor: Colors.red,
            button: FlatButton(onPressed: _submit, child: Text("Submit")),
          ),
        ],
      )),
    );
  }
}

```
