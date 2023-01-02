import 'package:client/config/gql_query.dart';
import 'package:client/core/services/graphql_service.dart';
import 'package:client/core/services/wallet_service.dart';
import 'package:client/models/collection.dart';
import 'package:client/models/nft.dart';
import 'package:client/provider/user_provider.dart';
import 'package:client/provider/wallet_provider.dart';
import 'package:flutter/material.dart';

enum AppState { empty, loading, loaded, success, error, unauthenticated }

class AppProvider with ChangeNotifier {
  final WalletService _walletService;
  final WalletProvider _walletProvider;
  // final FavProvider _favProvider;
  final UserProvider _userProvider;
  final GraphqlService _graphql;

  AppProvider(
    this._walletService,
    this._walletProvider,
    this._graphql,
    this._userProvider,
    // this._favProvider,
  );

  //APP PROVIDER VAR
  AppState state = AppState.empty;
  String errMessage = '';

  //HOME PAGE
  List<Collection> topCollections = [];
  List<NFT> featuredNFTs = [];

  //CREATOR PAGE
  List<Collection> userCreatedCollections = [];
  List<NFT> userCollected = [];

  // List<

  //METHODS

  initialize() async {
    final privateKey = _walletService.getPrivateKey();

    if (privateKey.isEmpty) {
      _handleUnauthenticated();
    } else {
      //FIRST - INITIALIZE WALLET
      await _walletProvider.initializeWallet();
      //HOME SCREEN DATA
      await fetchInitialData();

      //FETCH USER PAGES DATA
      _userProvider.fetchUserInfo();

      //Fav Provider
      // _favProvider.fetchFav();

      _handleLoaded();
    }
  }

  fetchInitialData() async {
    // _handleLoading();

    //FETCHING HOME SCREEN DATA
    final data = await _graphql.get(qHome, {'first': 15});

    //Model Collections
    topCollections = data['collections']
        .map<Collection>((collection) => Collection.fromMap(collection))
        .toList();

    //Model NFTS
    featuredNFTs =
        data['nfts'].map<NFT>((collection) => NFT.fromMap(collection)).toList();

    _handleLoaded();
  }

  logOut(BuildContext context) async {
    await _walletService.setPrivateKey('');

    _handleUnauthenticated();

    // scheduleMicrotask(() {
    //   Navigation.popAllAndPush(
    //     context,
    //     screen: const CreateWalletScreen(),
    //   );
    // });
  }

  void _handleEmpty() {
    state = AppState.empty;
    errMessage = '';
    notifyListeners();
  }

  void _handleLoading() {
    state = AppState.loading;
    errMessage = '';
    notifyListeners();
  }

  void _handleLoaded() {
    state = AppState.loaded;
    errMessage = '';
    notifyListeners();
  }

  void _handleUnauthenticated() {
    state = AppState.unauthenticated;
    errMessage = '';
    notifyListeners();
  }

  void _handleSuccess() {
    state = AppState.success;
    errMessage = '';
    notifyListeners();
  }

  void _handleError(e) {
    state = AppState.error;
    errMessage = e.toString();
    notifyListeners();
  }
}
