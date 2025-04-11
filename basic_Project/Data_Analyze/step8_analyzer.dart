// step8_analyzer.dart

// 필요한 클래스 가져오기
// 이전 단계에서 만든 `AnalysisResult`와 `DataManager` 클래스를 가져옵니다.
// 이 클래스들은 데이터 분석 결과를 저장하고 관리하거나, 데이터셋을 관리하는 데 사용됩니다.
// 필요에 따라 import 문을 수정하거나, 클래스를 재정의할 수 있습니다.

import "step6_result_model.dart";
import 'step7_data_manager.dart';

// Analyzer 클래스 정의하기
class Analyzer {
  // 8-A: 기본 분석 메서드 통합하기
  DataManager manager = new DataManager();
  // DataManager 인스턴스 저장 변수 선언하기
  // 이 변수는 데이터셋을 관리하는 `DataManager` 객체를 저장합니다.
  // Analyzer 클래스는 이 객체를 통해 데이터셋에 접근하고 분석을 수행합니다.

  // 기본 분석 함수들을 Map으로 저장하기
  // 여러 분석 함수(예: 합계, 평균, 최대값, 최소값 등)를 저장할 수 있는 구조를 만듭니다.
  // Map의 키는 함수 이름(String), 값은 해당 분석 함수(Function)입니다.
  // 이 구조를 통해 함수 이름으로 분석 함수를 동적으로 호출할 수 있습니다.
  // 예를 들어, "sum"이라는 키로 합계 함수에 접근할 수 있습니다.
  Map<String, Function> analyzes = {};

  // 생성자 구현
  // Analyzer 클래스의 생성자는 `DataManager` 객체를 매개변수로 받아 저장합니다.
  // 이를 통해 Analyzer 클래스는 데이터셋에 접근할 수 있습니다.
  Analyzer({required this.manager});

  // 기본 분석 함수들 정의하기
  // 합계, 평균, 최대값, 최소값 등의 분석 함수를 구현합니다.
  // 각 함수는 리스트를 입력받아 계산 결과를 반환합니다.
  // 예를 들어, 합계 함수는 리스트의 모든 요소를 더한 값을 반환합니다.

  num calculateSum(List<num> lists) {
    return lists.reduce((a, b) => a + b);
  }

  num calculateAve(List<num> lists) {
    return calculateSum(lists) / lists.length;
  }

  num findListInMaxValue(List<num> lists) {
    return lists.reduce((a, b) => a > b ? a : b);
  }

  num findListInMinValue(List<num> lists) {
    return lists.reduce((a, b) => a > b ? b : a);
  }

  // 분석 실행 메서드
  // 데이터셋 이름과 분석 함수 이름을 받아 분석을 실행하는 메서드를 구현합니다.
  // 이 메서드는 데이터셋 이름으로 데이터를 조회하고, 함수 이름으로 분석 함수를 호출하여 결과를 반환합니다.
  // 분석 결과는 `AnalysisResult` 객체로 저장할 수 있습니다.
  AnalysisResult? runAnalysisProgram(String name, Function functions) {
    List<num>? values = manager.datasets[name];
    if (manager.datasets.containsKey(name)) {
      if (values == null) {
        print("값이 올바르지 않거나 없습니다.");
        return null;
      }
      return AnalysisResult(
        dataSet: name,
        functions: functions.toString(),
        resultValue: values.first,
        times: DateTime.now(),
      );
    }
  }
  // 8-B: 사용자 정의 분석 함수 등록 기능

  // 함수 타입 정의하기
  // 사용자 정의 분석 함수의 타입을 정의합니다.
  // 이 타입은 리스트를 입력받아 숫자 값을 반환하는 함수입니다.
  // typedef를 사용하여 함수 타입에 별칭을 부여할 수 있습니다.

  // 사용자 정의 함수 저장 Map 선언하기
  // 사용자 정의 분석 함수를 저장할 수 있는 구조를 만듭니다.
  // Map의 키는 함수 이름(String), 값은 해당 사용자 정의 함수입니다.
  // 이를 통해 사용자 정의 함수도 동적으로 호출할 수 있습니다.

  // 사용자 정의 함수 등록 메서드 구현하기
  // 사용자 정의 분석 함수를 등록하는 메서드를 작성합니다.
  // 이 메서드는 함수 이름과 함수를 매개변수로 받아 Map에 저장합니다.
  // 등록된 함수는 이후 분석 실행 메서드에서 호출할 수 있습니다.

  // 8-C: 분석 결과 저장 구조 만들기

  // 분석 결과 리스트 선언하기
  // 분석 결과를 저장할 리스트를 선언합니다.
  // 이 리스트는 `AnalysisResult` 객체를 저장하며, 모든 분석 결과를 관리합니다.

  // 분석 결과 저장 메서드 구현하기
  // 분석 결과를 리스트에 추가하는 메서드를 작성합니다.
  // 이 메서드는 분석 실행 메서드에서 호출되어 결과를 저장합니다.

  // 특정 데이터셋의 모든 분석 결과 조회 메서드 구현하기
  // 데이터셋 이름을 매개변수로 받아 해당 데이터셋의 모든 분석 결과를 반환하는 메서드를 작성합니다.

  // 8-D: 다양한 분석 결과 출력 형식 구현하기

  // 가장 최근 분석 결과 출력 메서드 구현
  // 리스트에서 가장 마지막에 추가된 분석 결과를 출력하는 메서드를 작성합니다.

  // 모든 분석 결과 요약 출력 메서드 구현
  // 저장된 모든 분석 결과를 요약하여 출력하는 메서드를 작성합니다.
  // 예를 들어, 각 결과의 데이터셋 이름, 분석 함수 이름, 결과 값 등을 출력할 수 있습니다.

  // 데이터셋별 분석 결과 출력 메서드 구현
  // 특정 데이터셋의 모든 분석 결과를 출력하는 메서드를 작성합니다.
}

void main() {
  // DataManager 인스턴스 생성 및 샘플 데이터 추가
  // DataManager 객체를 생성하고, 샘플 데이터를 추가합니다.
  // 이를 통해 Analyzer 클래스에서 사용할 데이터셋을 준비합니다.

  // Analyzer 인스턴스 생성
  // Analyzer 객체를 생성하고, DataManager 객체를 전달합니다.

  // 기본 분석 함수 테스트
  // Analyzer 클래스의 기본 분석 함수들을 테스트합니다.
  // 예를 들어, 특정 데이터셋에 대해 합계, 평균 등을 계산합니다.

  // 사용자 정의 분석 함수 등록 및 테스트
  // 사용자 정의 분석 함수를 등록하고, 이를 사용하여 분석을 실행합니다.
  // 예를 들어, 특정 조건에 맞는 요소의 개수를 계산하는 함수를 등록할 수 있습니다.

  // 다양한 형식으로 결과 출력 테스트
  // 분석 결과를 다양한 형식으로 출력하는 메서드를 테스트합니다.
  // 예를 들어, 가장 최근 결과 출력, 모든 결과 요약 출력, 데이터셋별 결과 출력 등을 확인합니다.

  // 힌트:
  // - 함수를 변수에 저장할 때는 함수 이름만 사용합니다(괄호 없이).
  // - 사용자 정의 함수는 화살표 함수로 간단히 구현할 수 있습니다.
}
