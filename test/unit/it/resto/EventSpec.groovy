package it.resto

import grails.test.mixin.TestFor
import grails.test.mixin.Mock
import spock.lang.Specification
import java.util.Date

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Event)
@Mock(Vote)
class EventSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "create Event"() {
        given:
	        mockForConstraintsTests Event
	        mockForConstraintsTests Vote

        when: 'the user is new'
        	def event = new Event(name:'Repas de ce midi', date: new Date())

        then: 'validation should pass'
	        event.validate()
	        !event.hasErrors()  
    }
}
