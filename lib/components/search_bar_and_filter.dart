import 'package:flutter/material.dart';

class SearchBarAndFilter extends StatelessWidget {
  const SearchBarAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27),
      child: Row(
        children: [Expanded(child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius:7,
                // spreadRadius: 1,
                // offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Padding(padding: EdgeInsets.symmetric(horizontal:15, vertical:10),
          child: Row(
            children: [
              Icon(Icons.search, color: Colors.black45,size: 32,),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Where to?",style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),),
                  SizedBox(height:20,width: 225,child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Destination, city, or place",
                      hintStyle: TextStyle(
                        color: Colors.black45,
                        fontSize: 14,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    ),
                  ),
                ],

              )
            ],
          ),
        ))),
        SizedBox(width:8),Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black54,
            border: Border.all(color: Colors.black54),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.tune, color: Colors.white,size: 30,),
        )
        ],
        
      ),
    );
  }
}
