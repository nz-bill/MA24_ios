//

import Foundation

class PostRepository {
    func fetchPosts(completion: @escaping ([Post]?) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            completion(nil)
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(nil)
                return
            }

            guard let data = data else {
                completion(nil)
                return
            }

            do {
                let posts = try JSONDecoder().decode([Post].self, from: data)
                DispatchQueue.main.async {
                    completion(posts)
                }
            } catch {
                print("JSON decoding error: \(error)")
                completion(nil)
            }
        }

        task.resume()
    }
}

//

