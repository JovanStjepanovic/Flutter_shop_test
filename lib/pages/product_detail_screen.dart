import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/global_variable.dart';

class ProductDetailsPage extends StatefulWidget {
 
 final Map<String,Object>product;
 
  const ProductDetailsPage({
    super.key,
    required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
    
    int shoeSize =0; 

    void onTap(){
        
        if(shoeSize!=0){
 
          Provider.of<CartProvider>(context, listen: false).addProduct({

              
      'id':widget.product['id'],
      'title':widget.product['title'],
      'price':widget.product['price'],
      'company':widget.product['company'],
      'size': shoeSize,
      'imageUrl':widget.product['imageUrl'],
 


          });    

        ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text('Product added sucessfully')));
       
        }else{

            ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text('Please select a size!')));

        }
       
    }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
      ),
             
       body: Column(
        
        children: [
           
            Text(widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,), 
             const Spacer(),
             Padding(
               padding: const EdgeInsets.all(16.0),
               child: Image.asset(
                widget.product['imageUrl'] as String,
                height: 250,),
             ),
             const Spacer(flex: 2,),

              Container(
               height: 200,
               width: double.infinity,
               decoration: BoxDecoration(
                color: const Color.fromRGBO(245, 247, 249, 1), 
                borderRadius: BorderRadius.circular(40),
                ),
                    child: Column( 
                      mainAxisAlignment: MainAxisAlignment.center,                    
                      children: [

                         Text('\$${widget.product['price']}',
                          style: Theme.of(context).textTheme.titleLarge,),
            
                        const   SizedBox(height: 10,),
                   
                         
                         SizedBox(
                           height: 50,
                           child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: (widget.product['sizes'] as List<int>).length,
                            itemBuilder: (context,index){
                             
                             final sizes = (widget.product['sizes'] as List<int>)[index];
                                                 
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: (){
                                       setState(() {
                                         shoeSize=sizes;
                                       }); 
                                      },
                                      child: Chip(
                                        backgroundColor: shoeSize == sizes ? Theme.of(context).colorScheme.primary : null,
                                        label: Text(sizes.toString())),
                                    ),
                                  );



                           }),
                         ),
                    

       
                         
                      
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ElevatedButton.icon(
                          onPressed: onTap, 
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            fixedSize: const Size(350,50),                                   
                          ),
                          label: const Text('Add to Cart',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),                 
                            ),                                           
                          icon: const Icon(Icons.shopping_cart, color: Colors.black,),
                          ),
                      ),

                   
 
                      ]
                        
                         ),              
              )

        ]),
    );
 
  }
}