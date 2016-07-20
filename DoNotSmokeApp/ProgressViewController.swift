//
//  ProgressViewController.swift
//  DoNotSmokeApp
//
//  Created by Isabela Pereira on 7/19/16.
//  Copyright © 2016 Isabela Pereira. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    
// MARK: ARRAYS
    
    var progressImages = [UIImage(named: "20minutesHeart"), UIImage(named: "2hoursHeart"), UIImage(named: "8hoursProgress"), UIImage(named: "12hoursProgress"), UIImage(named: "24hoursProgress"), UIImage(named: "48hoursProgress"), UIImage(named: "3daysProgress"), UIImage(named: "2to3weeksProgress"), UIImage(named: "1to9monthsProgress"), UIImage(named: "1yearProgress"), UIImage(named: "5yearsProgress"), UIImage(named: "10yearsProgress"), UIImage(named: "15yearsProgress")]
    
    var progressTitle = ["20 minutos", "2 horas", "8 horas", "12 horas", "24 horas", "48 horas", "3 dias", "2 a 3 semanas", "1 a 9 meses", "1 ano", "5 anos", "10 anos"]
    
    var progressText = ["sua frequência cardíaca começará a cair até voltar ao nível normal",
                        "sua frequência cardíaca e pressão sanguínea estão pertinho de atingir o nível normal. Ah, e sua circulação sanguínea também vai começar a melhorar! Daqui a pouco você vai sentir as pontas dos seus dedos ficarem mais quentes.",
                        "os níveis de nicotina e monóxido de carbono no seu sangue já caíram pela metade. Agora, os níveis de oxigênio vão se normalizar e seu cabelo e sua pele ficarão bem bonitões!",
                        "o nível de monóxido de carbono no seu corpo está caindo! E com isso, a quantidade de oxigênio no seu sangue tá quaaase chegando a um valor normal. Falta bem pouquinho!",
                        "fumantes tem 70% mais risco de ter a chamada Doença Arterial Coronariana, que afeta os principais vasos sanguíneos do coração. A boa notícia? O risco de você ter já começou a diminuir! Também estão diminuindo as chances de um ataque cardíaco. Isso tudo em um diazinho só ein..",
                        "seu olfato e paladar estão ficando mais sensíveis. Já já você vai notar a diferença. Que tal apreciar o seu prato preferido?",
                        ]
    
// MARK: COLLECTION VIEW
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.progressImages.count
    }
    
// MARK: COLLECTION VIEW CELL
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! ProgressCell
        
        cell.cellImage.image = self.progressImages[indexPath.row]
    
        return cell
    }

    

    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
