import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_payment_method/providers/payment_method_provider.dart';
import 'address_screen/providers/address_card_provider.dart';
import 'doctor_details_screen/providers/doctor_service_provider.dart';
import 'forgot_password/providers/forgot_password_provider.dart';
import 'home_page/tab_bar_screens/appointments/providers/appointment_type_provider.dart';
import 'home_page/tab_bar_screens/messages/providers/messages_provider.dart';
import 'routes/routes.dart';
import 'splash_screen/splash_screen.dart';
import 'verification_screen/providers/id_verification_provider.dart';
import 'util/colors.dart';

void main() {
  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
  );
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ForgotPasswordProvider>(
          create: (_) => ForgotPasswordProvider(),
        ),
        ChangeNotifierProvider<AddressCardProvider>(
          create: (_) => AddressCardProvider(),
        ),
        ChangeNotifierProvider<PaymentMethodProvider>(
          create: (_) => PaymentMethodProvider(),
        ),
        ChangeNotifierProvider<IdVerificationProvider>(
          create: (_) => IdVerificationProvider(),
        ),
        ChangeNotifierProvider<DoctorServiceProvider>(
          create: (_) => DoctorServiceProvider(),
        ),
        ChangeNotifierProvider<MessagesProvider>(
          create: (_) => MessagesProvider(),
        ),
        ChangeNotifierProvider<AppointmentTypeProvider>(
          create: (_) => AppointmentTypeProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aderis Health App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(surface: mainColor),
        ),
        home: const SplashScreen(),
        routes: allRoutes,
      ),
    );
  }
}
