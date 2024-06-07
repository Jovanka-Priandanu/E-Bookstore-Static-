// import package
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';

// fungsi untuk running aplikasi
void main() {
  runApp(MyApp());
}

// class main aplikasi
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi',
      // home mengarahkkan ke class LoginPage
      home: LoginPage(),
    );
  }
}

// class LoginPage untuk state
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

// state untuk membuat variabel input data
class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // fungsi untuk pemrosesan input username&pass
  void _login(BuildContext context) async {
    if (usernameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      String username = usernameController.text;
      // validasi username & password (statis)
      if (username == 'jojo' && passwordController.text == '123') {
        // menunggu proses dari Sharedpreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        // setelah data berhasil di validasi akan berpindah ke Homepage
        await prefs.setString('username', username);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
        // snackbar saat login
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Selamat Datang $username')),
        );
      // pesan error saat username&pass salah
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Username Atau Password Salah',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))),
        );
      }
    //   pesan error saat field input kosong
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Username Dan Password Harus Diisi',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))),
      );
    }
  }

  // Tampilan utama Login page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            // background page
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/login.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.7),
          ),
          Padding(
            // memberi padding seluruh arah
            padding: EdgeInsets.all(70.0),
            child: Column(
              // membuat input menjadi di tengah
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // judul apk
                Text(
                  'Reffvision E-Book Store',
                  style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
                ),

                // field input username
                SizedBox(height: 25),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  style: TextStyle(color: Colors.red),
                ),

                // field input password
                SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  obscureText: true,
                  style: TextStyle(color: Colors.red),
                ),

                // tombol
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _login(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Text('Login', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),

          // Judul footer
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: Opacity(
              opacity: 0.5,
              child: Text(
                '© 2024 Reffvision E-Book Store made by Jovanka',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
