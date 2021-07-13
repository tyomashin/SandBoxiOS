//
//  ViewController.swift
//  TabCollectionViewSample
//
//  Created by micware on 2021/07/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var tabView: TabView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topViewTopConstraints: NSLayoutConstraint!
    
    private let TOPVIEW_HEIGHT: CGFloat = 100
    private var currentOffsetY: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height

        print("hoge!", contentOffset, maximumOffset)
        
        // 上方向スクロール
        if currentOffsetY - contentOffset < 0{
            print("up")
            if topViewTopConstraints.constant <= -100{
                topViewTopConstraints.constant = -100
                //currentOffsetY = contentOffset
            }else{
                topViewTopConstraints.constant -= contentOffset
                scrollView.contentOffset.y = 0
                currentOffsetY = 0
            }
        }
        // 下方向スクロール
        else {
            print("down")
            if topViewTopConstraints.constant >= 0{
                topViewTopConstraints.constant = 0
                //currentOffsetY = contentOffset
            }else{
                topViewTopConstraints.constant -= contentOffset
                scrollView.contentOffset.y = 0
                currentOffsetY = 0
            }
        }
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        //let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cell = UITableViewCell()
        // セルに表示する値を設定する
        cell.textLabel!.text = "\(indexPath.row)"
        return cell
    }
    
    
}
