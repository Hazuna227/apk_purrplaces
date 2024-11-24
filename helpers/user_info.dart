import 'package:shared_preferences/shared_preferences.dart'; // Mengimpor paket SharedPreferences untuk menyimpan data lokal.

const String TOKEN = "token"; // Mendefinisikan kunci untuk menyimpan token.
const String USER_ID = "userID"; // Mendefinisikan kunci untuk menyimpan ID pengguna.
const String USERNAME = "username"; // Mendefinisikan kunci untuk menyimpan nama pengguna.

class UserInfo { // Kelas untuk mengelola informasi pengguna.
  Future setToken(String value) async { // Fungsi untuk menyimpan token.
    final SharedPreferences pref = await SharedPreferences.getInstance(); // Mengambil instance SharedPreferences.
    return pref.setString(TOKEN, value); // Menyimpan token ke SharedPreferences.
  }

  Future<String?> getToken() async { // Fungsi untuk mengambil token.
    final SharedPreferences pref = await SharedPreferences.getInstance(); // Mengambil instance SharedPreferences.
    return pref.getString(TOKEN); // Mengembalikan token dari SharedPreferences.
  }

  Future setUserID(String value) async { // Fungsi untuk menyimpan ID pengguna.
    final SharedPreferences pref = await SharedPreferences.getInstance(); // Mengambil instance SharedPreferences.
    return pref.setString(USER_ID, value); // Menyimpan ID pengguna ke SharedPreferences.
  }

  Future<String> getUserID() async { // Fungsi untuk mengambil ID pengguna.
    final SharedPreferences pref = await SharedPreferences.getInstance(); // Mengambil instance SharedPreferences.
    return pref.getString(USER_ID).toString(); // Mengembalikan ID pengguna dari SharedPreferences sebagai string.
  }

  Future setUsername(String value) async { // Fungsi untuk menyimpan nama pengguna.
    final SharedPreferences pref = await SharedPreferences.getInstance(); // Mengambil instance SharedPreferences.
    return pref.setString(USERNAME, value); // Menyimpan nama pengguna ke SharedPreferences.
  }

  Future<String> getUsername() async { // Fungsi untuk mengambil nama pengguna.
    final SharedPreferences pref = await SharedPreferences.getInstance(); // Mengambil instance SharedPreferences.
    return pref.getString(USERNAME).toString(); // Mengembalikan nama pengguna dari SharedPreferences sebagai string.
  }

  Future<void> logout() async { // Fungsi untuk mengeluarkan pengguna.
    final SharedPreferences pref = await SharedPreferences.getInstance(); // Mengambil instance SharedPreferences.
    pref.clear(); // Menghapus semua data dari SharedPreferences.
  }
}
