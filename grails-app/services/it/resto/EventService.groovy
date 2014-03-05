package it.resto

import grails.transaction.Transactional
import it.resto.User
import it.resto.Restaurant
import it.resto.Event
import it.resto.Vote

@Transactional
class EventService {

    List getVotesDesc(Event event) {
    	def restaurants = Restaurant.listOrderByName()
    	def votes = event.getVotes()

		def resultMap = []
    	for (vote in votes) {
			def restoList = []
    		for (restaurant in restaurants) {
    			restoList.add(vote.getRestaurants().contains(restaurant))
    		}
            def tmp = [
                    user:vote.getUser(),
                    listVotesByRestaurants:restoList
            ]

			resultMap.add(tmp)
    	}

    	return resultMap
    }

    def createNewVote(Event event, List restaurants, User user) {
    	def vote = new Vote(user:user, event:event, restaurants:restaurants)
        event.addToVotes(vote)
    	vote.save(failOnError: true)
        event.save(failOnError: true)
    }
}
