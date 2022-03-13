import contest from "../../lib/contest"
import level from "../../lib/level"
import problem from "../../lib/problem"

contest_32817 = () ->
    return contest("2018, 1 тур", [
        problem(113911),
        problem(113912),
        problem(113913),
        problem(113914),
    ])

contest_32818 = () ->
    return contest("2018, 2 тур", [
        problem(113915),
        problem(113916),
        problem(113917),
        problem(113918),
    ])

export default level_roi2018 = () ->
    return level("roi2018", "2018", [
        contest_32817(),
        contest_32818(),
    ])