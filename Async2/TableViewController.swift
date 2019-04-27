//
//  TableViewController
//  Async2
//
//  Created by STUDENT on 27/04/2019.
//  Copyright © 2019 STUDENT. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    private var images = [UIImage?]()
    
    private let imageURLStrings = [
        "https://images.pexels.com/photos/207962/pexels-photo-207962.jpeg?cs=srgb&dl=artistic-blossom-bright-207962.jpg&fm=jpg",
        "https://images.unsplash.com/photo-1516589178581-6cd7833ae3b2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
        "https://st4.depositphotos.com/9897138/20228/i/1600/depositphotos_202280128-stock-photo-silhouette-woman-hands-heart-shape.jpg",
        "https://images.unsplash.com/photo-1483691278019-cb7253bee49f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80",
        "https://jecoaching.com/wp-content/uploads/2015/02/ripple1.jpg",
        "https://images.livemint.com/rf/Image-621x414/LiveMint/Period2/2018/11/24/Photos/Home%20Page/wedding-kWdE--621x414@LiveMint-8925.jpg",
        "https://thumbs.dreamstime.com/z/saving-drowning-man-hand-sea-33364386.jpg",
        "https://www.abc.net.au/news/image/9670912-3x2-700x467.jpg",
        "https://www.nyip.edu/media/zoo/images/how-to-instantly-improve-sunset-photos_2dbd0d9a0883b1e479745909e817b263.jpg",
        "https://tocka.com.mk/images/gallery/gallery-images/big/974/gal41717697.jpg",
        "https://3hh5bj8xbp7b7mq3hzh46bcs-wpengine.netdna-ssl.com/wp-content/uploads/2016/10/GoPro-Hero5-Black-Burst-Photo-750x536.jpg",
        "https://pixel.nymag.com/imgs/daily/vulture/2017/05/22/got-bts/got-06.w710.h473.jpg",
        "https://pub-static.haozhaopian.net/static/web/site/features/one-tap-enhance/images/1-tap-enhance_comparison_chart0cd39fa2358c48f674db97b65327666e.jpg",
        "https://cdn.vox-cdn.com/thumbor/oe7HgITxeapRVlTqL-WtdXI8ARg=/0x0:2000x1250/1200x800/filters:focal(840x177:1160x497)/cdn.vox-cdn.com/uploads/chorus_image/image/58822079/dunkirkcover.0.jpeg",
        "https://natgeo.imgix.net/factsheets/thumbnails/yourshot-underwater-1869254.adapt.1900.1.jpg?auto=compress,format&w=1024&h=560&fit=crop",
        "https://images.unsplash.com/photo-1509070016581-915335454d19?ixlib=rb-1.2.1&w=1000&q=80",
        "https://cdn.pixabay.com/photo/2015/11/02/14/26/maple-1018458_960_720.jpg",
        "https://d357bpt78riloh.cloudfront.net/my-picture2-co-uk/assets/img/products/photo-canvas-folded-0efc21fb5e.jpg",
        "https://www.incimages.com/uploaded_files/image/970x450/getty_670570584_200013751503697107170_367713.jpg",
        "https://images7.alphacoders.com/671/671281.jpg",
        "http://thewowstyle.com/wp-content/uploads/2015/03/3d-mario-wallpaper-super-desktop-art-stars-gallery.jpg",
        "https://images3.alphacoders.com/975/975999.png",
        "https://images7.alphacoders.com/305/305749.jpg",
        "https://images8.alphacoders.com/100/1003220.png",
        "https://images4.alphacoders.com/975/975294.jpg",
        "https://images5.alphacoders.com/481/481903.png",
        "https://images7.alphacoders.com/611/611138.png",
        "https://images6.alphacoders.com/515/515434.jpg",
        "https://images5.alphacoders.com/325/325117.jpg",
        "https://images5.alphacoders.com/564/564821.jpg",
        "https://images5.alphacoders.com/837/837093.jpg",
        "https://images7.alphacoders.com/867/867279.jpg",
        "https://images8.alphacoders.com/867/867237.jpg",
        "https://images2.alphacoders.com/159/159692.jpg",
        "https://images8.alphacoders.com/745/745710.jpg",
        "https://images6.alphacoders.com/704/704120.png",
        "https://images2.alphacoders.com/703/703553.jpg",
        "https://images6.alphacoders.com/613/613924.jpg",
        "https://images8.alphacoders.com/463/463477.jpg"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            for urlString in imageURLStrings {

                guard let url = URL(string: urlString) else {
                    continue
                }
                
                let data = try Data(contentsOf: url)
                let image = UIImage(data: data)
                
                images.append(image)
                
            }
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? TableCell else {
            fatalError("Can't cast cell to TableCell.")
        }
        
        cell.setImage(images[indexPath.row])
    }
}


class TableCell: UITableViewCell {
    
    @IBOutlet private var photoView: UIImageView!
    
    func setImage(_ image: UIImage?) {
        photoView.image = image
    }
}
