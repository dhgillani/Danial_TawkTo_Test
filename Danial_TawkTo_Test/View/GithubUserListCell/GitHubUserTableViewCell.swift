//
//  GitHubUserTableViewCell.swift
//  Danial_TawkTo_Test
//
//  Created by Danial Hussain on 16/06/2021.
//

import UIKit
import SkeletonView
class GitHubUserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var githubUserIV: UIImageView!
    @IBOutlet weak var githubUsernameLbl: UILabel!
    
    @IBOutlet weak var githubUserDetailLbl: UILabel!
    
    @IBOutlet weak var githubUserNoteIV: UIImageView!
    
    var githubUser:GithubUser?{
        didSet{
            showSkeletonForCell()
            setUpCell()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.hideSkeletonForCell()
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(){

        githubUsernameLbl.text = githubUser?.login
        githubUserDetailLbl.text = githubUser?.node_id
        
    }
    
//  Show Skeleton For Cell
    func showSkeletonForCell(){
        githubUsernameLbl.showAnimatedGradientSkeleton()
        githubUserDetailLbl.showAnimatedGradientSkeleton()
        githubUserIV.showAnimatedGradientSkeleton()
        githubUserNoteIV.showAnimatedGradientSkeleton()
    }
    
//  Hide Skeleton For Cell
    func hideSkeletonForCell(){
        githubUsernameLbl.hideSkeleton()
        githubUserDetailLbl.hideSkeleton()
        githubUserIV.hideSkeleton()
        githubUserNoteIV.hideSkeleton()
    }
    
}
