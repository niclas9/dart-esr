import 'package:dart_esr/dart_esr.dart';

void main(List<String> arguments) => actionExample();

Future<void> actionExample() async {
  print('Action');
  var esr = EOSIOSigningrequest('https://jungle2.cryptolions.io', 'v1',
      chainName: ChainName.EOS_JUNGLE2);

  var auth = <Authorization>[ESRConstants.PlaceholderAuth];

  var data = <String, String>{'name': 'data'};

  var action = Action()
    ..account = 'eosnpingpong'
    ..name = 'ping'
    ..authorization = auth
    ..data = data;

  var encoded = await esr.encodeAction(action);
  print('encoded : ' + encoded);

  var decoded = esr.deserialize(encoded);
  print('decoded : ' + decoded.toString());
}
