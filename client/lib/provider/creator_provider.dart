import 'package:client/config/gql_query.dart';
import 'package:client/core/services/graphql_service.dart';
import 'package:client/models/collection.dart';
import 'package:client/models/nft.dart';
import 'package:client/models/user.dart';
import 'package:client/provider/wallet_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:web3dart/web3dart.dart';

enum CreatorState { empty, loading, loaded, success, error }

class CreatorProvider with ChangeNotifier {
  final GraphqlService _graphql;
  final WalletProvider _walletProvider;

  CreatorProvider(
    this._graphql,
    this._walletProvider,
  );

  CreatorState state = CreatorState.empty;
  String errMessage = '';

  ///VARAIBLES
  late User user;

  List<Collection> createdCollections = [];
  List<Collection> userCollections = [];
  List<NFT> collectedNFTs = [];
  List<NFT> singles = [];

  fetchCreatorInfo(String address) async {
    try {
      user = User.initEmpty(address);

      state = CreatorState.loading;

      final data = await _graphql.get(qCreator, {'uAddress': address});

      createdCollections = data['collections']
          .map<Collection>((collection) => Collection.fromMap(collection))
          .toList();

      createdCollections.sort((a, b) => b.nItems.compareTo(a.nItems));

      collectedNFTs = data['nfts'].map<NFT>((nft) => NFT.fromMap(nft)).toList();

      if (data['users'].isEmpty) {
        user = User(
          name: 'Unamed',
          uAddress: EthereumAddress.fromHex(address),
          metadata: '',
          image: 'QmWTq1mVjiBp6kPXeT2XZftvsWQ6nZwSBvTbqKLumipMwD',
        );
      } else {
        user = User.fromMap(data['users'][0]);
      }

      _handleLoaded();
    } catch (e) {
      debugPrint('Error at Creator Provider -> fetchCreator: $e');

      _handleError(e);
    }
  }

  void _handleEmpty() {
    state = CreatorState.empty;
    errMessage = '';
    notifyListeners();
  }

  void _handleLoading() {
    state = CreatorState.loading;
    errMessage = '';
    notifyListeners();
  }

  void _handleLoaded() {
    state = CreatorState.loaded;
    errMessage = '';
    notifyListeners();
  }

  void _handleSuccess() {
    state = CreatorState.success;
    errMessage = '';
    notifyListeners();
  }

  void _handleError(e) {
    state = CreatorState.error;
    errMessage = e.toString();
    notifyListeners();
  }
}
