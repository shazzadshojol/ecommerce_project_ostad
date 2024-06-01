class Urls {
  static const String _baseUrl = 'http://ecom-api.teamrabbil.com/api';

  static const String homeSlider = '$_baseUrl/ListProductSlider';

  static const String categoryList = '$_baseUrl/CategoryList';

  static String productListCategory(int categoryId) =>
      '$_baseUrl/ListProductByCategory/$categoryId';

  static String productListByRemarks(String remark) =>
      '$_baseUrl/ListProductByRemark/$remark';

  static String productDetails(int productId) =>
      '$_baseUrl/ProductDetailsById/$productId';

  static const String createCartList = '$_baseUrl/CreateCartList';

  static String verifyEmailUrl(String email) => '$_baseUrl/UserLogin/$email';

  static String verifyOtp(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';

  static const String createProfile = '$_baseUrl/CreateProfile';
}
