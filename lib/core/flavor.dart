import 'package:flutter/services.dart';

/// `true` quando o app é compilado com `--flavor premium` (sem anúncios).
const bool isPremium = appFlavor == 'premium';
