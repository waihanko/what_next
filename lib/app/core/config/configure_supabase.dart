import 'package:higher_lower/app/constant/resources/app_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


Future configureSupabase() async {
  // init Supabase singleton
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnnonKey,
    authCallbackUrlHostname: 'login-callback',
    debug: true,
    //localStorage: SecureLocalStorage(),
  );
}

// user flutter_secure_storage to persist user session
// class SecureLocalStorage extends LocalStorage {
//   SecureLocalStorage()
//       : super(
//           initialize: () async {},
//           hasAccessToken: () {
//             const storage = FlutterSecureStorage();
//             return storage.containsKey(key: supabasePersistSessionKey);
//           },
//           accessToken: () {
//             const storage = FlutterSecureStorage();
//             return storage.read(key: supabasePersistSessionKey);
//           },
//           removePersistedSession: () {
//             const storage = FlutterSecureStorage();
//             return storage.delete(key: supabasePersistSessionKey);
//           },
//           persistSession: (String value) {
//             const storage = FlutterSecureStorage();
//             return storage.write(key: supabasePersistSessionKey, value: value);
//           },
//         );
// }
