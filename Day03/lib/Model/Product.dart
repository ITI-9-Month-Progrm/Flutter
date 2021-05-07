import 'package:flutter/material.dart';

class Product{
  final String image, title, description;
  final int  size, id;
  final double price;
  final Color color;
  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
  });
}