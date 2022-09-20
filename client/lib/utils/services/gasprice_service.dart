// import 'dart:convert';

import 'package:client/utils/global_utils.dart';
import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
// import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

class GasPriceService {
  // late final http.Client _httpClient;

  Future<GasInfo> getGasInfo(Transaction transaction) async {
    try {
      final estimatedGas = await ethereum.estimateGas(
        sender: transaction.from,
        to: transaction.to,
        value: transaction.value,
        data: transaction.data,
      );

      final currentGasPrice = await ethereum.getGasPrice();

      final totalGasRequired =
          estimatedGas * currentGasPrice.getInWei / BigInt.from(10).pow(18);

      return GasInfo(
        gas: estimatedGas,
        currentGasPrice: currentGasPrice,
        totalGasRequired: totalGasRequired,
      );
    } catch (e) {
      debugPrint('Error at GasPriceService -> getGasInfo: $e');

      rethrow;
    }
  }

  // Future<BigInt> getCurrentGasPrice() async {
  //   final body = {
  //     "jsonrpc": "2.0",
  //     "method": "eth_gasPrice",
  //     "params": [],
  //     "id": 1
  //   };
  //
  //   try {
  //     final response = await _httpClient.post(
  //       Uri.parse('https://rpc-mumbai.maticvigil.com/'),
  //       body: jsonEncode(body),
  //     );
  //
  //     final data = jsonDecode(response.body);
  //
  //     final amount = hexToInt(data['result']);
  //
  //     return amount;
  //   } catch (e) {
  //     debugPrint('Error at Estimate Gas Price -> getCurrentGasPrice: $e');
  //
  //     rethrow;
  //   }
  // }
}

class GasInfo {
  final BigInt gas;

  final EtherAmount currentGasPrice;

  final double totalGasRequired;

  const GasInfo({
    required this.gas,
    required this.currentGasPrice,
    required this.totalGasRequired,
  });

  @override
  String toString() {
    return 'GasInfo -> gas: $gas, currentGasPrice: $currentGasPrice, totalGasRequired: $totalGasRequired';
  }
}
