import 'package:client/utils/global_utils.dart';
import 'package:client/utils/services/contract_service.dart';
import 'package:client/utils/services/gasprice_service.dart';
import 'package:client/utils/services/wallet_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web3dart/web3dart.dart';

class WalletController extends GetxController with StateMixin {
  static WalletController get to => Get.find();

  final WalletService _walletService = WalletService();
  final GasPriceService _gasPriceService = GasPriceService();
  final ContractService _contractService = ContractService();

  late Credentials cred;
  late EthereumAddress address;

  GasInfo? gasInfo;
  Transaction? transactionInfo;
  double totalAmount = 0;
  String lastTxHash = '';
  double maticPrice = 0;

  final _publicAdr = ''.obs;

  get publicAdr => _publicAdr.value;

  set publicAdr(value) => _publicAdr.value = value;

  final _balance = ''.obs;

  get balance => _balance.value;

  set balance(value) => _balance.value = value;

  @override
  void onInit() {
    super.onInit();
  }

  createNewWallet() async {
    try {
      change(null, status: RxStatus.loading());

      cred = _walletService.generateRandomAccount();
      address = await cred.extractAddress();
      cred.extractAddress();

      setBalance(address);

      publicAdr = address.hex;
      copyAddress();
      change(null, status: RxStatus.success());
      Get.offNamed("/wallet");
    } catch (exception) {
      change(null, status: RxStatus.error(exception.toString()));
    }
  }

  String get faucetUrl => 'https://faucet.polygon.technology/';

  void setBalance(EthereumAddress address) async {
    final amt = await ethereum.getBalance(address);
    balance = formatBalance(amt);
  }

  @override
  void onReady() {
    super.onReady();
    copyAddress();
  }

  getTransactionFee(Transaction transaction) async {
    try {
      transactionInfo = transaction;
      gasInfo = null;

      gasInfo = await _gasPriceService.getGasInfo(transaction);

      if (transactionInfo!.value == null) {
        totalAmount = gasInfo!.totalGasRequired;
      } else {
        totalAmount = gasInfo!.totalGasRequired +
            transactionInfo!.value!.getValueInUnit(EtherUnit.ether);
      }

      final contract = _contractService.priceFeed;
      final price = await ethereum.call(
        contract: contract,
        function: contract.function('getLatestPrice'),
        params: [],
      );

      maticPrice = price[0] / BigInt.from(10).pow(8);

      setBalance(address);
    } catch (e) {
      debugPrint('Error at WallerController -> GetTransactionFee: $e');
    }
  }

  void copyAddress() {
    if (publicAdr != '') {
      Future.delayed(
          const Duration(seconds: 1), () => copyToClipboard(publicAdr));
    }
  }

// @override
// void onClose() {
//   super.onClose();
// }
}
