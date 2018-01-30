
/*
 swift中闭包，可作为属性、函数参数、以及函数返回值
 */

import UIKit

/// 给闭包起别名
typealias ClosuresOne = ((Int)->(Int))

class CDBasicsViewController: CDViewController {
    
    /// 闭包作为参数
    var closures1: ClosuresOne?
    var closures2: ((Int)->(Int))?
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        defineClosures()
        
        
        /// 这里即可以传一个与参数同函数类型的函数，也可以传一个闭包
//        closuresDeedParameter(square(_:))
//        closuresDeedParameter { (number) -> (Int) in
//            return number*2
//        }
        
        
        let closures = closuresReturnValue()
        print(closures(8))
    }

    func defineClosures() {
        /// 定义一个闭包，包含参数返回值、闭包体(在某些情况下，一些东西可以省略不写，能够自动推断,通常返回类型是可以通过闭包体推断出来的)
        let closures = { (number: Int) -> Int in
            return number*number
        }

        print(closures(6))
    }

    /// 闭包作为参数
    func closuresDeedParameter(_ closures: ((Int)->(Int))) {
        print(closures(7))
    }
    
    func square(_ number: Int) -> Int {
        return number*number
    }
    
    func closuresReturnValue() -> (Int)->(Int) {
        
        /// 这里即可以返回与返回值类型同函数类型的函数，也可以传一个闭包
//        return square(_:)
        return { number in
            return number*2
        }
        
    }

}
