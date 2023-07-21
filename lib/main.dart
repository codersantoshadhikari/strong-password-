import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:strong_password_generator/bloc/save_generated_data_bloc.dart';
import 'package:strong_password_generator/bloc/save_generated_password_bloc.dart';
import 'package:strong_password_generator/routes/routes_handler.dart';
import 'package:strong_password_generator/splash_screen/screen/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SaveGeneratedDataBloc()),
      ],
      child: ScreenUtilInit(
          splitScreenMode: true,
          designSize: const Size(390, 844),
          minTextAdapt: true,
          builder: (context, child) {
            return MaterialApp(
              onGenerateRoute: RouteHandler.handlerRoute,
              debugShowCheckedModeBanner: false,
              title: 'Password Generator',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const SplashScreen(),
            );
          }),
    );
  }
}
