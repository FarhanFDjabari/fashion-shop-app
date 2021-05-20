import 'package:fashion_shop/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../pages/product_detail_screen.dart';
import 'favorite_button.dart';

class ProductGrid extends StatefulWidget {
  String category;
  Function callback;
  final bool favoriteMode;

  ProductGrid({
    Key key,
    @required this.category,
    @required this.favoriteMode,
    this.callback,
  }) : super(key: key);

  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: productList.length < 1 && !widget.favoriteMode
          ? Center(
              child: Column(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    child: Lottie.asset('images/empty_grid.json'),
                  ),
                  Text('No Products'),
                ],
              ),
            )
          : favoriteProductList.length < 1 && widget.favoriteMode
              ? Center(
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        child: Lottie.asset('images/empty_grid.json'),
                      ),
                      Text('No Favorites'),
                    ],
                  ),
                )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: widget.favoriteMode
                      ? favoriteProductList.length
                      : productList.length,
                  itemBuilder: (context, index) {
                    if (widget.category != 'All' && !widget.favoriteMode) {
                      if (productList[index].category == widget.category) {
                        return InkWell(
                          borderRadius: BorderRadius.circular(15),
                          onTap: () => Navigator.of(context)
                              .push(
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailScreen(
                                    product: widget.favoriteMode
                                        ? favoriteProductList[index]
                                        : productList[index],
                                  ),
                                ),
                              )
                              .then(widget.callback),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  color: Colors.grey.shade300,
                                  child: Container(
                                    width: 180,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: Image.asset(
                                            widget.favoriteMode
                                                ? favoriteProductList[index]
                                                    .assetImages
                                                : productList[index]
                                                    .assetImages,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 5,
                                          right: 5,
                                          child: FavoriteButton(
                                            product: widget.favoriteMode
                                                ? favoriteProductList[index]
                                                : productList[index],
                                            isFavorite: widget.favoriteMode,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  widget.favoriteMode
                                      ? favoriteProductList[index].name
                                      : productList[index].name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  widget.favoriteMode
                                      ? "Rp ${favoriteProductList[index].price.toString()}"
                                      : "Rp ${productList[index].price.toString()}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          margin: EdgeInsets.all(8.0),
                          width: 180,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        );
                      }
                    } else {
                      return InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: () => Navigator.of(context)
                            .push(
                              MaterialPageRoute(
                                builder: (context) => ProductDetailScreen(
                                  product: widget.favoriteMode
                                      ? favoriteProductList[index]
                                      : productList[index],
                                ),
                              ),
                            )
                            .then(widget.callback),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                color: Colors.grey.shade300,
                                child: Container(
                                  width: 180,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Image.asset(
                                          widget.favoriteMode
                                              ? favoriteProductList[index]
                                                  .assetImages
                                              : productList[index].assetImages,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 5,
                                        right: 5,
                                        child: FavoriteButton(
                                          product: widget.favoriteMode
                                              ? favoriteProductList[index]
                                              : productList[index],
                                          isFavorite: widget.favoriteMode,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                widget.favoriteMode
                                    ? favoriteProductList[index].name
                                    : productList[index].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                widget.favoriteMode
                                    ? "Rp ${favoriteProductList[index].price.toString()}"
                                    : "Rp ${productList[index].price.toString()}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
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