import 'package:flutter_inappwebview/flutter_inappwebview.dart';

const String newsAPIBaseURL = 'https://newsapi.org/v2';
const String newsAPIKey = '33ffbb0690aa468fa844672b2d8395b0'; // ff957763c54c44d8b00e5e082bc76cb0
const String countryQuery = 'us';
const String categoryQuery = 'general';
const String kDefaultImage = "https://www.google.com/search?q=default+image&client=firefox-b-d&sxsrf=APq-WBskmtr-ix6NUAqqiHFNpsJX6JSOTg:1650026644151&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjEi_qfjJb3AhXvQd8KHd02BKUQ_AUoAXoECAEQAw#imgrc=A0pMe2lq2NT_jM";

const String localApi = 'https://app-6zo0.onrender.com';
const String OAUTH2_REDIRECT_URI = 'com.myapp://oauth2/redirect';

WebUri GOOGLE_AUTH_URL = WebUri(localApi + '/oauth2/authorize/google?redirect_uri=' + OAUTH2_REDIRECT_URI);

