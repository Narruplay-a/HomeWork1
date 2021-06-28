//
//  ImageService.swift
//  HomeWork
//
//  Created by Adel Khaziakhmetov on 21.06.2021.
//

import SwiftUI
import Foundation
import Combine

protocol ImageServiceProtocol {
    func fetchImage(for link: String) -> Future<UIImage?, Never>
}

final class ImageService: ImageServiceProtocol {
    private let urlSession = URLSession.shared
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = ""
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        return decoder
    }()
    var subcriptions = Set<AnyCancellable>()
    
    func fetchImage(for name: String) -> Future<UIImage?, Never> {
        return Future<UIImage?, Never> { future in
            guard let requestUrl = self.generateUrl(for: name) else {
                return  future(.success(nil))
            }
            
            self.urlSession.dataTaskPublisher(for: requestUrl)
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                    throw APIError.requestFailed
                }
                
                return data
            }
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                future(.success(UIImage(named: "empty")))
            }, receiveValue: { data in
                future(.success(UIImage(data: data)))
            }).store(in: &self.subcriptions)
        }
    }
}

private extension ImageService {
    func generateUrl(for name: String) -> URL? {
        guard var urlComponents = URLComponents(string: "https://api.nasa.gov/EPIC/archive/natural/2019/05/30/png/\(name).png") else {
            return nil
        }
        
        let queryItems = [URLQueryItem(name: "api_key", value: QueryFixedParams.apiKey.rawValue)]
        urlComponents.queryItems = queryItems
        
        return urlComponents.url
    }
}
