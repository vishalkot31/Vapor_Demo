import Vapor

//This wil convert strict to json
struct ProfileResponse:Content{
    let name:String
    let role:String
}

struct LoginRequest:Content{
    let email: String
    let password: String
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
        let login = try req.content.decode(LoginRequest.self)
        return LoginResponse(message: "welcome \(login.email)")
    }
}
