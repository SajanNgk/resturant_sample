/// All the assets used in the app are defined here.

class Assets {
  static const _images = 'assets/images';
  static const _icons = 'assets/icons';
  // static const _svgs = 'assets/svgs';
  // static const _gifs = 'assets/gifs';

  // Images
  static const appLogo = '$_images/logo.png';

  // Icons
  /// [BottomNavigationBar] icons.
  static const homeIcon = '$_icons/home_icon.svg';
  static const categoryIcon = '$_icons/category_icon.svg';
  static const cartIcon = '$_icons/cart_icon.svg';
  static const profileIcon = '$_icons/profile_icon.svg';

  // GIFs

  /// Dummy products [List] for testing purposes.
  static const hotDummyProducts = [
    '$_images/headphone_13.png',
    '$_images/jeans_4.png',
    '$_images/ring_7.png',
  ];

  static const topSellerDummyProducts = [
    '$_images/bag_5.png',
    '$_images/bag_6.png',
    '$_images/bag_3.png',
  ];

  static const topRatedDummyProducts = [
    '$_images/headphones_2.png',
    '$_images/headphones_3.png',
    '$_images/headphones.png',
  ];
}
