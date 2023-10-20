
import 'package:flutter/material.dart';
import 'package:shop_app/global_variable.dart';
import 'package:shop_app/widgtes/product_card.dart';
import 'package:shop_app/pages/product_detail_screen.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  
  
  
   
   final List<String>  filters= const ['All',  'Addidas', 'Nike','Sergio Tachini' ];
   
   late String selectedfFilter ;
   int currentPage= 0;
 
 
    @override
  void initState() {
    super.initState();
     selectedfFilter= filters[0];
  
  }
 
  
  
  
  
  @override
  Widget build(BuildContext context) {
  
 

    const border= OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
                      borderSide: BorderSide(
                        
                        color: Color.fromRGBO(225, 225, 225, 1),
                    ),
                      );
   
  
  
   return Scaffold(

      body:  SafeArea(
       child: Column(
          children: [
            
              Row( 
                children: [

                   Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text('Shoes \nCollection',
                                   style: Theme.of(context).textTheme.titleLarge,
                                 ),
                    ),
                
              const  Expanded(
                  child: TextField(
                  decoration: InputDecoration(
                    hintText:"Search",
                    prefixIcon: Icon(Icons.search),
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                    ),
                  ),
                ),
          

           

                ],
              ),
            
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    key: const Key('Cat list'),
                    itemCount: filters.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      
                      final filter = filters[index];
                
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: GestureDetector(
                           onTap: () {                         
                           setState(() {
                               selectedfFilter=filter;
                            });
                            
                           },
                          child: Chip(
                            backgroundColor: selectedfFilter==filter ? Theme.of(context).colorScheme.primary : const Color.fromRGBO(245, 247, 249, 1),
                            side:const BorderSide(color: Color.fromRGBO(245, 247, 249, 1) ),
                            label: Text(filter),
                            labelStyle:const TextStyle(fontSize: 16),
                            padding: const EdgeInsets.symmetric(
                              vertical:15,
                              horizontal: 18),
                             shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                             ),                          
                            ),
                        ),
                      );
                    }),
                ),


                 
                  Expanded(
                    child: LayoutBuilder(
                      
                      builder: (context,constraints){
                       
                       if(constraints.maxWidth>1080){
                        return         GridView.builder(                           
                              itemCount: products.length,
                             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                               childAspectRatio: 1.75,
                               crossAxisCount: 2), 
                             itemBuilder: (context,index){
                  
                               final product= products[index];
                              
                              return GestureDetector(
                                onTap: (){
                                 Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  
                                   return ProductDetailsPage(product: product);
                                 }));
                                },
                                child: Productcard(
                                 title:product['title'] as String,
                                 price: product['price'] as double,
                                 image: product['imageUrl'] as String,
                                 backgroundColor: index.isEven ? const Color.fromRGBO(215, 240, 253, 1) : const Color.fromRGBO(245, 247, 249, 1),
                  
                                )
                  
                                );
                             },
                        
                        
                         );
                       }
                         
                         else{
                          return ListView.builder  (
                            key: const Key('products'),
                    itemCount: products.length,
                    itemBuilder: (context,index){
                         
                         final product= products[index];
                         
                         return GestureDetector(
                           onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  
                              return ProductDetailsPage(product: product);
                            }));
                           },
                           child: Productcard(
                            title:product['title'] as String,
                            price: product['price'] as double,
                            image: product['imageUrl'] as String,
                            backgroundColor: index.isEven ? const Color.fromRGBO(215, 240, 253, 1) : const Color.fromRGBO(245, 247, 249, 1),
                           ),
                         );
                                 
                    }
                    ); 
                         }
                  
                    },
                      ),
                  ),


                


          ],
        ),
      ),
    );
  }
}