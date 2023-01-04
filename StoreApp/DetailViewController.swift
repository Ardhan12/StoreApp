//
//  DetailViewController.swift
//  StoreApp
//
//  Created by Arief Ramadhan on 03/01/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let viewPage: UIView = {
        let viewpage = UIView()
        viewpage.translatesAutoresizingMaskIntoConstraints = true
        viewpage.backgroundColor = .red
        
        return viewpage
    }()
    //
    private let imageView: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "alfa")
        imageview.frame = CGRect(x:0, y: 90, width:400 , height: 300)
        
        return imageview
    }()
    private let imageNav: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "alfa")
        imageview.frame = CGRect(x:320, y: 360, width:50 , height: 50)
        imageview.clipsToBounds = true
        imageview.layer.cornerRadius = imageview.frame.size.width / 2
        
        
        return imageview
    }()
    private let imageCam: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "alfa")
        imageview.frame = CGRect(x:260, y: 360, width:50 , height: 50)
        imageview.clipsToBounds = true
        imageview.layer.cornerRadius = imageview.frame.size.width / 2
        
        
        return imageview
    }()
    private let imageLoc: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "alfa")
        imageview.frame = CGRect(x:200, y: 360, width:50 , height: 50)
        imageview.clipsToBounds = true
        imageview.layer.cornerRadius = imageview.frame.size.width / 2
        
        
        return imageview
    }()
    
    
    private let buttonNoVisit: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 85, y: 750, width: 100, height: 50)
        button.backgroundColor = .systemRed
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.setTitle("No Visit", for: .normal)
        button.addTarget(ViewController.self, action: #selector(buttonAction), for: .touchDragInside)
        
        return button
    }()
    private let buttonVisit: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 215, y: 750, width: 100, height: 50)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.setTitle("Visit", for: .normal)
        button.addTarget(ViewController.self, action: #selector(buttonAction), for: .touchDragInside)
        
        return button
    }()
    
    @objc func buttonAction(sender: UIButton!) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail Page"
        view.backgroundColor = .white
//        view.addSubview(viewPage)
        view.addSubview(imageView)
        view.addSubview(buttonVisit)
        view.addSubview(buttonNoVisit)
        view.addSubview(imageNav)
        view.addSubview(imageCam)
        view.addSubview(imageLoc)
        addConstraint()
    }
    //
    private func addConstraint() {
//        var constraints = [NSLayoutConstraint]()
        
        imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true

//        constraints.append(viewPage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
//        constraints.append(viewPage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
//        constraints.append(viewPage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
//        constraints.append(viewPage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
//
//        NSLayoutConstraint.activate(constraints)
    }
    
}
