package it.resto

class Vote {

	User user

	static hasMany = [restaurants: Restaurant]

	static belongsTo = [event:Event]

    String toString() {
        def listRestautant
        for (restaurant in restaurants) {
            listRestautant += restaurant.name + ' - '
        }
        return this.user.login + ' : ' + listRestautant
    }

    static constraints = {
    }
}
