//
//  ViewController.swift
//  Danial_TawkTo_Test
//
//  Created by Danial Hussain on 16/06/2021.
//

import UIKit
import SkeletonView
class ProfileDetailViewController: UIViewController {
    @IBOutlet weak var bannerIV: UIImageView!
    @IBOutlet weak var followersLbl: UILabel!
    @IBOutlet weak var followingLbl: UILabel!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var notesTypingTV: UITextView!
    @IBOutlet weak var notesLbl: UILabel!
    @IBOutlet weak var blogLbl: UILabel!
    @IBOutlet weak var companyLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    
    var githubUserDetailVM = GithubUserDetailViewModel()
    var username:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showSkeletonView()
        githubUserDetailVM.vc = self
        githubUserDetailVM.getGithubUserDetails(username:username)
    }
    
    func showSkeletonView(){
        bannerIV.showAnimatedGradientSkeleton()
        followersLbl.showAnimatedGradientSkeleton()
        followingLbl.showAnimatedGradientSkeleton()
        saveBtn.showAnimatedGradientSkeleton()
        notesTypingTV.showAnimatedGradientSkeleton()
        notesLbl.showAnimatedGradientSkeleton()
        blogLbl.showAnimatedGradientSkeleton()
        companyLbl.showAnimatedGradientSkeleton()
        nameLbl.showAnimatedGradientSkeleton()
    }
    
    func hideSkeletonView(){
        bannerIV.hideSkeleton()
        followersLbl.hideSkeleton()
        followingLbl.hideSkeleton()
        saveBtn.hideSkeleton()
        notesTypingTV.hideSkeleton()
        notesLbl.hideSkeleton()
        blogLbl.hideSkeleton()
        companyLbl.hideSkeleton()
        nameLbl.hideSkeleton()
    }
    
    func updateFullView(specificUser:GithubUser){
        followersLbl.text = "Followers : \(specificUser.followers ?? 0)"
        followingLbl.text = "Followings : \(specificUser.following ?? 0)"
        
        blogLbl.text = "Blog : \(specificUser.blog ?? "")"
        nameLbl.text = "Name : \(specificUser.name ?? "")"
        companyLbl.text = "Company : \(specificUser.company ?? "")"
        self.title = specificUser.login
    }
    
    @IBAction func saveBtnPressed(_ sender: Any) {
        
    }
}

