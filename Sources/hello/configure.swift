import Vapor
import Fluent
import FluentSQLiteDriver

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
    //DataBase Setup
    app.databases.use(.sqlite(.file(app.directory.workingDirectory + "db.sqlite")), as: .sqlite)
    // 2️⃣ Add migration
    app.migrations.add(CreateUser())
    // 3️⃣ Run migrations automatically
    try await app.autoMigrate().get()
   
    try routes(app)
}
