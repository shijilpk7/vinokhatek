import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description,strapColor;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
    required this.strapColor,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/watch1.png",
      "assets/images/watch1.png",
      "assets/images/watch1.png",
      "assets/images/watch1.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Watch 1",
    price: 100,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,strapColor: 'Silver and Gold'
  ),
  Product(
    id: 2,
    images: [
      "assets/images/watch2.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Watch 2",
    price: 100,
    description: description,
    rating: 4.1,
    isPopular: true,strapColor: 'Black'
  ),
  Product(
    id: 3,
    images: [
      "assets/images/watch3.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Watch 3",
    price: 100,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,strapColor: 'Blue'
  ),
  Product(
    id: 4,
    images: [
      "assets/images/watch3.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Watch 4",
    price: 100,
    description: description,
    rating: 4.1,
    isFavourite: true,strapColor: 'Blue',isPopular: true,
  ),
];

const String description =
    "Watch is a portable timepiece intended to be carried or worn by a person. It is designed to keep a consistent movement despite the motions caused by the person's activities.…";
