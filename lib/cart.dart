// import package & file
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'data.dart';
import 'library.dart';

// class keranjang
class CartPage extends StatefulWidget {
  // menyimpan data buku dari data.dart kedalam variabel cart
  final List<AllBook> cart;
  // required data
  CartPage({required this.cart});

  @override
  _CartPageState createState() => _CartPageState();
}

// state yang extends dari class cartpage
class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    // currency rupiah untuk price
    final currencyFormat = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');

    return Scaffold(
      //topbar
      appBar: AppBar(
        title: Text('Cart', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        iconTheme: IconThemeData(color: Colors.white),
      ),

      // kondisi jika cart masih kosong (akan berisi pesan)
      body: widget.cart.isEmpty ? Center(child: Text('Keranjang masih kosong'))
          // kondisi jika menu cart terisi
          : Column(
        children: [
          Expanded(
            // listview agar tidak overflowed
            child: ListView.builder(
              // menyesuaikan data pada cart dengan banyaknya data yang tersedia
              itemCount: widget.cart.length,
              itemBuilder: (context, index) {
                return ListTile(
                  // menampilkan gambar (sesuai dengan produk yg dipilih)
                  leading: Image.asset(
                    widget.cart[index].image,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  // judul buku
                  title: Text(widget.cart[index].title),
                  // harga
                  subtitle: Text(currencyFormat.format(widget.cart[index].price)),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FractionallySizedBox(
                        // tombol checkout
                        child: ElevatedButton(
                          onPressed: () {
                            // pesan saat tombol checkout ditekan
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${widget.cart[index].title} telah di-checkout!'),
                              ),
                            );
                            // membuat produk hilang dari daftar keranjang setelah 2 detik, lalu masuk kedalam menu library (library.dart)
                            // blum pakai menu payment
                            addToLibrary(widget.cart[index]);
                            Future.delayed(Duration(seconds: 2), () {
                              setState(() {
                                widget.cart.removeAt(index);
                              });
                            });
                          },
                          // placeholder tombol
                          child: Text('Checkout', style: TextStyle(color: Colors.white, fontSize: 12)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
