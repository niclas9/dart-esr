import 'package:dart_esr/dart_esr.dart';

main(List<String> args) => actionExample();

Future<void> actionExample() async {
  var auth = <Authorization>[ESRConstants.PlaceholderAuth];

  var data = <String, String>{'name': 'data'};

  var action = Action()
    ..account = 'eosnpingpong'
    ..name = 'ping'
    ..authorization = auth
    ..data = data;

  var args = SigningRequestCreateArguments(
      action: action,
      chainId: ESRConstants.ChainIdLookup[ChainName.EOS_JUNGLE2],
      info: {'key': 'sctfgkhlkjnlm'});
  SigningRequestEncodingOptions options = defaultSigningRequestEncodingOptions(
      nodeUrl: 'https://jungle.greymass.com');

  try {
    var request = await SigningRequestManager.create(args, options: options);
    var uri = request.encode();
    print('action\n' + uri);
  } catch (e) {
    print(e.toString());
  }
}
