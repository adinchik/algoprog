mongoose = require('mongoose')

import User from './user'
import logger from '../log'

resultsSchema = new mongoose.Schema
    _id: String
    user: String
    userList: String
    activated: Boolean
    table: String
    total: Number
    required: Number  # number of problems from non-star subcontests, not the number of required problems on level
    solved: Number
    ps: Number
    ok: Number
    attempts: Number
    lastSubmitId: String
    lastSubmitTime: Date
    ignored: Number


resultsSchema.methods.upsert = () ->
    # required: user, table, total, solved, ok, attempts, ignored, lastSubmitId, lastSubmitTime
    user = await User.findById(@user)
    if not user
        logger.warn "Unknown user #{@user} in Result.upsert, result id #{@_id}"
        return
    @userList = user.userList
    @activated = user?.activated
    @_id = @user + "::" + @table
    @update(this, {upsert: true}).exec()

resultsSchema.statics.DQconst = -10

resultsSchema.statics.findByUserListAndTable = (userList, table) ->
    tableList = await Table.findById(table).descendandTables()
    return Result.find({
        userList: userList,
        table: {$in: tableList}
    }).sort { solved: -1, attempts: 1}

resultsSchema.statics.findByUserList = (userList) ->
    return Result.find({
        userList: userList
    }).sort { solved: -1, attempts: 1}

resultsSchema.statics.findByUser = (userId) ->
    return Result.find
        user: userId

resultsSchema.statics.findByUserAndTable = (userId, tableId) ->
    key = userId + "::" + tableId
    return Result.findOne
            _id: userId + "::" + tableId

resultsSchema.statics.findLastWA = (limit) ->
    return Result.find({
        total: 1,  # this is a problem, not a contest
        solved: 0,
        ok: 0,
        ignored: 0,
        attempts: {$gte: 1},
    }).sort({ lastSubmitTime: -1 }).limit(limit)


resultsSchema.index
    userList: 1
    table : 1
    solved: -1
    attempts: 1

resultsSchema.index
    userList: 1
    solved: -1
    attempts: 1

resultsSchema.index
    user: 1
    table: 1

resultsSchema.index
    total: 1
    solved: 1
    ok: 1
    ignored: 1
    attempts: 1
    lastSubmitTime: -1


Result = mongoose.model('Results', resultsSchema);


export default Result
