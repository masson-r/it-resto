package it.resto

import it.resto.Event


class CleanJob {
    static triggers = {
	    cron name:'cronTrigger', startDelay:10000, cronExpression: '0 0 6 * * ?' // execution, tous les jours à 6H
    }

    def execute() {
        def listPastEvent = Event.findAllByEventDateLessThan(new Date())
        for (event in listPastEvent) {
        	event.delete()
        }

    }
}
