// import package & file
import 'package:flutter/material.dart';
import 'data.dart';

class Read extends StatefulWidget {
  // variabel untuk menyimpan array data.dart
  final AllBook book;

  Read({
    required this.book,
  });

  @override
  _ReadState createState() => _ReadState();
}

// state untuk tampilan buku (mirip pada product.dart)
class _ReadState extends State<Read> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // customscrollview untuk gambar banner
      body: CustomScrollView(
        slivers: [
          // sliverappbar agar lebih fleksibel dimodifikasi & styling
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

          // tampilan informasi buku
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.book.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text(widget.book.author, style: TextStyle(fontSize: 18, color: Colors.grey[600])),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Expanded(
                        child: Text('Category: ${widget.book.category}', style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  Text('Deskripsi Buku', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  Text(widget.book.desc, style: TextStyle(fontSize: 14, color: Colors.grey[800])),

                  // section baca volume buku
                  SizedBox(height: 12.0),
                  Text('Baca ${widget.book.title} :', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  SizedBox(height: 16.0),
                  // tombol untuk membaca buku
                  ElevatedButton(
                    // saat di klik akan mengarah ke class artikel (isi buku)
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Volume1Page(book: widget.book),
                        ),
                      );
                    },
                    child: Text('Volume 1', style: TextStyle(color: Colors.red)),
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.black,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class untuk membaca buku
class Volume1Page extends StatelessWidget {
  // variabel untuk data buku
  final AllBook book;

  Volume1Page({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // topbar
      appBar: AppBar(
        title: Text('Volume 1', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        iconTheme: IconThemeData(color: Colors.white),
      ),

      // tampilan artikel berdasarkan data vol1 pada arrrat data.dart (saat ini baru volume 1)
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              book.vol1,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}