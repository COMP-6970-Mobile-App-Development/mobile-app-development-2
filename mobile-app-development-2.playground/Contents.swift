import UIKit

// Create array of tuples (at least 5 elements)

typealias Student = (name: String, grade: Float)

let grades: [Student] = [
    ("Walter", 30),
    ("Shelby", 100),
    ("Laurie", 85),
    ("Hendrix", 20),
    ("Seth", 44)
]

// Write function to return tuple with max, min, and avg value across the dataset

func summary(array: [Student]) -> (Student, Student, Float) {
    var max_student: Student = (name: "", grade: 0.0);
    var min_student: Student = (name: "", grade: 2e3);
    var avg: Float =  0.0;
    for student in array {
        if (student.grade > max_student.grade){
            max_student = student;
        }
        if (student.grade < min_student.grade){
            min_student = student
        }
        avg += student.grade
    }
    avg = avg/Float(grades.count)
    
    print("Highest Grade:", max_student.grade)
    print("Lowest Grade:", min_student.grade)
    print("Average Grade:", avg)
    
    return (max_student,min_student,avg)
}

let (max_student, min_student, avg) = summary(array: grades)

// Write filter function using a closure that selects a subset of the data based on a condition you define

let a_students = {(students: [Student]) -> [Student] in
    var students_with_a: [Student] = []
    for student in students {
        if (student.grade >= 90.0) {
            students_with_a.append(student)
        }
    }
    return students_with_a
}

let get_names = {(students: [Student]) -> [String] in
    var names: [String] = []
    for student in students {
        names.append(student.name)
    }
    return names
}

print("Students with A's: ", get_names(a_students(grades)))
