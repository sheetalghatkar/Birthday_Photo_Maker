//
//  HomeOptionCollectionCell.swift
//  Learn Nature
//
//  Created by Sheetal Ghatkar on 31/03/21.
//  Copyright © 2021 sheetal shinde. All rights reserved.
//

import UIKit
import AVFoundation

protocol HomeOptionCollectionProtocol : class {
    func clickOnHomeOption(getTag : Int)
}

class HomeOptionCollectionCell: UICollectionViewCell {
    @IBOutlet weak var imgViewOption: UIImageView!
//    @IBOutlet weak var lblOption: UILabel!
    var fontImageTitleLbl = UIFont(name: "ChalkboardSE-Bold", size: 24)
    weak var delegateHomeOptionCollection : HomeOptionCollectionProtocol?
    @IBOutlet weak var  widthOptionView: NSLayoutConstraint!
    var cellWidth = ((UIScreen.main.bounds.width) - Double(60.0)) / 2.2
    var player = AVAudioPlayer()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellWidth = ((UIScreen.main.bounds.width) - Double(60.0)) / 2.2

        let tapGestureRecognImg = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(tapGestureRecognizer:)))
        imgViewOption.addGestureRecognizer(tapGestureRecognImg)
        widthOptionView.constant = cellWidth
      //  widthOptionView.constant = UIScreen.main.bounds.width / 2
//        let tapGestureRecognLbl = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(tapGestureRecognizer:)))
//        lblOption.addGestureRecognizer(tapGestureRecognLbl)
       // imgViewOption.layer.cornerRadius = (widthWildAnimal.constant)/2
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgViewOption.isUserInteractionEnabled = true
        imgViewOption.addGestureRecognizer(tapGestureRecognizer)


    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){

        let tappedImage = tapGestureRecognizer.view as! UIImageView

        UIView.animate(withDuration: 0.2, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                
               // HERE
            tappedImage.transform = CGAffineTransform.identity.scaledBy(x: 0.5, y: 0.5) // Scale your image
            let path = Bundle.main.path(forResource: "optionClickSound", ofType : "mp3")!
            let url = URL(fileURLWithPath : path)
            do {
                self.player = try AVAudioPlayer(contentsOf: url)
               // if defaults.bool(forKey:"IsHomeSoundON") {
                    self.player.play()
               // }
            } catch {
               // print ("There is an issue with this code!")
            }
         }) { (finished) in
             UIView.animate(withDuration: 0.2, animations: {
               
                 tappedImage.transform = CGAffineTransform.identity // undo in 1 seconds

           })
        }    }

    @objc func imageViewTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        delegateHomeOptionCollection?.clickOnHomeOption(getTag: self.tag)
    }
    
    override func prepareForReuse()
    {
        print("---prepareForReuse---",self.tag)
        self.backgroundColor = UIColor.black
        if ((self.tag == 1) || (self.tag == 2) || (self.tag == 5) || (self.tag == 6) || (self.tag == 9)||(self.tag == 10)) {
            self.isHidden = true
//            self.imgViewOption.isHidden = true
//            self.backgroundColor = UIColor.black
        } else if ((self.tag == 0) || (self.tag == 3) || (self.tag == 4) || (self.tag == 7) || (self.tag == 8) || (self.tag == 11)) {
            self.isHidden = false
//            self.backgroundColor = UIColor.red
        }
//       self.HiddenGemView?.hidden = true
    }
}
