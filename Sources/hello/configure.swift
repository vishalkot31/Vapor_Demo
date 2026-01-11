import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // register routes
    let env = Environment.get("VAPOR_ENV")
    
    if env == "xcode"{
        app.http.server.configuration.port = 9090
    }
    else{
        app.http.server.configuration.port = 8080
    }
   
    try routes(app)
}
