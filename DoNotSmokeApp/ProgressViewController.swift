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
    
    @IBOutlet var notSmokingFor: UILabel!
    
    @IBOutlet var notSmokedCigarrettes: UILabel!
    
    @IBOutlet var timeWithoutSmoking: UILabel!
    
    @IBOutlet var savedMoney: UILabel!
    
    
    
    
    
    
// MARK: ARRAYS
    
    var progressImages = [UIImage(named: "20minutesHeart"), UIImage(named: "2hoursHeart"), UIImage(named: "8hoursProgress"), UIImage(named: "12hoursProgress"), UIImage(named: "24hoursProgress"), UIImage(named: "48hoursProgress"), UIImage(named: "3daysProgress"), UIImage(named: "2to3weeksProgress"), UIImage(named: "1to9monthsProgress"), UIImage(named: "1yearProgress"), UIImage(named: "5yearsProgress"), UIImage(named: "10yearsProgress"), UIImage(named: "15yearsProgress")]
    
    var progressTitle = ["20 minutos", "2 horas", "8 horas", "12 horas", "24 horas", "48 horas", "3 dias", "2 a 3 semanas", "1 a 9 meses", "1 ano", "5 anos", "10 anos", "15 anos"]
    
//    var progressText = ["sua frequência cardíaca começará a cair até voltar ao nível normal",
//                        "sua frequência cardíaca e pressão sanguínea estão pertinho de atingir o nível normal. Ah, e sua circulação sanguínea também vai começar a melhorar! Daqui a pouco você vai sentir as pontas dos seus dedos ficarem mais quentes.",
//                        "os níveis de nicotina e monóxido de carbono no seu sangue já caíram pela metade. Agora, os níveis de oxigênio vão se normalizar e seu cabelo e sua pele ficarão bem bonitões!",
//                        "o nível de monóxido de carbono no seu corpo está caindo! E com isso, a quantidade de oxigênio no seu sangue tá quaaase chegando a um valor normal. Falta bem pouquinho!",
//                        "fumantes tem 70% mais risco de ter a chamada Doença Arterial Coronariana, que afeta os principais vasos sanguíneos do coração. A boa notícia? O risco de você ter já começou a diminuir! Também estão diminuindo as chances de um ataque cardíaco. Isso tudo em um diazinho só ein..",
//                        "seu olfato e paladar estão ficando mais sensíveis. Já já você vai notar a diferença!",
//                        "????????",
//                        "você vai começar a sentir que tem mais fôlego para realizar atividades físicas. Sua circulação sanguínea e funções cardíacas vão melhorar bastante a partir de agora! Além disso, seus pulmões estão ficando limpos, o que vai te ajudar a  respirar bem mais fácil!",
//                        "Seus pulmões agora estão funcionando à todo vapor! Mais um pouquinho, sua tosse e falta de ar vão começar a desaparecer. Ao final desse progresso você já não vai nem mais saber o que é abstinência. Quase lá!!",
//                        "Seu risco de ter doenças cardíacas já caiu pela metade! Isso significa que um fumante tem 2x mais chances de desenvolver qualquer tipo de doença cardíaca do que você. Que orgulho!!",
//                        "A partir de agora as suas chances de ter um AVC vão começar a diminuir consideravelmente. Daqui a pouquinho, seus riscos serão os mesmos de uma pessoa que nunca fumou na vida!! Quem diria ein?",
//                        "Pode ter levado bastante tempo, mas agora seu risco de contrair câncer de pulmão já caiu pela metade! Assim como o risco de outros tipor de câncer, é claro.",
//                        "Agora seu risco de ter uma doença cardíaca é exatamente o mesmo que de uma pessoa que nunca fumou. Parabéns por ter chegado até aqui!"]
    
    
// MARK: COLLECTION VIEW
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.progressImages.count
    }
    
// MARK: COLLECTION VIEW CELL
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! ProgressCell
        
        cell.cellImage.image = self.progressImages[indexPath.row]
        cell.cellTitle.text = progressTitle[indexPath.row]
//        cell.cellText.text = progressText[indexPath.row]

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
