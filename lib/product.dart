// import package & file
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'data.dart';

class ProductPage extends StatefulWidget {
  // variabel untuk menarik buku
  final AllBook book;
  // variabel untuk trigger wishlist
  final VoidCallback toggleWishlist;
  final bool isInWishlist;
  // variabel untuk trigger cart
  final VoidCallback toggleCart;
  final bool isInCart;

  // menarik variabel
  ProductPage({
    required this.book,
    required this.toggleWishlist,
    required this.isInWishlist,
    required this.toggleCart,
    required this.isInCart,
  });

  // membuat state
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // membuat boolean untuk kondisi wishlist & cart
  late bool isBookInWishlist;
  late bool isBookInCart;

  // initiate toggle
  @override
  void initState() {
    super.initState();
    isBookInWishlist = widget.isInWishlist;
    isBookInCart = widget.isInCart;
  }

  @override
  Widget build(BuildContext context) {
    // membuat price sesuai currrency rupiah
    final currencyFormat = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');

    return Scaffold(
      // membuat gambar banner produk bisa scrolling
      body: CustomScrollView(
        slivers: [
          // Appbar yang lebih fleksile untuk di custom
          SliverAppBar(
            iconTheme: IconThemeData(color: Colors.white),
            expandedHeight: 350.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    widget.book.image,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ],
              ),
            ),
          ),

          // informasi product dengan sliver juga
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                // membuat teks rata kiri
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // informasi buku dari data.dart
                  Text(widget.book.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text(widget.book.author, style: TextStyle(fontSize: 18, color: Colors.grey[600])),
                  SizedBox(height: 8.0),
                  Text(currencyFormat.format(widget.book.price), style: TextStyle(color: Colors.red, fontSize: 24)),
                  Row(
                    children: [
                      Expanded(
                        child: Text('Category: ${widget.book.category}', style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                      ),

                      // tombol wishlist
                      IconButton(
                        onPressed: () {
                          // state untuk toggle wishlist (on/off)
                          setState(() {
                            isBookInWishlist = !isBookInWishlist;
                            widget.toggleWishlist();
                          });
                          // pesan toggle wishlist
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(isBookInWishlist ? 'Buku ditambahkan ke Wishlist!' : 'Buku dihapus dari Wishlist!'),
                            ),
                          );
                        },
                        icon: Icon(isBookInWishlist ? Icons.favorite : Icons.favorite_border),
                      ),

                      // tombol keranjang
                      IconButton(
                        onPressed: () {
                          // state toggle keranjang (on/off)
                          setState(() {
                            isBookInCart = !isBookInCart;
                            widget.toggleCart();
                          });
                          // pesan toggle keranjang
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(isBookInCart ? 'Buku ditambahkan ke keranjang' : 'Buku dihapus dari keranjang'),
                            ),
                          );
                        },
                        icon: Icon(isBookInCart ? Icons.shopping_cart : Icons.shopping_cart_outlined),
                      ),
                    ],
                  ),

                  SizedBox(height: 12.0),
                  Text('Deskripsi Buku', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  Text(widget.book.desc, style: TextStyle(fontSize: 14, color: Colors.grey[800])),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
