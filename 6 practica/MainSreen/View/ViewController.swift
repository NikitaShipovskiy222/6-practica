//
//  ViewController.swift
//  6 practica
//
//  Created by Nikita Shipovskiy on 16/04/2024.
//

import UIKit

final class ViewController: UIViewController {
    


    private var item = Item.makeData()
    
    private lazy var makeItem: UITableView = {
        $0.register(ItemTableViewCell.self, forCellReuseIdentifier: "item")
        $0.dataSource = self
        $0.delegate = self
        $0.separatorStyle = .none
        return $0
    }(UITableView(frame: CGRect(x: 20, y: 70, width: view.frame.width - 60, height: 800)))
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        view.addSubview(makeItem)
    }


}


//MARK: - DataSouce
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        item.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     guard let itemCell = makeItem.dequeueReusableCell(withIdentifier: "item", for: indexPath) as? ItemTableViewCell else {return UITableViewCell()}
        itemCell.SetupImage(item: item[indexPath.row])
        itemCell.selectionStyle = .none
        item[indexPath.row].imageLil = [""].dropLast()
    
        let item = item[indexPath.row]
        itemCell.complition = { [weak self]  in
            
            guard let self = self else {return}
            
            let secondVC = SecondViewController()
            secondVC.item = item
            secondVC.name = self.item[indexPath.row].name
            secondVC.mainImage = self.item[indexPath.row].imageBig
            secondVC.textLil = self.item[indexPath.row].desi
            self.navigationController?.pushViewController(secondVC, animated: true)
        }
        
        return itemCell
        
    }
    
    
}
//MARK: - Delegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        view.frame.width + 300
        
    }
    
}
