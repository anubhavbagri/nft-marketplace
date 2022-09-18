import 'dart:math';

import 'package:get_storage/get_storage.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

class WalletService {
  Credentials generateRandomAccount() {
    final cred = EthPrivateKey.createRandom(Random.secure());

    final key = bytesToHex(
      cred.privateKey,
      padToEvenLength: true,
    );

    setPrivateKey(key);

    return cred;
  }

  // ///Retrieve cred from private key
  // Credentials initalizeWallet([String? key]) =>
  //     EthPrivateKey.fromHex(key ?? getPrivateKey());
  //
  // ///Retrieve Private key from prefs
  // ///If not present send empty
  // String getPrivateKey() => _prefs.getString('user_private_key') ?? '';

  Future<void> setPrivateKey(String value) async =>
      GetStorage().write("user_private_key", value);
}
