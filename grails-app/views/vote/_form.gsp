<%@ page import="it.resto.Vote" %>



<div class="fieldcontain ${hasErrors(bean: voteInstance, field: 'event', 'error')} required">
	<label for="event">
		<g:message code="vote.event.label" default="Event" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="event" name="event.id" from="${it.resto.Event.list()}" optionKey="id" required="" value="${voteInstance?.event?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: voteInstance, field: 'restaurants', 'error')} ">
	<label for="restaurants">
		<g:message code="vote.restaurants.label" default="Restaurants" />
		
	</label>
	<g:select name="restaurants" from="${it.resto.Restaurant.list()}" multiple="multiple" optionKey="id" size="5" value="${voteInstance?.restaurants*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: voteInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="vote.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${it.resto.User.list()}" optionKey="id" required="" value="${voteInstance?.user?.id}" class="many-to-one"/>
</div>

