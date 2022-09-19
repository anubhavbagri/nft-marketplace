import 'package:client/utils/global_utils.dart';
import 'package:client/utils/services/wallet_service.dart';
import 'package:get/get.dart';
import 'package:web3dart/web3dart.dart';

class WalletController extends GetxController with StateMixin {
  static WalletController get to => Get.find();
  final WalletService _walletService = WalletService();

  late Credentials cred;
  late EthereumAddress address;

  final _publicAdr = ''.obs;

  get publicAdr => _publicAdr.value;

  set publicAdr(value) => _publicAdr.value = value;

  final _balance = ''.obs;

  get balance => _balance.value;

  set balance(value) => _balance.value = value;

  @override
  void onInit() {
    super.onInit();
    // initWalletConnect();
  }

  createNewWallet() async {
    try {
      change(null, status: RxStatus.loading());

      cred = _walletService.generateRandomAccount();
      address = await cred.extractAddress();
      cred.extractAddress();

      setBalance(address);

      publicAdr = address.hex;

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
