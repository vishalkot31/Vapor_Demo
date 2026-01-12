import Vapor
import Fluent
import FluentSQLiteDriver

//This wil convert strict to json
struct ProfileResponse:Content{
    let name:String
    let role:String
}

struct LoginRequest:Content{
    let email: String
    let password: String
}

struct SignupRequest:Content{
    let email:String
    let password:String
}
struct LoginResponse: Content {
    let message: String
}

func routes(_ app: Application) throws {
    //GET → request type
    // → root path (nothing after slash)
  //  Response → "Hello Vishal kothari"
    app.get { req  in
        "Hello Vishal kothari"
    }
   
   // GET is the method
    //hello
   // Return "Hello, world 123456!"
    app.get("hello") { req  -> String in
        "Hello, world 123456!"
    }
    
    //Differnet route with get request and response send
    app.get("profile") { req  -> ProfileResponse in
        ProfileResponse(name: "Vishal", role: "iOS Developer")
    }
    
    //Post Request
    
    app.post("login") { req -> LoginResponse in
        //Login request in json format
        let login = try req.content.decode(LoginRequest.self)
        return LoginResponse(message: "welcome \(login.email)")
    }
    
    app.post("signup"){ req async throws -> HTTPStatus in
        let data = try req.content.decode(SignupRequest.self)
        //Hash the passord
        
        let hash = try Bcrypt.hash(data.password)
        let user = User(email: data.email, passwordHash: hash)
        try await user.save(on: req.db)
        return .created
    }
}
