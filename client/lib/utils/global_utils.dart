import 'package:client/config/config.dart';
import 'package:client/themes/app_dimensions.dart';
import 'package:client/widgets/custom_glassmorphic_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web3dart/web3dart.dart';

String formatBalance(EtherAmount? balance, [int precision = 4]) =>
    balance == null
        ? '0'
        : balance.getValueInUnit(EtherUnit.ether).toStringAsFixed(precision);

String formatAddress(String address) =>
    '${address.substring(0, 4)}...${address.substring(38, 42)}';

void copyToClipboard(String data) async {
  await Clipboard.setData(ClipboardData(text: data));

  Get.snackbar(data, 'Copied to clipboard');
}

final ethereum = Web3Client(
  rpcURL,
  Client(),
);

void showCustomBottomSheet({
  required Widget child,
  required double height,
  Color? bottomSheetColor,
  bool isDismissible = false,
  bool enableDrag = true,
  void action,
}) {
  Get.bottomSheet(
    CustomGlassmorphicContainer(
      height: height,
      width: double.infinity,
      widget: child,
    ),
    isScrollControlled: true,
    enableDrag: enableDrag,
    isDismissible: isDismissible,
    backgroundColor: bottomSheetColor ?? Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppDimensions.buttonBorderRadius * 1.5),
      ),
    ),
  );
}

openUrl(String url) async {
  // if (await canLaunchUrl(Uri.parse(url))) {
  await launchUrl((Uri.parse(url)));
  // }
}

// share(
//     String title,
//     String image,
//     String description,
//     ) async {
//   try {
//     Fluttertoast.showToast(msg: 'Please wait');
//     final imageUrl = 'https://ipfs.io/ipfs/$image';
//
//     final response = await http.get(Uri.parse(imageUrl));
//     final bytes = response.bodyBytes;
//     final temp = await getTemporaryDirectory();
//     final path = '${temp.path}/image.jpg';
//
//     File(path).writeAsBytesSync(bytes);
//
//     const link = ' ';
//
//     await Share.shareFiles(
//       [path],
//       text: 'Have a look at ' +
//           title +
//           ' on Mintit. Download here https://drive.google.com/drive/folders/1C5y4Tv5_5WRmpK1faeO1tOliHs31J_w1?usp=sharing',
//       subject: description + link,
//     );
//   } catch (e) {
//     // ignore: avoid_print
//     print('Error at share: $e');
//   }
// }
