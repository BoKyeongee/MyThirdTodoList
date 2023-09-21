//
//  ProfileViewController.swift
//  MyApp2
//
//  Created by 보경 on 2023/09/22.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    let viewModel: SimpleProfileViewModel = SimpleProfileViewModel()
    let views = SimpleProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        views.bind(with: viewModel)
    }
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(views)
        views.translatesAutoresizingMaskIntoConstraints = false
        views.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        views.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
