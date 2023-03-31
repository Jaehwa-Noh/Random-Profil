//
//  MaleFemaleViewModel.swift
//  Random Profil
//
//  Created by Jaehwa Noh on 2023/03/31.
//

import Foundation

class MaleFemaleViewModel: ObservableObject {
    
    @Published var People: [ProfileStruct] = [ProfileStruct]()
    @Published var isServerError: Bool = false
    
    init(isMale: Bool) {
        self.getGenderList(isMale: isMale)
    }
    
    func getGenderList(isMale: Bool) {
        let url = RandomUserClient.Endpoints.getPersonList(gender: isMale ? "Male" : "Female").url
        print(url)
        Task {
            do {
                await MainActor.run {
                    isServerError = false
                }
                
                let getPeople = try await loadDataFromServer(url: url)
                
                await MainActor.run {
                    People = getPeople
                }
                
            } catch {
                await MainActor.run {
                    isServerError = true
                }
            }
        }
        
        
    }
    
    func loadDataFromServer(url: String) async throws -> [ProfileStruct] {
        let (data, response) = try await URLSession.shared.data(from: URL(string: url)!)
        
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode,
              (200...299).contains(statusCode) else {
            throw NSError(domain: "HTTP Connect Fail", code: 404)
        }
        
        return try await readDecoder(data: data)
    }
    
    func readDecoder(data: Data) async throws -> [ProfileStruct] {
        let decoder = JSONDecoder()
        do {
            let responseObject = try decoder.decode(RandomUserResponseStruct.self, from: data)
            return responseObject.results
        } catch let DecodingError.dataCorrupted(context) {
            print(context)
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.typeMismatch(type, context)  {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch {
            print(error.localizedDescription)
        }
        return [ProfileStruct]()
    }
    
    
}
