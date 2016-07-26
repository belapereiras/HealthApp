//
//  HealthAchievement.swift
//  DoNotSmokeApp
//
//  Created by Guilherme Marques on 7/19/16.
//  Copyright © 2016 Isabela Pereira. All rights reserved.
//

import Foundation

// Health Enum:
// BenefitNumber
// Raw Value = Time in seconds to the benefit be completed

enum HealthEnum: Double {
    
    case firstBenefit = 60
    case secondBenefit = 120
    case thirdBenefit = 43200
    case fourthBenefit = 26400
    case fifthBenefit = 172800
    case sixthBenefit = 259200
    case seventhBenefit = 0
    case eighthBenefit = 1
    case ninethBenefit = 2
    case tenthBenefit = 3
    case eleventhBenefit = 4
    case twelfthBenefit = 5
    case thirteenthBenefit = 6
    
}

// HealthAchievement
// class to manage the benefits
class HealthAchievement {
    
    var healthBenefit: [HealthBenefit] = []
    static var healthAchievement = HealthAchievement()
    var startingDay: NSDate {
        get {
            return self.startingDay
        }
        set(date) {
            self.startingDay = date
        }
        
    }
    
    private init(){
        initialSetupHB()
    }
    
    func createHealhBenefit(name: String, description: String, benefitNumber: HealthEnum) -> HealthBenefit {
        let healthBenefit = HealthBenefit(name: name, description: description, healthNumber: benefitNumber)
        return healthBenefit
    }
    
    private func initialSetupHB() {
        let progressTitle = ["20 minutos", "2 horas", "8 horas", "12 horas", "24 horas", "48 horas", "3 dias", "2 a 3 semanas", "1 a 9 meses", "1 ano", "5 anos", "10 anos", "15 anos"]
        
        var progressText = ["sua frequência cardíaca começará a cair até voltar ao nível normal",
                            "sua frequência cardíaca e pressão sanguínea estão pertinho de atingir o nível normal. Ah, e sua circulação sanguínea também vai começar a melhorar! Daqui a pouco você vai sentir as pontas dos seus dedos ficarem mais quentes.",
                            "os níveis de nicotina e monóxido de carbono no seu sangue já caíram pela metade. Agora, os níveis de oxigênio vão se normalizar e seu cabelo e sua pele ficarão bem bonitões!",
                            "o nível de monóxido de carbono no seu corpo está caindo! E com isso, a quantidade de oxigênio no seu sangue tá quaaase chegando a um valor normal. Falta bem pouquinho!",
                            "fumantes tem 70% mais risco de ter a chamada Doença Arterial Coronariana, que afeta os principais vasos sanguíneos do coração. A boa notícia? O risco de você ter já começou a diminuir! Também estão diminuindo as chances de um ataque cardíaco. Isso tudo em um diazinho só ein..",
                            "seu olfato e paladar estão ficando mais sensíveis. Já já você vai notar a diferença!",
                            "A essa altura, já não há mais nicotina no seu corpo. O que é ótimo!! Daqui a pouco você vai sentir o efeito dessa limpa: um pouquinho de dor de cabeça, talvez enjôo, ansiedade... Mas se você já foi capaz de chegar até aqui, PARABÉNS! Vamos em frente!",
                            "você vai começar a sentir que tem mais fôlego para realizar atividades físicas. Sua circulação sanguínea e funções cardíacas vão melhorar bastante a partir de agora! Além disso, seus pulmões estão ficando limpos, o que vai te ajudar a  respirar bem mais fácil!",
                            "Seus pulmões agora estão funcionando à todo vapor! Mais um pouquinho, sua tosse e falta de ar vão começar a desaparecer. Ao final desse progresso você já não vai nem mais saber o que é abstinência. Quase lá!!",
                            "Seu risco de ter doenças cardíacas já caiu pela metade! Isso significa que um fumante tem 2x mais chances de desenvolver qualquer tipo de doença cardíaca do que você. Que orgulho!!",
                            "A partir de agora as suas chances de ter um AVC vão começar a diminuir consideravelmente. Daqui a pouquinho, seus riscos serão os mesmos de uma pessoa que nunca fumou na vida!! Quem diria ein?",
                            "Pode ter levado bastante tempo, mas agora seu risco de contrair câncer de pulmão já caiu pela metade! Assim como o risco de outros tipor de câncer, é claro.",
                            "Agora seu risco de ter uma doença cardíaca é exatamente o mesmo que de uma pessoa que nunca fumou. Parabéns por ter chegado até aqui!"]
        for progress in progressTitle {
            guard let index = progressTitle.indexOf(progress) else { break }
            let description = progressText[index]
            let benefitEnum: HealthEnum
            switch index {
            case 0:
                benefitEnum = .firstBenefit
                break
            case 1:
                benefitEnum = .secondBenefit
                break
            case 2:
                benefitEnum = .thirdBenefit
                break
            case 3:
                benefitEnum = .fourthBenefit
                break
            case 4:
                benefitEnum = .fifthBenefit
                break
            case 5:
                benefitEnum = .sixthBenefit
                break
            case 6:
                benefitEnum = .seventhBenefit
                break
            case 7:
                benefitEnum = .eighthBenefit
                break
            case 8:
                benefitEnum = .ninethBenefit
                break
            case 9:
                benefitEnum = .tenthBenefit
                break
            case 10:
                benefitEnum = .eleventhBenefit
                break
            case 11:
                benefitEnum = .twelfthBenefit
                break
            default:
                benefitEnum = .thirteenthBenefit
                break
            }
            let benefit = createHealhBenefit(progress, description: description, benefitNumber: benefitEnum)
            healthBenefit.append(benefit)
        }
    }
    
    static func getHASingleton() -> HealthAchievement {
        return healthAchievement
    }
    
    func benefitsAchieved(timePassed: NSTimeInterval) -> [HealthBenefit]? {
        
        let time = timePassed
        var benefitsAchieved: [HealthBenefit] = []
        for benefit in healthBenefit {
            if benefit.completionTime == time || benefit.completionTime < time {
                benefitsAchieved.append(benefit)
            }
        }
        if benefitsAchieved.count > 0 {
            return benefitsAchieved
        } else {
            return nil
        }
        
    }
    
//    func adjustBenefitVector(benefitsAchieved: [HealthBenefit]) {
//        let benefits = benefitsAchieved
//        let range = 0..<benefits.endIndex
//        healthBenefit.removeRange(range)
//        healthBenefit.appendContentsOf(benefits)
//    }
//    

}



