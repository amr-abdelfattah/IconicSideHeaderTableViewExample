//
//  ViewController.swift
//  SideHeaderTableView
//
//  Created by admin on 1/14/20.
//  Copyright © 2020 Amr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    
    private var items = [Int : [(String, UIImage?)]]()
    private var sections = [UIImage]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.loadData()
        self.loadSections()
        
    }

    private func loadSections() {
    
        self.sections.append(UIImage.add)
        self.sections.append(UIImage.remove)
        self.sections.append(UIImage.checkmark)
        
    }
    
    private func loadData() {
        
        items.removeAll()
        
        items[0] = [(String, UIImage?)]()
        items[2] = [(String, UIImage?)]()
        items[1] = [(String, UIImage?)]()
        
        items[0]?.append(("First Item", UIImage.add))
        items[0]?.append(("Second Item", nil))
        items[0]?.append(("Third Item", nil))
        items[0]?.append(("Fourth Item", nil))
        items[0]?.append(("Fifth Item", nil))
        items[0]?.append(("Sixth Item", nil))
        items[0]?.append(("Seventh Item", nil))
        items[0]?.append(("Second Item", nil))
        items[0]?.append(("Third Item", nil))
        items[0]?.append(("Fourth Item", nil))
        items[0]?.append(("Fifth Item", nil))
        items[0]?.append(("Sixth Item", nil))
        items[0]?.append(("Seventh Item", nil))
        
        items[1]?.append(("First Item", UIImage.remove))
        items[1]?.append(("Second Item", nil))
        items[1]?.append(("Third Item", nil))
        items[1]?.append(("Fourth Item", nil))
        items[1]?.append(("Fifth Item", nil))
        items[1]?.append(("Sixth Item", nil))
        items[1]?.append(("Seventh Item", nil))
        items[1]?.append(("Second Item", nil))
        items[1]?.append(("Third Item", nil))
        items[1]?.append(("Fourth Item", nil))
        items[1]?.append(("Fifth Item", nil))
        items[1]?.append(("Sixth Item", nil))
        items[1]?.append(("Seventh Item", nil))
        
        items[2]?.append(("First Item", UIImage.checkmark))
        items[2]?.append(("Second Item", nil))
        items[2]?.append(("Third Item", nil))
        items[2]?.append(("Fourth Item", nil))
        items[2]?.append(("Fifth Item", nil))
        items[2]?.append(("Sixth Item", nil))
        items[2]?.append(("Seventh Item", nil))
        items[2]?.append(("Second Item", nil))
        items[2]?.append(("Third Item", nil))
        items[2]?.append(("Fourth Item", nil))
        items[2]?.append(("Fifth Item", nil))
        items[2]?.append(("Sixth Item", nil))
        items[2]?.append(("Seventh Item", nil))
        
    }

}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items[section]?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as! CustomTableViewCell
        if let itemData = self.items[indexPath.section]?[indexPath.row] {
        
            tableViewCell.bind(title: itemData.0, image: itemData.1)
            
        }
        
        return tableViewCell
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.handleHeaderView()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.handleHeaderView()
    }
    
    private func handleHeaderView() {
        
        guard let visibleIndexPaths = self.tableview.indexPathsForVisibleRows, visibleIndexPaths.count > 0 else {
            return
        }
        
        let firstVisibleIndexPath = visibleIndexPaths[0]
            
        let sectionImage = self.sections[firstVisibleIndexPath.section]
        self.imageView.image = sectionImage
            
        
        if self.tableview.visibleCells.count > 0, let firstVisibleTableViewCell = self.tableview.visibleCells[0] as? CustomTableViewCell {
            firstVisibleTableViewCell.hideImage()
        }

        if self.tableview.visibleCells.count > 1, let secondVisibleTableViewCell = self.tableview.visibleCells[1] as? CustomTableViewCell {
            secondVisibleTableViewCell.showImage()
        }
        
    }
    
}
