import 'package:dart_esr/dart_esr.dart';

void main(List<String> arguments) => actionsExample();

Future<void> actionsExample() async {
  print('Actions');
  var esr = EOSIOSigningrequest('https://jungle2.cryptolions.io', 'v1',
      chainName: ChainName.EOS_JUNGLE2);

  var auth = <Authorization>[ESRConstants.PlaceholderAuth];

  var data1 = <String, String>{'name': 'data1'};

  var action1 = Action()
    ..account = 'eosnpingpong'
    ..name = 'ping'
    ..authorization = auth
    ..data = data1;

  var data2 = <String, String>{'name': 'data2'};

  var action2 = Action()
    ..account = 'eosnpingpong'
    ..name = 'ping'
    ..authorization = auth
    ..data = data2;

  var actions = <Action>[action1, action2];

  var encoded = await esr.encodeActions(actions);
  print('encoded : ' + encoded);

  var decoded = esr.deserialize(encoded);
  print('decoded : ' + decoded.toString());
}
