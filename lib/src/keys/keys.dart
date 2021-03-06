
import 'package:nanodart/src/crypto/blake2b.dart';
import 'package:nanodart/src/crypto/tweetnacl_blake2b.dart';
import 'package:nanodart/src/keys/seeds.dart';
import 'package:nanodart/src/util.dart';

class NanoKeys {
  static String seedToPrivate(String seed, int index) {
    assert(NanoSeeds.isValidSeed(seed));
    assert(index >= 0);
    return NanoHelpers.byteToHex(Blake2b.digest256(
            [NanoHelpers.hexToBytes(seed), NanoHelpers.intToBytes(index, 4)]))
        .toUpperCase();
  }

  static String createPublicKey(String privateKey) {
    assert(NanoSeeds.isValidSeed(privateKey));
    return NanoHelpers.byteToHex(
        Nano.pkFromSecret(NanoHelpers.hexToBytes(privateKey)));
  }
}
