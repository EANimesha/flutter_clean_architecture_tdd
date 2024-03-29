import 'dart:convert';

import 'package:clean_architecture_tdd/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main(){
  final tNumberTriviaModel=NumberTriviaModel(number:1,text:'Test text');
  test(
    'should be a subclass of NumberTrivia Entity',
    ()async{
      //assert
      expect(tNumberTriviaModel, isA<NumberTrivia>());

    });

    group('fromJson', (){
      test('should retrurn a valid model when the JSOn number is a integer', 
      ()async{
        //arrange
        final Map<String,dynamic> jsonMap=json.decode(fixture('trivia.json'));
        //act
        final result=NumberTriviaModel.fromJson(jsonMap);
        //assert
        expect(result, tNumberTriviaModel);
      });

      test('should retrurn a valid model when the JSOn number is regarded as a double', 
      ()async{
        //arrange
        final Map<String,dynamic> jsonMap=json.decode(fixture('trivia_double.json'));
        //act
        final result=NumberTriviaModel.fromJson(jsonMap);
        //assert
        expect(result, tNumberTriviaModel);
      });
    });

    group('toJson', (){
      test(
        'should return a Json Map containing the proper data', 
        ()async{
          //act
          final result= tNumberTriviaModel.toJson();
          //assert
          final expectedMap={
            "text":"Test text",
            "number":1,
          };
          expect(result, expectedMap);
        });
    });
}