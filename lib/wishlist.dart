// import package & file
import 'package:flutter/material.dart';
import 'data.dart';
import 'package:intl/intl.dart';

class WishlistPage extends StatelessWidget {
  // menyimpan data pada data.dart pada variabel wishlist
  final List<AllBook> wishlist;
  // required variabel
  WishlistPage({required this.wishlist});

  @override
  Widget build(BuildContext context) {
    // currency rupiah
    final currencyFormat = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');

    return Scaffold(
      // topbar
      appBar: AppBar(
        title: Text('Wishlist', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.red,
      ),

      // kondisi jika wishlist kosong, hanya menampilkan pesan
      body: wishlist.isEmpty ? Center(child: Text('Belum ada Wishlist', style: TextStyle(fontSize: 18)))
          // listview agar tidak pverflowed
          : ListView.builder(
        // menampilkan banyaknya daftar wishlist
        itemCount: wishlist.length,
        itemBuilder: (context, index) {
          // tampilan daftar wishlist berdasarkan informasi produk yang di wishlist
          return ListTile(
            leading: Image.asset(
              wishlist[index].image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(wishlist[index].title),
            subtitle: Text(wishlist[index].author),
            trailing: Text(currencyFormat.format(wishlist[index].price)),
          );
        },
      ),
    );
  }
}
