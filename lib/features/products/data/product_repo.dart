import 'package:ultera_shopping/features/products/domain/product.dart';
import 'package:ultera_shopping/utils/id_gen.dart';

class ProductRepo {
  List<Product> getProducts() {
    return [
      Product(
        name: 'KTM Enduro 390 Motercycle/Bike Orange',
        imageLink:
            'https://m.media-amazon.com/images/I/71fvH2BN9-L._SX522_.jpg',
        price: 89999,
        id: Utils.generateRandomId(),
      ),
      Product(
        name: 'Bajaj Avenger 220 Cruise Motorcycle/Motorbike',
        imageLink:
            'https://m.media-amazon.com/images/I/51zNfi2-HlL._SL1000_.jpg',
        id: Utils.generateRandomId(),
        price: 84999,
      ),
      Product(
        name: 'Bajaj Pulsar Rs 200 Motorcycle/Motorbike - Brooklyn Black',
        imageLink:
            'https://m.media-amazon.com/images/I/51Bwgp3URHL._SX522_.jpg',
        id: Utils.generateRandomId(),
        price: 49999,
      ),
      Product(
        name:
            'Hero MotoCorp DESTINI 125 FI ZX+ DSSC (OBD2B) Scooter Pearl Fadless White',
        imageLink:
            'https://m.media-amazon.com/images/I/61agMR857NL._SX522_.jpg',
        id: Utils.generateRandomId(),
        price: 34999,
      ),
    ];
  }
}
