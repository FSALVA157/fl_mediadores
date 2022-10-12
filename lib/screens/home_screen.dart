import 'package:fl_mediadores_app/utiles/constants.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);

  static const route = "home";
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _appBarFijo(),
      body: _customBody(),
    );
  }

  AppBar _appBarFijo() => AppBar(
    elevation: 0,
    backgroundColor: kPrimaryColor,
    centerTitle: true,
    title: Text("Buenas Tardes"),
  );
}

class _customBody extends StatelessWidget {
  const _customBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double maximo = size.height  * 0.25;
    double minimo = size.height  * 0.10;
    
    return  CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          pinned: true,
          delegate: AppBarSecondary(max: maximo, min: minimo)
          ),
      ],
    );
  }
}

class AppBarSecondary extends SliverPersistentHeaderDelegate {
  final double max;
  final double min;

  const AppBarSecondary({
    Key? key, required this.max, required this.min,
  });
  
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Material(
      color: kTerceryColor,
      // child: Row(
      //   children: [
      //     IconButton(
      //       onPressed: () {},
      //      icon: Icon(Ionicons.push_outline)
      //      ),
      //   ],
      //),
    );
  }
  
  @override
  // TODO: implement maxExtent
  double get maxExtent => 150;
  
  @override
  // TODO: implement minExtent
  double get minExtent => 100;
  
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    
    return maxExtent != oldDelegate.maxExtent ||
            minExtent != oldDelegate.minExtent;
  }

  
  
}