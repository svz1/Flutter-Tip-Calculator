import 'package:flutter/material.dart';

class Tips extends StatefulWidget {
  @override
  _TipsState createState() => _TipsState();
}

class _TipsState extends State<Tips> {
  int amount=100 ;

  int persons=1 ; 

  int tip=0 ; 

  int percentage=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        leading: Icon(Icons.monetization_on_sharp),
        backgroundColor: Colors.green,
        title: Text("Billing Calculator"),
        centerTitle:true,
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.ac_unit))
        
      ],
        
      ),
      

      
     
     body: Column(
      
       children: [
         Container(
           alignment: Alignment.center,
           
          
         
           margin: EdgeInsets.all(10),
           decoration:BoxDecoration(
             color: Colors.grey,
             borderRadius: BorderRadius.circular(18)
           ),

           padding: EdgeInsets.all(20),
           child: Column(
             children: [
               Text("Total Amount",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,)),
               SizedBox(height: 10,),
               Text("${calculatetotal(amount,persons)}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
            
            
            
             ],
            

           ),


         ),

         Container(
           margin: EdgeInsets.all(15),
           decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(10)
           ),
           padding: EdgeInsets.all(10),
           child: 
           Column(
              children: [
                TextField(
                  keyboardType:TextInputType.numberWithOptions(decimal: true) ,
                  decoration: InputDecoration(
                    prefixText:"Enter Amount"
                  ),

                  onChanged:(String value) {
                    try{
                      amount=int.parse(value) ;
                    }
                    catch(exception){
                      
                     amount=0  ;
                    }
                  }
                ),
                SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Split",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black,)),
                    Row(
                    children: [
                      GestureDetector(
                        onTap: () { 
                          setState(() {
                             persons+=1 ;
                            
                          });
                         
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(4)
                          ),
                          width: 25,
                          height: 25,
                          child: Text("+",style: TextStyle(color: Colors.white,fontSize: 20),),
                      
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("$persons",style: TextStyle(color: Colors.green,fontSize:20,fontWeight: FontWeight.bold),),

                        SizedBox(
                        width: 10,
                      ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              persons-=1 ;
                            });
                          },
                          child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(4)
                          ),
                          width: 25,
                          height: 25,
                          child: Text("-",style: TextStyle(color: Colors.white,fontSize: 20),),
                        
                                              ),
                        ),

                    ],
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tip",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black,)),

                    Row(
                      children: [
                        Text("${calculatetip(amount,persons,percentage)}",style: TextStyle(color: Colors.green,fontSize:20,fontWeight: FontWeight.bold))
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,

                ),
                Text("$percentage",style: TextStyle(color: Colors.orange,fontSize:20,)),
                Slider(
                   min: 0,
                   max:100,
                   divisions: 100,
                  
                  value:percentage.toDouble(), 
                  onChanged: (double newValue)

                  {
                    setState( (){
                      percentage=newValue.round() ;
                    } ) ; 

                  }) 
                
              ],

              

           ),
         )

       ],
     )
    
    
      
    );
  }
  calculatetip( amount,int persons,int percentage){
     double totaltip=0 ; 
     if(amount<=0||amount.toString().isEmpty){

     }
     else {
       totaltip=(amount*percentage)/100 ;
     } 
     return totaltip ;

  }
  calculatetotal(int amount,int persons){
    var totalperperson=(calculatetip(amount,persons,percentage)+amount)/persons ;
    
    return totalperperson ;

  }
}