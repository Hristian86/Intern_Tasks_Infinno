// задача 8. имаме списък от хора (зададен като масив от стрингове),
// за всеки от който е дадено име, адрес, град, който изглежда така:
// Иван, София
// Петър, Пловдив
// Никола, София
// Деница, Варна
// Жельо, Пловдив
// Да напечатаме списъка с хора групирани по град. За всеки град първо печатаме града,
// и под него хората в от този град с 3 интервала преди името:
// Варна
//    Деница
// Пловдив
//    Жельо
//    Петър
// София
//    Иван
//    Никола
// Малко прилича на CSV задачата, но въобще не е същото, няма такива сложни случаи като кавички, интервали и \
// Не е проблем да се ползва вградената функция за сортиране както показах сутринта

public class Person {
    private var address = Address<String>()
    private var name = "";

    init(_ name: String,_ city: String) {
        self.name = name;
        self.address.AddCity(city)
    }
    
    public func GetName() -> String {
        return self.name;
    }

    public func GetCity() -> String {
        return self.address.GetCity(0) ?? "";
    }
}

public class Address<T> {
    private var address = Array<T>();

    init() {}
    public func AddUserToCity(_ user: T) {

    }

    public func GetCity(_ defaultAddress: Int) -> T? {
        return self.address[defaultAddress] ?? nil;
    }
    
    public func AddCity(_ city: T) -> Int {
        self.address.append(city);
        return self.address.count
    }
}

public class UserService {
    private var userRepository = [String: Array<Person>]();
    
    init() {}
    public func AddPerson(_ person: Person) {
        AddtoColl(person);
    }

    private func AddtoColl(_ person: Person) {
        var city: String = person.GetCity();
        let keyExists = self.userRepository[city] != nil

        if !keyExists {
            self.userRepository[city] = [person];
        } else {
            var ppl = self.userRepository[city] ?? [];
            ppl.append(person);
            self.userRepository.updateValue(ppl, forKey: city);
        }
    }
    
    public func PrintPeaople() {
        for city in self.userRepository.sorted(by: { $0.key < $1.key }) {
            // Prints the city.
            print(city.key)
            for name in city.value.sorted(by: { $0.GetName() < $1.GetName() }) {
                // Prints the name of the Persons.
                print("   \(name.GetName())")
            }
        }
    }
}

let userService = UserService();
userService.AddPerson(Person("Иван","София"));
userService.AddPerson(Person("Петър","Пловдив"));
userService.AddPerson(Person("Никола","София"));
userService.AddPerson(Person("Деница","Варна"));
userService.AddPerson(Person("Пенчо","Враца"));
userService.AddPerson(Person("Генчо","Пловдив"));
userService.AddPerson(Person("Тодор","София"));
userService.AddPerson(Person("Жельо","Пловдив"));
userService.PrintPeaople();