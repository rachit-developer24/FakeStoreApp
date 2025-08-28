//
//  CacheManager.swift
//  FakeStoreApp
//
//  Created by Rachit Sharma on 24/08/2025.
//

import Foundation
protocol CacheManager {
    func getData<T:Codable>(as data: T.Type)throws -> [T]
    func saveData<T:Codable>(as data: [T])
    func invalidata()
    
    var filename: String { get }
}
class fileCacheManager: CacheManager {
    let filename:String
    init(filename:String){
        self.filename = filename
    }
}
extension CacheManager {
    var documentDirectory: URL? {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    }
    func getData<T:Codable>(as data: T.Type) throws -> [T]  {
        guard let fileurl = documentDirectory?.appending(path: filename)else {
            return []
        }
        let data = try Data(contentsOf: fileurl)
        return try JSONDecoder().decode([T].self, from: data)
    }
    
    func saveData<T:Codable>(as data: [T]) {
          guard let fileurl = documentDirectory?.appending(path: filename) else { return }
          do {
              let data = try JSONEncoder().encode(data)
              try data.write(to: fileurl)
          } catch {
              print("Cache save error:", error.localizedDescription)
          }
      }
    
    func invalidata() {
        guard let fileurl = documentDirectory?.appending(path: filename)else{return}
        do{
            try FileManager.default.removeItem(at: fileurl)
        }catch{
            print("cant find the file to delete")
        }
    }
    
   
    
    
}
