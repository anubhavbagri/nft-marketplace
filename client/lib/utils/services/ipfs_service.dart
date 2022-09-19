import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:client/config/config.dart';
import 'package:client/constants/env.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class IPFSService {
  final storage = GetStorage();

  Future<http.Response> getImage(String cid) async {
    try {
      final response = await http.get(Uri.parse(ipfsURL + cid));

      return response;
    } catch (e) {
      debugPrint('Error at IPFS Service - getImage: $e');

      rethrow;
    }
  }

  Future<Map<String, dynamic>> getJson(String cid) async {
    try {
      //CHECK FOR CACHE FIRST
      final cache = _checkCache(cid);

      if (cache != null) {
        return jsonDecode(cache);
      }

      final response = await http.get(Uri.parse(ipfsURL + cid));

      final data = jsonDecode(response.body);

      //CACHE RESPONSE
      _cacheResponse(cid, response.body);

      return data;
    } catch (e) {
      debugPrint('Error at IPFS Service - getJson: $e');

      rethrow;
    }
  }

  _checkCache(String cid) {
    return storage.read('getJson-$cid');
  }

  _cacheResponse(String cid, String body) async {
    await storage.write('getJson-$cid', body);

    Timer(const Duration(seconds: 15), () async {
      await storage.remove('getJson-$cid');

      debugPrint('Removed cache');
    });
  }

  Future<String> uploadMetaData(Map<String, dynamic> body) async {
    try {
      final response = await http.post(
        Uri.parse('https://api.nft.storage/upload'),
        headers: {
          'Authorization': 'Bearer $nftStorageKey',
          'content-type': 'application/json',
        },
        body: jsonEncode(body),
      );

      final data = jsonDecode(response.body);

      final cid = data['value']['cid'];

      debugPrint('CID OF METADATA -> $cid');

      return cid;
    } catch (e) {
      debugPrint('Error at IPFS Service - uploadMetaData: $e');

      rethrow;
    }
  }

  Future<String> uploadImage(String imgPath) async {
    try {
      final bytes = File(imgPath).readAsBytesSync();

      final response = await http.post(
        Uri.parse('https://api.nft.storage/upload'),
        headers: {
          'Authorization': 'Bearer $nftStorageKey',
          'content-type': 'image/*'
        },
        body: bytes,
      );

      final data = jsonDecode(response.body);

      final cid = data['value']['cid'];

      debugPrint('CID OF IMAGE -> $cid');

      return cid;
    } catch (e) {
      debugPrint('Error at IPFS Service - uploadImage: $e');

      rethrow;
    }
  }
}
