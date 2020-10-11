//
//  CustomTableViewCell.swift
//  iOSChallenge
//
//  Created by Mounika Jakkampudi on 10/10/20.
//  Copyright © 2020 Tmobile. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    private let postImageView : UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "placeholder.png"))
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private let postTitleLabel : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textColor = .black
        lbl.numberOfLines = 3
        return lbl
    }()
    
    private let postCommentNoLabel : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textAlignment = .left
        lbl.textColor = .black
        lbl.numberOfLines = 0
        return lbl
    }()

    private let postScoreLabel : UILabel =  {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .right
        label.textColor = .black
        return label
        
    }()
    
    private let shadowLabel : UILabel =  {
        let label = UILabel()
        label.backgroundColor = .systemGray5
        return label
        
    }()
    
    private let stackViewHorizontal   = UIStackView()
    private let stackView   = UIStackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        //stackViewHorizontal
        stackViewHorizontal.backgroundColor = UIColor.white
        stackViewHorizontal.axis  = NSLayoutConstraint.Axis.horizontal
        stackViewHorizontal.distribution  = UIStackView.Distribution.fillEqually
        stackViewHorizontal.addArrangedSubview(postCommentNoLabel)
        stackViewHorizontal.addArrangedSubview(postScoreLabel)
        stackViewHorizontal.translatesAutoresizingMaskIntoConstraints = false

        //stackView
        stackView.backgroundColor = UIColor.white
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.spacing = 15.0
        stackView.addArrangedSubview(postTitleLabel)
        stackView.addArrangedSubview(postImageView)
        stackView.addArrangedSubview(stackViewHorizontal)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(stackView)
        
        //shadowLabel
        shadowLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(shadowLabel)
        
        //Constraints
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            stackView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.shadowLabel.topAnchor),
            shadowLabel.heightAnchor.constraint(equalToConstant: 5.0),
            shadowLabel.topAnchor.constraint(equalTo: self.stackView.bottomAnchor),
            shadowLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        //VisualFormat
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[stackView][shadowLabel(5)]|", options: [.alignAllLeading,.alignAllTrailing], metrics: nil, views: ["stackView":stackView, "shadowLabel":shadowLabel]))
       }
       
    required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }

    var childrenDataObject : ChildrenDataObject? {
     didSet {
        guard let childrenDTO = childrenDataObject else {
                return
            }
        postTitleLabel.text = childrenDTO.title
        postCommentNoLabel.text = "\(childrenDTO.numComments ?? 0) Comments"
        postScoreLabel.text = "Score: \(childrenDTO.score ?? 0)"

        postImageView.setImageFromServerURL(childrenDTO.thumbnail ?? "", placeHolder: UIImage(named: "placeholder.png")!) { (image) -> (Void) in
         }
        }
    }
}


