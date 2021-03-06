//
//  ViewController.swift
//  demo
//
//  Created by Yan Li on 5/12/15.
//  Copyright (c) 2015 Liulishuo.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

  @IBOutlet weak var textView: FuriganaTextView!
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    
    textView.furiganas = exampleFuriganas
    textView.contents = exampleContents
  }

}


// MARK: - Example Contents Mock

extension ViewController
{
  
  private var exampleFuriganas: [Furigana] {
    return [
      // Furiganas for '田中さん、中華料理を食べたことありますか。'
      Furigana(text: "た", original: "田", range: NSMakeRange(0, 1)),
      Furigana(text: "なか", original: "中", range: NSMakeRange(1, 1)),
      Furigana(text: "ちゅう", original: "中", range: NSMakeRange(5, 1)),
      Furigana(text: "か", original: "華", range: NSMakeRange(6, 1)),
      Furigana(text: "りょう", original: "料", range: NSMakeRange(7, 1)),
      Furigana(text: "り", original: "理", range: NSMakeRange(8, 1)),
      Furigana(text: "た", original: "食", range: NSMakeRange(10, 1)),
      
      // Furiganas for 'すみません。靴売り場はどこですか。'
      Furigana(text: "くつ", original: "靴", range: NSMakeRange(29, 1)),
      Furigana(text: "う", original: "売", range: NSMakeRange(30, 1)),
      Furigana(text: "ば", original: "場", range: NSMakeRange(32, 1)),
    ]
  }
  
  // Because we are using NSAttributedString as contents,
  // most builtin attributes (e.g. NSFontAttributeName, NSForegroundColorAttributeName) will work just fine.
  private var exampleContents: NSAttributedString {
    let contents = NSMutableAttributedString(string: "田中さん、中華料理を食べたことありますか。\n\n", attributes: [NSFontAttributeName : exampleFont])
    contents.addAttribute(NSForegroundColorAttributeName, value: UIColor.darkGrayColor(), range: NSMakeRange(0, 2))
    contents.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: NSMakeRange(5, 2))
    contents.addAttribute(NSForegroundColorAttributeName, value: UIColor.brownColor(), range: NSMakeRange(7, 2))
    contents.addAttribute(NSForegroundColorAttributeName, value: UIColor.greenColor(), range: NSMakeRange(10, 1))
    
    contents.appendAttributedString(NSAttributedString(string: "すみません。靴売り場はどこですか。", attributes: [NSFontAttributeName : exampleFontSansSerif]))
    contents.addAttribute(NSForegroundColorAttributeName, value: UIColor.purpleColor(), range: NSMakeRange(29, 1))
    contents.addAttribute(NSForegroundColorAttributeName, value: UIColor.orangeColor(), range: NSMakeRange(30, 3))
    
    return contents;
  }
  
  private var exampleFont: UIFont {
    if let fontDescriptor = UIFontDescriptor(name: "Hiragino Mincho ProN", size: 24).fontDescriptorWithSymbolicTraits(.TraitBold)
    {
      return UIFont(descriptor: fontDescriptor, size: 24)
    }
    else
    {
      return UIFont.boldSystemFontOfSize(24)
    }
  }
  
  private var exampleFontSansSerif: UIFont {
    let fontDescriptor = UIFontDescriptor(name: "Hiragino Kaku Gothic ProN", size: 24)
    return UIFont(descriptor: fontDescriptor, size: 24)
  }
  
}
