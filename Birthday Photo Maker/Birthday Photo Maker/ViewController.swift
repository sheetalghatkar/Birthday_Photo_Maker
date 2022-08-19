//
//  ViewController.swift
//  Birthday Photo Maker
//
//  Created by Sheetal Ghatkar on 27/07/22.
//

import UIKit

class ViewController:UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var viewParentSetting: UIView!
    @IBOutlet weak var viewtransperent: UIView!

    @IBOutlet weak var topBgImg: NSLayoutConstraint!
    @IBOutlet weak var collectionViewOption: UICollectionView!
    var cellWidth = 10.0
//    public var optionImageArray = ["pink_circle.png","blue_circle.png","green_circle.png","purple_circle.png"]
    
    public var optionImageArray = ["red_circle6.png","blue_circle.png","green_circle.png","blue_circle6.png", "queen_circle2.png", "blue_circle.png","blue_circle.png","green_circle11.png","brown_circle.png","brown_circle3.png","gray_circle3.png","black_circle1.png"]

    
//    public var optionImageArray = ["green_circle.png","green_circle.png","green_circle.png","green_circle.png", "green_circle.png"]


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topBgImg.constant = UIScreen.main.bounds.height / 2
        cellWidth = ((UIScreen.main.bounds.width) - Double(60.0)) / 2.2
//        var optionArray = ["Wild Animals","Farm Animals","Birds","Sea Animals","Reptiles &\nAmphibians", "Insects", "Flowers"]
        
        
        
        self.collectionViewOption.delegate = self
        self.collectionViewOption.dataSource = self
        
        collectionViewOption.register(UINib(nibName: "HomeOptionCollectionCell", bundle: nil), forCellWithReuseIdentifier: "HomeOptionCollectionCell")
        
        
    }
    

    
    // MARK: - CollectionView Functions
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  optionImageArray.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeOptionCollectionCell", for: indexPath) as! HomeOptionCollectionCell
       // cell.lblOption.text = optionArray[indexPath.row]
        cell.imgViewOption.image = UIImage(named:optionImageArray[indexPath.row])
        cell.tag = indexPath.row
//        cell.imgViewOption.contentMode = .scaleToFill
//        cell.imgViewOption.clipsToBounds = true

//        cell.backgroundColor = UIColor.red
       // cell.delegateHomeOptionCollection = self

        if ((indexPath.row == 1)||(indexPath.row == 2)||(indexPath.row == 5)||(indexPath.row == 6)||(indexPath.row == 9)||(indexPath.row == 10)) {
            cell.isHidden = true
        } else if((indexPath.row == 0)||(indexPath.row == 3)||(indexPath.row == 4)||(indexPath.row == 7)||(indexPath.row == 8)||(indexPath.row == 11)) {
            cell.isHidden = false
        }
        cell.isUserInteractionEnabled = true
        return cell
    }
//    func numberOfSections(in collectionView: UICollectionView) -> Int{
//        return 2;
//    }

    func convertAnyObjectToJSONString(from object:Any) -> String? {

        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {

            return nil
        }

        return String(data: data, encoding: String.Encoding.utf8)
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        print("----**---",UIScreen.main.bounds.width / 2.2)
        if (indexPath.row == 1) {
            return CGSize(width: cellWidth, height: cellWidth - 50)
        } else {
            return CGSize(width: cellWidth, height: cellWidth)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return -50
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return -50

    }
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected Cell: \(indexPath.row)")
    }


        //CGSize(width:UIScreen.main.bounds.width / 2.5, height:         UIScreen.main.bounds.width / 2.5)

       /* if (UIDevice.current.userInterfaceIdiom == .pad) {
            if UIScreen.main.bounds.height > 1100 {
                return CGSize(width: 300, height: 280)
            }
            return CGSize(width: 200, height: 250)
        } else if (UIScreen.main.bounds.height < 850 && !(UIDevice.current.userInterfaceIdiom == .pad)) {
            return CGSize(width: 145, height: 180)
        } else {
            return CGSize(width: 160, height: 210)
        }*/
    //}

//    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return  2
//    }
//    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return  2
//    }


}


