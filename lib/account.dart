// import package, dependencies shared preferences & file
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

// class profil
class Account extends StatelessWidget {
  // method untuk menangkap data dari shared preferences (data username)
  Future<String?> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // topbar
      appBar: AppBar(
        title: Text('Profil Pengguna', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ),

      // tampilan menun profil
      body: FutureBuilder<String?>(
        future: getUsername(),
        builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
          // kondisi jika data pada shared preferences masih ditunggu
          if (snapshot.connectionState == ConnectionState.waiting) {
            // menampilkan loading
            return Center(child: CircularProgressIndicator());
          //   ketika data salah atau error akan memberikan pesan
          } else if (snapshot.hasError) {
            return Center(child: Text('Terjadi kesalahan'));
          //   ketika data diterima, namun username kosong
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('Username tidak ditemukan'));
          //   ketika data berhasil ditemukan
          } else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Card untuk membungkus (background) informasi user
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // icon user/foto user
                            Icon(
                              Icons.account_circle,
                              size: 100.0,
                              color: Colors.red,
                            ),
                            SizedBox(width: 20),
                            // informasi username user
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'User Detail :',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Username : ' + snapshot.data!,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    // section tombol logout
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        showDialog(
                        context: context,
                        builder: (BuildContext context){

                          // pesan konfirmasi logout
                          return AlertDialog(
                            title: Text('Logout'),
                            content: Text('Yakin ingin logout?'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: (){
                                    Navigator.of(context).pop();
                              },
                                  child: Text('Batal'),
                              ),
                              TextButton(
                                  // saat logout akan menghapus data user dari session & kembali ke loginpage
                                  onPressed: () async {
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    await prefs.remove('username');
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));

                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Logout Berhasil')
                                        ),
                                    );
                                  },
                                  child: Text('Logout', style: TextStyle(color: Colors.red))
                              ),
                            ],
                          );
                        });
                      },
                      child: Text('Logout', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
