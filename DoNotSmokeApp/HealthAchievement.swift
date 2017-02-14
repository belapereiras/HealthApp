//
//  HealthAchievement.swift
//  DoNotSmokeApp
//
//  Created by Guilherme Marques on 7/19/16.
//  Copyright © 2016 Isabela Pereira. All rights reserved.
//

import Foundation

// HealthAchievement
// class to manage the healthBenefits
class HealthAchievement: Achievement {
    
    var benefits: [Benefit] = []
    static var healthAchievement = HealthAchievement()
    var startingDay: Date {
        get {
            return self.startingDay
        }
        set(date) {
            self.startingDay = date
        }
    }
    
    fileprivate init(){
        initial_setup()
    }
    
    internal func initial_setup() {
        //key: time to achieve the benefit
        //value: (title, description)
        let progress_info: [TimeInterval: (String, String)] = [
                            7200:("2 horas", "Sua frequência cardíaca e pressão sanguínea estão pertinho de atingir o nível normal. Ah, e sua circulação sanguínea também vai começar a melhorar! Daqui a pouco você vai sentir as pontas dos seus dedos ficarem mais quentes."),
                            28800:("8 horas", "Os níveis de nicotina e monóxido de carbono no seu sangue já caíram pela metade. Agora, os níveis de oxigênio vão se normalizar e seu cabelo e sua pele ficarão bem bonitões!"),
                            43200:("12 horas", "O nível de monóxido de carbono no seu corpo está caindo! E com isso, a quantidade de oxigênio no seu sangue tá quaaase chegando a um valor normal. Falta bem pouquinho!"),
                            86400:("24 horas", "Fumantes tem 70% mais risco de ter a chamada Doença Arterial Coronariana, que afeta os principais vasos sanguíneos do coração. A boa notícia? O risco de você ter já começou a diminuir! Também estão diminuindo as chances de um ataque cardíaco. Isso tudo em um diazinho só hein..."),
                            172800:("48 horas","Seu olfato e paladar estão ficando mais sensíveis. Já já você vai notar a diferença!"),
                            259200:("3 dias", "A essa altura, já não há mais nicotina no seu corpo. O que é ótimo!! Daqui a pouco você vai sentir o efeito dessa limpa: um pouquinho de dor de cabeça, talvez enjôo, ansiedade... Mas se você já foi capaz de chegar até aqui, PARABÉNS! Vamos em frente!"),
                            1814400:("2 a 3 semanas", "Você vai começar a sentir que tem mais fôlego para realizar atividades físicas. Sua circulação sanguínea e funções cardíacas vão melhorar bastante a partir de agora! Além disso, seus pulmões estão ficando limpos, o que vai te ajudar a  respirar bem mais fácil!"),
                            23328000:("1 a 9 meses", "Seus pulmões agora estão funcionando à todo vapor! Mais um pouquinho, sua tosse e falta de ar vão começar a desaparecer. Ao final desse progresso você já não vai nem mais saber o que é abstinência. Quase lá!!"),
                            31536000:("1 ano","Seu risco de ter doenças cardíacas já caiu pela metade! Isso significa que um fumante tem 2x mais chances de desenvolver qualquer tipo de doença cardíaca do que você. Que orgulho!!"),
                            157680000:("5 anos", "A partir de agora as suas chances de ter um AVC vão começar a diminuir consideravelmente. Daqui a pouquinho, seus riscos serão os mesmos de uma pessoa que nunca fumou na vida!! Quem diria ein?"),
                            315360000:("10 anos", "Pode ter levado bastante tempo, mas agora seu risco de contrair câncer de pulmão já caiu pela metade! Assim como o risco de outros tipor de câncer, é claro."),
                            473040000:("15 anos", "Agora seu risco de ter uma doença cardíaca é exatamente o mesmo que de uma pessoa que nunca fumou. Parabéns por ter chegado até aqui!")]
        
        progress_info.forEach{ text in
            let title = text.value.0
            let description = text.value.1
            let completion_time = text.key
            
            let benefit = create_benefit(title, description, completion_time)
            benefits.append(benefit)
        }
        
        benefits.sort()
    }
    
    static func getHASingleton() -> HealthAchievement {
        return healthAchievement
    }
    

}



