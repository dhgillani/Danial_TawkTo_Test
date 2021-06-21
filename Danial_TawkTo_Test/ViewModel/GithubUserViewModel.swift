//
//  GithubUserViewModel.swift
//  Danial_TawkTo_Test
//
//  Created by Danial Hussain on 16/06/2021.
//

import UIKit

class GithubUserViewModel {
    weak var vc:ViewController?
    var arrUsers = [GithubUser]()
    
    /* Method use to get the github user on the base of last user id */
    func getGithubUsers(lastUserId:Int) {
        let urlToHit = URL(string:"https://api.github.com/users?since=\(lastUserId)")
        URLSession.shared.dataTask(with: urlToHit!, completionHandler:{ data,response,error in
            if error == nil{
                if let data = data {
                    do {
                        let githubUsersResponse = try JSONDecoder().decode([GithubUser].self, from: data)
                        
                        
                        //Save/Update Data here to core data
                        
                        self.arrUsers.append(contentsOf: githubUsersResponse)
                        
                        /* Updating TableView Data */
                        DispatchQueue.main.async {
                            self.vc?.tableView.reloadData()
                        }
                        
                    }catch let err{
                        print(err.localizedDescription)
                    }
                }
            }else{
                print(error!.localizedDescription)
            }
        }).resume()
    }
}



