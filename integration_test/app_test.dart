
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/main.dart' as app;
import 'package:shop_app/pages/product_detail_screen.dart';
import 'package:shop_app/widgtes/product_list.dart';



void main(){

IntegrationTestWidgetsFlutterBinding.ensureInitialized;




group('selectitn sizes', () {  

testWidgets('changing size choice annd checking if correct size is in cart then deleting', (tester) async {
app.main();

await tester.pumpAndSettle();

await  Future.delayed(const Duration (seconds: 2));

await tester.drag(find.text('Men\'s Nike Shoes'), const Offset(0.00, -300));

await tester.pumpAndSettle();

await  Future.delayed(const Duration (seconds: 2));

await tester.tap(find.byType(Container).at(1));

await tester.pumpAndSettle();

expect(find.byType(ProductDetailsPage), findsOneWidget);

await  Future.delayed(const Duration (seconds: 2));

await tester.tap(find.text('40'));

await tester.pumpAndSettle();

expect(tester.widget<Chip>(find.byType(Chip).at(0)).backgroundColor, const Color.fromRGBO(254, 206, 1, 1));

await  Future.delayed(const Duration (seconds: 2));

await tester.tap(find.text('43'));

await tester.pumpAndSettle();

expect(tester.widget<Chip>(find.byType(Chip).at(3)).backgroundColor, const Color.fromRGBO(254, 206, 1, 1));

await  Future.delayed(const Duration (seconds: 2));


await tester.tap(find.text('41'));

await tester.pumpAndSettle();

expect(tester.widget<Chip>(find.byType(Chip).at(1)).backgroundColor, const Color.fromRGBO(254, 206, 1, 1));

await  Future.delayed(const Duration (seconds: 2));

await tester.tap(find.byIcon(Icons.shopping_cart));

await  Future.delayed(const Duration (seconds: 2));


await tester.tap(find.byType(BackButton));

await tester.pumpAndSettle();

await  Future.delayed(const Duration (seconds: 2));

await tester.tap(find.byIcon(Icons.shopping_cart));


await tester.pumpAndSettle();

expect(find.text('Size 41'), findsOneWidget);


});


testWidgets('changing size choice another shoe annd checking if correct size is in cart then deleting', (tester) async {
app.main();

await tester.pumpAndSettle();

await  Future.delayed(const Duration (seconds: 2));

await tester.drag(find.byKey(const Key('products')), const Offset(0.00, -650));

await tester.pumpAndSettle();

 await  Future.delayed(const Duration (seconds: 2));

await tester.tap(find.text('Men\'s Rebook Shoes'));

await tester.pumpAndSettle();

expect(find.byType(ProductDetailsPage), findsOneWidget);

await  Future.delayed(const Duration (seconds: 2));

await tester.tap(find.text('41'));

await tester.pumpAndSettle();

expect(tester.widget<Chip>(find.byType(Chip).at(0)).backgroundColor, const Color.fromRGBO(254, 206, 1, 1));

await  Future.delayed(const Duration (seconds: 2));

await tester.tap(find.text('43'));

await tester.pumpAndSettle();

expect(tester.widget<Chip>(find.byType(Chip).at(2)).backgroundColor, const Color.fromRGBO(254, 206, 1, 1));

await  Future.delayed(const Duration (seconds: 2));


await tester.tap(find.text('42'));

await tester.pumpAndSettle();

expect(tester.widget<Chip>(find.byType(Chip).at(1)).backgroundColor, const Color.fromRGBO(254, 206, 1, 1));

await  Future.delayed(const Duration (seconds: 2));

await tester.tap(find.byIcon(Icons.shopping_cart));

await  Future.delayed(const Duration (seconds: 2));


await tester.tap(find.byType(BackButton));

await tester.pumpAndSettle();

await  Future.delayed(const Duration (seconds: 2));

await tester.tap(find.byIcon(Icons.shopping_cart));


await tester.pumpAndSettle();

expect(find.text('Size 42'), findsOneWidget);


});





});





group('startup ', () {

testWidgets('home screen ', (widgetTester) async {


app.main();
await widgetTester.pumpAndSettle();


expect(find.text('All'), findsOneWidget);
expect(find.text('Addidas'), findsOneWidget);
expect(find.text('Nike'), findsOneWidget);
expect(find.text('Sergio Tachini'), findsOneWidget);
expect(find.byType(TextField), findsOneWidget);

await Future.delayed( const Duration(seconds: 1));



});


testWidgets('cart ', (widgetTester) async {


app.main();
await widgetTester.pumpAndSettle();


await Future.delayed( const Duration(seconds:  1));

await widgetTester.tap(find.byIcon(Icons.shopping_cart));

await widgetTester.pumpAndSettle();

expect(find.text('Cart'), findsOneWidget);


expect(find.byType(ListTile), findsNothing);


});







 });



group('category switchng', () { 


testWidgets('switching between categories', (tester) async { 


app.main();
await tester.pumpAndSettle();


var colorSelected =const Color.fromRGBO(254, 206, 1, 1);
var colorNotSelected = const Color.fromRGBO(245, 247, 249, 1);


expect(tester.widget<Chip>(find.byType(Chip).at(0)).backgroundColor , colorSelected);

expect(tester.widget<Chip>(find.byType(Chip).at(1)).backgroundColor , colorNotSelected);
expect(tester.widget<Chip>(find.byType(Chip).at(2)).backgroundColor , colorNotSelected);
expect(tester.widget<Chip>(find.byType(Chip).at(3)).backgroundColor , colorNotSelected);


await Future.delayed( const Duration(seconds: 2));

await tester.tap((find.byType(Chip).at(1)));

await tester.pumpAndSettle();


expect(tester.widget<Chip>(find.byType(Chip).at(0)).backgroundColor , colorNotSelected);
expect(tester.widget<Chip>(find.byType(Chip).at(1)).backgroundColor , colorSelected);
expect(tester.widget<Chip>(find.byType(Chip).at(2)).backgroundColor , colorNotSelected);
expect(tester.widget<Chip>(find.byType(Chip).at(3)).backgroundColor , colorNotSelected);


await Future.delayed( const Duration(seconds: 2));

await tester.tap((find.byType(Chip).at(2)));

await tester.pumpAndSettle();


expect(tester.widget<Chip>(find.byType(Chip).at(0)).backgroundColor , colorNotSelected);
expect(tester.widget<Chip>(find.byType(Chip).at(1)).backgroundColor , colorNotSelected);
expect(tester.widget<Chip>(find.byType(Chip).at(2)).backgroundColor , colorSelected);
expect(tester.widget<Chip>(find.byType(Chip).at(3)).backgroundColor , colorNotSelected);



await Future.delayed( const Duration(seconds: 2));


await tester.drag(find.byKey( const Key('Cat list')) ,const Offset(-130, 0.0));

await tester.pumpAndSettle();

await tester.tap((find.text('Sergio Tachini')));

await tester.pumpAndSettle();


expect(tester.widget<Chip>(find.byType(Chip).at(0)).backgroundColor , colorNotSelected);
expect(tester.widget<Chip>(find.byType(Chip).at(1)).backgroundColor , colorNotSelected);
expect(tester.widget<Chip>(find.byType(Chip).at(2)).backgroundColor , colorSelected);







});






});



group('select and add to cart', () { 

testWidgets('seelct first item , add it to the cart, check the cart page , remove item from cart ', (tester) async {


app.main();

await tester.pumpAndSettle();

expect(find.byType(Chip), findsNWidgets(4));
expect(find.byType(TextField), findsOneWidget);
expect(find.byType(Container), findsNWidgets(4));


await Future.delayed( const Duration(seconds: 2));


await tester.tap(find.byType(Container).at(0));

await tester.pumpAndSettle();

expect(find.byType(ProductDetailsPage), findsOneWidget);


 await Future.delayed( const Duration(seconds: 2));

await tester.tap(find.byType(Chip).at(0));

await tester.tap(find.byIcon(Icons.shopping_cart));

await tester.pumpAndSettle();

expect(find.byType(ScaffoldMessenger), findsOneWidget);

await tester.tap(find.byType(BackButton));

await tester.pumpAndSettle();

expect(find.byType(ProductList), findsOneWidget);

await tester.tap(find.byIcon(Icons.shopping_cart));

await tester.pumpAndSettle();


await Future.delayed( const Duration(seconds: 2));

expect(find.byType(ListTile), findsOneWidget);

expect(find.text('Men\'s Sergio Tachini'), findsOneWidget);

await Future.delayed( const Duration(seconds: 2));

await tester.tap(find.byIcon(Icons.delete));

await tester.pumpAndSettle();

expect(find.byType(AlertDialog), findsOneWidget);

await tester.tap(find.text('Yes'));

await tester.pumpAndSettle();

expect(find.text('Men\'s Sergio Tachini'), findsNothing);

});


testWidgets('seelct second item , add it to the cart, check the cart page , remove item from cart ', (tester) async {


app.main();

await tester.pumpAndSettle();

expect(find.byType(Chip), findsNWidgets(4));
expect(find.byType(TextField), findsOneWidget);
expect(find.byType(Container), findsNWidgets(4));


await Future.delayed( const Duration(seconds: 2));

await tester.drag(find.text('Men\'s Nike Shoes'), const Offset(0.0, -300));

await tester.pumpAndSettle();

await tester.tap(find.byType(Container).at(1));

await tester.pumpAndSettle();

expect(find.byType(ProductDetailsPage), findsOneWidget);


 await Future.delayed( const Duration(seconds: 2));


await tester.tap(find.byType(Chip).at(1));

await tester.tap(find.byIcon(Icons.shopping_cart));

await tester.pumpAndSettle();

expect(find.byType(ScaffoldMessenger), findsOneWidget);

await tester.tap(find.byType(BackButton));

await tester.pumpAndSettle();

expect(find.byType(ProductList), findsOneWidget);

await tester.tap(find.byIcon(Icons.shopping_cart));

await tester.pumpAndSettle();


await Future.delayed( const Duration(seconds: 2));


expect(find.text('Men\'s Nike Shoes'), findsOneWidget);

await Future.delayed( const Duration(seconds: 2));

await tester.tap(find.byIcon(Icons.delete));

await tester.pumpAndSettle();

expect(find.byType(AlertDialog), findsOneWidget);

await tester.tap(find.text('Yes'));

await tester.pumpAndSettle();

expect(find.text('Men\'s Nike Shoes'), findsNothing);

});


} );



group('add shoes one by one and check', () {

testWidgets('big test', (tester) async{

app.main();
await tester.pumpAndSettle();


await Future.delayed( const Duration(seconds: 2));


await tester.tap(find.byType(Container).at(0));

await tester.pumpAndSettle();

expect(find.byType(ProductDetailsPage), findsOneWidget);


 await Future.delayed( const Duration(seconds: 2));

await tester.tap(find.byType(Chip).at(0));

await tester.tap(find.byIcon(Icons.shopping_cart));

await tester.pumpAndSettle();

expect(find.byType(ScaffoldMessenger), findsOneWidget);

await tester.tap(find.byType(BackButton));

await tester.pumpAndSettle();



await Future.delayed( const Duration(seconds: 2));

await tester.drag(find.byKey(const Key('products')), const Offset(0.0, -300));

await tester.pumpAndSettle();

await tester.tap(find.byType(Container).at(1));

await tester.pumpAndSettle();

expect(find.byType(ProductDetailsPage), findsOneWidget);


 await Future.delayed( const Duration(seconds: 2));

await tester.tap(find.byType(Chip).at(1));

await Future.delayed( const Duration(seconds: 2));

await tester.tap(find.byIcon(Icons.shopping_cart));

await tester.pumpAndSettle();

expect(find.byType(ScaffoldMessenger), findsOneWidget);

await tester.tap(find.byType(BackButton));

await tester.pumpAndSettle();




await Future.delayed( const Duration(seconds: 2));

await tester.drag(find.byKey(const Key('products')), const Offset(0.0, -350));

await tester.pumpAndSettle();

await tester.tap(find.text('Men\'s Rebook Shoes'));

await tester.pumpAndSettle();

expect(find.byType(ProductDetailsPage), findsOneWidget);


 await Future.delayed( const Duration(seconds: 2));


await tester.tap(find.byType(Chip).at(1));

await Future.delayed( const Duration(seconds: 2));

await tester.tap(find.byIcon(Icons.shopping_cart));

await tester.pumpAndSettle();

expect(find.byType(ScaffoldMessenger), findsOneWidget);

await tester.tap(find.byType(BackButton));

await tester.pumpAndSettle();



await Future.delayed( const Duration(seconds: 2));

await tester.drag(find.byKey(const Key('products')), const Offset(0.0, -350));

await tester.pumpAndSettle();

await tester.tap(find.text('Men\'s Lasocki Shoes'));

await tester.pumpAndSettle();

expect(find.byType(ProductDetailsPage), findsOneWidget);


 await Future.delayed( const Duration(seconds: 2));


await tester.tap(find.byType(Chip).at(1));

await Future.delayed( const Duration(seconds: 2));

await tester.tap(find.byIcon(Icons.shopping_cart));

await tester.pumpAndSettle();

expect(find.byType(ScaffoldMessenger), findsOneWidget);

await tester.tap(find.byType(BackButton));

await tester.pumpAndSettle();

await Future.delayed(const Duration(seconds: 2));

await tester.tap(find.byIcon(Icons.shopping_cart));

await tester.pumpAndSettle();

expect(find.text('Men\'s Lasocki Shoes'), findsOneWidget);
expect(find.text('Men\'s Rebook Shoes'), findsOneWidget);
expect(find.text('Men\'s Nike Shoes'), findsOneWidget);
expect(find.text('Men\'s Sergio Tachini'), findsOneWidget);

expect(find.text('Size 40'), findsOneWidget);
expect(find.text('Size 41'), findsOneWidget);
expect(find.text('Size 42'), findsNWidgets(2));


});







 });













}