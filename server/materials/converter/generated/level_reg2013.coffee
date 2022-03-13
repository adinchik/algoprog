import contest from "../../lib/contest"
import level from "../../lib/level"
import problem from "../../lib/problem"

contest_6667 = () ->
    return contest("2013, 1 тур", [
        problem(111488),
        problem(111489),
        problem(111490),
        problem(111491),
    ])

contest_6670 = () ->
    return contest("2013, 2 тур", [
        problem(111492),
        problem(111493),
        problem(111494),
        problem(111495),
    ])

export default level_reg2013 = () ->
    return level("reg2013", "2013", [
        contest_6667(),
        contest_6670(),
    ])