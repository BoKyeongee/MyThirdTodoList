//
//  SimpleProfileView.swift
//  MyApp2
//
//  Created by 보경 on 2023/09/22.
//

import UIKit
import SnapKit

class SimpleProfileView: UIView {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24)
        label.textAlignment = .center
        label.textColor = .green
        return label
    }()
    
    var ageLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24)
        label.textAlignment = .center
        label.textColor = .green
        return label
    }()
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           setupUI()
       }
       
    required init?(coder: NSCoder) {
           super.init(coder: coder)
           setupUI()
       }
    
    func setupUI() {
        addSubview(nameLabel)
        addSubview(ageLabel)
        nameLabel.snp.makeConstraints{ make in
            make.centerX.centerY.equalToSuperview()
        }
        ageLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom)
        }
    }
        
    func bind(with viewModel: SimpleProfileViewModel) {
        nameLabel.text = "userName: " + viewModel.simpleUserInfo.userName
        ageLabel.text = "userAge: " + String(viewModel.simpleUserInfo.userAge)
            
        viewModel.simpleInfoDidChange = { [weak self] simpleUserInfo in
            self?.nameLabel.text = "userName: " + simpleUserInfo.userName
            self?.ageLabel.text = "userAge: " + String(simpleUserInfo.userAge)
        }
    }
}
