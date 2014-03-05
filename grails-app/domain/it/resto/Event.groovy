package it.resto

class Event {

	String name
	Date eventDate
    User owner
	static hasMany = [votes: Vote]

    String toString() {
        return this.name;
    }

    static constraints = {
    	name blank: false
    	eventDate nullable: true
    }
}
