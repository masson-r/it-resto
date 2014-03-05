package it.resto

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Restaurant)
class RestaurantSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void 'create Restaurant'() {
        given:
	        mockForConstraintsTests Restaurant

        when: 'the restaurant name is new'
        def restaurant = new Restaurant()
        restaurant.name = 'King Croissant'

        then: 'validation should pass'
        restaurant.validate()
        !restaurant.hasErrors()
    }

    void 'test constraint Restaurant'() {
        given:
	        mockForConstraintsTests Restaurant

        when: 'the restaurant name is null'
        def restaurant = new Restaurant()
        restaurant.name = null

        then: 'validation should fail'
        !restaurant.validate()
        restaurant.hasErrors()
        print restaurant.errors['name']

        when: 'the restaurant name is blank'
        restaurant.name = ''

        then: 'validation should fail'
        !restaurant.validate()
        restaurant.hasErrors()
        print restaurant.errors['name']

    }
}
