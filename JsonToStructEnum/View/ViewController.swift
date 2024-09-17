//
//  ViewController.swift
//  JsonToStructEnum
//
//  Created by Abouzar Moradian on 9/17/24.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel = CookieViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        tableView.dataSource = self
        
        loadCookieData()
        loadVideoData()

        
    }
    
    func loadVideoData() {
        
        viewModel.decodeJsonString(modelType: VideoModel.self,  Constants.videoJsonData.rawValue){ [weak self] result in
            
            guard let self = self else {return}
            
            switch result {
            case .success(let videoObject):
                
                DispatchQueue.main.async {
                    
                    print(videoObject)
                    self.tableView.reloadData()
                }
                
            case .failure(let failure):
                print("failed to decode")
            }
        }
       
    }
    
    func loadCookieData(){
        
        viewModel.decodeJsonString(modelType: Cookie.self,  Constants.cookieJsonData.rawValue){ [weak self] result in
            
            guard let self = self else {return}
            
            switch result {
            case .success(let cookieObject):
                
                DispatchQueue.main.async {
                    
                    self.viewModel.cookie = cookieObject
                    self.tableView.reloadData()
                }
                
            case .failure(let failure):
                print("failed to decode")
            }
        }
    }
    
    func registerCell(){
        let nib = UINib(nibName: ToppingCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ToppingCell.identifier)
    }


}

extension  ViewController:  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let filteredBatters = viewModel.cookie?.batters.batter.filter { $0.type == .blueberry || $0.type == .chocolate }
        print("count: \(filteredBatters?.count)")
        return filteredBatters?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ToppingCell.identifier, for: indexPath) as? ToppingCell else { return UITableViewCell()}
        
        if let filteredBatters = viewModel.cookie?.batters.batter.filter({ $0.type == .blueberry || $0.type == .chocolate }) {
            
            
            let batter = filteredBatters[indexPath.row]
            
            cell.batter = batter
            
        }
        
        return cell
    }
    
}

