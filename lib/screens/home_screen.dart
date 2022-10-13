import 'package:fl_mediadores_app/utiles/constants.dart';
//import 'package:fl_mediadores_app/widgets/widgets.dart';

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
    double maximo = size.height  * 0.22;
    double minimo = size.height  * 0.14;
    
    return  CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverPersistentHeader(
          pinned: true,
          delegate: AppBarSecondary(max: maximo, min: minimo)
          ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              _bodyOptions(),              
              SizedBox(height: 1000,)
            ]
          )
          )
      ],
    );
  }

  ExpansionPanelList _bodyOptions(){
          return  ExpansionPanelList.radio(
            animationDuration: Duration(milliseconds: 500),
            expandedHeaderPadding: EdgeInsets.all(10),
            elevation: 3,
            children: [
              //ExpansionPanelRadio(value: value, headerBuilder: headerBuilder, body: body)
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
    final progress = shrinkOffset/maxExtent;

    return Align(
      alignment: Alignment.center,
      child: Material(
        child: Container(
          height: this.max,
          color: kTerceryColor,
          child: Stack(                        
            children: [
                Positioned(
                  top: 5,
                  left: 10,                  
                  child: AnimatedButton(progress: progress)),
                Positioned(
                  top: 5,
                  left: 0,
                  right: 0,
                  child: AnimatedText(progress: progress)),
                Positioned(
                  top: 5,
                  right: 10,
                  child: AnimatedWidget(progress: progress))
            ],
          ) 
          ),
        ),
      //),
    );
  }
  
  @override
  
  double get maxExtent => this.max;
  
  @override
  
  double get minExtent => this.min;
  
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    
    return maxExtent != oldDelegate.maxExtent ||
            minExtent != oldDelegate.minExtent;
  }

  
  
}


class AnimatedWidget extends StatelessWidget {
  final double progress;

  const AnimatedWidget({Key? key, required this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _currentImageSize = (120 * (1 - this.progress)).clamp(95, 120);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      margin: const EdgeInsets.only(bottom: 20),
      width: _currentImageSize,
      height: _currentImageSize,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        //color: Colors.black38,
        image: DecorationImage(
          image: AssetImage('assets/manos.png'),
          fit: BoxFit.fill
          )
      ),
      alignment: Alignment.lerp(
          Alignment.bottomCenter,
          Alignment.topCenter,
          progress),
      );
  }
}

class AnimatedText extends StatelessWidget {
final double progress;

  const AnimatedText({
    Key? key, required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
 //   final loginProvider = Provider.of<LoginProvider>(context);
   // final String nombre = loginProvider.correo;
    
    //print(nombre);
    return AnimatedContainer(
      duration:const Duration(milliseconds: 100),
       alignment: Alignment.lerp(
          Alignment.topCenter,
          Alignment.bottomCenter,
          progress),
        child: Text(
              '2',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle.lerp(
                Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.white, overflow: TextOverflow.clip, fontSize: 80),
                Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.white,fontSize: 50),
                progress,
              ),
        ),
      
      );
  }
}


class AnimatedButton extends StatelessWidget {
final double progress;

  const AnimatedButton({
    Key? key, required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
 //   final double _currentImageSize = (120 * (1 - this.progress)).clamp(95, 120);
 //   final loginProvider = Provider.of<LoginProvider>(context);
   // final String nombre = loginProvider.correo;
    
    //print(nombre);
    return AnimatedContainer(
      duration:const Duration(milliseconds: 100),
       alignment: Alignment.lerp(
          Alignment.center,
          Alignment.topCenter,
          progress),
        child: IconButton(
          onPressed: () {},
          icon: Icon(Ionicons.calendar_number_outline,
           size: (80 * (1 - this.progress)).clamp(55, 80),
           color: Colors.blue[100]
           ,)
          )    
      
      );
  }
}