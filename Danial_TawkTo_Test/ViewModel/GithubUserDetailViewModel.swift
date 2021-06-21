//
//  GithubUserViewModel.swift
//  Danial_TawkTo_Test
//
//  Created by Danial Hussain on 16/06/2021.
//

import UIKit

class GithubUserDetailViewModel {

    weak var vc:ProfileDetailViewController?
    
    /* Method use to get the github user details */
    func getGithubUserDetails(username:String) {
        let urlToHit = URL(string:"https://api.github.com/users/\(username)")
        URLSession.shared.dataTask(with: urlToHit!, completionHandler:{ data,response,error in
            if error == nil{
                if let data = data {
                    do {
                        let githubUserResponse = try JSONDecoder().decode(GithubUser.self, from: data)
                        
                        print(githubUserResponse)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.vc?.hideSkeletonView()
                            self.vc?.updateFullView(specificUser: githubUserResponse)
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
