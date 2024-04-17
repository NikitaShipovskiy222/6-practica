//
//  ItemTableViewCell.swift
//  6 practica
//
//  Created by Nikita Shipovskiy on 16/04/2024.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    
    
    private lazy var  itemVie: UIView = {
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 30
        $0.clipsToBounds = true
        $0.isUserInteractionEnabled = true
        return $0
    }(UIView(frame: CGRect(x: 30, y: 25, width: frame.width  - 60 , height: 600)))
    
    private lazy var itemImage: UIImageView = {
        $0.layer.cornerRadius = 20
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView(frame: CGRect(x: 25 , y: 25, width: itemVie.bounds.width - 50, height: itemVie.bounds.width - 20)))
    
    private lazy var labelName: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .white
        $0.textAlignment = .center
        $0.numberOfLines = 0
        return $0
    }(UILabel(frame: CGRect(x: 25, y: itemImage.bounds.maxY + 35, width: itemImage.bounds.width, height: 20)))
    
    private lazy var hStack: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 25
        $0.distribution = .fillEqually
        return $0
        
    }(UIStackView(frame: CGRect(x: 25, y: labelName.frame.maxY + 10, width: labelName.bounds.width, height: 99)))
    
    private lazy var labelDesin: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 15, weight: .light)
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.textColor = .black
        return $0
    }(UILabel(frame: CGRect(x: 25, y: hStack.frame.maxY + 10, width: hStack.bounds.width, height: 80)))
    
    var complition: (() -> Void)?
    
    private lazy var buttonNext: UIButton = {
        $0.setTitle("Next", for: .normal)
        $0.backgroundColor = .black
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
        return $0
    }(UIButton(frame: CGRect(x: 25, y: labelDesin.frame.maxY + 10, width: itemVie.frame.width - 50, height: 40), primaryAction: nextAction))
    
    lazy var nextAction = UIAction { [weak self] _ in
        guard let self = self else {return}
        self.complition?()
    }
    
    
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
    }
    
    func SetupImage(item: Item) {

        
        itemImage.image = UIImage(named: item.imageBig)
        
        
        item.imageLil.forEach{
            self.hStack.addArrangedSubview(setImage(name: $0))
            self.prepareForReuse()
        }
        
        
        labelName.text = "\(item.name)"
        labelDesin.text = "\(item.desi)"
        
        addSubview(itemVie)
        
        [labelName, itemImage, hStack, labelDesin, buttonNext].forEach{
            itemVie.addSubview($0)
            
            
        }
        
    }
    
    private func setImage(name: String) -> UIImageView{
        {
            $0.image = UIImage(named: name)
            $0.contentMode = .scaleAspectFill
            $0.layer.cornerRadius = 20
            $0.clipsToBounds = true
            return $0
        }(UIImageView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
