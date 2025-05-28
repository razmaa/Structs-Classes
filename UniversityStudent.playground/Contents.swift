import Foundation

// MARK: - Person Structure
class Person {
    let name: String
    let age: Int
    static let minAgeForEnrollment = 16
    
    var isAdult: Bool {
        return age >= 18
    }
    
    lazy var profileDescription: String = {
       return "\(name) is \(age) years old"
    }()
    
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
    static var studentCount = 0
    weak var advisor: Professor?
    
    var formattedID: String {
        return "ID: " + studentID.uppercased()
    }
    
    required init(name: String, age: Int, studentID: String, major: String) {
        self.studentID = studentID
        self.major = major
        super.init(name: name, age: age)
        Student.studentCount += 1
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
    static var professorCount = 0
    
    var fullTitle: String {
        return "Professor \(name), Faculty of \(faculty)"
    }
    
    init?(name: String, age: Int, faculty: String) {
        guard !faculty.isEmpty else {
            print("Professor initialization failed: Faculty cannot be empty.")
            return nil
        }
        self.faculty = faculty
        super.init(name: name, age: age)
        Professor.professorCount += 1
    }
}

// MARK: - University Struct

struct University {
    let name: String
    let location: String
    
    var description: String {
        return "University: \(name), located in \(location)"
    }
}

