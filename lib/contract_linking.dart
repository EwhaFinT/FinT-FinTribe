import 'package:flutter/material.dart';

class ContractLinking extends ChangeNotifier {
  final String _rpcUrl = "http://127.0.0.1:7545";
  final String _wsUrl = "ws://127.0.0.1:7545/";
  final String _privateKey = "2ce7b7b027a52950ecaaef468099045367babcfc84df4a88804fa5af7cefa730";


  Web3Client _client;
  bool isLoading = true;

  String _abiCode;
  EthereumAddress _contractAddress;

  Credentials _credentials;

  DeployedContract _contract;

  ContractFunction _buyNFT;

  String deployedName;

  ContractLinking() {
    initialSetup();
  }

  initialSetup() async {
    // establish a connection to the ethereum rpc node. The socketConnector
    // property allows more efficient event streams over websocket instead of
    // http-polls. However, the socketConnector property is experimental.
    _client = Web3Client(_rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(_wsUrl).cast<String>();
    });

    await getAbi();
    await getCredentials();
    await getDeployedContract();
  }

  Future<void> getAbi() async {

    // Reading the contract abi
    String abiStringFile =
    await rootBundle.loadString("src/artifacts/NFTMarket.json");
    var jsonAbi = jsonDecode(abiStringFile);
    _abiCode = jsonEncode(jsonAbi["abi"]);

    _contractAddress =
        EthereumAddress.fromHex(jsonAbi["networks"]["5777"]["address"]);
  }

  Future<void> getCredentials() async {
    _credentials = await _client.credentialsFromPrivateKey(_privateKey);
  }

  Future<void> getDeployedContract() async {

    // Telling Web3dart where our contract is declared.
    _contract = DeployedContract(
        ContractAbi.fromJson(_abiCode, "NFTMarket"), _contractAddress);

    // Extracting the functions, declared in contract.
    // _yourName = _contract.function("yourName");
    // _setName = _contract.function("setName");
    // getName();
    _buyNFT = _contract.function("buyNFT");
    buy();
  }
  buy() async {
    var tf = await _client
      .call(contract: _contract, function: _buyNFT, params: []);

    notifyListeners();
  }
  // getName() async {
  //
  //   // Getting the current name declared in the smart contract.
  //   var currentName = await _client
  //       .call(contract: _contract, function: _yourName, params: []);
  //   deployedName = currentName[0];
  //   isLoading = false;
  //   notifyListeners();
  // }

  setName(String nameToSet) async {

    // Setting the name to nameToSet(name defined by user)
    isLoading = true;
    notifyListeners();
    await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
            contract: _contract, function: _setName, parameters: [nameToSet]));
    getName();
  }
}