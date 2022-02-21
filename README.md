# hacker_news

```
┌── assets/            
├── lib/
│   ├── models/
│   ├── provider/
│   ├── components/
│   ├── screens/                  
│   └── utilities/
│        └── network_helper.dart
│
├── main.dart
├── pubspec.yaml
└── README.md
```
### Named route 사용
- 각 screen에 static변수로 route명 선언

### Provider를 이용한 상태관리
- 화면과 상태값,로직 분리
- 상태값의 직접적인 수정이 생기지 않게 private변수로 선언하고 getter는 수정불가능한 데이터 형식(UnmodifiableListView)으로 반환
- 상태값을 수정하는 경우 별도의 메소드를 만들고, 메소드 명을 통해 어떤 로직 인지 설명
- context.watch<T>(): T의 데이터 값을 화면에 보여주는 용도로 사용. 데이터 값이 변경시 위젯을 재빌드
- context.read<T>(): T의 데이터 값을 변경하는 이벤트들을 위한 용도로 사용. 이벤트들은 데이터 값의 변경에 따라 재빌드할 필요가 없음

### NetworkHelper
- dio 패키지 사용
- 자주쓰는 CRUD 메소드들을 모아둔 헬퍼클래스