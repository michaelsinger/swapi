//
//  NetworkUtility.swift
//  starwars
//
//  Created by Michael Singer on 7/8/19.
//

import Foundation


enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
    case head = "HEAD"
    case options = "OPTIONS"
    case trace = "TRACE"
    case connect = "CONNECT"
}

struct HTTPHeader {
    let field: String
    let value: String
}

class APIRequest {
    let method: HTTPMethod
    let path: String
    var queryItems: [URLQueryItem]?
    var headers: [HTTPHeader]?
    var body: Data?
    
    init(method: HTTPMethod, path: String) {
        self.method = method
        self.path = path
    }
    
    init<Body: Encodable>(method: HTTPMethod, path: String, body: Body) throws {
        self.method = method
        self.path = path
        self.body = try JSONEncoder().encode(body)
    }
}

struct APIResponse<Body> {
    let statusCode: Int
    let body: Body
}

extension APIResponse where Body == Data? {
    func decode<BodyType: Decodable>(to type: BodyType.Type) throws -> APIResponse<BodyType> {
        guard let data = body else {
            throw APIError.decodingFailure
        }
        let decoded = try JSONDecoder().decode(BodyType.self, from: data)
        
        return APIResponse<BodyType>(statusCode: self.statusCode,
                                     body: decoded)
    }
}

enum APIError: Error {
    case invalidURL
    case requestFailed
    case decodingFailure
}

enum APIResult<Body> {
    case success(APIResponse<Body>)
    case failure(APIError)
}

struct GenericAPIResult<Element:Decodable>:Decodable {
    let count:Int
    let next:String?
    let previous:String?
    let results:[Element]
}


struct APIClient {
    
    typealias APIClientCompletion = (APIResult<Data?>) -> Void
    
    private let session = URLSession.shared
    private let baseURL = URL(string: "https://swapi.co/api")!
    
    func perform(_ request: APIRequest, _ completion: @escaping APIClientCompletion) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = baseURL.scheme
        urlComponents.host = baseURL.host
        urlComponents.path = baseURL.path
        urlComponents.queryItems = request.queryItems
        
        guard let url = urlComponents.url?.appendingPathComponent(request.path) else {
            completion(.failure(.invalidURL)); return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.httpBody = request.body
        
        request.headers?.forEach { urlRequest.addValue($0.value, forHTTPHeaderField: $0.field) }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.requestFailed)); return
            }
            completion(.success(APIResponse<Data?>(statusCode: httpResponse.statusCode, body: data)))
        }
        task.resume()
    }
}

class APIHandler {
    static let shared: APIHandler = {
        let instance = APIHandler()
        return instance
    }()

    func load<T:Decodable>(path:String, _ :T.Type, completion: @escaping ([T]) -> Void) {
        let request = APIRequest(method: .get, path: path)
        APIClient().perform(request) { (result) in
            switch result {
            case .success(let response):
                if let response = try? response.decode(to: GenericAPIResult<T>.self) {
                    let data = response.body
                    print("data \(data)")
                    completion(data.results)
                } else {
                    print("failed to decode")
                }
            default:
                print("def")
            }
        }
    }
    
    func loadPlanets(){
        self.load(path: "/planets/", Planet.self) { (planets) in
            print("planets = \(planets)")
        }
    }
    
    func loadPeople() {
        self.load(path: "/people/", People.self) { (people) in
            print("people = \(people)")
        }
    }
    
    func loadStarships() {
        self.load(path: "/starships/", Starship.self) { (starships) in
            print("starships = \(starships)")
        }
    }
    
    func loadVehicles() {
        self.load(path: "/vehicles/", Vehicle.self) { (vehicles) in
            print("vehicles = \(vehicles)")
        }
    }
    
    func loadFilm() {
        self.load(path: "/films/", Film.self) { (films) in
            print("films = \(films)")
        }
    }
    
    func loadSpecies() {
        self.load(path: "/species/", Species.self) { (species) in
            print("species = \(species)")
        }
    }
}
