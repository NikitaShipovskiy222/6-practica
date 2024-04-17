//
//  SecondViewController.swift
//  6 practica
//
//  Created by Nikita Shipovskiy on 17/04/2024.
//

import UIKit

final class SecondViewController: UIViewController {

    var item: Item?
    
    var name = ""
    private lazy var labelName: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .black
        $0.text = name
        $0.textAlignment = .center
        return $0
    }(UILabel(frame: CGRect(x: 20, y: 70, width: view.frame.width - 40, height: 50)))
    
    var mainImage = ""
    private lazy var bigImage: UIImageView = {
        $0.image = UIImage(named: mainImage)
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.layer.borderWidth = 1
        return $0
    }(UIImageView(frame: CGRect(x: 20, y: labelName.frame.maxY + 20, width: view.frame.width - 40, height: 200)))
    
    
    var textLil = ""
    private lazy var lilText: UILabel = {
        $0.text = textLil
        $0.font = UIFont.systemFont(ofSize: 15, weight: .light)
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.textAlignment = .center
        return $0
    }(UILabel(frame: CGRect(x: 20, y: bigImage.frame.maxY + 20, width: view.frame.width - 40, height: 50)))
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(labelName)
        view.addSubview(bigImage)
        view.addSubview(lilText
        )
        navigationController?.navigationBar.tintColor = .black
    }
}
