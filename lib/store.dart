// import package & file
import 'package:flutter/material.dart';
import 'data.dart';
import 'product.dart';
import 'wishlist.dart';
import 'cart.dart';

// class Store state
class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

// class state yang di extends ke class Store
class _StoreState extends State<Store> {
  // menarik data dari array data.dart
  final BookList bookList = BookList();
  // array untuk menyimpan data searchbar
  List<AllBook> filteredBooks = [];
  // array untuk menyimpan wishlist
  List<AllBook> wishlist = [];
  // array untuk menyimpan product di keranjang
  List<AllBook> cart = [];

  @override

  // fungsi untuk filter
  void initState() {
    super.initState();
    // menarik filter berdasarkan data pada array bookList
    filteredBooks = bookList.getBooks();
  }

  // fungsi hasil search
  void filterBooks(String query) {
    // array untuk menyimpan result dari search
    List<AllBook> _searchResult = [];
    _searchResult.addAll(bookList.getBooks());
    // jika search tidak kosong
    if (query.isNotEmpty) {
      List<AllBook> _searchListData = [];
      // mencari dari keseluruhan ketersediaan data
      _searchResult.forEach((book) {
        // membuat agar search tidak berpengaruh huruf kecil ataupun besar
        if (book.title.toLowerCase().contains(query.toLowerCase())) {
          _searchListData.add(book);
        }
      });
      // menampilkan hasil search yang telah di filter (presisi)
      setState(() {
        filteredBooks = [];
        filteredBooks.addAll(_searchListData);
      });
      return;
    } else {
      // menampilkan keseluruhan daftar search menyesuaikan nama (belum data presisi)
      setState(() {
        filteredBooks = [];
        filteredBooks.addAll(bookList.getBooks());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // menarik variabel currencyformat dari data.dart
    final currencyFormat = bookList.getCurrencyFormat();

    return Scaffold(
      // tampilan Appbar
      appBar: AppBar(
        title: Text('Store', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WishlistPage(wishlist: wishlist),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cart: cart),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              showSearch(context: context, delegate: BookSearch(filteredBooks));
            },
          ),
        ],
      ),

      // Tampilan store page
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        // membuat grid untuk tampilan produk
        child: GridView.builder(
          // mengatur tampilan produk
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // membuat agar hanya menampilkan 2 produk perbaris
            crossAxisCount: 2,
            // jarak horizontal&vertikal
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
            // ukuran tampilan produk
            childAspectRatio: 0.65,
          ),
          // membuat agar jumlah produk sesuai pada filter
          itemCount: filteredBooks.length,
          itemBuilder: (context, index) {
            // variabel untuk menyimpan searc,wishlist, & cart
            final book = filteredBooks[index];
            final isInWishlist = wishlist.contains(book);
            final isInCart = cart.contains(book);

            // membuat produk dapat ditekan
            return GestureDetector(
              onTap: () {
                // membuat agar saat di click pindah ke halaman ProductPage (product.dart)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductPage(
                      book: book,
                      toggleWishlist: () {
                        // set trigger untuk menambah & menghapus wishlist
                        setState(() {
                          if (isInWishlist) {
                            wishlist.remove(book);
                          } else {
                            wishlist.add(book);
                          }
                        });
                      },
                      isInWishlist: isInWishlist,

                      // set trigger untuk menambah & menghapus cart
                      toggleCart: () {
                        setState(() {
                          if (isInCart) {
                            cart.remove(book);
                          } else {
                            cart.add(book);
                          }
                        });
                      },
                      isInCart: isInCart,
                    ),
                  ),
                );
              },

              // tampilan daftar produk
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 1.0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                          image: DecorationImage(
                            image: AssetImage(book.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 20,
                            child: Text(book.title, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            height: 20,
                            child: Text(book.author, style: TextStyle(fontSize: 12)),
                          ),
                          SizedBox(height: 8.0),
                          Container(
                            height: 20,
                            child: Text(currencyFormat.format(book.price), style: TextStyle(color: Colors.red, fontSize: 13)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// class untuk searchbar
class BookSearch extends SearchDelegate<AllBook> {
  final List<AllBook> books;

  BookSearch(this.books);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      // icon untuk menghapus search data
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  // tombol back dari search
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  // Container untuk menyimpan hasil search
  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  // suggestion produk saat di search
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? []
        : books.where((book) => book.title.toLowerCase().contains(query.toLowerCase())).toList();

    // membuat agar nama produk yang di search dapat di click dan ketika di click akan emnuju productpage
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        final AllBook suggestion = suggestionList[index];
        return ListTile(
          title: Text(suggestion.title),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductPage(
                  book: suggestion,
                  toggleWishlist: () {
                    // Implementasi toggle wishlist di halaman hasil pencarian (BookSearch)
                  },
                  isInWishlist: false, // Implementasi status wishlist di halaman hasil pencarian (BookSearch)
                  toggleCart: () {
                    // Implementasi toggle cart di halaman hasil pencarian (BookSearch)
                  },
                  isInCart: false, // Implementasi status cart di halaman hasil pencarian (BookSearch)
                ),
              ),
            );
          },
        );
      },
    );
  }
}
