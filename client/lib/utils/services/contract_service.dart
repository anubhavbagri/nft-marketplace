import 'package:client/config/config.dart';
import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';

class ContractService {
  late final DeployedContract collection;
  late final DeployedContract marketPlace;
  late final DeployedContract priceFeed;

  ContractService() {
    _init();
  }

  Future<void> _init() async {
    //collection
    collection = await _loadABI(
      'assets/abi/CreateCollection.json',
      'CreateCollection',
      createCollectionAddress,
    );

    //price feed
    priceFeed = await _loadABI(
      'assets/abi/Pricefeed.json',
      'Pricefeed',
      priceFeedAddress,
    );

    //Marketplace
    marketPlace = await _loadABI(
      'assets/abi/Exibit.json',
      'Exibit',
      exibitAddress,
    );
  }

  Future<DeployedContract> _loadABI(
    String path,
    String name,
    String contractAddress,
  ) async {
    String abiString = await rootBundle.loadString(path);

    final contract = DeployedContract(
      ContractAbi.fromJson(abiString, name),
      EthereumAddress.fromHex(contractAddress),
    );

    return contract;
  }

//Load Collection Contract on the go
  Future<DeployedContract> loadCollectionContract(
    String contractAddress,
  ) async =>
      await _loadABI(
        'assets/abi/CreateCollection.json',
        'CreateCollection',
        contractAddress,
      );
}
