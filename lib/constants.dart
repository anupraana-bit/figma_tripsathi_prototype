import 'package:flutter/material.dart';

// Colors
const kGreen = Color(0xFF0B5D4B);
const kLightGreen = Color(0xFFE3F1EC);

// Image links (replace with your own anytime)
const imgHero = 'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=900';
const imgEverest = 'https://images.unsplash.com/photo-1486870591958-9b9d0d1dda99?w=900';
const imgAnnapurna = 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=600';
const imgLangtang = 'https://images.unsplash.com/photo-1519681393784-d120267933ba?w=600';
const imgMardi = 'https://images.unsplash.com/photo-1454496522488-7a8e488e8606?w=600';
const imgProfile = 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300';

// Network image that shows a grey box if it fails to load
class NetImage extends StatelessWidget {
  final String url;
  final double? width, height;
  const NetImage(this.url, {super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: width,
      height: height,
      fit: BoxFit.cover,
      errorBuilder: (c, e, s) => Container(
        width: width,
        height: height,
        color: Colors.blueGrey,
        child: const Icon(Icons.landscape, color: Colors.white),
      ),
    );
  }
}