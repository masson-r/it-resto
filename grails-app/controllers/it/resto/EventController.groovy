package it.resto

import java.text.SimpleDateFormat
import java.text.DateFormat

class EventController {
    static scaffold = true

    def eventService

    def listEvent() {
    	[events: Event.listOrderByName()]
    }

    def voteEvent() { 
        if (params.isVote != null) {
            def listIdRestaurant = []
            params.each{
                key, value -> if (key.startsWith('resto')) {
                    listIdRestaurant.add(Long.parseLong(value))
                }
            }
            eventService.createNewVote(Event.get(params.eventId), Restaurant.findAllByIdInList(listIdRestaurant), User.findByLogin(session.user))
        }

        def votes = eventService.getVotesDesc(Event.get(params.eventId))
        def canVote = true

        for (vote in votes) {
            if (session.user.equals(vote.user.login)) {
                canVote=false
            }
        }
    	[event: Event.get(params.eventId), votes:votes, restaurants: Restaurant.listOrderByName(), canVote:canVote]
    }

    def login() { 
    	if (params.login != null) {
    		def user = User.findByLogin(params.login)

            if (user != null) {
        		if (user.password == params.password) {
        			session.user = user.login
                    session.userAdmin = user.admin
                    session.userLastName = user.lastName
                    session.userName = user.name
        			redirect(controller: "Event", action: "listEvent")
        		} 
            }
    	}
  		[login: false, message: 'Login ou mot de passe incorrect']
    }

    def logout() { 
    	session.user = null
        redirect(controller: "Event", action: "login")
    }

    def createEvent() { 
    	if (params.name != null) {
            try {
                DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm", Locale.FRENCH)
        		def event = new Event(name: params.name, eventDate:df.parse(params.dateEvent), owner:User.findByLogin(session.user)).save()
                redirect(controller: "Event", action: "listEvent")
            } catch (java.text.ParseException pexp) {
                // si la date est mal saisie
                [create: false]
            }
    	}
    	else {
  	    	[create: false]
    	}
    }
}
