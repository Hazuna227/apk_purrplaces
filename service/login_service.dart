import '../helpers/user_info.dart'; // Mengimpor kelas UserInfo untuk mengelola informasi pengguna.

class LoginService { // Kelas untuk mengelola proses login.
  Future<bool> login(String email, String password) async { // Fungsi untuk melakukan login, mengembalikan nilai boolean.
    bool isLogin = false; // Variabel untuk menyimpan status login, defaultnya false.
    // Memeriksa apakah email dan password cocok dengan yang telah ditentukan.
    if (email == 'Siapaaku@gmail.com' && password == '123456') { 
      await UserInfo().setToken("admin"); // Menyimpan token untuk pengguna yang berhasil login.
      await UserInfo().setUserID("1"); // Menyimpan ID pengguna untuk pengguna yang berhasil login.
      await UserInfo().setUsername("admin"); // Menyimpan nama pengguna untuk pengguna yang berhasil login.
      isLogin = true; // Mengubah status login menjadi true jika berhasil.
    }
    return isLogin; // Mengembalikan status login.
  }
}
