//
//  Enums.swift
//  Central
//


enum Error: Swift.Error {
    case emptyField
    case passwordsDoNotMatch
    case invalidEmail
    case usernameTaken
    case incorrectSignIn
    case invalidPassword

}

extension Error : CustomStringConvertible {
    var description: String {
        switch self {
        case .emptyField: return "Please fill in all fields"
        case .passwordsDoNotMatch: return "The passwords do not match"
        case .invalidEmail: return "Please enter a valid email"
        case .usernameTaken: return "Username is already taken"
        case .incorrectSignIn: return "Incorrect username or password"
        case .invalidPassword: return "Password must be 8 or more characters, \n and include a numeric and a capital letter"
        }
    }
}
