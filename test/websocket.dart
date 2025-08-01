import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

Future<String?> getIP4() async {
  try {
    final client = HttpClient();
    final request4 = await client.getUrl(
        Uri.parse('https://api.ipify.org?format=jsonipAddressType=IPv4'));
    final response4 = await request4.close();
    final body = await response4.transform(utf8.decoder).join();
    final json = jsonDecode(body);
    return json['ip'];
  } catch (e) {
    print(e as String?);
    return '0.0.0.0';
  }
}

void main() async {
  final channel =
      WebSocketChannel.connect(Uri.parse((await getIP4()) as String));

  channel.stream.listen(
    (message) => print('Received: $message'),
    onDone: () => print('Connection closed'),
    onError: (error) => print('Error: $error'),
  );

  stdin.listen((data) {
    final message = String.fromCharCodes(data).trim();
    channel.sink.add(message);
  });
}
