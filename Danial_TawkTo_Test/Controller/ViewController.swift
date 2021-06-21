//
//  ViewController.swift
//  Danial_TawkTo_Test
//
//  Created by Danial Hussain on 16/06/2021.
//

import UIKit
import SkeletonView
class ViewController: UIViewController {
    @IBOutlet var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    var githubUserVM = GithubUserViewModel()
    var selectedUserName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "GitHubUserTableViewCell", bundle: nil), forCellReuseIdentifier: "GitHubUserCell")
        self.title = "Github Profiles"
        tableView.separatorStyle = .none
        self.navigationItem.titleView = searchBar
        githubUserVM.vc = self
        githubUserVM.getGithubUsers(lastUserId: 0)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mySegue" {
            if let destinationVC = segue.destination as? ProfileDetailViewController {
                
                destinationVC.username = self.selectedUserName
            }
        }
    }
}

/* Table view datasource */
extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GitHubUserCell", for: indexPath) as? GitHubUserTableViewCell
        let model = githubUserVM.arrUsers[indexPath.row]
        print (model)
        cell?.githubUser = model
        cell?.selectionStyle = .none
        return cell!
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return githubUserVM.arrUsers.count
    }
}

/* Table view delegate */
extension ViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedUserName = githubUserVM.arrUsers[indexPath.row].login ?? ""
        self.performSegue(withIdentifier: "mySegue", sender: self)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

