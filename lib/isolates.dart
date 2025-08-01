import 'barrel1.dart';

void isolateMain(SendPort mainSend) {
  final isolateRecieve = ReceivePort();
  while (true) {
    //_sendIP();
    //print('hello from the isolate');
    //final sendIP = Future.delayed(Duration(minutes: 5), () async {});
    Timer(Duration(minutes: 1), () {});
  }
}
