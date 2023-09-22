//
//  ProfileDesignViewController.swift
//  MyApp2
//
//  Created by 보경 on 2023/09/20.
//

import UIKit
import SnapKit

let imageDummyName = ["picture", "picture2", "picture3", "picture4", "picture5", "picture6"]

class ProfileDesignViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // 프로필 상단
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var usernameLabel: UILabel!
    
    // UserFollowInfo
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followingNum: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    @IBOutlet weak var followerNum: UILabel!
    @IBOutlet weak var postsLabel: UILabel!
    @IBOutlet weak var postsNum: UILabel!
    @IBOutlet weak var userFollowInfoBox: UIView!
    
    // UserProfile
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var userPic: UIImageView!
    
    // Buttons
    @IBOutlet weak var moreBtn: UIButton!
    @IBOutlet weak var msgBtn: UIButton!
    @IBOutlet weak var followBtn: UIButton!
    
    // collectionView
    @IBOutlet weak var collection: UICollectionView!
    
    // nav bar
    @IBOutlet weak var personBtn: UIButton!
    @IBOutlet weak var navBar: UIView!
    @IBOutlet weak var gridBtn: UIButton!
    @IBOutlet weak var navGal: UIView!
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {imageDummyName.count}
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "profileCollectionCell", for: indexPath) as! ProfileDesignCollectionViewCell
        
        cell.thumbnail.image = UIImage(named: imageDummyName[indexPath.item])
        
        return cell
    }
    
    func loadUIDetails() {
        
        let safetyArea = UIView()
        self.view.addSubview(safetyArea)
        
        safetyArea.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11, *) {
            let guide = view.safeAreaLayoutGuide
            safetyArea.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
            safetyArea.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
            safetyArea.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
            safetyArea.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
                    
        } else {
            safetyArea.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor).isActive = true
            safetyArea.bottomAnchor.constraint(equalTo: bottomLayoutGuide.bottomAnchor).isActive = true
            safetyArea.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            safetyArea.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        }
        // 상단바 뒤로 버튼
        safetyArea.addSubview(back)
        back.snp.makeConstraints{ make in
            make.left.equalTo(safetyArea).inset(14)
        }
        
        // 상단바 Username
        safetyArea.addSubview(usernameLabel)
            //label font랑 size, alignment 다시 잡아야함
        usernameLabel.textAlignment = .center
        usernameLabel.snp.makeConstraints{ make in
            make.size.equalTo(CGSize(width: usernameLabel.bounds.width, height: 25))
            make.top.centerX.equalToSuperview()
            make.top.equalTo(safetyArea).inset(10)
        }
        
        // 상단바 Menu 버튼
        safetyArea.addSubview(menuButton)
        menuButton.snp.makeConstraints{ make in
            make.size.equalTo(CGSize(width: 21, height: 17.5))
            make.top.equalTo(safetyArea).inset(10)
            make.right.equalTo(safetyArea).inset(16)
        }
        
        // 프로필 이미지
        safetyArea.addSubview(userPic)
        userPic.snp.makeConstraints{ make in
            make.size.equalTo(CGSize(width: 88, height: 88))
            make.top.equalTo(usernameLabel.snp.bottom).offset(14)
            make.left.equalTo(safetyArea).inset(14)
        }
        
        // UserFollewInfo Box View
        safetyArea.addSubview(userFollowInfoBox)
        userFollowInfoBox.snp.makeConstraints{ make in
            make.centerY.equalTo(userPic)
            make.size.equalTo(CGSize(width: userFollowInfoBox.bounds.width, height: 41))
            make.right.equalTo(safetyArea).inset(28)
            make.left.equalTo(userPic.snp.right).offset(41)
        }
        
        // UserFollowInfoBox 속의 Label들
        userFollowInfoBox.addSubview(postsLabel)
        userFollowInfoBox.addSubview(postsNum)
        postsLabel.snp.makeConstraints{ make in
            make.left.equalToSuperview()
        }
        postsNum.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.centerX.equalTo(postsLabel)
        }
        postsLabel.snp.makeConstraints{ make in
            make.top.equalTo(postsNum.snp.bottom)
        }
        
        userFollowInfoBox.addSubview(followingNum)
        userFollowInfoBox.addSubview(followingLabel)
        followingLabel.snp.makeConstraints{ make in
            make.right.equalToSuperview()
        }
        followingNum.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.centerX.equalTo(followingLabel)
        }
        followingLabel.snp.makeConstraints{ make in
            make.top.equalTo(followingNum.snp.bottom)
        }
        
        let centerXPoint = (userFollowInfoBox.bounds.width + postsLabel.bounds.width  - followingLabel.bounds.width) / 2
        
        userFollowInfoBox.addSubview(followerNum)
        userFollowInfoBox.addSubview(followerLabel)
        followerNum.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().inset(centerXPoint)
        }
        followerLabel.snp.makeConstraints{ make in
            make.top.equalTo(followerNum.snp.bottom)
            make.centerX.equalTo(followerNum)
        }

        
        // 프로필 레이아웃
        safetyArea.addSubview(nicknameLabel)
        safetyArea.addSubview(descriptionLabel)
        safetyArea.addSubview(linkLabel)
        
        nicknameLabel.snp.makeConstraints{ make in
            make.top.equalTo(userPic.snp.bottom).offset(14)
            make.left.equalTo(userPic.snp.left)
        }
        descriptionLabel.snp.makeConstraints{ make in
            make.top.equalTo(nicknameLabel.snp.bottom).offset(2)
            make.left.equalTo(nicknameLabel.snp.left)
        }
        linkLabel.snp.makeConstraints{ make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(2)
            make.left.equalTo(nicknameLabel.snp.left)
        }
        linkLabel.textColor = UIColor(red: 0.061, green: 0.274, blue: 0.492, alpha: 1)
        
        // button 레이아웃
        let insetFromSafetyArea: CGFloat = 15
        let interspacing: CGFloat = 8
        
        safetyArea.addSubview(moreBtn)
        moreBtn.setImage(UIImage(named: "More"), for: .normal)
        moreBtn.snp.makeConstraints{ make in
            make.top.equalTo(linkLabel.snp.bottom).offset(11)
            make.right.equalTo(safetyArea).inset(15)
            make.size.equalTo(CGSize(width: 30, height: 30))
        }
        
        safetyArea.addSubview(followBtn)
        followBtn.setImage(UIImage(named: "Follow"), for: .normal)
        followBtn.snp.makeConstraints{ make in
            make.top.equalTo(moreBtn.snp.top)
            make.left.equalTo(safetyArea).inset(15)
            make.size.equalTo(CGSize(width: UIScreen.main.bounds.width - (insetFromSafetyArea * 2) - (interspacing * 2), height: 30))
        }

        safetyArea.addSubview(msgBtn)
        msgBtn.snp.makeConstraints{ make in
            make.top.equalTo(moreBtn.snp.top)
            make.left.equalTo(followBtn.snp.right).offset(8)
            make.right.equalTo(moreBtn.snp.left).offset(-8)
            make.size.equalTo(CGSize(width: UIScreen.main.bounds.width - (insetFromSafetyArea * 2) - (interspacing * 2), height: 30))
        }
        msgBtn.setBackgroundImage(UIImage(named: "Message"), for: .normal)
        
        safetyArea.addSubview(navGal)
        navGal.snp.makeConstraints{ make in
            make.top.equalTo(moreBtn.snp.bottom).offset(11)
            make.left.right.equalToSuperview()
            make.size.equalTo(CGSize(width: safetyArea.bounds.width , height: 44))
        }
        navGal.layer.borderWidth = 1
        navGal.layer.borderColor = CGColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
        
        gridBtn.snp.makeConstraints{ make in
            make.top.equalTo(navGal.snp.top).inset(10)
            make.bottom.equalTo(navGal.snp.bottom).inset(11.5)
            make.left.equalTo(navGal.snp.left).inset((UIScreen.main.bounds.width / 6) - 10)
        }
        
        // collection view
        collection.snp.makeConstraints{ make in
            make.top.equalTo(navGal.snp.bottom)
            make.left.right.equalToSuperview()
            make.size.equalTo(CGSize(width: safetyArea.bounds.width , height: 380))
        }

    }
    
    func setCollectionLayout() {
        let layout = UICollectionViewFlowLayout()
        let itemSpacing: CGFloat = 2

        let width: CGFloat = UIScreen.main.bounds.width - (itemSpacing * 2)
        let itemWidth: CGFloat = width / 3
        
        // 각 item의 크기 설정(정사각형)
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)

        // 스크롤 방향 설정
        layout.scrollDirection = .vertical

        // item간 간격 설정
        // 최소 줄간 간격 (수직 간격)
        layout.minimumLineSpacing = itemSpacing
        
        // 최소 행간 간격 (수평 간격)
        layout.minimumInteritemSpacing = itemSpacing

        self.collection.collectionViewLayout = layout
    }
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collection)
        
        collection.dataSource = self
        collection.delegate = self
        
        setCollectionLayout()
        collection.showsVerticalScrollIndicator = false
        
        loadUIDetails()
    }
    

}

class ProfileDesignCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnail: UIImageView!
    
}
