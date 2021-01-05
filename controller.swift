import UIkit

// メインページ機能
class MainViewController: UIViewController{
    let UserID :Int
    // ユーザーIDから情報を取得
    let USerName : String
    let PointCount : Int
    var MyArchives = [Archive]()
    // 検索バー追加
    func setupSearchBar(){
        serch.delegate = self
    }
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int){
    }
    // 検索バーに表示があると呼ばれる
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        guard !searchText.isEmpty else {
            performSegue(withIdentifier: "toRsultViewController",sender:nil)
        }
    }
    override func prepare(for segue:UIStoryboardSeuge,sender: Any?){
        // segueのIdを確認し特定のsegueの時に動作
        if segue.identifier == "toResultViewController"{
            // 遷移先のViewControlllerを取得
            let next = segue.destination as? ResultViewController
            next.seachText = seachText
        }
    }
    override func viewDidLoad(){
        super.viewDidLoad()
    }
}

// 検索結果ページ
class ResultViewController: UITableView, ArticleCellDelegate, UISearchBarDelegate{
    let storyboard: UIStoryboard = UIStoryboard(name; "resultPage",bundle)
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet var table: UITableView!
    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var outputLabel: UILabel!

    // メインページからの検索を引き継ぐ
    var seachText : String?
    override func viewDidLoad(){
        super.viewDidLoad()
        outputLabel.seachText = searchText
    }

    let myRefreshControl = UIRefreshControl()
    var resultArchives = [Archive]()
    var currentArchives = [Archive]()
    var button: UIBackButton = UIButton()

    func setupSearchBar(){
        search.delegate = self
    }

    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
    }
    //  検索バーに入力があったら呼ばれる
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            currentArchives = archives
            table.reloadData()
            return
        }
        currentArchives = archives.filter({ archive -> Bool in
            archive.title.lowercased().contains(searchText.lowercased())
        })
        table.reloadData()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentArchives.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyTableViewCell
        let row_item = currentArchives[indexPath.row]
        cell.setArticle(item: row_item)
        return cell
    }
    // 戻るボタン
    @objc func tapButton(_ sendar: UIBackButton){
        performSegue(withIdentifier: "MainViewController",sender:nil)
    }
}

// レビュー詳細ページ
class ArchivesViewController: UIViewController{


    override func viewDidLoad(){
        super.viewDidLoad()
    }
}

// お店詳細ページ　＆　レビュー一覧
class ShoppViewController: UIViewController{
    override func viewDidLoad(){
        super.viewDidLoad()
    }
}

// レビュー投稿ページ
class PostViewController: UIViewController{
    override func viewDidLoad(){
        super.viewDidLoad()
    }
}