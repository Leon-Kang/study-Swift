let volunteerCounts = [1, 3, 40, 32, 2, 53, 77, 13]

//func sortAscending(_ i: Int, _ j: Int) -> Bool{
//    return i < j;
//}
//let volunteersSorted = volunteerCounts.sorted(by: sortAscending)

//let volunteersSorted = volunteerCounts.sorted {
//    (i, j) -> Bool in
//    return i < j;
//}

//let volunteersSorted = volunteerCounts.sorted(by: {i, j in i < j})

let volunteersSorted = volunteerCounts.sorted(by: {$0 < $1} )

func makeTownGrand(with budget: Int,
                   condition: (Int) -> Bool) -> ((Int, Int) -> Int)? {
    if condition(budget) {
        func buildRoads(byAddingLights light: Int,
                        toExistingLights existingLights: Int) -> Int {
            return light + existingLights
        }
        return buildRoads
    } else {
        return nil;
    }
}

func evaluate(budget: Int) -> Bool {
    return budget > 10_000;
}

var stopLight = 4

if let r = makeTownGrand(with: 1_000, condition: evaluate)  {
    stopLight = r(4, stopLight)
}

print(stopLight)


func makePopulationTracker(forInitialPopulation population: Int) -> (Int) -> Int {
    var totalPopulation = population
    func populationTracker(growth: Int) -> Int {
        totalPopulation += growth
        return totalPopulation
    }
    return populationTracker
}

var currentPopulation = 5_422
let growBy = makePopulationTracker(forInitialPopulation: currentPopulation)

growBy(500)
growBy(500)
growBy(500)

currentPopulation = growBy(500)
		