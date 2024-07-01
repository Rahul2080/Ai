import 'package:ai/Bloc/ai_bloc.dart';
import 'package:ai/Repository/ModelClass/AiModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  late AiModel ai;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 35.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: SizedBox(height: 33.h,
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "Message",
                    hintStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(30)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            BlocBuilder<AiBloc, AiState>(
              builder: (context, state) {
                if (state is AiBlocLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is AiBlocErrror) {
                  return SizedBox(
                    child: Text("Error",style: TextStyle(color: Colors.white),),
                  );
                }
                if (state is AiBlocLoaded) {
                  ai = BlocProvider.of<AiBloc>(context).aiModel;

                  return Container(
                    width: 340.w,
                    height: 300.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(),
                    ),child: Image.network(fit: BoxFit.cover,ai.url.toString()),
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
            SizedBox(
              height: 30.h,
            ),
            GestureDetector(
              onTap: () {
                BlocProvider.of<AiBloc>(context)
                    .add(FeatchAi(id: controller.text));
              },
              child: Container(
                width: 150.w,
                height: 38.h,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(
                    "Submit",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
