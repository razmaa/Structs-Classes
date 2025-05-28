import Foundation

// MARK: - User Structure

struct User {
    let username: String
    let email: String
    private(set) var password: String

    init(username: String, email: String, password: String) {
        self.username = username
        self.email = email
        self.password = User.hashPassword(password)
    }
    
    static func hashPassword(_ password: String) -> String {
        return String(password.reversed())
    }
}

// MARK: - UserManager Class

class UserManager {
    var users: [String: User] = [:]
    
    var userCount: Int {
        return users.count
    }
    
    func registerUser(username: String, email: String, password: String) -> Bool {
        guard !username.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            print("Registration failed: Username cannot be empty.")
            return false
        }

        guard !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            print("Registration failed: Password cannot be empty.")
            return false
        }

        if users.values.contains(where: { $0.email.caseInsensitiveCompare(email) == .orderedSame }) {
            print("Registration failed: Email is already in use.")
            return false
        }

        let newUser = User(username: username, email: email, password: password)
        users[username] = newUser
        return true
    }

    
    func login(username: String, password: String) -> Bool {
        guard let user = users[username] else { return false }
        return User.hashPassword(password) == user.password
    }
    
    func removeUser(username: String) -> Bool {
        if users.removeValue(forKey: username) != nil {
            return true
        }
        return false
    }
}

// MARK: - AdminUser Class (Subclass of UserManager)

class AdminUser: UserManager {

    override init() {
        super.init()
        print("AdminUser instance created.")
    }
    
    func listAllUsers() -> [String] {
        return Array(users.keys)
    }

    deinit {
        print("AdminUser instance is being deinitialized.")
    }
}



