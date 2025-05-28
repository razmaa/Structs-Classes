import Foundation

// MARK: - Person Structure
class Person {
    let name: String
    let age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    convenience init?(validatedName name: String, age: Int) {
        guard age >= 16 else {
            print("Initialization failed: Age must be at least 16.")
            return nil
        }
        self.init(name: name, age: age)
    }
}

// MARK: - Student Subclass

class Student: Person {
    let studentID: String
    let major: String

    required init(name: String, age: Int, studentID: String, major: String) {
        self.studentID = studentID
        self.major = major
        super.init(name: name, age: age)
    }

    convenience init?(validatedName name: String, age: Int, studentID: String, major: String) {
        guard let _ = Person(validatedName: name, age: age) else {
            print("Student initialization failed: Age must be at least 16.")
            return nil
        }
        self.init(name: name, age: age, studentID: studentID, major: major)
    }
}

// MARK: - Professor Subclass

class Professor: Person {
    let faculty: String

    init(name: String, age: Int, faculty: String) {
        self.faculty = faculty
        super.init(name: name, age: age)
    }
}

// MARK: - University Struct

struct University {
    let name: String
    let location: String
}

