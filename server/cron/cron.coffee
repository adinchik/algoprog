import Cron from 'cron'
import * as downloadSubmits from "./downloadSubmits"
import * as downloadContests from "./downloadContests"
import * as downloadBlog from './downloadBlog'
import updateCf from "./updateCf"
import submitSubmits from './submitSubmits'

import logger from '../log'
import User from '../models/user'

#downloadSubmits.runUntilIgnored()
#downloadSubmits.runAll().catch((e) -> logger.error(e))
#downloadContests.run().catch((e) -> logger.error(e))
#updateCf().catch((e) -> logger.error(e))

offset = (new Date().getTimezoneOffset()) / 60
MOSCOW_OFFSET = -3
nightHour = (3 + MOSCOW_OFFSET - offset - 1) %% 24

logger.info "Will set downloadAll to " + nightHour + ":59:58 local time"

#jobAll = undefined  #new Cron.CronJob('58 59 ' + nightHour + ' * * *', downloadSubmits.runAll, null, true);
#jobUntilIgnored = undefined  #new Cron.CronJob('59 */10 * * * *', downloadSubmits.runUntilIgnored, null, true);
jobLast = undefined  #new Cron.CronJob('0 * * * * *', downloadSubmits.runLast, null, true);
jobCT = new Cron.CronJob('*/2 * * * * *', downloadSubmits.runForCT, null, true);

#jobContests = new Cron.CronJob('0 */10 * * * *', downloadContests.run, null, true);
jobContests = undefined

jobCf = new Cron.CronJob('0 0 * * * *', updateCf, null, true);

jobUpdateResults = new Cron.CronJob('45 46 ' + (nightHour + 1) + ' * * *', User.updateAllUsers, null, true);

jobUpdateBlog = new Cron.CronJob('0 */5 * * * *', downloadBlog.run, null, true)

jobSubmitSubmits = new Cron.CronJob("*/2 * * * * *", submitSubmits, null, true)

export default [jobCT, jobLast, jobContests, jobCf, jobUpdateResults, jobUpdateBlog, jobSubmitSubmits]

#downloadSubmits.runLast()