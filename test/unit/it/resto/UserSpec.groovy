package it.resto

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(User)
class UserSpec extends Specification {
	def user

    def setup() {
        user = new User()
		user.name = 'Doe'
		user.lastName = 'Jhon'
		user.login = 'jhon.doe'
		user.password = 'azerty'
		user.email = 'jhon@doe.com'

		print 'setup'
    }

    def cleanup() {
    }

   void 'create User'() {
        given:
	        mockForConstraintsTests User

        when: 'the user is new'

        then: 'validation should pass'
        user.validate()
        !user.hasErrors()
    }

    void 'test constraint User name'() {
        given:
	        mockForConstraintsTests User

        when: 'the user name is null'
        user.name = null

        then: 'validation should fail'
        !user.validate()
        user.hasErrors()

        when: 'the user name is blank'
        user.name = ''

        then: 'validation should fail'
        !user.validate()
        user.hasErrors()
    }

    void 'test constraint User lastname'() {
        given:
	        mockForConstraintsTests User

        when: 'the user lastname is null'
        user.lastName = null

        then: 'validation should fail'
        !user.validate()
        user.hasErrors()

        when: 'the user lastname is blank'
        user.lastName = ''

        then: 'validation should fail'
        !user.validate()
        user.hasErrors()
    }

    void 'test constraint User login'() {
        given:
	        mockForConstraintsTests User

        when: 'the user login is null'
        user.login = null

        then: 'validation should fail'
        !user.validate()
        user.hasErrors()

        when: 'the user login is blank'
        user.login = ''

        then: 'validation should fail'
        !user.validate()
        user.hasErrors()

        when: 'the user login is too small'
        user.login = 'jhon'

        then: 'validation should fail'
        !user.validate()
        user.hasErrors()

        when: 'the user login is too large'
        user.login = 'jhon.doe.0123456789'

        then: 'validation should fail'
        !user.validate()
        user.hasErrors()
    }

    void 'test constraint User password'() {
        given:
	        mockForConstraintsTests User

        when: 'the user password is null'
        user.password = null

        then: 'validation should fail'
        !user.validate()
        user.hasErrors()

        when: 'the user password is blank'
        user.password = ''

        then: 'validation should fail'
        !user.validate()
        user.hasErrors()

        when: 'the user password is too small'
        user.password = 'jhon'

        then: 'validation should fail'
        !user.validate()
        user.hasErrors()

        when: 'the user password is too large'
        user.password = 'jhon.doe.0123456789'

        then: 'validation should fail'
        !user.validate()
        user.hasErrors()
    }

    void 'test constraint User mail'() {
        given:
	        mockForConstraintsTests User

        when: 'the mail is not valid'
        user.email = 'jhon'

        then: 'validation should fail'
        !user.validate()
        user.hasErrors()
    }

}
