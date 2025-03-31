
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let repository = PostRepository()
    
        private var posts: [Post] = []
    
    
    @IBAction func fetchTableData(_ sender: UIButton) {
        repository.fetchPosts { [weak self] posts in
                    guard let self = self, let posts = posts else { return }
                    self.posts = posts
                    self.tableView.reloadData()
                }
    }


    @IBOutlet weak var tableView: UITableView!
    
   
        
    
    override func viewDidLoad() {
            super.viewDidLoad()
           
            tableView.delegate = self
            tableView.dataSource = self
        }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                cell.textLabel?.text = posts[indexPath.row].title
                return cell
    }


}

