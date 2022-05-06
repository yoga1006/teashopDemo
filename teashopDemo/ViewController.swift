//
//  ViewController.swift
//  teashopDemo
//
//  Created by Yoga on 2022/5/6.
//

import UIKit

class ViewController: UIViewController {

    let drinks = ["john","monmonday","shangyulin"]
    let shops = ["約翰紅茶","漫漫點","上宇林"]
    var index:Int = 0
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var drinkLabel: UILabel!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var pageDot: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //切換到上一頁
    @IBAction func pre(_ sender: Any) {
        
        //切到上一頁，一開始index為0，若直接0-1為負數會出現錯誤，若想得出上一頁的數字，可用(index＋要切換的頁面數-1)除以切換的頁面數所得的餘數
        index=(index+drinks.count-1)%drinks.count
        //做圖片的切換，IBOutlet為logoImageView
        logoImageView.image=UIImage(named: drinks[index])
        //店名也要一起更換，IBOutlet為drinkLabel，其要存取的內容為一開始先定義的shops Array
        drinkLabel.text=shops[index]
        //第幾名的segment也需換頁，IBOutlet為segment
        segment.selectedSegmentIndex=index
        //小圓點也須同步切換，IBOutlet為pageDot
        pageDot.currentPage = index
        
    }
    //切換到下一頁
    @IBAction func next(_ sender: Any) {
        
        index=(index+1)%drinks.count
        let name = drinks[index]
        logoImageView.image=UIImage(named: name)
        drinkLabel.text=shops[index]
        segment.selectedSegmentIndex=index
        pageDot.currentPage = index
    }
    
    
    @IBAction func segmentChange(_ sender: Any) {
        
        index = segment.selectedSegmentIndex
        logoImageView.image=UIImage(named: drinks[index])
        drinkLabel.text=shops[index]
        pageDot.currentPage = index
        
        }
    
    
    @IBAction func pageChange(_ sender: Any) {
        
        index = pageDot.currentPage
        segment.selectedSegmentIndex=index
        logoImageView.image=UIImage(named: drinks[index])
        drinkLabel.text=shops[index]
        
    }
    
        
    }

