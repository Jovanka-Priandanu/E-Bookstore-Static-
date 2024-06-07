// import package & file
import 'package:flutter/material.dart';
import 'data.dart';
import 'read.dart';

// List untuk menyimpan data buku yang telah di checkout
List<AllBook> library = [];

// fungsi untuk menambahkan buku pada library (checkout)
void addToLibrary(AllBook book) {
  library.add(book);
}

// class untuk tampilan library
class LibraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // topbar
      appBar: AppBar(
        title: Text('Library', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        iconTheme: IconThemeData(color: Colors.white),
      ),

      // kondisi jika library masih kosong
      body: library.isEmpty ? Center(child: Text('Library kamu masih kosong nih!'))
          : ListView.builder(
        // menampilkan daftar jumlah produk
        itemCount: library.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              // Navigasi ke halaman membaca buku saat ListTile diklik
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Read(book: library[index]),
                ),
              );
            },

            // tampilan produk di library
            leading: Image.asset(
              library[index].image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(library[index].title),
            subtitle: Text(library[index].author),
          );
        },
      ),
    );
  }
}
