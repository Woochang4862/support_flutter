enum FieldType { id, password, passwordConfirm, nickname, gender, dormType }

class ErrorUtil {
  ErrorUtil._();

  static final ErrorUtil instance = ErrorUtil._();

  String? getErrorMessage(String? code) {
    switch (code) {
      case "USR-F100": // 학교 이메일 공백
        return '학교 이메일을 입력해주세요!';
      case "USR-F200": // 인증번호 공백
        return '인증번호를 입력해주세요!';
      case "USR-F300": // 비밀번호 공백
        return '비밀번호는 영어, 숫자, 특수문자 모두 포함하여 5~20자 이내로 작성해주세요!';
      case "USR-F301": // 비밀번호 형식에 맞지 않음
        return '비밀번호가 일치하지 않습니다!';
      case "ERR001": // 서버 에러
      case "ERR002": // 미구현 api
        return '서버 에러가 발생했습니다.';
      case "ERR111": // 아이디 혹은 비밀번호가 일치 x
        return '아이디 혹은 비밀번호가 일치하지 않습니다.';
      case "ERR100": // 로그인 오류
        return '로그인 오류가 발생했습니다.';
      case "ERR101": // 데이터 처리 오류
        return '데이터 처리 중 오류가 발생했습니다.';
      case "ERR003": // Valid 오류
        return '유효성 검사 오류가 발생했습니다.';
      case "ERR102": // 현재 비밀번호 변경 오류
        return '현재 비밀번호 변경 중 오류가 발생했습니다.';
      case "ERR004": // 인증코드 일치 x, 만료
        return '인증코드가 유효하지 않습니다.';
      case "ERR103": // 존재하지 않는 아이디
        return '존재하지 않는 아이디입니다.';
      case "ERR005": // 존재하지 않은 멤버
        return '존재하지 않는 멤버입니다.';
      case "ERR402": // 토큰 만료
        return '토큰이 만료되었습니다.';
      case "ERR006": // JSON 형식 오류
        return 'JSON 형식 오류가 발생했습니다.';
      case "ERR403": // 유효하지 않은 토큰
        return '유효하지 않은 토큰입니다.';
      case "ERR404": // REST API TYPE 오류
        return 'REST API 타입 오류가 발생했습니다.';
      case "ERR007": // 중복된 아이디
      case "ERR109": // 중복된 아이디
        return '중복된 아이디입니다.';
      case "ERR113":
        return '존재하지 않는 아이디입니다!';
      default:
        return null;
    }
  }

  bool isValid(String? code, FieldType fieldType) {
    switch (code) {
      case "USR-F400": // 학교 이메일
        return fieldType != FieldType.id;
      case "USR-F500": // 비밀번호
        return fieldType != FieldType.password;
      case "USR-F600": // 비밀번호 확인
        return fieldType != FieldType.passwordConfirm;
      case "USR-F700": // 닉네임
        return fieldType != FieldType.nickname;
      case "USR-F800": // 성별
        return fieldType != FieldType.gender;
      case "USR-F900": // 기숙사
        return fieldType != FieldType.dormType;
      default:
        return true;
    }
  }
}
