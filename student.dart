void main() {
  var studentList = StudentList();
  studentList.addStudent(Student(
      id: 1,
      surname: "Кисилев",
      middle: "Васильевич",
      "Иван",
      20,
      "Группа П50-6-20",
      4.5));
  studentList.addStudent(Student(
      id: 2,
      surname: "Амерханов",
      middle: "Рамзанович",
      "Апти",
      21,
      "Группа П50-7-20",
      3.8));

  print("Высший балл: ");
  print(studentList.getStudentWithHighestGrade(true).grade);
  print("Низший балл: ");
  print(studentList.getStudentWithHighestGrade(false).grade);
  print("Средний балл: ");
  print(studentList.getAverageGrade());
  print("СПИСОК ДО:");
  studentList.viewAllStudents();

  studentList.editInfoStudent(2, "Амерханов");
  print("СПИСОК После:");
  studentList.viewAllStudents();
  print("СПИСОК ФИЛЬТРОВАННЫЙ ПО ВОЗРАСТУ:");
  studentList.viewAllStudents(20);
  print("СПИСОК ФИЛЬТРОВАННЫЙ ПО ГРУППЕ:");
  studentList.viewAllStudents(null, "Группа П50-7-20");
  print("СПИСОК ФИЛЬТРОВАННЫЙ ПО СРЕДНЕМУ БАЛЛУ:");
  studentList.viewAllStudents(null, null, 3.8);
  studentList.deleteStudentId(1);
}

class Student {
  int id;
  String surname;
  String middle;
  String first_name;
  int age;
  String group;
  double grade;
  Student(this.first_name, this.age, this.group, this.grade,
      {required this.id, required this.surname, required this.middle});
}

class StudentList {
  List<Student> students = [];

  void addStudent(Student student) {
    students.add(student);
  }

  Student getStudentWithHighestGrade(bool high) {
    if (high) {
      return students
          .reduce((curr, next) => curr.grade > next.grade ? curr : next);
    } else {
      return students
          .reduce((curr, next) => curr.grade < next.grade ? curr : next);
    }
  }

  double getAverageGrade() {
    double total = students
        .map((student) => student.grade)
        .reduce((curr, next) => curr + next);
    return total / students.length;
  }

  void deleteStudentId(int id) {
    students.removeWhere((element) => element.id == id);
  }

  void editInfoStudent(int id,
      [String? surname,
      String? middle,
      String? first_name,
      int? age,
      String? group,
      double? grade]) {
    Student studentEdit = students.where((element) => element.id == id).first;
    surname == null ? null : studentEdit.surname = surname;
    middle == null ? null : studentEdit.middle = middle;
    first_name == null ? null : studentEdit.first_name = first_name;
    age == null ? null : studentEdit.age = age;
    group == null ? null : studentEdit.group = group;
    grade == null ? null : studentEdit.grade = grade;
  }

  void viewAllStudents(
      [int? ageFiltr, String? groupNameFiltr, double? gradeFiltr]) {
    if (ageFiltr == null && gradeFiltr == null && groupNameFiltr == null) {
      students.forEach((element) {
        print(
            "ФИО - ${element.surname} ${element.first_name} ${element.middle}\n Группа - ${element.group} \n Возраст - ${element.age} \n Средний балл - ${element.grade}");
      });
    } else if (ageFiltr != null &&
        gradeFiltr == null &&
        groupNameFiltr == null) {
      students.forEach((element) {
        if (element.age == ageFiltr) {
          print(
              "ФИО - ${element.surname} ${element.first_name} ${element.middle}\n Группа - ${element.group} \n Возраст - ${element.age} \n Средний балл - ${element.grade}");
        }
      });
    } else if (ageFiltr == null &&
        gradeFiltr != null &&
        groupNameFiltr == null) {
      students.forEach((element) {
        if (element.grade == gradeFiltr) {
          print(
              "ФИО - ${element.surname} ${element.first_name} ${element.middle}\n Группа - ${element.group} \n Возраст - ${element.age} \n Средний балл - ${element.grade}");
        }
      });
    } else if (ageFiltr == null &&
        gradeFiltr == null &&
        groupNameFiltr != null) {
      students.forEach((element) {
        if (element.group == groupNameFiltr) {
          print(
              "ФИО - ${element.surname} ${element.first_name} ${element.middle}\n Группа - ${element.group} \n Возраст - ${element.age} \n Средний балл - ${element.grade}");
        }
      });
    }
  }
}
