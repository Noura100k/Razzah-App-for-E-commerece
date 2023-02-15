import 'dart:typed_data';

import 'package:flutter/material.dart';

@protected
Future<dynamic> _loadAsync(AssetBundleImageKey key, DecoderCallback decode) async{
  ByteData? data;

  try{
    data= await key.bundle.load(key.name);
    if(data == null){
      PaintingBinding.instance.imageCache.evict(key);
      throw StateError('Unable to read data');
    }
    return decode(data.buffer.asUint8List());
  } on FlutterError{
    PaintingBinding.instance.imageCache.evict(key);
    rethrow;
  }
}