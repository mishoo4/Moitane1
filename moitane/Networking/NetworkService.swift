//
//  NetworkService.swift
//  uzma
//
//  Created by misho zirakashvili on 14.09.22.
//

import Foundation

struct NetworkService {
    static let shared = NetworkService()
    private init() {}
    
//    func myFirstRequest(completion: @escaping(Result<[Dish], Error>) -> Void) {
//        request(route: .temp, method: .get, complition: completion)
//    }
    func fetchAllCategories (completion: @escaping(Result<AllDishes, Error>) -> Void) {
        request(route: .fetchAllCategories, method: .get, complition: completion)
    }
    func placeOrder(dishId: String, name: String, completion: @escaping(Result<Order, Error>) -> Void) {
        let params = ["name": name]
        request(route: .placeOrder(dishId), method: .post, parameters: params, complition: completion)
        
    }
    func fetchCategoriDishes(categoryId: String, completion: @escaping (Result<[Dish], Error>) -> Void) {
        request(route: .fetchCategoryDishes(categoryId), method: .get, complition: completion )
        
    }
    func fetchOrders(completion: @escaping((Result<[Order], Error>) -> Void)) {
        request(route: .fetchOrders, method: .get, complition: completion)
        
    }
    private func request<T: Decodable>(route: Route,
                                     method: Method,
                                    parameters: [String: Any]? = nil,
                                     complition:@escaping(Result<T, Error>) -> Void) {
        guard  let request = createRequest(route: route, method: method, parameters: parameters) else {
            complition(.failure(AppError.unknownError))
            return
            
        }
        URLSession.shared.dataTask(with: request) {
            data, responce, error in
            var result: Result<Data, Error>?
            if let data = data {
                result = .success(data)
                let responseString = String(data: data, encoding: .utf8) ?? "Could not stringify our data"
                print("the response in:\(responseString)")
            } else if  let error = error {
                result = .failure(error)
                print("the error is:\n\(error.localizedDescription)")
            }
            DispatchQueue.main.async {
                //TODO decode out result and send back to the user
                self.handleResponce(result: result, completion: complition)
                
            }
        }.resume()
    }
    private func handleResponce<T: Decodable>(result: Result<Data, Error>?, completion: (Result<T, Error>) -> Void) {
        guard let result = result else {
            completion(.failure(AppError.unknownError))
            
            return
        }
        switch result {
            
        case .success(let data):
            let decoder = JSONDecoder()
            guard let responce = try?decoder.decode(ApiResponse<T>.self, from: data)
            else {
                completion(.failure(AppError.errorDecoding))
                return
            }
            if let error = responce.error {
                completion(.failure(AppError.serverError(error)))
                return
            }
            if let decodedData = responce.data {
                completion(.success(decodedData))
            }
                           else {
                completion(.failure(AppError.unknownError))
            }
        case .failure(let error):
            completion(.failure(error))
        }
    }
    /// this  functions helps us to genetare a urlRequest
    /// - Parameters:
    ///   - route: the path the pesource in the backend
    ///   - method: type of request to be made
    ///   - parameters: whatever extra information you need ro pass to the backend
    /// - Returns: URLRequest
     private func createRequest(route: Route,
                               method: Method,
                               parameters: [String: Any]? = nil) -> URLRequest? {
        let urlString = Route.baseUrl + route.description
        guard let url = urlString.asUrl else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        
        if let params = parameters {
            switch method {
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map{
                    URLQueryItem(name: $0, value: "\($1)")}
                 urlRequest.url = urlComponent?.url
              case .post, .delete, .patch:
                let  bodyData = try?
                JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = bodyData
            }
        }
        return urlRequest
    }
}
