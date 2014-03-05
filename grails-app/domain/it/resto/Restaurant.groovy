package it.resto

class Restaurant {

	String name

    String toString() {
        return this.name;
    }

    static constraints = {
    	name blank: false, unique:true
    }
}
