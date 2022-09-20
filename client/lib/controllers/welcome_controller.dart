import 'package:client/utils/global_utils.dart';
import 'package:get/get.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:walletconnect_secure_storage/walletconnect_secure_storage.dart';
import 'package:web3dart/web3dart.dart';

class WelcomeController extends GetxController {
  static WelcomeController get to => Get.find();

  late WalletConnect connector;

  // final _displayUri = ''.obs;
  // get displayUri => _displayUri.value;
  // set displayUri(value) => _displayUri.value = value;

  final _account = ''.obs;

  get account => _account.value;

  set account(value) => _account.value = value;

  final _balance = ''.obs;

  get balance => _balance.value;

  set balance(value) => _balance.value = value;

  @override
  void onInit() {
    super.onInit();
    initWalletConnect();
  }

  Future initWalletConnect() async {
    // Define a session storage
    final sessionStorage = WalletConnectSecureStorage();
    final session = await sessionStorage.getSession();

    // Create a connector
    connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      session: session,
      sessionStorage: sessionStorage,
      clientMeta: const PeerMeta(
        name: 'exibit eth',
        description: 'NFT Marketplace for local artists',
        url: 'https://walletconnect.org',
        icons: [
          'https://user-images.githubusercontent.com/56643117/189768647-86da362e-21cc-42a4-86f4-be379e572ca6.png?alt=media'
        ],
      ),
    );

    account = session?.accounts.first ?? '';

    connector.registerListeners(
      onConnect: (status) {
        account = status.accounts[0];
      },
    );

    // getBalance();
  }

  Future<SessionStatus?> connect() async {
    // Create a new session
    if (connector.connected) {
      return SessionStatus(
        chainId: connector.session.chainId,
        accounts: connector.session.accounts,
      );
    }
    return await _createSession(chainId: 137);
  }

  Future<SessionStatus?> _createSession({
    int? chainId,
  }) async {
    try {
      final session = await connector.createSession(
          chainId: chainId,
          onDisplayUri: (uri) async {
            // displayUri = uri;
            openUrl(uri);
          });
      print('^^^^^^^^^^ Connected: $session');
      setBalance();
      Get.offAllNamed("/main-screen");
      return session;
    } catch (e) {
      print(e);
    }
    return null;
  }

  bool validateAddress({required String address}) {
    try {
      EthereumAddress.fromHex(address);
      return true;
    } catch (_) {
      return false;
    }
  }

  void setBalance() async {
    final address = EthereumAddress.fromHex(connector.session.accounts[0]);
    final amount = await ethereum.getBalance(address);
    balance = formatBalance(amount);
  }

  // @override
  // void onReady() {
  //   super.onReady();
  //   initWalletConnect();
  // }

  @override
  void onClose() {
    super.onClose();
    connector.killSession();
  }
}
