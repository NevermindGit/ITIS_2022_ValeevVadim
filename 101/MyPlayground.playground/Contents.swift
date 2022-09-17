// Vadim Valeev 11-109
import UIKit


enum HumanClasses: String {
    case swordsman = "Мечник"
    case wizard = "Маг"
    case knight = "Рыцарь"
    case hunter = "Охотник"
}

enum Direction: String, CaseIterable {
    case forward = "Вперед"
    case left = "Налево"
    case right = "Направо"
    case back = "Назад"
}

enum MonsterClasses: String {
    case orc = "Орк"
    case goblin = "Гоблин"
    case skeleton = "Скелет"
    case berserk = "Берсерк"
}


protocol HumanForces {
    var name: String { get }
    var hp: Int { get set }
    var mp:Int { get set }
    var damage: Int { get }
    var classType: HumanClasses { get }
}

protocol MonsterForces {
    var name: String { get }
    var hp: Int { get set }
    var damage: Int { get set }
    var classType: MonsterClasses { get }
}


class Swordsman: HumanForces {
    var name: String = String(Int.random(in: 0...1000))
    var hp: Int = 300
    var mp: Int = 0
    var damage: Int = Int.random(in: 10...30)
    var classType: HumanClasses = .swordsman
}

class Wizard: HumanForces {
    var name: String = String(Int.random(in: 0...1000))
    var hp: Int = 100
    var mp: Int = 200
    var damage: Int = Int.random(in: 30...50)
    var classType: HumanClasses = .wizard
}

class Knight: HumanForces {
    var name: String = String(Int.random(in: 0...1000))
    var hp: Int = 250
    var mp: Int = 50
    var damage: Int = Int.random(in: 25...40)
    var classType: HumanClasses = .knight
}

class Hunter: HumanForces {
    var name: String = String(Int.random(in: 0...1000))
    var hp: Int = 300
    var mp: Int = 0
    var damage: Int = Int.random(in: 20...45)
    var classType: HumanClasses = .hunter
}

class Orc: MonsterForces {
    var name: String = String(Int.random(in: 0...1000))
    var hp: Int = 500
    var damage: Int = Int.random(in: 40...60)
    var classType: MonsterClasses = .orc
}

class Goblin: MonsterForces {
    var name: String = String(Int.random(in: 0...1000))
    var hp: Int = 80
    var damage: Int = Int.random(in: 10...20)
    var classType: MonsterClasses = .goblin
}

class Skeleton: MonsterForces {
    var name: String = String(Int.random(in: 0...1000))
    var hp: Int = 100
    var damage: Int = Int.random(in: 20...35)
    var classType: MonsterClasses = .skeleton
}

class Berserk: MonsterForces {
    var name: String = String(Int.random(in: 0...1000))
    var hp: Int = 350
    var damage: Int = Int.random(in: 50...80)
    var classType: MonsterClasses = .orc
}


class Game {
    
    var humanTeam: [HumanForces] = []
    var deadHumanTeam: [HumanForces] = []
    var monstersTeam: [MonsterForces] = []
    var deadMonstersTeam: [MonsterForces] = []
    var moves: Int = 0

    func createHeroTeam() {
        for _ in 0..<15 {
            humanTeam.append(Swordsman())
        }
        for _ in 0..<7 {
            humanTeam.append(Hunter())
        }
        for _ in 0..<8 {
            humanTeam.append(Knight())
        }
        for _ in 0..<10 {
            humanTeam.append(Wizard())
        }
        print("Герои успешно созданы")
    }
    
    func createMonsterTeam() {
        for _ in 0..<5 {
            monstersTeam.append(Orc())
        }
        for _ in 0..<15 {
            monstersTeam.append(Goblin())
        }
        for _ in 0..<7 {
            monstersTeam.append(Skeleton())
        }
        for _ in 0..<5 {
            monstersTeam.append(Berserk())
        }
        print("Монстры успешно созданы")
    }
    
    func explore() {
        print("\nКоманда героев идет \(Direction.allCases.randomElement()?.rawValue ?? "")")
        if Int.random(in: 1...10) < 3 {
            print("Нашел что-то")
        }
    }
    
    func startGame(){
        print("\nИгра началась \n")
        game.explore()
        
        while (humanTeam.count > 1) || (monstersTeam.count > 1) {
            
            if (humanTeam.count > 1) && (monstersTeam.count > 1) {
                for i in 0..<humanTeam.count {
                    for j in 0..<monstersTeam.count {
                        var human: HumanForces = humanTeam[Int.random(in: 0..<humanTeam.count)]
                        var monster: MonsterForces = monstersTeam[Int.random(in: 0..<monstersTeam.count)]
                        if human.classType == .wizard {
                            humanTeam[Int.random(in: 0..<humanTeam.count)].hp += 50
                            human.mp -= 20
                            monster.hp -= 20
                            print("\(human.classType.rawValue)\(human.name) подлечил союзника")
                        }
                        if (human.classType == .knight) && (human.mp > 0) {
                            if human.hp < 150 {
                                human.hp += 70
                                human.mp = 0
                                print("\(human.classType.rawValue)\(human.name) подлечил себя")
                            } else {
                                humanTeam[Int.random(in: 0..<humanTeam.count)].hp += 70
                                print("\(human.classType.rawValue)\(human.name) подлечил союзника")
                            }
                        }
                        
                        if human.hp < 0 {
                            deadHumanTeam.append(human)
                            humanTeam.remove(at: i)
                        }
                        monster.hp -= human.damage
                        print("\(human.classType.rawValue)\(human.name) ударяет \(monster.classType.rawValue)\(monster.name) с силой \(human.damage), HP=\(monster.hp)\n")
                        if monster.hp < 0 {
                            deadMonstersTeam.append(monster)
                            monstersTeam.remove(at: j)
                        }
                        human.hp -= monster.damage
                        print("\(monster.classType.rawValue)\(monster.name) ударяет \(human.classType.rawValue)\(human.name) с силой \(monster.damage), HP=\(human.hp)")
                        moves += 1
                    }
                }
            }
            if humanTeam.count == 0 {
                print("Люди проиграли за \(moves) ходов")
                break
            }
            if monstersTeam.count == 0 {
                print("Люди победили за \(moves) ходов")
                break
            }
        }
    }
}

let game = Game()
game.createHeroTeam()
game.createMonsterTeam()
game.explore()
game.startGame()


