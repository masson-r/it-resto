import it.resto.User
import it.resto.Restaurant
import it.resto.Event
import it.resto.Vote

class BootStrap {

    def init = { servletContext ->
        print 'Bootstrap'
        print 'User : ' + User.count()
        def user
        def event
        def restaurant
        def vote

        if (!User.count()) {
            print 'Create'
            user = new User(name: 'Doe', lastName: 'Jhon', login: 'jhon.doe', password: 'azerty', email: 'jhon@doe.com').save(failOnError: true)
            new User(name: 'Doe', lastName: 'Jane', login: 'jane.doe', password: 'azerty', email: 'jane@doe.com', admin:true).save(failOnError: true)
        }
        print 'User : ' + User.count()
        print 'Restaurant : ' + Restaurant.count()
        if (!Restaurant.count()) {
            print 'Create'
        	restaurant = new Restaurant(name: 'King Croissant').save(failOnError: true)
        	new Restaurant(name: 'Les trois mi-temps').save(failOnError: true)
        }
        print 'Restaurant : ' + Restaurant.count()
        print 'Event : ' + Event.count()
        if (!Event.count()) {
            print 'Create'
        	event = new Event(name: 'Repas entre amis', eventDate: new Date(), owner:User.get(1)).save(failOnError: true)
        	new Event(name: 'Repas pour ce midi', eventDate: new Date(), owner:User.get(1)).save(failOnError: true)
		}
        print 'Event : ' + Event.count()
        print 'Vote : ' + Vote.count()
        if (!Vote.count()) {
            print 'Create'
            vote = new Vote(user:User.get(1), event:Event.get(1))
            vote.addToRestaurants(Restaurant.get(1))
            vote.save(failOnError: true)
            Event.get(1).addToVotes(vote).save(failOnError: true)
        }
        print 'Vote : ' + Vote.count()
    }
    def destroy = {
        print 'Bootstrap destroy'
    }
}



