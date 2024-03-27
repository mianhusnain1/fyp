import 'package:doctor/main.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: MediaQuery.of(context).size.width - 270,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Image.asset("images/doctor.png", fit: BoxFit.cover,),
      
    );
  }
  
}
class TextContainer extends StatefulWidget {
   TextContainer({super.key, required this.Icons, required this.Search, required this.isobscure, required this.controller,});
final IconData Icons;
final TextEditingController controller;
final String Search;
final bool isobscure;

  @override
  State<TextContainer> createState() => _TextContainerState();
  
}

class _TextContainerState extends State<TextContainer> {
  final GlobalKey<FormState> _formstate = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    
    return  Container(
        
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(const Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4,
              offset: Offset(1, 1)
            )
          ]
        ),
        
height: MediaQuery.of(context).size.height * 0.065,
      width: MediaQuery.of(context).size.width - 60,

      child: Form(
        key: _formstate,
        child: Center(
          child: TextFormField(
            
            controller: widget.controller,
            obscureText: widget.isobscure,
            
            decoration: InputDecoration(
            
             prefixIcon: Icon(widget.Icons, color: Colors.grey,),
             hintText: widget.Search,
             hintStyle: const TextStyle(color: Colors.grey),
             border: InputBorder.none
             
            ),
          ),
        ),
      ),

      
    );
  }
}

class btn extends StatelessWidget {
  const btn({super.key, required this.title, required this.action});
final String title;
final VoidCallback action;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Container(
        width: MediaQuery.of(context).size.width - 60,
        height: MediaQuery.of(context).size.height *0.060,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: myColor,
          boxShadow: [ BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 4,
            offset: const Offset(1, 1),
            
          )]
        ),
        child: Center(
        child: Text(title, style: const TextStyle( color: Colors.black, fontSize: 20),),
        ),
    
      ),
    );
  }
}
class MainTop extends StatelessWidget {
  const MainTop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.175,

      width: MediaQuery.of(context).size.width,
      // child: SvgPicture.asset(
      //   "images/bg.svg",
      // ),
      child: Image.asset(
        "images/Bg.png",
        fit: BoxFit.cover,
      ),
    );
  }
}